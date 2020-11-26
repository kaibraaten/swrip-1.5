-- Mon Calamri
-- Last saved Thursday 26-Nov-2020 15:24:46

AreaEntry
{
   ResetMessage = "Imperial TIE fighters scream past above, patrolling this occupied city.", 
   Rooms = 
   {
      [21000] = 
      {
         Tunnel = 0, 
         Description = "&P You are standing within the expanse of the famous Mon Calamrian City of\
Coral City .  A metallic statue of Admiral Ackbar occupies the square's\
center, surrounded by gardens of shrubbery which enhance the air of\
serenity and peace here in the center of the city.  The main roads lead\
away in the cardinal directions, while to the east and west are smooth\
carved rock roads. The roof tops of a buildings can be seen rising to the\
south east.\
", 
         Vnum = 21000, 
         Tag = "", 
         Name = "Coral City Center", 
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
         Flags = 
         {
            [15] = "NoDropAll", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Anna Avenue lies to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21001, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "To the east lies Barster Road.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21036, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Anna Avenue lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21042, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "To the west lies Barster Road.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21039, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21001] = 
      {
         Tunnel = 0, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. Directly south you\
can see the circular center of Coral City.\
", 
         Vnum = 21001, 
         Tag = "", 
         Name = "Anna Avenue", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Anna Avenue lies in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21002, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road to the south leads to the main  Square.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21000, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21002] = 
      {
         Tunnel = 0, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. \
", 
         Vnum = 21002, 
         TeleDelay = 0, 
         Name = "Anna Avenue", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The worn metallic roads of Anna Avenue lie in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21003, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A peculiar section of Anna Avenue lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21001, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21003] = 
      {
         Tunnel = 0, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. to the north you can see an intersection. \
", 
         Vnum = 21003, 
         TeleDelay = 0, 
         Name = "Anna Avenue", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Anna Avenue and Security Road cross just north of here.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21004, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A rather bland portion of Anna Avenue lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21002, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21004] = 
      {
         Tunnel = 0, 
         Description = "&RYou stand at the intersection of &PAnna Avenue&R and Security Road.  This\
main road is home to the Mon Calamari Police. It is highly recommended\
that you do not walk down this street with rifle a blaze. Soft greenery\
have been added to the street sides to help make it look more attractive.\
To the north you can see the north docking bay where the transport ships\
continualy stop. Security Road lies to the east and west, while &P Anna\
Avenue &R can be seen to the north and south.\
", 
         Vnum = 21004, 
         TeleDelay = 0, 
         Name = "Intersection of Anna Avenue and Security Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The northern Docking bay can be seen in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21100, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Security Road extends to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21005, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Going south will bring you near the heart of the city.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21003, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "Security Road extends to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21035, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21005] = 
      {
         Tunnel = 0, 
         Description = "&R This portion of Security Road seems extremly well taken care of.  A\
whistling northern wind can be heard passing the large Security building\
to the north.  The extremly large building was made out of grinded lava\
rock from the planet ocean floor. This extremly hard surface is known for\
it's ability to keep criminals inside. Security Road stretches  to the\
east and west.\
", 
         Vnum = 21005, 
         TeleDelay = 0, 
         Name = "Main Security Office", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21132, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Security Road lies to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21006, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "The intersection of Anna Avenue and Security Road is to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21004, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21006] = 
      {
         Tunnel = 0, 
         Description = "&RYou are on a straight section of Security Road.  A statue depicting a\
party of adventurers fighting off a Imperial Stortrooper sits in the\
center of the road.  Blinking back a tear, you remember hearing this tale\
in a local Factory , and realize that the statue is a memorial.  Security\
Road extends to the east and west. \
", 
         Vnum = 21006, 
         TeleDelay = 0, 
         Name = "Security Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road is to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21007, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road extends westward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21005, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21007] = 
      {
         Tunnel = 0, 
         Description = "&R You are walking down Security Road.  The long road, which lines the\
northern wall of Coral City, meets up with Oceanview Street to the east to\
form one of the four corners of Coral City. Beyond these four corners is a\
small walkway guarded by a Mon built breakwater that turns back the\
largest ocean on a habital planet. The street continues westward.\
", 
         Vnum = 21007, 
         TeleDelay = 0, 
         Name = "Security Road", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road meets Luke Street to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21008, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21006, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21008] = 
      {
         Tunnel = 0, 
         Description = "&B Oceanview Street and Security Road come together here to form one of the\
four corners of Coral City. Oceanview Street lies to the south, while\
Security Road stretches westward.To the south you can see Mon Calamrian\
New Rebublic troops practicing military drills incase and invasion ever\
occurs again. \
", 
         Vnum = 21008, 
         TeleDelay = 0, 
         Name = "Meeting of Oceanview Street and Security Road ", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "Luke Street lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21009, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road lies to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21007, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21009] = 
      {
         Tunnel = 0, 
         Description = "&B This section of Oceanview Street is reserved for the Mon Calamrian\
defense team.  E- Web Blaster's and Com - blasters are stacked high into\
the air, almost within reach of the  New Rebublic guards on the outpost.\
to the west. Oceanview Street stretches to the north and south.  You also\
\
see in the enterance a body scanner that will make sure you have no\
weapons on you.\
", 
         Vnum = 21009, 
         TeleDelay = 0, 
         Name = "Oceanview Street", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street meets up with Security Road to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21008, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Luke Street continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21010, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21010] = 
      {
         Tunnel = 0, 
         Description = "&B This portion of Oceanview Street is rather poor and unkempt.  Rags\
\
litter the street, and several of the city's unfortunate have set up\
residence here.;A holohome has been set up on the eastern side of the\
road, a beggar's home no doubt.  They prefer this road thanks to the\
constant tourists that travelk it. Oceanview Street continues to the north\
and south.\
", 
         Vnum = 21010, 
         TeleDelay = 0, 
         Name = "Oceanview Street", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21009, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road ranges to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21011, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21011] = 
      {
         Tunnel = 0, 
         Description = "&BYou are walking down the northern half of Oceanview Street at a brisk\
pace. To the east is the towering  security wall of Coral City ,blocking\
your view of the awsome ocean.   Oceanview Street ranges to the north and\
south.  The road is extremly polished and looks as if not to many Mon\
Calamrian's travel down it.\
", 
         Vnum = 21011, 
         TeleDelay = 0, 
         Name = "Oceanview Street", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street extends northward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21010, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Barster Road and Luke Street cross to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21012, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21012] = 
      {
         Tunnel = 0, 
         Description = "&B You stand at the intersection of Barster Road and Oceanview Street.  To\
the east you can see the massive east Docking bay of Coral City. This is\
one of the main smuggling bay's of the city.While Oceanview Street lies to\
the north and south, and Barster Road runs west.\
", 
         Vnum = 21012, 
         TeleDelay = 0, 
         Name = "Intersection of Barster Road and Oceanview Street", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street is to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21011, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "To the east is the eastern Docking bay.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21113, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "You can see Luke Street stretch far to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21013, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "Barster Road lies to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21038, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21013] = 
      {
         Tunnel = 0, 
         Description = "&B You take a brief pause on your way down Oceanview Street, and you can\
hear the chirping of some strange bird like creature  coming from the\
other side of the extending breakwall.  Upon catching your breath from the\
salty air, you gather  your belongings and continue on your way.\
", 
         Vnum = 21013, 
         TeleDelay = 0, 
         Name = "Oceanview Street", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Barster Road and Luke Street cross just north of here.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21012, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Trading Post  and Luke Street intersection is south of here.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21014, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21014] = 
      {
         Tunnel = 0, 
         Description = "&B You stand at the intersection of Trading Post Street and Luke Street.\
You look out and can see the waves crash upon the breakwall To the west\
are the glorious pavilions and shops of Coral City, while Oceanview Street\
continues to the north and south.\
", 
         Vnum = 21014, 
         TeleDelay = 0, 
         Name = "Intersection of Trading post Street and Oceanview Street ", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street lies in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21013, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Luke Street stretches southward as far as the eye can see.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21015, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "The Trading posts of Akatamer await your arrival and Credits.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21050, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21015] = 
      {
         Tunnel = 0, 
         Description = "&B This portion of Oceanview street allows you see rest and watch one of\
the two suns set. Two crome like  benches sit on opposite sides of the\
polished rock road, enticing you to rest.  You can see Law Avenue meeting\
up with Oceanview Street to the south, while to the north is the Trading\
Post Street  and Oceanview Street intersection.\
", 
         Vnum = 21015, 
         TeleDelay = 0, 
         Name = "Oceanview Street.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Trading post Street and Luke Street meet to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21014, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Gazing southward, you see the southeastern corner of Akatamer.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21016, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21016] = 
      {
         Tunnel = 0, 
         Description = "&WOceanview  Street and Law Avenue come together here to form one of the\
four corners of Coral City. This attractive street recived it's name\
\
becasue the creators of the city's layout placed it on a hill allowing you\
to look at the ocean.Oceanview Street lies to the north, while Law Avenue\
stretches westward.\
", 
         Vnum = 21016, 
         TeleDelay = 0, 
         Name = "Meeting of Oceanview Street and Law Avenue ", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Luke Street lies to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21015, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 6905, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue lies to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21017, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21017] = 
      {
         Tunnel = 0, 
         Description = "&WYou are walking down the newly paved Law Avenue, the road which lines the\
southern wall of Coral City recives constant traffic and is ofen the\
center of attraction.  The dust  here seems wet and muddy. you must be\
getting closer to the ocean  To the east is one of the four corners  of\
Coral City, while Law Avenue continues westward. \
", 
         Vnum = 21017, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Law Avenue joins Luke Street to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21016, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Law Avenue stretches westward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21018, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21018] = 
      {
         Tunnel = 0, 
         Description = "&W A tall statue attracts your attention on this portion of Law Avenue. \
The platiki metallic  sculpture is of a Calamrian in his late years\
wielding a E-web Blaster against an unseen attacker, although from the\
man's posture it is obvious that his opponent was enormous.  A small\
golden plaque sits near the statue, explaining its importance.  The newly\
paved road stretches both east and west. \
", 
         Vnum = 21018, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "In honor of the late GHETT, founder of the special forces team S.P.I.N.\
\13True friend, and hero to all of us. \
\13", 
               Keyword = "statue ", 
            }, 
            [2] = 
            {
               Description = "The plaque reads: 'May you rest in peace, Ghett of S.P.I.N..'\
\13", 
               Keyword = "plaque", 
            }, 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21138, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "The road extends eastward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21017, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue stretches westward as far as the eye can see.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21019, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21019] = 
      {
         Tunnel = 0, 
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
         Vnum = 21019, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21051, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21018, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Anna Avenue and Law Avenue cross to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21020, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21020] = 
      {
         Tunnel = 0, 
         Description = "&W You stand at the intersection of Anna Avenue and Law Avenue.  Gazing to\
the south, you see the massive south Docking bay of Coral City. It is\
there most new traders enter the city. It also there that new bounty\
hunters enter. The newly covered roads of Anna Avenue and Law Avenue lie\
in the four cardinal directions.\
", 
         Vnum = 21020, 
         TeleDelay = 0, 
         Name = "Intersection of Anna Avenue and Law Avenue", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "To the north is Anna Avenue.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21044, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "You see the legendary Law Avenue.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21019, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "To the south is Akatamer's southern Docking bay.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21074, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "Law Avenue extends to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21021, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21021] = 
      {
         Tunnel = 0, 
         Description = "&W You are traveling down one of the newly covered section of Law Avenue at\
a brisk pace. To the north is the Mon Calamrian Factory , a building known\
throughout the the world for its rare metal melting.  You feel almost like\
paying the building a visit.  Law Avenue extends to the east and west.\
", 
         Vnum = 21021, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21073, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue and Anna Road cross to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21020, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue ranges to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21022, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21022] = 
      {
         Tunnel = 0, 
         Description = "&W You are walking down a rather commercial part of Law Avenue. Merchants\
and droids hassle you to spend your credits as you attempt to continue on\
your way. Glancing to the north, you see  the only shop worth visiting,\
owned by the respectable Lokist the Tailor.  Law Avenue stretches to the\
east and west. \
", 
         Vnum = 21022, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A fashion shop is situated to the north.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21066, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue extends to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21021, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue stretches westward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21023, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21023] = 
      {
         Tunnel = 0, 
         Description = "&W This stretch of Law Avenue is well trimed and well kept, like most of\
the streets now in Coral City.  Looking northward, you see a small defense\
building that looks like it saw some where and tear twenty years  ago.\
Most of the remains are unenterable.  The lengthy polished rock road\
extends to the east and west. \
", 
         Vnum = 21023, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21186, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue continues in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21022, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Law Avenue clashes with Monock Road to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21024, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21024] = 
      {
         Tunnel = 0, 
         Description = "&W Monock Road and Law Avenue come together here to form one of the four\
corners of Coral City.  A metal staircase leads up onto the main city's\
Security Post, from where even the strongest Imperial Stormtrooper  can be\
repelled. Monock Road lies to the north, while Law Avenue stretches\
eastward.\
", 
         Vnum = 21024, 
         TeleDelay = 0, 
         Name = "Meeting of Monock Road and Law Avenue", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road lies to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21025, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Law Avenue lies to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21023, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21025] = 
      {
         Tunnel = 0, 
         Description = "&p You pick up your pace as you travel down this portion of Monock Road.\
\
Gazing eastward, you see what is easily the darkest alley in the city,\
though a glimmer of light can be seen flickering in the shadows of the\
slim street.  To the north is an intersection, while Monock Road continues\
to the south. \
", 
         Vnum = 21025, 
         TeleDelay = 0, 
         Name = "Monock Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Thieves Alley is east of here.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21026, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "The Thieves Alley is east of here.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21063, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "One of the four corners of Akatamer is located to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21024, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21026] = 
      {
         Tunnel = 0, 
         Description = "&Y You stand at the intersection of Trading Post  Street and Monock Road. \
A wall towers over you to the west, keeping intruders (mostly Quarren) out\
of Coral City unannounced.  To the east are the newly built shops of Coral\
City, while Monock Road continues to the north and south.\
", 
         Vnum = 21026, 
         TeleDelay = 0, 
         Name = "Intersection of Trading Post  Street and Monock Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road lies in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21027, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "You gaze at the pavillions and shops of Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21045, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "To the south is Monock Road.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21025, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21027] = 
      {
         Tunnel = 0, 
         Description = "&p You are walking down a poorer section of Monock Road.  The carved rock\
roads  seem unkept and poorly made, definitely unusual in this city which\
represents hope and order.  The street ranges to the north and south.\
", 
         Vnum = 21027, 
         TeleDelay = 0, 
         Name = "Monock Road", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Barster Road and Monock Road cross to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21028, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Trading Post  Street and Monock Road cross just south of here.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21026, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21028] = 
      {
         Tunnel = 0, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in the four cardinal directions.\
", 
         Vnum = 21028, 
         TeleDelay = 0, 
         Name = "Intersection of Barster Road and Monock Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The metallic streets of Monock Road lie to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21029, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Walking in this direction will lead you into the very heart of the city.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21041, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Monock Road lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21027, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "To the west is the west Docking bay of Akatamer.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21088, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21029] = 
      {
         Tunnel = 0, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in two directions north and south.\
", 
         Vnum = 21029, 
         TeleDelay = 0, 
         Name = "Monock Road", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road stretches northward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21030, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The intersection of Barster Road and Monock Road is south of here.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21028, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21030] = 
      {
         Tunnel = 0, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not palnning to tackle for awile. \
", 
         Vnum = 21030, 
         TeleDelay = 0, 
         Name = "Monock Road", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road extends northward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21031, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21067, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Monock Road stretches southward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21029, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21031] = 
      {
         Tunnel = 0, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not planning to tackle for awile.\
", 
         Vnum = 21031, 
         TeleDelay = 0, 
         Name = "Monock Road", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Monock Road meets with Security Road to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21032, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Monock Road lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21030, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21032] = 
      {
         Tunnel = 0, 
         Description = "&R Monock Road and Security Road come together here to form one of the four\
corners of Coral City.  From here you can smell the ocean sea salt form\
the nearby breakwall to the west. It reminds you of the fun you have\
swimming in the huge ocean that surrounds this city. Monock Road lies to\
the south, while Security Road stretches \
", 
         Vnum = 21032, 
         TeleDelay = 0, 
         Name = "Meeting of Monock Road and Security Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road lies to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21033, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Monock Road lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21031, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21033] = 
      {
         Tunnel = 0, 
         Description = "&RYou stand on  Security Road staring at the two suns or the stars above\
your head, depending on time.  This newly paved street is made of polished\
rock that glimers when the first sun comes up. In the distence you can see\
Mon Calamrian children playing in the nearby park. \
", 
         Vnum = 21033, 
         TeleDelay = 0, 
         Name = "Security Road", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road stretches eastward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21034, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road and Monock Road meet to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21032, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21034] = 
      {
         Tunnel = 0, 
         Description = "&RYou travel down a newly lanscaped area of Security Road.  In the new park\
created to the south you can hear strange animal noises that remind you of\
the days back when you used to go to the galactic zoo.  The mysterious\
melody relaxes you as you start to whistle with the birds in a city of\
peace and goodness.  Security Road stretches east and west.\
", 
         Vnum = 21034, 
         TeleDelay = 0, 
         Name = "Security Road", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Security Road lies to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21035, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21131, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Security Road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21033, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21035] = 
      {
         Tunnel = 0, 
         Description = "&R You are walking cautiously through this part of Security Road.  Lately\
you have heard rumors of thieves prowling these parts, mocking the very\
name of the road.  But that is mostly not likely. The newly paved street\
\
ranges to the east and west.\
", 
         Vnum = 21035, 
         TeleDelay = 0, 
         Name = "Security Road", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The intersection of Anna Avenue and Security Road is east of here.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21004, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Security Road stretches westward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21034, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21036] = 
      {
         Tunnel = 0, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east and west is the  Barster Road  \
", 
         Vnum = 21036, 
         TeleDelay = 0, 
         Name = "Barster Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Barster Road stretches onward in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21037, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road to the west leads to Akatamer Square.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21000, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21037] = 
      {
         Tunnel = 0, 
         Description = "&c While walking Barster Road, you gaze up at the Akatamer medical\
facility, whose entrance lies to the south. New plantlife grows along side\
the road,&G adding a buitiful haze of green. &c The lengthy rock carved\
out road stretches to the east and west.&x\
", 
         Vnum = 21037, 
         TeleDelay = 0, 
         Name = "Barster Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Barster Road continues in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21038, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The enterence to Akatamer's Tower of Jedi's are to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21126, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Barster Road continues in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21036, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21038] = 
      {
         Tunnel = 0, 
         Description = "&c Young and giddy Mon Calmarians pass you as you travel this portion of\
Barster Road.  Gazing southward, you see the illustrious Coral City\
Academy, which has the responsibility of educateting new Mon Calamarian's.\
 The newly carved rock road of Barster  continue to the east and west.\
", 
         Vnum = 21038, 
         TeleDelay = 0, 
         Name = "Barster Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The intersection of Barster Road and Luke Street lies to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21012, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21133, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Barster Road stretches to the west as far as the eye can see.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21037, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21039] = 
      {
         Tunnel = 0, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east is Coral City Square, while Barster Road\
leads on to the west.   \
", 
         Vnum = 21039, 
         TeleDelay = 0, 
         Name = "Barster Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road to the east leads to Akatamer Square.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21000, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Barster Road stretches onward as far as the eye can see.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21040, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21040] = 
      {
         Tunnel = 0, 
         Description = "&cHere the city's only and extremly large  Hotel stands to the south It was\
constructed fromt he remains of crashed space vessel. It is considered\
sheek to stay in this coverted junk heap (Who figures?)You make note to\
remember  this location for later.  Gazing to the east and west, you can\
see nothing but Barster Road. \
", 
         Vnum = 21040, 
         TeleDelay = 0, 
         Name = "Barster Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Barster Road stretches further eastward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21039, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The town hotel  awaits.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21069, 
               Keyword = "door", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Barster Road stretches further westward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21041, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21041] = 
      {
         Tunnel = 0, 
         Description = "&c Cheery laughter can be heard in this section of Barster Road.  Listening\
closely, you are not surprised to find the laughter coming from the\
Cantinia to the south.  People from differnt planets passing by also seem\
interested in those who can find joy in these dark times. This tavern is\
best place to find new friends, bith good and evil. Barster Road ranges to\
the east and west.\
", 
         Vnum = 21041, 
         TeleDelay = 0, 
         Name = "Barster Road", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Barster Road continues in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21040, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The tavern lies to the south.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21068, 
               Keyword = "door", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Barster Road and Monock Road cross to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21028, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21042] = 
      {
         Tunnel = 0, 
         Description = "&PYou are travelling upon the southern portion of Anna Avenue.  The newly\
constructed buildings of the Coral City Trading Post street rise high into\
the air to the east and west.  The metallic road stretches to the north\
and south, where you can see a bustling intersection of Mon Calamrian\
shopers.\
", 
         Vnum = 21042, 
         TeleDelay = 0, 
         Name = "Anna Avenue", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The road to the north leads to Akatamer Square.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21000, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A bustling intersection lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21043, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21043] = 
      {
         Tunnel = 0, 
         Description = "&YYou stand at the intersection of Anna Avenue and Trading Post  Street. \
The intersection bustles with activity as citizens go about their\
business. To the east and west runs Trading Post  Street, lined with the\
exotic and local shops of Coral City, while Anna Avenue lies to the north\
and south. \
", 
         Vnum = 21043, 
         TeleDelay = 0, 
         Name = "Intersection of Anna Avenue and Trading Post  Street", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Anna Avenue lies to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21042, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21048, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Anna Avenue stretches to the south as far as the eye can see.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21044, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21047, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21044] = 
      {
         Tunnel = 0, 
         Description = "&PWhile traversing the busy, smooth carved road of Coral City, you notice a\
\
particularly dark alley to the west which citizens commonly avoid. As  you\
 imagine running into a cloaked thief lurking in the shadows. Anna Avenue\
extends to the north and south.\
", 
         Vnum = 21044, 
         TeleDelay = 0, 
         Name = "Anna Avenue", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Intersection of Anna Avenue and Trading Post  Street\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21043, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The intersection of Anna Avenue and Law Avenue lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21020, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "You can't make out any details about the dark alley.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21065, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21045] = 
      {
         Tunnel = 0, 
         Description = "To the north is where a rock seller used to hold shop, on the door is a\
small sign. it does keep your wife happy. Trading Post  Street extends to\
the east and west. \
", 
         Vnum = 21045, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "More shops attract your attention to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21046, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A jewelry shop has been set up in the tent to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21052, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "Trading Post  Street meets up with Monock Road to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21026, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21046] = 
      {
         Tunnel = 0, 
         Description = "&YCitizens of Coral City waddle  around you, anxious to finish their\
shopping. Gazing northward, you can see a female Rodian drying a multitude\
of spices, while to the south you see Coral City's courier service. \
Trading Post  Street ranges to the east and west. \
", 
         Vnum = 21046, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The Spice Trader's is to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21054, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "More shops attract your attention to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21047, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "The Akatamer mail service is situated in a building to the south.\
\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21053, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "More shops attract your attention to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21045, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21047] = 
      {
         Tunnel = 0, 
         Description = "&YThe newly carved polished stone rock road is buzzing with activity. \
Eager shouts from numerous new buildings encourage potential customers to\
come inspect a shopkeeper's;wares.  To the north is Anikem's new shop,\
while a Map Builder  just moved in to the south.  Trading Post  Street\
stretches to the east and west. \
There is a small note tacked up on the north door.\
", 
         Vnum = 21047, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Sorry due to costs of shipping I have moved my shop below closer to the\
\13mine.\
\13", 
               Keyword = "note", 
            }, 
            [2] = 
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
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "You see the intersection of Anna Avenue and Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21043, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A mapmaker store lies to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21056, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "More shops attract your attention to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21046, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21048] = 
      {
         Tunnel = 0, 
         Description = "&YThe newly carved rock road is buzzing with activity.  Eager shouts from\
the newly built buildings encourage potential customers to come inspect a\
shopkeeper's wares.  To the north you can smaell the sweet aroma that is\
the Bantha barbecue Shop , while the building to the south is dedicated to\
repairing broken items.  Trading Post  Street stretches to the east and\
west.\
", 
         Vnum = 21048, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The barbecue stand lies in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21057, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "More shops attract your attention in this direction.\
\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21049, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "You can see a stocky Mon Calamrian repairing equipment.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21058, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "The intersection of Anna Avenue and Trading Post  Street lies to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21043, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21049] = 
      {
         Tunnel = 0, 
         Description = "&YCitizens of Coral City scamper about you, eager to finish their shopping.\
The aroma of fresh bread assails your nose, coming from a bakery from the\
north, and you can see Armory clanging from the wind on the shop to the\
south.ity's armoury to the south.  Trading Post  Street ranges to the east\
and west. \
", 
         Vnum = 21049, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "You can see a bakery to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21060, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "More shops attract your attention in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21050, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "The Bobba waresis to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21059, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "More shops attract your attention in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21048, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21050] = 
      {
         Tunnel = 0, 
         Description = "&YYou smile at the familiar sight of Trading Post  Street and its glorious\
newly built buildings. The buzz of vibro-blades can be heard from the\
south, while the blue milk dairy is situated to the north.  Trading Post \
Street extends east and west. \
", 
         Vnum = 21050, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The dairy to the north deals in all blue milk dairy products.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21061, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "Trading Post  Street joins up with Luke Street to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21014, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Weapons can be bought or sold in the store to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21062, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "More shops attract you in this direction.\
\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21049, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21051] = 
      {
         Tunnel = 0, 
         Description = "", 
         Vnum = 21051, 
         Tag = "", 
         Name = "Interior of City Hall", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21019, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21052] = 
      {
         Tunnel = 0, 
         Description = "&O A locked display box dominates this particular shop.  Under the glass of\
the box are two of the only three known ulti-ma pearls in existence., each\
lying gently upon a miniscule cushion. Various other items are displayed\
in differnt boxes. Hanging from the walls are various paintings, while\
sculptures take up the rest of the floor space. A north door leads back\
out onto Trading Post Street.\
", 
         Vnum = 21052, 
         Tag = "", 
         Name = "The Shining Emerald", 
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
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21045, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21053] = 
      {
         Tunnel = 0, 
         Description = "&O An immense computer set against the southern wall of the Building has\
been organized into small consoles, each containing letters to and from\
the citizens of Coral City through Star mail.  Errand boys are constantly\
coming in and collecting disks for delivery.  In the center of the room is\
a large glatic_net mail terminal where people from around the world can\
send mail. A door to the north leads back out onto Trading Post  Street .\
", 
         Vnum = 21053, 
         Tag = "", 
         Name = "Coral City Courier Office", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - Mail Service is Governemnt Own sorry!\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Flags = 
         {
            [18] = "NoDrop", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "An opening in the building leads back out onto Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21046, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21054] = 
      {
         Tunnel = 0, 
         Description = "&OThis newly contructed building is filled with the scent of dried spices.\
Wooden shelves are lined with spices, each of varying colors. A counter\
sits in the center of the room. Walking nearer, you notice a small plaque\
on the counter which reads 'Success lies in Spices'. Dispite numerous\
attempts to outlaw spices , they are still legal in this city. A door\
south leads back out onto Trading Post  Street.\
", 
         Vnum = 21054, 
         Tag = "", 
         Name = "The Spice dealer", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 50,000 Must be a smuggler of 40\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21046, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21055] = 
      {
         Tunnel = 0, 
         Description = "&O A musty odor fills your nostrils as you inhale.  Shelves hug the walls\
of this newly created building, each shelf filled with  items from the\
mines or ocean floor.  As you begin to inspect several of the shelves, you\
notice they are all covered in dust and dirt.  A square wooden counter\
sits in the center of the room, and to to the south a door leads back out\
onto Trading Post  Street. \
", 
         Vnum = 21055, 
         Tag = "", 
         Name = "Anakiem's Rocks", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - Not for Sale\
\13", 
               Keyword = "cost ", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 6882, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21056] = 
      {
         Tunnel = 0, 
         Description = "&OYou find yourself in a rather small and empty shop.  Parchments tied into\
neat packs lie about in an unorganized manner in the back corner.  A\
counter in the center of the room houses numerous state of the art\
Holo-Maps, as well as a couple more computer writing tools. This thin\
printer is havinga hard time converting to new technology, and is even\
contemplating retiring. A door to the  north leads back out onto Trading\
Post  Street. \
", 
         Vnum = 21056, 
         Tag = "", 
         Name = "Maps", 
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
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21047, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21057] = 
      {
         Tunnel = 0, 
         Description = "&OThe smell of fresh meat grilled to a perfection as only chef Wannie knows\
how is present in the air of this shop.  Kept cool in frosted vaults, the\
city chef sells his meats here, imported from planets far distant or\
harvested form the ocean. There are a few tables scattered around for you\
to sit at, and share stories with your friends.Through the door to the\
south is Trading Post  Street.\
", 
         Vnum = 21057, 
         Tag = "", 
         Name = "The Bantha Barbecue Shop", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "An opening in the tent allows you to return to Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21048, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21058] = 
      {
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
         Vnum = 21058, 
         Tag = "", 
         Name = "The Unlit saber", 
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
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21048, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21059] = 
      {
         Tunnel = 0, 
         Description = "&O This Mon Calamarian is a dedicated creator of armor and shields.  Having\
lost her son to shabby equipment, she took up the job of putting\
protective suits of armor together. She is also  extremly infatuated with\
the legendary Bobba Fett, and collects any holographics  or drawings of\
this great Bounty Hunter. The enterance leads back out north onto Trading\
Post  Street.\
", 
         Vnum = 21059, 
         Tag = "", 
         Name = "Bobba's wares", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 80,000 plus a Dinner with Bobba Fett\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21049, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21060] = 
      {
         Tunnel = 0, 
         Description = "&OUpon entering the Akatamer Bakery, you find yourself surrounded by\
citizens of the marvelous city, each waiting in line for their daily\
bread. This Mon Calamrian is famous for his fine baked bread made from\
refined seaweed. This green food is terrific with every meal. The door to\
the south leads back out onto Trading Post  Street. \
", 
         Vnum = 21060, 
         Tag = "", 
         Name = "The Akatamer Bakery", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 28,000 And a Love for Bread\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21049, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21061] = 
      {
         Tunnel = 0, 
         Description = "&OThis small shop smells strongly of blue cheese, as dozens of types of\
cheeses have been laid out and labeled properly on several long shelves. \
You notice many bottles of blue milk, considered to be more important than\
even water, carefully stacked in the northeast corner.  This Mon girl is\
staioned here by here father to sell this rare drink froma seacow. Through\
the door Trading Post  Street lies to the south.\
", 
         Vnum = 21061, 
         Tag = "", 
         Name = "The Blue Sea-Cow", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 28,000 credits a you must marry off His daughter.\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21050, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21062] = 
      {
         Tunnel = 0, 
         Description = "&ORacks line the walls of this store, each filled to the brim with weapons.\
You grin evilly at the items of destruction, and try out a couple on the\
practice dummies hung from the ceiling.  A counter in the center of the\
room is where the keeper of this shop does business.  He is an extremly\
large calamarian who knows his stuff. The door to the north leads back out\
onto Trading Post  Street.\
", 
         Vnum = 21062, 
         Tag = "", 
         Name = "Vibro-Fizz", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 89,000 credits and Engineering\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21050, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21063] = 
      {
         Tunnel = 0, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
         Vnum = 21063, 
         TeleDelay = 0, 
         Name = "Thieves Alley", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The Thieves Alley continues in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21064, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Monock Road lies to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21025, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21064] = 
      {
         Tunnel = 0, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
         Vnum = 21064, 
         TeleDelay = 0, 
         Name = "Thieves Alley", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The Thieves Alley continues in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21065, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The Thieves Alley continues in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21063, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21065] = 
      {
         Tunnel = 0, 
         Description = "You are walking through a particularly dark and unkempt alley of Akatamer.\
Whomp rats scurry across the metallicground, squeaking at you.  Empty crates and\
tattered rags are lying about.  The alley opens up to Anna Avenue to the\
\
east, while to the west the darkness deepens.\
", 
         Vnum = 21065, 
         TeleDelay = 0, 
         Name = "Thieves Alley", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Anna Avenue lies to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21044, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The Thieves Alley continues in this direction.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21064, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21066] = 
      {
         Tunnel = 0, 
         Description = "&O The shop you have entered smells heavily of dried bantha leather. \
Gazing about, you see all manners of clothing, from leather to silk.  A\
coral counter lines the northern wall of the shop, and several stalls line\
the eastern wall, where you can try on your clothes (after you pay for\
them.).  A door to the south leads back out onto Law Avenue. \
", 
         Vnum = 21066, 
         Tag = "", 
         Name = "Annir's Clothing", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "The door leads back out onto Law Avenue\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [3] = "Secret", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21022, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21180, 
               Keyword = "hatch", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21067] = 
      {
         Tunnel = 0, 
         Description = "&O You walk into a large shop which smells of Banthas.  Behind the long\
wooden counter are dozens of cages containing varying types of animals. \
You can hear the sounds of creatures coming from a store room in the back\
of the shop.  A path to the west leads back out onto the busy Monnock St.\
", 
         Vnum = 21067, 
         Tag = "", 
         Name = "Companions and Mounts", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21030, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21068] = 
      {
         Tunnel = 0, 
         Description = "&OYou enter the city's lavish cantinia, in fact the only bar inside the\
city;itself, appropriately connected to the city's hotel  to the east\
through a hallway. That way visitors can just get drunk then head over to\
bed. Smoke and the smell of alcohol mix with laughter, quickly gives you a\
dull headache. To the east is the town hotel , while the fresh air of the\
\
outdoors stands at bay to the north.\
", 
         Vnum = 21068, 
         Tag = "", 
         Name = "The Tavern", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A door leads out onto Barster Road.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21041, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "The hotel  lies to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21069, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21069] = 
      {
         Tunnel = 0, 
         Description = "&OHere a weary traveller can seek a good rest in comfort without fear of\
theft or, worse yet, murder.  A long counter stretches across much of the\
room, and for a few credits the hotel keeper will gladly rent you one of\
his rooms.  Drunken laughter emerges from a hall to the west.  To the\
south beyond a door barred by the hotel keeper are the rooms.\
 \
You may safely quit here.\
", 
         Vnum = 21069, 
         Tag = "", 
         Name = "The Akatamer hotel ", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Barster Road lies to the north.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21040, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The tavern lies to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21068, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21071] = 
      {
         Tunnel = 0, 
         Description = "This room is for the severly wounded. Please donot take advantage of this\
great Facility or the Mon Calamarian Officals will have to remove the\
bacta tank. \
", 
         Vnum = 21071, 
         Tag = "", 
         Name = "&C Inside Bacta Tank", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your\
body.\
feel heal $n\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21127, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21072] = 
      {
         Tunnel = 0, 
         Description = "&z This lavish room comes complete with plush bantha leather seat benches.\
A brand new drinking fountain that diperses fresh salt water for drinking.\
And a new cooking droid here to serve some of the great Mon Calamari food.\
The floor is a soft grey colored marble like rock sanded to a smooth\
surface. \
", 
         Vnum = 21072, 
         Tag = "", 
         Name = "Restarea", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21100, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21073] = 
      {
         Tunnel = 0, 
         Description = "&c &C You stand before huge doors of the Krantz mining ore factory complex.\
 the doors are kept closed, yet the bared windows are cracked open to give\
all the heat and noise inside a means of escaping.  The doors are made of\
some sort of black metal, most likely found on the ocean floor  seemingly\
impenatrable, and has the Krontz symbol K carved into them  You are not\
sure if the doors are meant to keep intruders out, or workers in...\
", 
         Vnum = 21073, 
         Tag = "", 
         Name = "Factory Enterence", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21151, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21021, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21074] = 
      {
         Tunnel = 0, 
         Description = "&z You stand inside the southern Docking bay of Coral City. Ships of all\
sizes line the many enterences.There is only four docking bays on Mon\
Calamari that is known to the public and all four exsist on the outskirts\
of the city. They were originally created as Imperial Slave ports but were\
later converted to Docking bays.To the north is the intersection of Anna\
Avenue and Law Avenue.\
", 
         Vnum = 21074, 
         Tag = "", 
         Name = "Inside the Southern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Two roads cross to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21020, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Docking bay leads outside of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 21073, 
               DestinationVnum = 21075, 
               Keyword = "Docking bay", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21075] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the eastand west. While to the north you\
can hear the sounds of ships landing and taking off.\
", 
         Vnum = 21075, 
         Tag = "", 
         Name = "Outside the Southern Docking bay", 
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
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The Docking bay leads into the city of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 21073, 
               DestinationVnum = 21074, 
               Keyword = "Docking bay", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "A path begins to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21123, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "A path begins to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21076, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21076] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
\
the city.  The road stretches to the east and west. \
", 
         Vnum = 21076, 
         TeleDelay = 0, 
         Name = "On a Road west of the Southern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "To the east the southern Docking bay of Akatamer.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21075, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21077, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21077] = 
      {
         Tunnel = 0, 
         Description = "&c You are on carved out rock road rounding the southern wall of Akatamer.\
The familiar sound of running water emanates from the Mon Calamarian ocean\
to the south. The large breakwater was created to keep the nasty wind\
storms that come up from spalshing 50 ft. waves upon the city.  The road\
stretches to the east and west. \
", 
         Vnum = 21077, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21076, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21078, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21078] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Vnum = 21078, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21077, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The trail continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21079, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21079] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can hear the\
ocean getting nearer to the west.  \
", 
         Vnum = 21079, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21078, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21080, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21080] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can see the ocean\
front just off a dock to the west. \
", 
         Vnum = 21080, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21079, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21081, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21081] = 
      {
         Tunnel = 0, 
         Description = "&c  You have come to the western most spot of the city. before you is a\
large dock leading out to the ocean..  Its supports are cracked,and the\
entire structure seems liable to fall into the ocean at any moment. To the\
north and east are two plain man made roads. \
", 
         Vnum = 21081, 
         TeleDelay = 0, 
         Name = "Before the Dock", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A path begins to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21082, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "A road begins to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21080, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 6908, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21082] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.\
", 
         Vnum = 21082, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21083, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The trail continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21081, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21083] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.You look into the sky\
and see a common Mon Calamarian bird above.\
", 
         Vnum = 21083, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The trail continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21084, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21082, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21084] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
         Vnum = 21084, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The road continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21085, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21083, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21085] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
         Vnum = 21085, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21086, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21084, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21086] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Vnum = 21086, 
         TeleDelay = 0, 
         Name = "On a Road south of the Western Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The western entrance to Akatamer lies to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21087, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Water Shuttle continues rounding the city wall of Akatamer.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21085, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21087] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the east you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
         Vnum = 21087, 
         Tag = "", 
         Name = "Outside the Western Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A path begins to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21089, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "The Docking bay leads into the city of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 21070, 
               DestinationVnum = 21088, 
               Keyword = "Docking bay", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "A road begins to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21086, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21088] = 
      {
         Tunnel = 0, 
         Description = "&z You stand in the western dockingbay, do to the massive damage this place\
took by the empire , only small shuttles can enter this docking bay. This\
platform was designed as a slave port for Mon Calamrian workers by the\
Empire years ago, but were later easily converted in to Docking Bay's for\
the Rebellion's greatest ship builder. You can hear the soft wind of the\
ocean to the west.\
", 
         Vnum = 21088, 
         Tag = "", 
         Name = "Inside the Western Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Two roads cross to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21028, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues deep into the metallic waste land s of Haon Dor.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 21070, 
               DestinationVnum = 21087, 
               Keyword = "Docking bay", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21089] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the south you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
         Vnum = 21089, 
         TeleDelay = 0, 
         Name = "On a Road north of the Western Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21090, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The western Docking bay is to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21087, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21090] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Vnum = 21090, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21091, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21089, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21091] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Vnum = 21091, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21092, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21090, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21092] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Vnum = 21092, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21093, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The trail continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21091, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21093] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         Vnum = 21093, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A gentle sea breeze is coming in from the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21094, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21092, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21094] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and south. \
\
", 
         Vnum = 21094, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21095, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21093, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21095] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Vnum = 21095, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21096, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21094, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21096] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Vnum = 21096, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The trail continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21097, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21095, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21097] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
breeze from the ocean beyond.\
", 
         Vnum = 21097, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21098, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21096, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21098] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
drop of water from the ocean beyond.\
", 
         Vnum = 21098, 
         TeleDelay = 0, 
         Name = "On the Road West of the Northern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "Akatamer's northern Docking bay is to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21099, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21097, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21099] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the south you can\
hear alot of hustle and bustle of ships taking off.\
\
", 
         Vnum = 21099, 
         Tag = "", 
         Name = "Outside the Northern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path begins to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21101, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Docking bay leads into Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 21071, 
               DestinationVnum = 21100, 
               Keyword = "Docking bay", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "The road begins to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21098, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21100] = 
      {
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
         Vnum = 21100, 
         Tag = "moncal_landing", 
         Name = "Inside the Northern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The Docking bay leads out of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 21071, 
               DestinationVnum = 21099, 
               Keyword = "Docking bay", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21072, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "Two roads meet to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21004, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21101] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the west you can\
hear alot of hustle and bustle of ships taking off.\
", 
         Vnum = 21101, 
         TeleDelay = 0, 
         Name = "On the Road East of the Northern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The trail continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21102, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Akatamer's northern Docking bay is to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21099, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21102] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Vnum = 21102, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
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
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21103, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21101, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21103] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         Vnum = 21103, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21105, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The trail continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21102, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21105] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You see a Mon Clamrian\
bird soaring in the sky.\
", 
         Vnum = 21105, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21106, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21103, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21106] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the South and west. \
", 
         Vnum = 21106, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21107, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path stretches westward.\
\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21105, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21107] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the eastern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from splashing 50 ft. waves upon\
the city.  The road stretches to the South and North. \
", 
         Vnum = 21107, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path curves around the northeastern corner.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21106, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21108, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21108] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
", 
         Vnum = 21108, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The trail stretches northward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21107, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21109, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21109] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
\
", 
         Vnum = 21109, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The road heads northward.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21108, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road extends to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21110, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21110] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. \
", 
         Vnum = 21110, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21109, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21111, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21111] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the south you can\
\
hear starships taking off.\
", 
         Vnum = 21111, 
         TeleDelay = 0, 
         Name = "On the Road North of The Eastern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21110, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "Akatamer's eastern Docking bay is to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21112, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21112] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the east you can hear\
starships taking off.\
", 
         Vnum = 21112, 
         Tag = "", 
         Name = "Outside the Eastern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "A path begins to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21111, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "A road begins to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21114, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "The Docking bay leads into Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 21072, 
               DestinationVnum = 21113, 
               Keyword = "Docking bay", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21113] = 
      {
         Tunnel = 0, 
         Description = "&z You stand inside the eastern Docking bay of Coral City.  This docking\
\
bay gets very little use, very little survalanice..and consequently is\
known for it's secretive cargo. To the west is the intersection of Barster\
Road and Luke Street. \
", 
         Vnum = 21113, 
         Tag = "", 
         Name = "Inside the Eastern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The Docking bay leads out of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 21072, 
               DestinationVnum = 21112, 
               Keyword = "Docking bay", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "Two roads cross to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21012, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21114] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the north you can\
hear starships taking off.\
", 
         Vnum = 21114, 
         TeleDelay = 0, 
         Name = "On the Road South of The Eastern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The eastern Docking bay is to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21112, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21115, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21115] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         Vnum = 21115, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The trail continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21114, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21116, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21116] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         Vnum = 21116, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The road continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21115, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The path continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21117, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21117] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         Vnum = 21117, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21116, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21118, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21118] = 
      {
         Tunnel = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. You can feel a soft mist\
coming from the ocean.\
\
", 
         Vnum = 21118, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21117, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The road continues to the south.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21119, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21119] = 
      {
         Tunnel = 0, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the eastern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the north. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and North. You\
can feel a soft mist coming from the ocean.\
", 
         Vnum = 21119, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "The path continues to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21118, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21120, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21120] = 
      {
         Tunnel = 0, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
         Vnum = 21120, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21119, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21121, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21121] = 
      {
         Tunnel = 0, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
         Vnum = 21121, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21120, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21122, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21122] = 
      {
         Tunnel = 0, 
         Description = "&c You walk briskly on carved out rock road rounding the southern wall of\
Akatamer.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the south. The large breakwater was created to keep\
the nasty wind storms that come up from spalshing 50 ft. waves upon the\
city.  The road stretches to the east and west. \
", 
         Vnum = 21122, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21121, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The path continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21123, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21123] = 
      {
         Tunnel = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can feel brief\
splashes of water as the ocean spills over the breakwall.\
", 
         Vnum = 21123, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The path continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21122, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "The road continues to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21075, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21124] = 
      {
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 21124, 
         Tag = "", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The road continues to the east.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21123, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "To the west is the southern Docking bay of Akatamer.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21075, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21126] = 
      {
         Tunnel = 0, 
         Description = "&c Before you is a large plain rock building used for healing the sick. The\
rock surface was once a coral underwater creature but is now a memorial to\
what once was. Here you can enter and recive top of the line treatment,\
from some of the greatest medical minds in the galexy. &R The pathway was\
properly framed with imported red plantlife. &c This is another one of\
those steps the new city officols are doing to clean up this city.\
", 
         Vnum = 21126, 
         Tag = "", 
         Name = "&p Mon Calamri Medical Facility", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "Barster Road is to the north.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21037, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "The Tower of Mon Calamri lies to the south.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21127, 
               Keyword = "door", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21127] = 
      {
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
         Vnum = 21127, 
         Tag = "", 
         Name = "&pWithin the Mon Calamri Medical Facility", 
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
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21126, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21129, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "An immense library is at the end of the corridor to the west.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21128, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21128] = 
      {
         Tunnel = 0, 
         Description = "&c This room while not highly decorated is a perfect place for adventurers\
who are grouping with a injured partener. The floor is a well polished and\
clean coral rock. While the walls are decorated with hand drawn pictures\
from Mon Calamarian children. \
", 
         Vnum = 21128, 
         Tag = "", 
         Name = "Waiting Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "The corridor leads back to the main hall.\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21127, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21129] = 
      {
         Tunnel = 0, 
         Description = "&C This small area of the building was sectioned off to allow travelers to\
Mon Calamari the option to purchase medical equipment. The walls are a\
polished coral rock which give off a pinkish reflection. The floor has a\
\
medical track on it to allow easy transport of victims to and from areas\
of the Medical facility. To the West is the Main hallway\
", 
         Vnum = 21129, 
         Tag = "", 
         Name = "Medical Supply Store", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21127, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21130] = 
      {
         Tunnel = 0, 
         Description = "&z This high tech space appears to have no exits except for the main door.\
The walls are a smooth pink coral surface decorated with pictures and\
space charts. There appears to be dirt on the checkered pattern floor and\
a small lighting unit is suspeneded from the ceiling.\
", 
         Vnum = 21130, 
         Tag = "", 
         Name = "New Rebublic Mon Headquaters", 
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
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21009, 
               Keyword = "door", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21131] = 
      {
         Tunnel = 0, 
         Description = "&G A attractive black metal gate frames the enterence to Coral City's\
newest relaxation area. The Security Park, is home to a few rare \
creatures flown in and captured by customs. Due to the lack of space for\
storage , city officals created this new park for them to roam around in.\
It also allows for Mon Calamarian youth to have a safe and fun place to\
play in. There is a large sign above the metal frame that welcome's all to\
the park.\
", 
         Vnum = 21131, 
         Tag = "", 
         Name = "Coral City Park", 
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
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21034, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21135, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21134, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "southwest", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21137, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21132] = 
      {
         Tunnel = 0, 
         Description = "&z You enter the main office of the Mon Calamari Security. This room is\
slightly, less extravegant then the rest, and has more of a rough ocean\
bottom feel. The walls  are decorated with pictures of wanted men, and the\
floors are polished rock that imitates a marble look. This rock was\
inported from the depths of the ocean floor. In front of you is a large\
counter to which you see alot of people working behind. At the counter is\
a sign that says step up for assistance.\
", 
         Vnum = 21132, 
         Tag = "", 
         Name = "Security Lobby", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21139, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21005, 
               Keyword = "door", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21145, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21133] = 
      {
         Tunnel = 0, 
         Description = "", 
         Vnum = 21133, 
         Tag = "", 
         Name = "Coral City Academy", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21038, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21134] = 
      {
         Tunnel = 0, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for it's\
durablity and groth rate. Both of which will be need to maintain the\
trampling and activity it will see. This grass like surface is new to Mon\
Calamarians and they find it extremely interesting, while the Quarren's\
find it just frivlous. \
", 
         Vnum = 21134, 
         Tag = "", 
         Name = "Coral City Park", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21135, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21131, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21136, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21135] = 
      {
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
         Vnum = 21135, 
         Tag = "", 
         Name = "Coral City Park", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21131, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21134, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21136, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21137, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21136] = 
      {
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
         Vnum = 21136, 
         Tag = "", 
         Name = "Coral City Park", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21135, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21134, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21137, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21137] = 
      {
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
         Vnum = 21137, 
         Tag = "", 
         Name = "Coral City Park", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21135, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21131, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21136, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21138] = 
      {
         Tunnel = 0, 
         Description = "&z This marble like surfaced bank allows for easy transactions between you\
and your currencey. There is a large table in the center of the room to\
sign your life away along with, a counter towards the back where a very\
attractive clerk stands and counts the daily inflow of credits. On the top\
of the ceiling you can see a rather expensive security system tracking\
your everymove. The First bank of Mon's motto isn't \"your money is safe\
with us for no reason.\" To make a bank transaction please type bank.\
", 
         Vnum = 21138, 
         Tag = "", 
         Name = "First Bank of Mon (Main Branch)", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [30] = "Prototype", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21018, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21139] = 
      {
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The damp hallway is a dark grey with light grey flashes\
as you pass the cells. Very little activity occurs here as most criminals\
can't escape with over 20' of rock between them and the corridor. You  are\
safe and sure not to hear any of them. There is a large bashproof door to\
the east with an electronic doorslides for safty.\
", 
         Vnum = 21139, 
         Tag = "", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 21428, 
               DestinationVnum = 21140, 
               Keyword = "Door", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21150, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21132, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21140] = 
      {
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         Vnum = 21140, 
         Tag = "", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21141, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21139, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Key = 21140, 
               DestinationVnum = 21149, 
               Keyword = "door", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21141] = 
      {
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         Vnum = 21141, 
         Tag = "", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Key = 21140, 
               DestinationVnum = 21148, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21140, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21142, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21142] = 
      {
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them. \
", 
         Vnum = 21142, 
         Tag = "", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21141, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Key = 21140, 
               DestinationVnum = 21147, 
               Keyword = "door", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21143, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21143] = 
      {
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         Vnum = 21143, 
         Tag = "", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Key = 21140, 
               DestinationVnum = 21146, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21142, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21144, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21144] = 
      {
         Tunnel = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         Vnum = 21144, 
         Tag = "", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21143, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21145, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21145] = 
      {
         Tunnel = 0, 
         Description = "The chief of security's office is now vacant. As the last chief was ordered\
to leave by the Crime Syndacate Mon Calamari is currently looking for a\
BRAVE security officer to replace him. If interested please contact\
Ackbar. Sorry you must be Mon Calamari to fulfill duties\
", 
         Vnum = 21145, 
         Tag = "", 
         Name = "Chief Security Officer's Office", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [3] = "Secret", 
                  [23] = "BashProof", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21144, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21132, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21146] = 
      {
         Tunnel = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         Vnum = 21146, 
         Tag = "", 
         Name = "Cell Block 1138", 
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
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 21140, 
               DestinationVnum = 21143, 
               Keyword = "door", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21147] = 
      {
         Tunnel = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         Vnum = 21147, 
         Tag = "", 
         Name = "Cell Block 1139", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Key = 21140, 
               DestinationVnum = 21142, 
               Keyword = "door", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21148] = 
      {
         Tunnel = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         Vnum = 21148, 
         Tag = "", 
         Name = "Cell Block 1140", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Key = 21140, 
               DestinationVnum = 21141, 
               Keyword = "door", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21149] = 
      {
         Tunnel = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         Vnum = 21149, 
         Tag = "", 
         Name = "Cell Block 1141", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Key = 21140, 
               DestinationVnum = 21140, 
               Keyword = "door", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21150] = 
      {
         Tunnel = 0, 
         Description = "&z This small cubicle is where a very alert and strong guard stays at\
attention. For it is here that the main door opens from and allows access\
to the jail cells. There is a small computer panel on the wall surrounded\
by laser proof glass panels. There is also a large swival chair with a\
recline feature.  The walls and floors are smooth surface unlike the\
surrounding area. It is most likely that this station was recently\
installed.\
", 
         Vnum = 21150, 
         Tag = "", 
         Name = "Security Station", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "lever", 
            }, 
            [2] = 
            {
               Description = "There is a state of the art computer panel with a televison screen for each\
\13cell\
\13block.\
\13In the center of the computer panel is a large lever.\
\13", 
               Keyword = "computer", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21139, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21151] = 
      {
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
         Vnum = 21151, 
         Tag = "", 
         Name = "Security Desk", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21152, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21073, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21155, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21152] = 
      {
         Tunnel = 0, 
         Description = "&c This is a nice, sunlit area, strewn about with cushions and benches and\
other pieces of Calamrian comforts.  Along one wall is a array of service\
machines that sell food and drinks.  There is a mini kitchen near the\
windows, for the employee's lunches.  The walls are covered with pitures\
of home and of some of the workers children. On the table you even see a\
Mon Calamarian Fish Scout cookiee order form.\
", 
         Vnum = 21152, 
         Tag = "", 
         Name = "Worker's Lobby", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21160, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21151, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21153] = 
      {
         Tunnel = 0, 
         Description = "", 
         Vnum = 21153, 
         Tag = "", 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21152, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21155] = 
      {
         Tunnel = 0, 
         Description = "This part of the factory is set up for customer relations with clients.\
There is a protocol droid sitting here to set up meetings, answer\
telecommunica ions and take orders for materials to be sent all over the\
galaxy. The carpet here \
", 
         Vnum = 21155, 
         Tag = "", 
         Name = "Customer Check-In", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Halway", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21156, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21151, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21156] = 
      {
         Tunnel = 0, 
         Description = "You are walking along a plush hallway.  Large windows line the western wall\
and a door is set to the east.  The markings on the door indicate a\
salesroom \
", 
         Vnum = 21156, 
         Tag = "", 
         Name = "Hallway", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-End of Hall", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21158, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "East-Equipment Sales", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21157, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "South-Customer Checkin", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21155, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21157] = 
      {
         Tunnel = 0, 
         Description = "You barely step into the room and are stopped by a large counter.  A short \
squat Protocol Droid stands here taking orders and feeding the information \
into its counterpart, a large assembly droid.  Bins of parts and pieces line the\
walls behind the counter waiting for thier turn to be used in som useful pieces\
of equipment for you.", 
         Vnum = 21157, 
         Tag = "", 
         Name = "Equipment Sales", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "West-Hallway", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21156, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21158] = 
      {
         Tunnel = 0, 
         Description = "Here a magnetic lift sits waiting to take customers up to the ship repair\
", 
         Vnum = 21158, 
         Tag = "", 
         Name = "End of Hall", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "East-Workshop", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21159, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "South-Hallway", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21156, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "up", 
               Description = "Up-Ship Repair", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21170, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21159] = 
      {
         Tunnel = 0, 
         Description = "This is the largest and most elaborate workshop you have everseen. A\
magnetic balanced laser guided lathe sits along the north wall and further\
in is several plasma cutters and a bench of specialty tools of all shapes\
and sizes.  Along the south wall lies a circuit building station complete\
with touch screen  \
", 
         Vnum = 21159, 
         Tag = "", 
         Name = "Workshop", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "West-End of Hall", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21158, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21160] = 
      {
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
         Vnum = 21160, 
         Tag = "", 
         Name = "Security Check-Point", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North- Observation Room", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21161, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21152, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "Down-Workers Entrance", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21162, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21161] = 
      {
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
         Vnum = 21161, 
         Tag = "", 
         Name = "Observation Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "South-Security Checkpoint", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21160, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "Up-Ship Yard", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21172, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "Down-Mainframe Computer", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21162] = 
      {
         Tunnel = 0, 
         Description = "Rows upon Rows of Equipment lockers stand here holding workers personal\
items and tools for work.  This is presumably where those who work at the\
factory  suit up for the day.  There are two exits from here up to the\
security checkpoi t  In the Direction up you can goto the lift station\
while west is the security post. \
", 
         Vnum = 21162, 
         Tag = "", 
         Name = "Workers Entrance", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "West-Lift Station", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21163, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "Up-Security Checkpoint", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21160, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21163] = 
      {
         Tunnel = 0, 
         Description = "The cooled parts arrive here on a conveyor from the north where they are\
loaded into large boxes and the boxes are loaded on to a repulsor lift and\
taken up to  the uppermost floor for storage and transfer onto shipping\
barges.  From here y u can go east to the workers entrance, you can go\
north further up the line, or up to the warehouse..or ne to the mainframe.\
", 
         Vnum = 21163, 
         Tag = "", 
         Name = "Lift Station", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Cooling Section", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21164, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "East-Workers Entrance", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21162, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "up", 
               Description = "Up-Warehouse", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21171, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "northeast", 
               Description = "Northeast-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21164] = 
      {
         Tunnel = 0, 
         Description = "Here the converyor makes a series of sharp turns to S its way from the\
north as dozens of droids turn cooling air hoses on the parts to cool them\
before they  make it to the lift station to the south.  Looking east you\
can see the system that controls the entire facility and from the north\
loud clanging and hissing \
", 
         Vnum = 21164, 
         Tag = "", 
         Name = "Cooling Station", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Molding and Forming", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21166, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "East-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "South-Lift Station", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21163, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21165] = 
      {
         Tunnel = 0, 
         Description = "Here before you is a huge cylinderical object that stretchs from floor to\
ceili g lights run the entire circumfrence of the object and wires string\
about running  away from the massive computer in all directions.  Several\
operator stations ci cle the factory's heart and soul as to monitor and\
solve any problems that occur at a moments notice.  It is possible to\
reach almost any station along the line fr m\
", 
         Vnum = 21165, 
         Tag = "", 
         Name = "Mainframe Computer", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Smelting", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21167, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "West-Cooling Section", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21164, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "up", 
               Description = "Up-Observation Room", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21161, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Direction = "northeast", 
               Description = "Northeast-Sorting and Seperating", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21168, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Direction = "northwest", 
               Description = "Northwest-Molding and Forming", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21166, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Direction = "southwest", 
               Description = "Southwest-Lift Station", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21163, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21166] = 
      {
         Tunnel = 0, 
         Description = "Here is where the super heated pipes carring the melted down ore end.  They pore\
their precious cargo into shape shifting molds that set the steel into whatever\
shape the clients of this factory require.  They are then lifted on to the conveyor\
by special droids designed to withstand the heat.  After that they are sent south \
to the cooling section.  You could go east to find out where the pipes are filled.\
", 
         Vnum = 21166, 
         Tag = "", 
         Name = "Molding and Forming", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21167, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "South- Cooling Section", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21164, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Description = "Southeast-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21167] = 
      {
         Tunnel = 0, 
         Description = "After the ore is seperated further east, it comes here to be dropped in a\
huge vat that melts it down.  Huge specially heated pipes connect to the\
vat here an \
", 
         Vnum = 21167, 
         Tag = "", 
         Name = "Smelting", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "East-Sorting and Seperating", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21168, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "South-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "West- Molding and Forming", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21166, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21168] = 
      {
         Tunnel = 0, 
         Description = "After the raw ore and other materials are recieved to the north it comes\
here. The materials that are used for maintence and electronic\
construction are seper ted from the ore here. As well unexecatable pieces\
of ore are returned to the molin \
", 
         Vnum = 21168, 
         Tag = "", 
         Name = "Sorting and Seperating", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "North-Recieving", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21169, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "West-Smelting", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21167, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Description = "Southwest-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21169] = 
      {
         Tunnel = 0, 
         Description = "Here is where the moling miner machines return to drop off the ore after stripping\
it from the floor of the ocean below.  Other things are also recieved here as well,\
Parts for maintence of crucial machines and critical components that can not be\
created on site.  The sorting area to the south is responsible for deciphering where \
materials need to go,  here though the main concern is unloading the constant \
stream of machines as quickly as possible.", 
         Vnum = 21169, 
         Tag = "", 
         Name = "Recieving", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "South-Sorting and Seperating", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21168, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21170] = 
      {
         Tunnel = 0, 
         Description = "A huge hangar surrounds you and large cranes susspended from the ceiling\
work  continuosly peeling old armor off of ships and pulling worn engine\
casings.  Maintence droids of all shapes and sizes swarm over the ships\
here beeping and whiring at an almost frantic pace.  You get the feeling\
that although this is an iron ore factory they recieve a substancial\
income from the repair of ships\
", 
         Vnum = 21170, 
         Tag = "", 
         Name = "Ship Repair", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "East-Warehouse", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21171, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "Down-End of Hall", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21158, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21171] = 
      {
         Tunnel = 0, 
         Description = "As the repulsor lifts the huge packages of parts bound for other worlds.\
Binary load lifters sweep them up and move them into neat stacks to await \
transport.  Many of the boxes marked armor are sent west to the ship\
repair area and still many other boxes are being sent through huge doors\
to the east \
", 
         Vnum = 21171, 
         Tag = "", 
         Name = "Warehouse", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "East-Ship Yard", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21172, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "West-Ship Repair", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21170, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "Down- Lift Station", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21163, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21172] = 
      {
         Tunnel = 0, 
         Description = "Here a platform that holds at least five cargo ships at any given time is a\
bee hive of activity.  Binary load lifters beep at you to get out of the\
way as the   charge back and forth between waiting barges and the\
warehouse to the west. A  small lev tube sits out of the way at one corner\
of the platform. It seems to  \
West is the warehouse and Down is the observation booth.\
", 
         Vnum = 21172, 
         TeleDelay = 0, 
         Name = "Shipping Platform", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "West-Warehouse", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21171, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "Down-Observation Room", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 21161, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tag = "", 
      }, 
      [21180] = 
      {
         Tunnel = 0, 
         Description = "&z As you look up you can see a few light rays slipping down from the\
cracks in the hard wood floor above. There is a small light positioned in\
the corner of the room. The floor is carved out stone and rather ruffand\
dark. The walls lead around to a small steal circular hatch. If you become\
quiet you can hear small business transactions occuring above.\
", 
         Vnum = 21180, 
         Tag = "", 
         Name = "Secret Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21181, 
               Keyword = "hatch", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21066, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21181] = 
      {
         Tunnel = 0, 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see the hatch, while below you\
look down and see nothing but complete darkness.\
", 
         Vnum = 21181, 
         Tag = "", 
         Name = "Tunnel", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21180, 
               Keyword = "hatch", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21182, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21182] = 
      {
         Tunnel = 0, 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see only darkness, while below\
you look down and see a glimmer of light coming from the darkness.\
", 
         Vnum = 21182, 
         Tag = "", 
         Name = "Tunnel", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21181, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21183, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21183] = 
      {
         Tunnel = 0, 
         Description = "&c  Looking around you know this place is one of danger and definitely\
doesn't belong here in Coral City. The Walls are carved out magma with\
extremly state of the art security cameras scanning your every bio-stat.\
Attached to the sides of the doors are small laser pods used to make sure\
someone doesn't pass who is not allowed.  \
", 
         Vnum = 21183, 
         Tag = "", 
         Name = "Security Clearance Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21184, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21182, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21184] = 
      {
         Tunnel = 0, 
         Description = "&z You stand in a rather large room full of computer and survailence\
equipment. There are strange markings on the displays .You are familiar\
with the markings, Imperial code language . Apparently the rumors about\
the Quarren are true. \
&x\
", 
         Vnum = 21184, 
         Tag = "", 
         Name = "Imperial Spy Base", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21185, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21183, 
               Keyword = "door", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21185] = 
      {
         Tunnel = 0, 
         Description = "", 
         Vnum = 21185, 
         Tag = "", 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21184, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21186] = 
      {
         Tunnel = 0, 
         Description = "Welcome to the Universe Construction Co. , We are always looking for new\
builders. In this room is the Construction Board. On it will be\
assignments and a way to check in. This is not a place to ask for a zone\
you have to email me or contact me on the game! Failure to follow this\
simple rule will result in you getting smacked with my back fin!!!!\
To the east you see a large Library!\
Contact Ackbar for more info!\
", 
         Vnum = 21186, 
         Tag = "", 
         Name = "&G Universe Construction Co.", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21187, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21023, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21187] = 
      {
         Tunnel = 0, 
         Description = "Here you will find some background info available for your reading.\
Understand this is not all you can use but a basic idea to start with. Got\
any more info on projects were doing ..Well email me them at\
MonCal@netscape.net \
", 
         Vnum = 21187, 
         Tag = "", 
         Name = "Construction Blueprints", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21186, 
               Keyword = "", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21445] = 
      {
         Tunnel = 0, 
         Description = "", 
         Vnum = 21445, 
         Tag = "", 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21499] = 
      {
         Tunnel = 0, 
         Description = "", 
         Vnum = 21499, 
         Tag = "", 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [21436] = 
      {
         Tunnel = 0, 
         Description = "", 
         Vnum = 21436, 
         Tag = "", 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
   }, 
   Author = "Ackbar", 
   HighEconomy = 0, 
   LowEconomy = 187437341, 
   VnumRanges = 
   {
      Object = 
      {
         First = 21000, 
         Last = 21435, 
      }, 
      Room = 
      {
         First = 21000, 
         Last = 21499, 
      }, 
      Mob = 
      {
         First = 21000, 
         Last = 21499, 
      }, 
   }, 
   Name = "Mon Calamri", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21003, 
         Arg2 = 2, 
         Arg1 = 21045, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21010, 
         Arg2 = 1, 
         Arg1 = 21055, 
      }, 
      [3] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21012, 
         Arg2 = 7, 
         Arg1 = 21037, 
      }, 
      [4] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [5] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [6] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [7] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [8] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [9] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [10] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [11] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [12] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [13] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21018, 
         Arg2 = 7, 
         Arg1 = 21037, 
      }, 
      [14] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [15] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [16] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [17] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [18] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [19] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [20] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [21] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [22] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [23] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21026, 
         Arg2 = 3, 
         Arg1 = 21052, 
      }, 
      [24] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21029, 
         Arg2 = 7, 
         Arg1 = 21037, 
      }, 
      [25] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [26] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [27] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [28] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [29] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [30] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [31] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [32] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [33] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [34] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21048, 
         Arg2 = 2, 
         Arg1 = 21045, 
      }, 
      [35] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21053, 
         Arg2 = 1, 
         Arg1 = 21017, 
      }, 
      [36] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21053, 
         Arg2 = 1, 
         Arg1 = 21048, 
      }, 
      [37] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21053, 
         Arg2 = 1, 
         Arg1 = 38, 
      }, 
      [38] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21055, 
         Arg2 = 1, 
         Arg1 = 21001, 
      }, 
      [39] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21422, 
      }, 
      [40] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21423, 
      }, 
      [41] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21424, 
      }, 
      [42] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21425, 
      }, 
      [43] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21056, 
         Arg2 = 1, 
         Arg1 = 21011, 
      }, 
      [44] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21057, 
         Arg2 = 1, 
         Arg1 = 21018, 
      }, 
      [45] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21014, 
      }, 
      [46] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21015, 
      }, 
      [47] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21016, 
      }, 
      [48] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21058, 
         Arg2 = 1, 
         Arg1 = 21002, 
      }, 
      [49] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21060, 
         Arg2 = 1, 
         Arg1 = 21019, 
      }, 
      [50] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21020, 
      }, 
      [51] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21021, 
      }, 
      [52] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21061, 
         Arg2 = 1, 
         Arg1 = 21020, 
      }, 
      [53] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21017, 
      }, 
      [54] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21018, 
      }, 
      [55] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21019, 
      }, 
      [56] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21062, 
         Arg2 = 1, 
         Arg1 = 21016, 
      }, 
      [57] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [58] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [59] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21081, 
      }, 
      [60] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21082, 
      }, 
      [61] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21062, 
         Arg2 = 7, 
         Arg1 = 21037, 
      }, 
      [62] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [63] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [64] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [65] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [66] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [67] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [68] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [69] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [70] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [71] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21063, 
         Arg2 = 1, 
         Arg1 = 21055, 
      }, 
      [72] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21064, 
         Arg2 = 3, 
         Arg1 = 21052, 
      }, 
      [73] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21064, 
         Arg2 = 3, 
         Arg1 = 21052, 
      }, 
      [74] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21064, 
         Arg2 = 1, 
         Arg1 = 21055, 
      }, 
      [75] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21065, 
         Arg2 = 1, 
         Arg1 = 21055, 
      }, 
      [76] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21080, 
         Arg2 = 4, 
         Arg1 = 21061, 
      }, 
      [77] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [78] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [79] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [80] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [81] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [82] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [83] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [84] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [85] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [86] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
         Arg2 = 1, 
         Arg1 = 21065, 
      }, 
      [87] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [88] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [89] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [90] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [91] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21087, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [92] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [93] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [94] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [95] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [96] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [97] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [98] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [99] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [100] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [101] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [102] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
         Arg2 = 1, 
         Arg1 = 21065, 
      }, 
      [103] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [104] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [105] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [106] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
         Arg2 = 1, 
         Arg1 = 21070, 
      }, 
      [107] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21087, 
      }, 
      [108] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21088, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [109] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
         Arg2 = 1, 
         Arg1 = 21070, 
      }, 
      [110] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [111] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [112] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [113] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [114] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [115] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [116] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [117] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [118] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [119] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [120] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [121] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [122] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 3, 
         Arg1 = 21088, 
      }, 
      [123] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21099, 
         Arg2 = 1, 
         Arg1 = 21065, 
      }, 
      [124] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
         Arg2 = 1, 
         Arg1 = 21071, 
      }, 
      [125] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [126] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [127] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [128] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [129] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [130] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [131] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [132] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [133] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [134] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [135] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [136] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [137] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
         Arg2 = 1, 
         Arg1 = 21065, 
      }, 
      [138] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [139] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 2, 
         Arg1 = 21099, 
      }, 
      [140] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21112, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [141] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
         Arg2 = 1, 
         Arg1 = 21072, 
      }, 
      [142] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
         Arg2 = 1, 
         Arg1 = 21065, 
      }, 
      [143] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [144] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [145] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [146] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [147] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [148] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [149] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [150] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [151] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [152] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [153] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [154] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [155] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [156] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 3, 
         Arg1 = 21112, 
      }, 
      [157] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21054, 
         Arg2 = 1, 
         Arg1 = 21003, 
      }, 
      [158] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 32230, 
      }, 
      [159] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 10487, 
      }, 
      [160] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21054, 
         Arg2 = 7, 
         Arg1 = 21037, 
      }, 
      [161] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [162] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [163] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [164] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [165] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [166] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [167] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [168] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [169] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [170] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21075, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [171] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [172] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [173] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [174] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [175] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [176] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [177] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [178] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [179] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [180] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [181] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [182] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [183] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
         Arg2 = 1, 
         Arg1 = 21073, 
      }, 
      [184] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [185] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
         Arg2 = 1, 
         Arg1 = 21065, 
      }, 
      [186] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21075, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [187] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 0, 
         Arg1 = 21075, 
      }, 
      [188] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21119, 
         Arg2 = 2, 
         Arg1 = 21059, 
      }, 
      [189] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21114, 
         Arg2 = 4, 
         Arg1 = 21061, 
      }, 
      [190] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [191] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [192] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [193] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [194] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [195] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [196] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [197] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [198] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [199] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [200] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [201] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
         Arg2 = 1, 
         Arg1 = 21065, 
      }, 
      [202] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [203] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [204] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [205] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [206] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [207] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [208] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [209] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [210] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [211] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [212] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [213] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [214] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [215] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [216] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [217] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [218] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [219] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [220] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [221] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [222] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [223] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [224] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [225] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [226] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [227] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [228] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [229] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [230] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [231] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21022, 
      }, 
      [232] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21019, 
      }, 
      [233] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21020, 
      }, 
      [234] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 10317, 
      }, 
      [235] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 10312, 
      }, 
      [236] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 10424, 
      }, 
      [237] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21114, 
         Arg2 = 3, 
         Arg1 = 21059, 
      }, 
      [238] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21106, 
         Arg2 = 4, 
         Arg1 = 21059, 
      }, 
      [239] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21094, 
         Arg2 = 5, 
         Arg1 = 21059, 
      }, 
      [240] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21089, 
         Arg2 = 6, 
         Arg1 = 21059, 
      }, 
      [241] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21129, 
         Arg2 = 1, 
         Arg1 = 21435, 
      }, 
      [242] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 32254, 
      }, 
      [243] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21071, 
         Arg2 = 1, 
         Arg1 = 32231, 
      }, 
      [244] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21100, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [245] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [246] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [247] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [248] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [249] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [250] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [251] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [252] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [253] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [254] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [255] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [256] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [257] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
         Arg2 = 1, 
         Arg1 = 21071, 
      }, 
      [258] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21100, 
         Arg2 = 1, 
         Arg1 = 21421, 
      }, 
      [259] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 0, 
         Arg1 = 21100, 
      }, 
      [260] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21074, 
         Arg2 = 1, 
         Arg1 = 21068, 
      }, 
      [261] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
         Arg2 = 1, 
         Arg1 = 21073, 
      }, 
      [262] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [263] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [264] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [265] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [266] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [267] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [268] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [269] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [270] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [271] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [272] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [273] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [274] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 2, 
         Arg1 = 21074, 
      }, 
      [275] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21052, 
         Arg2 = 1, 
         Arg1 = 21014, 
      }, 
      [276] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21094, 
      }, 
      [277] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [278] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21128, 
         Arg2 = 1, 
         Arg1 = 21444, 
      }, 
      [279] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 6824, 
      }, 
      [280] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 32283, 
      }, 
      [281] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21113, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [282] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21056, 
      }, 
      [283] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [284] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [285] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [286] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [287] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [288] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [289] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [290] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [291] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [292] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21067, 
      }, 
      [293] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [294] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
         Arg2 = 1, 
         Arg1 = 21072, 
      }, 
      [295] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21113, 
      }, 
      [296] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21072, 
         Arg2 = 1, 
         Arg1 = 21436, 
      }, 
      [297] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 6814, 
      }, 
      [298] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 6824, 
      }, 
      [299] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 6822, 
      }, 
      [300] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 6825, 
      }, 
      [301] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21133, 
      }, 
      [302] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21072, 
         Arg2 = 1, 
         Arg1 = 32208, 
      }, 
      [303] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21135, 
         Arg2 = 7, 
         Arg1 = 21059, 
      }, 
      [304] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21135, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [305] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21134, 
         Arg2 = 2, 
         Arg1 = 21447, 
      }, 
      [306] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21134, 
         Arg2 = 2, 
         Arg1 = 21446, 
      }, 
      [307] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21134, 
         Arg2 = 2, 
         Arg1 = 21446, 
      }, 
      [308] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21134, 
         Arg2 = 2, 
         Arg1 = 21447, 
      }, 
      [309] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21137, 
         Arg2 = 3, 
         Arg1 = 21446, 
      }, 
      [310] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21137, 
         Arg2 = 3, 
         Arg1 = 21447, 
      }, 
      [311] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21136, 
         Arg2 = 4, 
         Arg1 = 21446, 
      }, 
      [312] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21136, 
         Arg2 = 4, 
         Arg1 = 21447, 
      }, 
      [313] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21007, 
         Arg2 = 8, 
         Arg1 = 21037, 
      }, 
      [314] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21011, 
         Arg2 = 9, 
         Arg1 = 21037, 
      }, 
      [315] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21015, 
         Arg2 = 10, 
         Arg1 = 21037, 
      }, 
      [316] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21021, 
         Arg2 = 11, 
         Arg1 = 21037, 
      }, 
      [317] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21027, 
         Arg2 = 12, 
         Arg1 = 21037, 
      }, 
      [318] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21032, 
         Arg2 = 13, 
         Arg1 = 21037, 
      }, 
      [319] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21001, 
         Arg2 = 14, 
         Arg1 = 21037, 
      }, 
      [320] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21059, 
         Arg2 = 1, 
         Arg1 = 21015, 
      }, 
      [321] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [322] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21058, 
      }, 
      [323] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21059, 
      }, 
      [324] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21060, 
      }, 
      [325] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 29008, 
      }, 
      [326] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21062, 
      }, 
      [327] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21063, 
      }, 
      [328] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21064, 
      }, 
      [329] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21065, 
      }, 
      [330] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21066, 
      }, 
      [331] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 29007, 
      }, 
      [332] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21061, 
      }, 
      [333] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 29006, 
      }, 
      [334] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21426, 
      }, 
      [335] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 10311, 
      }, 
      [336] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21138, 
         Arg2 = 1, 
         Arg1 = 21448, 
      }, 
      [337] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21150, 
         Arg2 = 1, 
         Arg1 = 21433, 
      }, 
      [338] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21150, 
         Arg2 = 1, 
         Arg1 = 21427, 
      }, 
      [339] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21145, 
         Arg2 = 12, 
         Arg1 = 21037, 
      }, 
      [340] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21000, 
         Arg2 = 1, 
         Arg1 = 21114, 
      }, 
      [341] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21148, 
         Arg2 = 1, 
         Arg1 = 21115, 
      }, 
      [342] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21148, 
         Arg2 = 1, 
         Arg1 = 21116, 
      }, 
      [343] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 3, 
         Arg1 = 21148, 
      }, 
      [344] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 1, 
         Arg1 = 21141, 
      }, 
      [345] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 8, 
         Arg1 = 21140, 
      }, 
      [346] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21149, 
         Arg2 = 1, 
         Arg1 = 21116, 
      }, 
      [347] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21149, 
         Arg2 = 1, 
         Arg1 = 21115, 
      }, 
      [348] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 7, 
         Arg1 = 21149, 
      }, 
      [349] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 1, 
         Arg1 = 21139, 
      }, 
      [350] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 2, 
         Arg1 = 21142, 
      }, 
      [351] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 0, 
         Arg1 = 21143, 
      }, 
      [352] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21144, 
         Arg2 = 1, 
         Arg1 = 21438, 
      }, 
      [353] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
         Arg2 = 1, 
         Arg1 = 21140, 
      }, 
      [354] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21146, 
         Arg2 = 1, 
         Arg1 = 21081, 
      }, 
      [355] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21146, 
         Arg2 = 1, 
         Arg1 = 21115, 
      }, 
      [356] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21146, 
         Arg2 = 1, 
         Arg1 = 21116, 
      }, 
      [357] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 2, 
         Arg1 = 21146, 
      }, 
      [358] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 0, 
         Arg1 = 21073, 
      }, 
      [359] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21147, 
         Arg2 = 1, 
         Arg1 = 21082, 
      }, 
      [360] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg2 = 1, 
         Arg1 = 21117, 
      }, 
      [361] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
         Arg2 = 1, 
         Arg1 = 28015, 
      }, 
      [362] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
         Arg2 = 1, 
         Arg1 = 21118, 
      }, 
      [363] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21147, 
         Arg2 = 1, 
         Arg1 = 21115, 
      }, 
      [364] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21147, 
         Arg2 = 1, 
         Arg1 = 21116, 
      }, 
      [365] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 0, 
         Arg1 = 21147, 
      }, 
      [366] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21132, 
         Arg2 = 1, 
         Arg1 = 21400, 
      }, 
      [367] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21069, 
      }, 
      [368] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 2, 
         Arg1 = 21132, 
      }, 
      [369] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
         Arg2 = 3, 
         Arg1 = 21058, 
      }, 
      [370] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
         Arg2 = 1, 
         Arg1 = 21057, 
      }, 
      [371] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
         Arg2 = 1, 
         Arg1 = 21437, 
      }, 
      [372] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 60, 
      }, 
      [373] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
         Arg2 = 3, 
         Arg1 = 21058, 
      }, 
      [374] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
         Arg2 = 3, 
         Arg1 = 21058, 
      }, 
      [375] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21130, 
         Arg2 = 1, 
         Arg1 = 21083, 
      }, 
      [376] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21130, 
      }, 
      [377] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 2, 
         Arg1 = 21126, 
      }, 
      [378] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21127, 
         Arg2 = 1, 
         Arg1 = 21434, 
      }, 
      [379] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 0, 
         Arg1 = 21127, 
      }, 
      [380] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 2, 
         Arg1 = 21040, 
      }, 
      [381] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21069, 
         Arg2 = 1, 
         Arg1 = 21025, 
      }, 
      [382] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 0, 
         Arg1 = 21069, 
      }, 
      [383] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21068, 
         Arg2 = 1, 
         Arg1 = 21013, 
      }, 
      [384] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21009, 
      }, 
      [385] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21008, 
      }, 
      [386] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21010, 
      }, 
      [387] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21068, 
         Arg2 = 1, 
         Arg1 = 21445, 
      }, 
      [388] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 0, 
         Arg1 = 21068, 
      }, 
      [389] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 2, 
         Arg1 = 21041, 
      }, 
      [390] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 0, 
         Arg1 = 21022, 
      }, 
      [391] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21066, 
         Arg2 = 1, 
         Arg1 = 21021, 
      }, 
      [392] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21076, 
      }, 
      [393] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21077, 
      }, 
      [394] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21078, 
      }, 
      [395] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21079, 
      }, 
      [396] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg3 = 0, 
         Arg2 = 1, 
         Arg1 = 21080, 
      }, 
      [397] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 2, 
         Arg1 = 21066, 
      }, 
      [398] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 5, 
         Arg1 = 21066, 
      }, 
      [399] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21180, 
      }, 
      [400] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 3, 
         Arg1 = 21184, 
      }, 
      [401] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
         Arg2 = 1, 
         Arg1 = 21183, 
      }, 
      [402] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21187, 
         Arg2 = 1, 
         Arg1 = 21435, 
      }, 
   }, 
   Objects = 
   {
      [21000] = 
      {
         ObjectValues = 
         {
            [1] = 28, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         Description = "A glowing violet potion has been carelessly left here.", 
         Vnum = 21000, 
         Tag = "", 
         ActionDescription = "", 
         Name = "potion violet glowing", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Textures of both deep red and pale purple swirl together inside the vial.\
\13", 
               Keyword = "violet", 
            }, 
         }, 
         Weight = 2, 
         ShortDescr = "a glowing violet potion", 
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
         Layers = 0, 
         ItemType = "potion", 
         Cost = 61000, 
      }, 
      [21001] = 
      {
         ObjectValues = 
         {
            [1] = 15, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         Description = "A glowing purple potion has been carelessly left here.", 
         Vnum = 21001, 
         Tag = "", 
         ActionDescription = "", 
         Name = "potion purple glowing", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         ShortDescr = "a glowing purple potion", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         Layers = 0, 
         ItemType = "potion", 
         Cost = 6500, 
      }, 
      [21002] = 
      {
         ObjectValues = 
         {
            [1] = 61, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Description = "A glowing puce potion has been carelessly left here.", 
         Vnum = 21002, 
         Tag = "", 
         ActionDescription = "", 
         Name = "puce potion glowing", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         ShortDescr = "a glowing puce potion", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         Layers = 0, 
         ItemType = "potion", 
         Cost = 2400, 
      }, 
      [21003] = 
      {
         ObjectValues = 
         {
            [1] = 16, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Description = "A glowing maroon potion has been carelessly left here.", 
         Vnum = 21003, 
         Tag = "", 
         ActionDescription = "", 
         Name = "potion maroon glowing", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         ShortDescr = "a glowing maroon potion", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         Layers = 0, 
         ItemType = "potion", 
         Cost = 750, 
      }, 
      [21004] = 
      {
         ObjectValues = 
         {
            [1] = 49, 
            [2] = 49, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 22, 
         }, 
         Description = "A glowing blue potion has been carelessly left here.", 
         Vnum = 21004, 
         Tag = "", 
         ActionDescription = "", 
         Name = "potion blue glowing", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         ShortDescr = "glowing blue potion", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         Layers = 0, 
         ItemType = "trash", 
         Cost = 15000, 
      }, 
      [21133] = 
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
         Description = "A freshly smoked womp rat lies here giving off a hickory scent.", 
         Vnum = 21133, 
         Tag = "", 
         Name = "smoked womp rat", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s savour$q a piece of $p.", 
         ShortDescr = "smoked womp rat", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 200, 
      }, 
      [21134] = 
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
         Description = "A plump roast kinewe bird has been carelessly left on the ground here.", 
         Vnum = 21134, 
         Tag = "", 
         Name = "roast kinewe", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s delicately nibble$q on a piece of $p.", 
         ShortDescr = "Roast kinewe", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 200, 
      }, 
      [21135] = 
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
         Description = "Some freshly picked chanterelle mushrooms have been left behind here.", 
         Vnum = 21135, 
         Tag = "", 
         Name = "chanterelle mushrooms", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s savor$q $p.", 
         ShortDescr = "some freshly picked chanterelle mushrooms", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 200, 
      }, 
      [21136] = 
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
         Description = "Nuts shells lie discarded around a small bag left here.", 
         Vnum = 21136, 
         Tag = "", 
         Name = "bag black walnuts", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s quickly down$q $p.", 
         ShortDescr = "a bag of fresh black nuts", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 200, 
      }, 
      [21137] = 
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
         Description = "A freshly cooked leg of dewback has been dropped here.", 
         Vnum = 21137, 
         Tag = "", 
         ActionDescription = "%s savagely gnaw$q on $p.", 
         Name = "leg dewback", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         ShortDescr = "a leg of dewback", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 200, 
      }, 
      [21010] = 
      {
         ObjectValues = 
         {
            [1] = 12, 
            [2] = 4, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Description = "A large mug of ale sits here.", 
         Vnum = 21010, 
         Tag = "", 
         Name = "mug ale", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "a mug of ale", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "drink_container", 
         Cost = 75, 
      }, 
      [21139] = 
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
         Description = "A handfull of salty Grana seeds has been left hhere.", 
         Vnum = 21139, 
         Tag = "", 
         Name = "Grana seeds", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s quickly consume$q $p.", 
         ShortDescr = "a handful of Grana seeds", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 200, 
      }, 
      [21140] = 
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
         Description = "&z A set of silver master keys was left here.", 
         Vnum = 21140, 
         Tag = "", 
         Name = "key master silver", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "&z A set of silver master keys &x", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "key", 
         Cost = 0, 
      }, 
      [21141] = 
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
         Description = "&c A Flag of War", 
         Vnum = 21141, 
         Tag = "", 
         Name = "flag", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "A flag", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "treasure", 
         Cost = 0, 
      }, 
      [21014] = 
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
         Description = "A slice of salami sits in the man made.", 
         Vnum = 21014, 
         Tag = "", 
         ActionDescription = "", 
         Name = "salami", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a slice of salami", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 4, 
      }, 
      [21015] = 
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
         Description = "A large chunk of raw beef lies here.", 
         Vnum = 21015, 
         Tag = "", 
         ActionDescription = "", 
         Name = "beef", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         ShortDescr = "a big chunk of beef", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 9, 
      }, 
      [21016] = 
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
         Description = "A  cooked Mon bird, which looks quite edible, lies on the tray.", 
         Vnum = 21016, 
         Tag = "", 
         ActionDescription = "", 
         Name = "turkey", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         ShortDescr = "a cooked turkey", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 10, 
      }, 
      [21017] = 
      {
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 10, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Description = "A bottle of imported blue milk sits upright on the ground.", 
         Vnum = 21017, 
         Tag = "", 
         ActionDescription = "", 
         Name = "bottle blue milk", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 3, 
         ShortDescr = "a bottle of blue milk", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "drink_container", 
         Cost = 4, 
      }, 
      [21018] = 
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
         Description = "A round wheel of cheese looks very good.", 
         Vnum = 21018, 
         Tag = "", 
         ActionDescription = "", 
         Name = "wheel cheese", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 3, 
         ShortDescr = "a wheel of cheese", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 10, 
      }, 
      [21019] = 
      {
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Description = "A cup of spiked lemonade makes your thirst quench easily.", 
         Vnum = 21019, 
         Tag = "", 
         ActionDescription = "", 
         Name = "lemonade cup", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a cup of lemonade", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "drink_container", 
         Cost = 1, 
      }, 
      [21020] = 
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
         Description = "A large chocolate cake awaits someone to eat it.", 
         Vnum = 21020, 
         Tag = "", 
         ActionDescription = "", 
         Name = "cake", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a chocolate cake", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 15, 
      }, 
      [21021] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Description = "A scrumptious loaf of bread lies here, making your taste buds swirl.", 
         Vnum = 21021, 
         Tag = "", 
         ActionDescription = "", 
         Name = "loaf bread", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         ShortDescr = "a loaf of bread", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 2, 
      }, 
      [21022] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Description = "A cherry pie makes your mouth water.", 
         Vnum = 21022, 
         Tag = "", 
         Name = "cherry pie", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "a cherry pie", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 100, 
      }, 
      [21023] = 
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
         Description = "A writing computer pen lies on the ground, unowned.", 
         Vnum = 21023, 
         Tag = "", 
         Name = "pen", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "a writing computer pen", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ItemType = "pen", 
         Cost = 30, 
      }, 
      [21420] = 
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
         Description = "A hologram parchment sits here.", 
         Vnum = 21420, 
         Tag = "", 
         ActionDescription = "", 
         Name = "hologram", 
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
         Weight = 1, 
         ShortDescr = "A hologram", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [1] = "Hum", 
         }, 
         Layers = 0, 
         ItemType = "book", 
         Cost = 45000, 
      }, 
      [21421] = 
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
         Description = "A pluogus bus stop sign.", 
         Vnum = 21421, 
         Tag = "", 
         Name = "bus stop sign", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a sign", 
         ActionDescription = "", 
         Weight = 1, 
         Layers = 0, 
         ItemType = "furniture", 
         Cost = 0, 
      }, 
      [21422] = 
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
         Description = "A small crystal catches your eye.", 
         Vnum = 21422, 
         Tag = "", 
         ActionDescription = "", 
         Name = "small crystal", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a small crystal", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "crystal", 
         Cost = 100, 
      }, 
      [21423] = 
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
         Description = "A crystal was dropped here.", 
         Vnum = 21423, 
         Tag = "", 
         ActionDescription = "", 
         Name = "relacite crystal", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a relacite crystal", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "crystal", 
         Cost = 3000, 
      }, 
      [21424] = 
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
         Description = "Something shiney catches your eye.", 
         Vnum = 21424, 
         Tag = "", 
         ActionDescription = "", 
         Name = "Kathracite crystal", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a kathracite crystal", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "crystal", 
         Cost = 2000, 
      }, 
      [21425] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Description = "Something shiney catches your eye.", 
         Vnum = 21425, 
         Tag = "", 
         ActionDescription = "", 
         Name = "mephite crystal", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a mephite crystal", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "crystal", 
         Cost = 5000, 
      }, 
      [21042] = 
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
         Description = "The Akatamer board hangs here.", 
         Vnum = 21042, 
         Tag = "", 
         Name = "board general", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "book", 
            }, 
         }, 
         ShortDescr = "the general board", 
         ActionDescription = "", 
         Weight = 1001, 
         Layers = 0, 
         ItemType = "furniture", 
         Cost = 0, 
      }, 
      [21427] = 
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
         Description = "&b A computer terminal rests aginst the wall here.", 
         Vnum = 21427, 
         Tag = "", 
         ActionDescription = "", 
         Name = "lever omputer terminal", 
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
         Weight = 1, 
         ShortDescr = "A computer terminal lever", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [1] = "Hum", 
         }, 
         Layers = 0, 
         ItemType = "lever", 
         Cost = 45000, 
      }, 
      [21428] = 
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
         Description = "Key", 
         Vnum = 21428, 
         Tag = "", 
         Name = "key ", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "Key", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "key", 
         Cost = 0, 
      }, 
      [21045] = 
      {
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 3, 
            [3] = 81, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Description = "A sparkling crystal staff has been left lying here.", 
         Vnum = 21045, 
         Tag = "", 
         ActionDescription = "", 
         Name = "crystal staff", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a sparkling crystal staff", 
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
         Layers = 0, 
         ItemType = "_wand", 
         Cost = 1000, 
      }, 
      [21046] = 
      {
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 75, 
         }, 
         Description = "A strange bag, covered in dust, has been left here.", 
         Vnum = 21046, 
         Tag = "", 
         ActionDescription = "", 
         Name = "bag rune-covered", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a rune-covered bag", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         Layers = 0, 
         ItemType = "container", 
         Cost = 1000, 
      }, 
      [21048] = 
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
         Description = "A stack of holomail is piled high here.", 
         Vnum = 21048, 
         Tag = "", 
         Name = "mail board stack", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a stack of holomail", 
         ActionDescription = "", 
         Weight = 1001, 
         Layers = 0, 
         ItemType = "furniture", 
         Cost = 0, 
      }, 
      [21049] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = -1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "A bright ball of light shimmers in the air.", 
         Vnum = 21049, 
         Tag = "", 
         ActionDescription = "", 
         Name = "ball light", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a bright ball of light", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         Layers = 0, 
         ItemType = "light", 
         Cost = 100, 
      }, 
      [21435] = 
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
         Description = "Data Info Center - (Terminal)", 
         Vnum = 21435, 
         Tag = "", 
         Name = "augurer guild board", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the board of the augurer guild", 
         ActionDescription = "", 
         Weight = 1, 
         Layers = 0, 
         ItemType = "furniture", 
         Cost = 0, 
      }, 
      [21055] = 
      {
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Description = "A ring which will bring good luck lies here.", 
         Vnum = 21055, 
         Tag = "", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 31, 
               Modifier = 2, 
            }, 
         }, 
         Name = "thief ring", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a thief's ring", 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [5] = "Invis", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 500, 
      }, 
      [21056] = 
      {
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Description = "An iron ring has fallen here.", 
         Vnum = 21056, 
         Tag = "", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 3072, 
            }, 
            [2] = 
            {
               Location = 17, 
               Modifier = -3, 
            }, 
         }, 
         Name = "ring", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Rumors say that these rings protect from magical enchantments...\
\13", 
               Keyword = "ring", 
            }, 
         }, 
         Weight = 1, 
         ShortDescr = "a ring of the city guard", 
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
         Layers = 0, 
         ItemType = "armor", 
         Cost = 100, 
      }, 
      [21057] = 
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
         Description = "A large neck guard was dropped here.", 
         Vnum = 21057, 
         Tag = "", 
         ActionDescription = "", 
         Name = "a neck guard", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 3, 
         ShortDescr = "a neck guard", 
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
         Layers = 0, 
         ItemType = "armor", 
         Cost = 30, 
      }, 
      [21058] = 
      {
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         Description = "A New Rebublic breastplate has fallen here.", 
         Vnum = 21058, 
         Tag = "", 
         ActionDescription = "", 
         Name = "crested plate", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 8, 
         ShortDescr = "a New rebublic crested breastplate", 
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
         Layers = 128, 
         ItemType = "armor", 
         Cost = 150, 
      }, 
      [21059] = 
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
         Description = "A helm is here.", 
         Vnum = 21059, 
         Tag = "", 
         ActionDescription = "", 
         Name = "a helm", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 8, 
         ShortDescr = "a helm", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Layers = 4, 
         ItemType = "armor", 
         Cost = 50, 
      }, 
      [21060] = 
      {
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Description = "A set of guard leggings has fallen here.", 
         Vnum = 21060, 
         Tag = "", 
         ActionDescription = "", 
         Name = "guard leggings", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 4, 
         ShortDescr = "guard leggings", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Layers = 16, 
         ItemType = "armor", 
         Cost = 20, 
      }, 
      [21061] = 
      {
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Description = "A set of boots has fallen here.", 
         Vnum = 21061, 
         Tag = "", 
         ActionDescription = "", 
         Name = "boots black", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         ShortDescr = "black boots", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 40, 
      }, 
      [21062] = 
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
         Description = "A set of guard sleeves has fallen here.", 
         Vnum = 21062, 
         Tag = "", 
         ActionDescription = "", 
         Name = "guard sleeves", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 3, 
         ShortDescr = "guard sleeves", 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 20, 
      }, 
      [21063] = 
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
         Description = "Some guard gauntlets have fallen here.", 
         Vnum = 21063, 
         Tag = "", 
         ActionDescription = "", 
         Name = "guard gauntlets", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 4, 
         ShortDescr = "guard gauntlets", 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 40, 
      }, 
      [21064] = 
      {
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Description = "A bracer was dropped here.", 
         Vnum = 21064, 
         Tag = "", 
         ActionDescription = "", 
         Name = "bracer", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         ShortDescr = "a bracer", 
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
         Layers = 128, 
         ItemType = "armor", 
         Cost = 75, 
      }, 
      [21065] = 
      {
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         Description = "A calamarian energy shield was dropped here.", 
         Vnum = 21065, 
         Tag = "", 
         ActionDescription = "", 
         Name = "calamarian energy shield", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 6, 
         ShortDescr = "a calamarian energy shield", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 600, 
      }, 
      [21066] = 
      {
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Description = "A rubber visor was misplaced here.", 
         Vnum = 21066, 
         Tag = "", 
         ActionDescription = "", 
         Name = "rubber visor", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a rubber visor", 
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
         Layers = 0, 
         ItemType = "armor", 
         Cost = 50, 
      }, 
      [21067] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 24, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "A plain electric torch has been left lying here.", 
         Vnum = 21067, 
         Tag = "", 
         Name = "torch", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "a torch", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ItemType = "light", 
         Cost = 10, 
      }, 
      [21068] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Description = "A com-blaster has fallen here.", 
         Vnum = 21068, 
         Tag = "", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 3, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Name = "com-blaster", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 3, 
         ShortDescr = "a com-blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ItemType = "weapon", 
         Cost = 300, 
      }, 
      [21069] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Description = "A hand blaster has fallen here.", 
         Vnum = 21069, 
         Tag = "", 
         ActionDescription = "", 
         Name = "hand blaster", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 6, 
         ShortDescr = "hand blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Layers = 0, 
         ItemType = "weapon", 
         Cost = 300, 
      }, 
      [21070] = 
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
         Description = "Key to Docking Bay", 
         Vnum = 21070, 
         Tag = "", 
         Name = "Key", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "Key to Docking Bay", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 1000, 
      }, 
      [21071] = 
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
         Description = "The key to Akatamer's northern Docking bay lies here.", 
         Vnum = 21071, 
         Tag = "", 
         Name = "Key", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "the key to the northern Docking bay of Akatamer", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 1000, 
      }, 
      [21072] = 
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
         Description = "The key to Akatamer's eastern Docking bay lies here.", 
         Vnum = 21072, 
         Tag = "", 
         Name = "Key", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "the key to the eastern Docking bay of Akatamer", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 1000, 
      }, 
      [21073] = 
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
         Description = "The Key to the southern Docking Bay", 
         Vnum = 21073, 
         Tag = "", 
         Name = "Key", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "Key to Southern Docking Bay.", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 0, 
      }, 
      [21076] = 
      {
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Description = "Someone has left a bantha leather shirt lying here.", 
         Vnum = 21076, 
         Tag = "", 
         Name = "leather shirt", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "a leather shirt", 
         Weight = 4, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 200, 
      }, 
      [21077] = 
      {
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Description = "Some bantha leather pants are lying here.", 
         Vnum = 21077, 
         Tag = "", 
         Name = "pants leather", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "some leather pants", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 150, 
      }, 
      [21078] = 
      {
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Description = "Some bantha leather sleeves have been abandoned here.", 
         Vnum = 21078, 
         Tag = "", 
         Name = "leather sleeves", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "some leather sleeves", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 75, 
      }, 
      [21079] = 
      {
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Description = "A pair of bantha leather boots are lying here.", 
         Vnum = 21079, 
         Tag = "", 
         Name = "leather boots", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "some leather boots", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 125, 
      }, 
      [21080] = 
      {
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Description = "Two bantha leather gloves are lying on the ground.", 
         Vnum = 21080, 
         Tag = "", 
         Name = "leather gloves pair", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "a pair of leather gloves", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Cost = 100, 
      }, 
      [21081] = 
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
         Description = "A gleaming knife shines brightly here.", 
         Vnum = 21081, 
         Tag = "", 
         ActionDescription = "", 
         Name = "steel knife", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a steel knife", 
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
         Layers = 0, 
         ItemType = "weapon", 
         Cost = 100, 
      }, 
      [21082] = 
      {
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         Description = "An Mon Blaster has been carelessly left here.", 
         Vnum = 21082, 
         Tag = "", 
         ActionDescription = "", 
         Name = "Mon-blaster", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 4, 
         ShortDescr = "Mon blaster", 
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
         Layers = 0, 
         ItemType = "weapon", 
         Cost = 200, 
      }, 
      [21083] = 
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
         Description = "This item doesn't need a long :P", 
         Vnum = 21083, 
         Tag = "", 
         Name = "Key", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "hotel  key", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ItemType = "key", 
         Cost = 0, 
      }, 
      [21094] = 
      {
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Description = "A strange golden band has been left lying here.", 
         Vnum = 21094, 
         Tag = "", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 3072, 
            }, 
         }, 
         Name = "ring golden band", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "a strange golden band", 
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
         Layers = 0, 
         ItemType = "armor", 
         Cost = 10000, 
      }, 
      [21426] = 
      {
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "&O A Mon Gill was left here on the ground.", 
         Vnum = 21426, 
         Tag = "", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = -2147483648, 
            }, 
         }, 
         Name = "gill mask", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&O The mon gill while very effective has a very short life span.\
\13", 
               Keyword = "gill mask", 
            }, 
         }, 
         Weight = 1, 
         ShortDescr = "&O A Mon Gill", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho &R^R Warning, Gill Mask Failure &x ^x\
", 
               ScriptType = "MProg", 
               Arguments = "1", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ItemType = "armor", 
         Cost = 200, 
      }, 
      [21138] = 
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
         Description = "Some freshly gathered wild seaweed have been forgotten here.", 
         Vnum = 21138, 
         Tag = "", 
         Name = "wild mustard greens", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "%s quickly eat$q $p.", 
         ShortDescr = "some wild seaweed greens", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ItemType = "food", 
         Cost = 200, 
      }, 
      [21008] = 
      {
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Description = "A small bottle, tipped on its side, drips on the ground.", 
         Vnum = 21008, 
         Tag = "", 
         Name = "beer bottle", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "a bottle of beer", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "drink_container", 
         Cost = 100, 
      }, 
      [21111] = 
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
         Description = "A painting of a glorious security post hangs on the wall, catching your eye.", 
         Vnum = 21111, 
         Tag = "", 
         Layers = 0, 
         Name = "manor painting", 
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
         ActionDescription = "", 
         ShortDescr = "an oil painting", 
         Weight = 1, 
         Flags = 
         {
            [8] = "Bless", 
         }, 
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
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "exa_prog", 
            }, 
         }, 
         ItemType = "furniture", 
         Cost = 0, 
      }, 
      [21112] = 
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
         Description = "A dark, solemn painting hangs here in the shadows, collecting dust.", 
         Vnum = 21112, 
         Tag = "", 
         Name = "solemn painting unholy", 
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
         Layers = 0, 
         ShortDescr = "a dark, solemn painting", 
         ActionDescription = "", 
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
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "exa_prog", 
            }, 
         }, 
         ItemType = "furniture", 
         Cost = 0, 
      }, 
      [21113] = 
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
         Description = "A ratted up map was left here.", 
         Vnum = 21113, 
         Tag = "", 
         ActionDescription = "", 
         Name = "map", 
         ExtraDescriptions = 
         {
            [1] = 
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
            [2] = 
            {
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
               Keyword = "painting manor house", 
            }, 
         }, 
         Weight = 1, 
         ShortDescr = "A ratted up map", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [8] = "Bless", 
         }, 
         Layers = 0, 
         ItemType = "furniture", 
         Cost = 2, 
      }, 
      [21114] = 
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
         Description = "&c A large bronze statue stands tall here.", 
         Vnum = 21114, 
         Tag = "", 
         Layers = 0, 
         Name = "statue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&c This large bronze statue is of a great Mon Calamarian individual, who\
\13helped end the first Imperial force and the second Death Star. There is  a\
\13small frame on the sign with a gold inprint on it.\
\13", 
               Keyword = "statue", 
            }, 
            [2] = 
            {
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
               Keyword = "painting manor house", 
            }, 
         }, 
         ActionDescription = "", 
         ShortDescr = "&c A large bronze statue ", 
         Weight = 1, 
         Flags = 
         {
            [8] = "Bless", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You feel all your prayers are being answered from above.\
", 
               ScriptType = "MProg", 
               Arguments = "bow pray", 
               MudProgType = "act_prog", 
            }, 
         }, 
         ItemType = "furniture", 
         Cost = 0, 
      }, 
      [21115] = 
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
         Description = "&z A metal prison bed lies aginst the wall. &x", 
         Vnum = 21115, 
         Tag = "", 
         Name = "bed prison", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "What you've never seen a chair before??\
\13", 
               Keyword = "Chair", 
            }, 
         }, 
         Layers = 0, 
         ShortDescr = "&z A metal prison bed ", 
         ActionDescription = "", 
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
               ScriptType = "MProg", 
               Arguments = "100 p sits down.", 
               MudProgType = "act_prog", 
            }, 
         }, 
         ItemType = "furniture", 
         Cost = 0, 
      }, 
      [21116] = 
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
         Description = "&c A TI-0 suction waste machine is placed in the corner.", 
         Vnum = 21116, 
         Tag = "", 
         Name = "suction john toilet waste", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "What you've never seen a chair before??\
\13", 
               Keyword = "Chair", 
            }, 
         }, 
         ShortDescr = "&c A TI-0 suction waste machine", 
         ActionDescription = "", 
         Weight = 1, 
         Layers = 0, 
         ItemType = "trash", 
         Cost = 0, 
      }, 
      [21117] = 
      {
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "&G A gamorrean double strap vest was left here. &x", 
         Vnum = 21117, 
         Tag = "", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = -10, 
            }, 
         }, 
         Name = "vest gamorean double strap", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "&G A gamorrean double strap vest &x", 
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
         Layers = 8, 
         ItemType = "armor", 
         Cost = 100, 
      }, 
      [21118] = 
      {
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "&b Lizard skin feet covers were left here &x.", 
         Vnum = 21118, 
         Tag = "", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 47, 
               Modifier = 100, 
            }, 
            [2] = 
            {
               Location = 14, 
               Modifier = -20, 
            }, 
         }, 
         Name = "boots lizard feet cover", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ShortDescr = "&b Lizard skin feet covers.", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Layers = 4, 
         ItemType = "armor", 
         Cost = 125, 
      }, 
      [21009] = 
      {
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 5, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Description = "A bottle of whiskey spills drops on the ground.", 
         Vnum = 21009, 
         Tag = "", 
         Name = "whiskey bottle", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ShortDescr = "a bottle of whiskey", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ItemType = "drink_container", 
         Cost = 50, 
      }, 
   }, 
   Mobiles = 
   {
      [21000] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 500, 
            HitPlus = 300, 
            HitNoDice = 25, 
         }, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [2] = "_02", 
            [0] = "parry", 
            [8] = "_08", 
         }, 
         LongDescr = "A elderly saint wearing only a dark robe wanders here.\
", 
         Sex = "female", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21000, 
         Race = "Human", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "elderly saint", 
         Name = "healer jedi saint", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21001] = 
      {
         HitRoll = 34, 
         Description = "", 
         Shop = 
         {
            KeeperShortDescr = "Anikem the shopkeeper", 
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
         Tag = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
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
               ScriptType = "MProg", 
               Arguments = "corusca", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "Anakiem the shopkeeper stands here.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 20, 
            DamSizeDice = 100, 
            DamPlus = 100, 
         }, 
         ArmorClass = -300, 
         Vnum = 21001, 
         Race = "Quarren", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "Anikem the shopkeeper", 
         Name = "Anakiem shopkeeper", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 4, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 6, 
      }, 
      [21002] = 
      {
         HitRoll = 0, 
         Description = "", 
         RepairShop = 
         {
            ProfitFix = 120, 
            ShopType = 1, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the repair tech", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
         }, 
         Tag = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say hello, if you don't have a weapon for me to repair please leave I'm\
mpecho busy!\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = "mpecho You hear loud bangs as Torval hammers out dents in the\
mpecho weapons\
", 
               ScriptType = "MProg", 
               Arguments = "10 ", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "Torval the repir tech works on armor.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 1000, 
         }, 
         ArmorClass = -300, 
         Vnum = 21002, 
         Race = "Twi'lek", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the repair tech", 
         Name = "Torval repair", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 5, 
      }, 
      [21003] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Shop = 
         {
            KeeperShortDescr = "the spice dealer", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 115, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
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
         LongDescr = "The Rodian spice dealer stands behind the counter.\
", 
         Sex = "female", 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 5, 
            DamPlus = 100, 
         }, 
         ArmorClass = 0, 
         Vnum = 21003, 
         Race = "Wookiee", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the spice dealer", 
         Name = "Shana spice dealer", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 6, 
      }, 
      [21004] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Shop = 
         {
            KeeperShortDescr = "the Shuttleee", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
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
         LongDescr = "The Shuttleee sits here.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 5, 
            DamPlus = 100, 
         }, 
         ArmorClass = 0, 
         Vnum = 21004, 
         Race = "Wookiee", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the Shuttleee", 
         Name = "Shuttleee", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 6, 
      }, 
      [21006] = 
      {
         HitRoll = 0, 
         Description = "", 
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
         Tag = "", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 50, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "skill teacher", 
         Resistant = 
         {
            [1] = "cold", 
            [4] = "blunt", 
            [20] = "magic", 
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
         LongDescr = "The skill teacher awaits a student.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 20, 
         }, 
         ArmorClass = 0, 
         Vnum = 21006, 
         Race = "Human", 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Susceptible = 
         {
            [0] = "fire", 
            [5] = "pierce", 
         }, 
         Name = "guildmaster", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
         }, 
         Alignment = -1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21007] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 100, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A Calamrian doll hangs limply here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21007, 
         Race = "Human", 
         Sex = "female", 
         ShortDescr = "the Calamrian doll", 
         Name = "Mon Calamrian doll", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21009] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         Shop = 
         {
            KeeperShortDescr = "the Builder", 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "A Builder offers you his selection of Mon made ships.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21009, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the Builder", 
         Name = "Ship builder", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 5, 
      }, 
      [21010] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the waitress", 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "The cute Calamrian waitress awaits your order.\
", 
         Sex = "female", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21010, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the waitress", 
         Name = "waitress", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21011] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the printer", 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A thin Calamrian printer sits behind a stack of papers.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21011, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the printer", 
         Name = "printer", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21012] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "The Guild's Shuttleer meditates here.\
\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 5, 
            DamPlus = 800, 
         }, 
         ArmorClass = 0, 
         Vnum = 21012, 
         Race = "Human", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the Guild Father", 
         Name = "Shuttleer father", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 5, 
      }, 
      [21013] = 
      {
         HitRoll = 0, 
         Description = "", 
         Shop = 
         {
            KeeperShortDescr = "the bartender Monei", 
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
         Tag = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpemote You hear the bartender say, \"I wish those dman vendors would shut\
up!\"\
", 
               ScriptType = "MProg", 
               Arguments = "10 ", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Code = "Say Pull up a chair and have a drink, we only live once ya know.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "Monei the bartender stands behind his counter.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 100, 
            DamPlus = 800, 
         }, 
         ArmorClass = 0, 
         Vnum = 21013, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the bartender Monei", 
         Name = "Monei bartender", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 5, 
      }, 
      [21014] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Shop = 
         {
            KeeperShortDescr = "Joyta, Mon Calamarian Jewler", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 95, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Hello $n in the mood for buying some Jewlery?\
", 
               ScriptType = "MProg", 
               Arguments = "hi hello ", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "Say Good come take a look at my display!\
", 
               ScriptType = "MProg", 
               Arguments = "yes", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Code = "say Sorry those are not for sale, protected by the governement.\
say Shhhh , I hear there are more in the ocean, get me one and I'll pay you\
a high\
price.\
say but you didn't here that from me.\
", 
               ScriptType = "MProg", 
               Arguments = "ultima pearl ultima_pearl", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Code = "Yell Come in , I've got the best Jewlery in the Galexy!\
", 
               ScriptType = "MProg", 
               Arguments = "5 ", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "&C Joyta, Mon Calamarian Jewler displays here jems in the case.\
", 
         Sex = "female", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21014, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "Joyta, Mon Calamarian Jewler", 
         Name = "jeweler", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21015] = 
      {
         RepairShop = 
         {
            ProfitFix = 100, 
            ShopType = 1, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the Rax armourer", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
         }, 
         HitRoll = 0, 
         Description = "", 
         Shop = 
         {
            KeeperShortDescr = "the Rax armourer", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 130, 
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
         Tag = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Welcome $n Heard you were in town.\
say If you want any equipment just tell me.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "Rax the armourer is here fitting a Mon Calamrian  helm.\
", 
         Sex = "female", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 1000, 
         }, 
         ArmorClass = 0, 
         Vnum = 21015, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the Rax armourer", 
         Name = "rax armourer", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 5, 
      }, 
      [21016] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Shop = 
         {
            KeeperShortDescr = "the Bonta weaponsmith", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Welcome to my shop care to buy a weapon?\
mpecho Bonta grins at you evily.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "The weaponsmith Bonta, labors over a lengthy blade.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21016, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the Bonta weaponsmith", 
         Name = "bonta weaponsmith", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 5, 
      }, 
      [21017] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "The postmaster sorts the day's mail.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21017, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the postmaster", 
         Name = "postmaster", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21018] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Shop = 
         {
            KeeperShortDescr = "the chef Wannie", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Yell Barbecue, fresh and hot, falls of the bones. \
", 
               ScriptType = "MProg", 
               Arguments = "5 ", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Code = "Say Hello just step right up and get my galexy famous barbecue.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "A chef Wannie greets you.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 800, 
         }, 
         ArmorClass = 0, 
         Vnum = 21018, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the chef Wannie", 
         Name = "chef", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21019] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Shop = 
         {
            KeeperShortDescr = "the baker", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Yell Fresh Hot Seaweed Bread, Get it while it's Hot!\
", 
               ScriptType = "MProg", 
               Arguments = "5", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Code = "say Welcome to my shop when you want to buy just yell!\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "The Mon Calamarian baker is here, covered with seaweed flour.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 500, 
         }, 
         ArmorClass = 0, 
         Vnum = 21019, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the baker", 
         Name = "baker", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21020] = 
      {
         HitRoll = 20, 
         Description = "", 
         Tag = "", 
         Shop = 
         {
            KeeperShortDescr = "the Mon Calamrian girl", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 100, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 20, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Hello, can I intrest you in anything?\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = "Say Noy noe $n I'm working...maybe later!\
stare $n\
", 
               ScriptType = "MProg", 
               Arguments = "sex you fuck", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Code = "Yell Fresh blue seacow milk, get it while it's here.\
", 
               ScriptType = "MProg", 
               Arguments = "5", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "A young Mon Calamarian girl smiles as you enter.\
", 
         Sex = "female", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -150, 
         Vnum = 21020, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the Mon Calamrian girl", 
         Name = "Mon Calamrian girl", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 20, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21021] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Shop = 
         {
            KeeperShortDescr = "&z Lokist the tailor", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
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
         LongDescr = "&z Lokist the tailor is here showing off the latest fashion.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 5, 
            DamPlus = 100, 
         }, 
         ArmorClass = 0, 
         Vnum = 21021, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "&z Lokist the tailor", 
         Name = "Lokist tailor", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 6, 
      }, 
      [21022] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
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
         LongDescr = "The bantha keeper tends to his animals.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 5, 
            DamPlus = 100, 
         }, 
         ArmorClass = 0, 
         Vnum = 21022, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the bantha keeper", 
         Name = "bantha keeper", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 6, 
      }, 
      [21023] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
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
         LongDescr = "A master thief is here to demonstrate the ways of thievery.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21023, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the Master Thief", 
         Name = "thief master", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21025] = 
      {
         HitRoll = 0, 
         Description = "", 
         RepairShop = 
         {
            ProfitFix = 100, 
            ShopType = 1, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the hotel keeper", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
         }, 
         Tag = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if inroom($i) == 21146\
if inroom($n) == 21146\
  mptransfer $n 21069\
  mpat $n mea $n The hotel keeper leads you out.\
endif\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "leave exit", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "Say Welcome $n your room awits you.\
", 
               ScriptType = "MProg", 
               Arguments = "", 
               MudProgType = "all_greet_prog", 
            }, 
            [3] = 
            {
               Code = "say Welcome $n your room awaits.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
            [4] = 
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
               ScriptType = "MProg", 
               Arguments = "200", 
               MudProgType = "bribe_prog", 
            }, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "The hotel keeper stands here, looking rather gruff.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 15, 
            DamPlus = 1000, 
         }, 
         ArmorClass = 0, 
         Vnum = 21025, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the hotel keeper", 
         Name = "hotel keeper", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 4, 
      }, 
      [21028] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A pensive sage mulls over new Jedi's .\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 5, 
            DamPlus = 800, 
         }, 
         ArmorClass = 0, 
         Vnum = 21028, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the sage", 
         Name = "sage man", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 5, 
      }, 
      [21029] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         Shop = 
         {
            KeeperShortDescr = "the storekeeper", 
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
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         LongDescr = "A large man stands here, selling equipment for adventurers.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 10, 
            DamPlus = 1000, 
         }, 
         ArmorClass = 0, 
         Vnum = 21029, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the storekeeper", 
         Name = "storekeeper", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 4, 
      }, 
      [21031] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "The ranger Shuttleer demonstrates combat maneuvers.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 5, 
            DamPlus = 800, 
         }, 
         ArmorClass = 0, 
         Vnum = 21031, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the ranger Shuttleer", 
         Name = "man ranger", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 5, 
      }, 
      [21416] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21416, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created newbie mob", 
         Name = "newbie mob", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21034] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A robed woman is here, Shuttleing initiate officers.\
", 
         Sex = "female", 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 10, 
            DamPlus = 1000, 
         }, 
         ArmorClass = 0, 
         Vnum = 21034, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the officers Shuttleer", 
         Name = "woman Shuttleer", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 4, 
      }, 
      [21035] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A giant man stands here, waiting to Shuttle young warriors.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 100, 
            DamPlus = 800, 
         }, 
         ArmorClass = 0, 
         Vnum = 21035, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the Warrior Shuttleer", 
         Name = "man Shuttleer", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 5, 
      }, 
      [21420] = 
      {
         HitRoll = 0, 
         Description = "A dark Mon Calamrian stands before you, seemingly wearing the shadows around him\
like a cloak.  His gaze bores into your soul, and he appears to beckon\
you over to speak with him.  The glint of a blaster by his side alerts you\
that this man is probably bounty hunter.\
", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 10, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 200, 
            HitNoDice = 1, 
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
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isnpc($n)\
else\
  mpechoat $n The dark figure stares unflinchingly into your eyes.\
  mpechoaround $n $I draws close to $n and says something.\
    mpechoat $n $I matter-of-factly says, '200 credits.'\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "p how much", 
               MudProgType = "speech_prog", 
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
               ScriptType = "MProg", 
               Arguments = "p what price", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
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
               ScriptType = "MProg", 
               Arguments = "45000", 
               MudProgType = "bribe_prog", 
            }, 
            [4] = 
            {
               Code = "if isnpc($n)\
else\
  mpechoat $n A man hidden in the shadows beckons you over to him.\
  tell $n I have some information which may be of some value...\
  tell $n And for a price I will perhaps share it with you.\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "25", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A dark figure lurks here, hiding in the shadows.\
", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21420, 
         Race = "Human", 
         AffectedBy = 
         {
            [15] = "Sneak", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the bounty hunter", 
         Name = "dark figure bounty hunter", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 1, 
      }, 
      [21037] = 
      {
         HitRoll = 2, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 15, 
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
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
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
         LongDescr = "A Mon Calamrian guard patrols the streets of the city.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 20, 
         }, 
         ArmorClass = 0, 
         Vnum = 21037, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "guard man", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21041] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Position = "sleeping", 
         Level = 5, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 20, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A tired guard is here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 3, 
            DamPlus = 3, 
         }, 
         ArmorClass = 90, 
         Vnum = 21041, 
         Race = "Human", 
         Sex = "male", 
         ShortDescr = "the guard", 
         Name = "guard", 
         Weight = 0, 
         Credits = 100, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21043] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 15, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A E-Web guard stares out over the area.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21043, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "E-web guard", 
         Weight = 0, 
         Credits = 500, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21044] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         LongDescr = "A executioner stands silently before you.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 800, 
         }, 
         ArmorClass = 0, 
         Vnum = 21044, 
         Race = "Human", 
         AffectedBy = 
         {
            [2] = "DetectEvil", 
            [3] = "DetectInvis", 
            [13] = "Protect", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [7] = "Sanctuary", 
         }, 
         ShortDescr = "the Executioner", 
         Name = "executioner", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 4, 
      }, 
      [21045] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 35, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A stray Mosny dog noses along the street.\
", 
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
         ArmorClass = 100, 
         Vnum = 21045, 
         Race = "Yevetha", 
         Sex = "female", 
         ShortDescr = "a stray", 
         Name = "dog stray", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21431] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Level = 51, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A proud man stands here, deliberating over his theories.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 100, 
            DamSizeDice = 10, 
            DamPlus = 1000, 
         }, 
         ArmorClass = 0, 
         Vnum = 21431, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "Kinalsta", 
         Name = "kinalsta man", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21433] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Position = "incapacitated", 
         Level = 49, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You hear the sweat sounds of a guard snoring.\
say &c ZZZZZZZZZZzzzzzzzzzz    ZZZZZZZZZZZZZzzzzzzzzzz\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A sleeping Security Guard rests here.\
", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21433, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "A sleeping Security Guard", 
         Name = "guard sleeping", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 40, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21434] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 100, 
            HitNoDice = 1, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Ya ya ya take a number $n.\
Say please fill out these forms and give me 200 credits for the\
say apointment.\
", 
               ScriptType = "MProg", 
               Arguments = "hurt sick injured bleeding emergency ", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "Say Sorry we have paying customers here. Move along!\
", 
               ScriptType = "MProg", 
               Arguments = "insurance poor money broke", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Code = "Say Well, well you do have money! Have a good time.\
mptransfer $n 21071\
", 
               ScriptType = "MProg", 
               Arguments = "200", 
               MudProgType = "bribe_prog", 
            }, 
            [4] = 
            {
               Code = "Say Please state your emergency, I'm busy here.\
mpecho You see the secretary return to watching\
\
mpecho her favorite soap.\
", 
               ScriptType = "MProg", 
               Arguments = "hi hello", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A Mon Calamrian Secretary sits here doing important things.\
\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21434, 
         Race = "Human", 
         Sex = "female", 
         ShortDescr = "A female Secretary ", 
         Name = "woman sec secretary female", 
         Weight = 0, 
         Credits = 1, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = -750, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21435] = 
      {
         HitRoll = 10, 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         Tag = "", 
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
         Position = "standing", 
         Level = 51, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 510, 
            HitNoDice = 10, 
         }, 
         Shop = 
         {
            KeeperShortDescr = "&P A Mon Calamarian Nurse", 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "&P A Mon Calamarian Nurse sorts through medical supplies.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -27, 
         Vnum = 21435, 
         Race = "Human", 
         Sex = "female", 
         ShortDescr = "&P A Mon Calamarian Nurse", 
         Name = "mon nurse", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 10, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21052] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 8, 
         SpecFuns = 
         {
            [0] = "spec_thief", 
         }, 
         HitChance = 
         {
            HitSizeDice = 40, 
            HitPlus = 50, 
            HitNoDice = 3, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho From behind the shadows you can feel somone lighten your pockets.\
mpforce $n give 25 credits thief\
mpecho You turn around and see noone.\
", 
               ScriptType = "MProg", 
               Arguments = "29", 
               MudProgType = "greet_prog", 
            }, 
         }, 
         Resistant = 
         {
            [11] = "charm", 
         }, 
         LongDescr = "A strange figure lurks furtively.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 2, 
            DamPlus = 5, 
         }, 
         ArmorClass = 0, 
         Vnum = 21052, 
         Race = "Human", 
         AffectedBy = 
         {
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [15] = "Sneak", 
         }, 
         ShortDescr = "the thief", 
         Name = "thief figure", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21437] = 
      {
         HitRoll = 0, 
         Description = "This shop keeper is of a very young age, most likely hi father left him\
here to rent out the\
beasts.\
", 
         Tag = "", 
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
         Position = "incapacitated", 
         Level = 49, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You hear the soft sounds of ZZZZZZZZZzzzzzzzz coming from the shop\
mpecho keeper!\
", 
               ScriptType = "MProg", 
               Arguments = "35", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "&R A sleeping Mount shop keeper lies here.\
", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21437, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "&R A sleeping Mount shop keeper ", 
         Name = "sleeping shop ", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 40, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21438] = 
      {
         HitRoll = 6, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 40, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 400, 
            HitNoDice = 8, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say &z Sorry pal but your mouth just bought you a night in jail!\
mptransfer $n 21147\
", 
               ScriptType = "MProg", 
               Arguments = "fuck ass suck dick ", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "Say &z Hey if your not supposed to be here, leave before\
Say &z I place you in one of those.\
mpecho The guard points toward the jail cell.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         LongDescr = "&c An Elite Security Officer , Hyko stands here.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 0, 
         Vnum = 21438, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "&c An Elite Security Officer , Hyko ", 
         Name = "elite officer hyko", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 6, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21055] = 
      {
         HitRoll = 0, 
         Description = "The old man is clad in the rags of what was once a military outfit.\
He eyes you warily and holds out a tin cup in supplication...\
", 
         Tag = "", 
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
         Level = 3, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 20, 
            HitNoDice = 1, 
         }, 
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
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = ", rummages in one of many pouches, searching for gold no doubt.\
", 
               ScriptType = "MProg", 
               Arguments = "5", 
               MudProgType = "rand_prog", 
            }, 
            [3] = 
            {
               Code = "say OHHH MY!!!\
mpecho The beggar suddenly clutches his chest and doubles over.\
mpecho In the blink of an eye, he is dead. \
mpecho The surprise and shock must have been too much for him.\
mpat 21194 mpforce cleric mpat beggarprog mppurge beggarprog\
", 
               ScriptType = "MProg", 
               Arguments = "1000", 
               MudProgType = "bribe_prog", 
            }, 
            [4] = 
            {
               Code = "say I cannot express my gratitude in words $n!\
kis $n\
say If only others were so generous.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "bribe_prog", 
            }, 
            [5] = 
            {
               Code = "say Thank you for such a worthy donation.\
thank $n\
", 
               ScriptType = "MProg", 
               Arguments = "10", 
               MudProgType = "bribe_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A decrepit old beggar sits on the cobbles of the road, pleading.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 3, 
            DamPlus = 3, 
         }, 
         ArmorClass = 100, 
         Vnum = 21055, 
         Race = "Human", 
         Sex = "male", 
         ShortDescr = "the beggar", 
         Name = "beggar man beggarprog", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Alignment = 300, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21056] = 
      {
         HitRoll = 0, 
         Description = "The Calmese returns your stare with unfeeling eyes.  Its beak and talons\
appear as though they could rend even the toughest of flesh.\
", 
         Tag = "", 
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
         Position = "standing", 
         Level = 15, 
         HitChance = 
         {
            HitSizeDice = 75, 
            HitPlus = 100, 
            HitNoDice = 3, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
         LongDescr = "A proud Calmese bird perches regally here, defiant to all.\
", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 10, 
            DamPlus = 10, 
         }, 
         ArmorClass = -20, 
         Vnum = 21056, 
         Race = "_78", 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         ShortDescr = "the regal calmese", 
         Name = "Calmese", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21057] = 
      {
         HitRoll = 0, 
         Description = "This white bantha sports a brilliant white coat and  lies at your approach.\
She appears ready to serve anyone.\
", 
         Tag = "", 
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
         Position = "standing", 
         Level = 20, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 100, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "the smelly bantha", 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A smelly white bantha slowly trods in a circle.\
", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 10, 
            DamPlus = 10, 
         }, 
         ArmorClass = 80, 
         Vnum = 21057, 
         Race = "_86", 
         Sex = "female", 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Name = "bantha", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21058] = 
      {
         HitRoll = 0, 
         Description = "The green dewback snorts as you examine him.  His green scales shine\
brightly regardless of light and the dewback seems as though it could\
move tirelessly for days. dewbacks are scarse here...mostly for pets.\
", 
         Tag = "", 
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
         Position = "standing", 
         Level = 25, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 100, 
            HitPlus = 250, 
            HitNoDice = 3, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "the dewback", 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A mighty green dewback beats angrily at the ground here.\
", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 10, 
            DamPlus = 30, 
         }, 
         ArmorClass = 80, 
         Vnum = 21058, 
         Race = "Dewback", 
         Sex = "male", 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Name = "dewback", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21059] = 
      {
         HitRoll = 0, 
         Description = "The teke lizard appears frightened out of its mind...\
", 
         Tag = "", 
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
         Position = "standing", 
         Level = 5, 
         HitChance = 
         {
            HitSizeDice = 75, 
            HitPlus = 50, 
            HitNoDice = 2, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A teke lizard scampers away from your booted feet.\
", 
         ShortDescr = "teke lizard", 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 10, 
            DamPlus = 20, 
         }, 
         ArmorClass = 20, 
         Vnum = 21059, 
         Race = "_74", 
         Sex = "undistinguished", 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Name = "teke lizard", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21060] = 
      {
         HitRoll = 0, 
         Description = "The Mon Calmarian mutt constantly sniffs the ground, searching for its prey.\
", 
         Tag = "", 
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
         Position = "standing", 
         Level = 10, 
         HitChance = 
         {
            HitSizeDice = 75, 
            HitPlus = 85, 
            HitNoDice = 3, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "the Mon Calmarian mutt", 
         LongDescr = "A mon calamrian mutt paces in circles here, sniffing the ground.\
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
         ArmorClass = 30, 
         Vnum = 21060, 
         Race = "_73", 
         Sex = "undistinguished", 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Name = "dog", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21061] = 
      {
         HitRoll = 2, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 15, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         LongDescr = "A heavy guard walks the wall of the city.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 5, 
         Vnum = 21061, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "guard man", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21062] = 
      {
         HitRoll = 2, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 15, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 150, 
            HitNoDice = 15, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close w\
\
lock w\
", 
               ScriptType = "MProg", 
               Arguments = "20", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Code = "un w\
op w\
", 
               ScriptType = "MProg", 
               Arguments = "6", 
               MudProgType = "time_prog", 
            }, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         LongDescr = "A Docking bay guard tends the western Docking bay.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21062, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the Docking bay guard", 
         Name = "guard", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21063] = 
      {
         HitRoll = 2, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 15, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close e\
lock e\
", 
               ScriptType = "MProg", 
               Arguments = "20", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Code = "un e\
op e\
", 
               ScriptType = "MProg", 
               Arguments = "6", 
               MudProgType = "time_prog", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21063, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "man guard", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21064] = 
      {
         HitRoll = 2, 
         Description = "", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Tag = "", 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 15, 
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
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close n\
lock n\
", 
               ScriptType = "MProg", 
               Arguments = "20", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Code = "un n\
op n\
", 
               ScriptType = "MProg", 
               Arguments = "6", 
               MudProgType = "time_prog", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         LongDescr = "A Docking bay guard tends the north Docking bay.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21064, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "guard man", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21065] = 
      {
         HitRoll = 2, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 15, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "unlock s\
op s\
\
", 
               ScriptType = "MProg", 
               Arguments = "6", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Code = "close s\
lock s\
", 
               ScriptType = "MProg", 
               Arguments = "20", 
               MudProgType = "time_prog", 
            }, 
         }, 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 4, 
            DamPlus = 15, 
         }, 
         ArmorClass = 0, 
         Vnum = 21065, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "guard", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21066] = 
      {
         HitRoll = 2, 
         Description = "", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Tag = "", 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 15, 
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
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close e\
lock e\
", 
               ScriptType = "MProg", 
               Arguments = "20", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Code = "un e\
op e\
", 
               ScriptType = "MProg", 
               Arguments = "6", 
               MudProgType = "time_prog", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         LongDescr = "A guard of watches you as you move by.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21066, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "guard", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21067] = 
      {
         HitRoll = 2, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 15, 
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
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close w\
lock w\
", 
               ScriptType = "MProg", 
               Arguments = "20", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Code = "un w\
op w\
", 
               ScriptType = "MProg", 
               Arguments = "6", 
               MudProgType = "time_prog", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         LongDescr = "A guard of the city stands here.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21067, 
         Race = "Human", 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "man guard", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21068] = 
      {
         HitRoll = 2, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 15, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 150, 
            HitNoDice = 15, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close s\
lock s\
", 
               ScriptType = "MProg", 
               Arguments = "20", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Code = "un s\
op s\
", 
               ScriptType = "MProg", 
               Arguments = "6", 
               MudProgType = "time_prog", 
            }, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         LongDescr = "A guard of the city stands at the ready.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21068, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "guard", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21069] = 
      {
         HitRoll = 2, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 15, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close n\
lock n\
close manhole\
", 
               ScriptType = "MProg", 
               Arguments = "20", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Code = "un n\
op n\
", 
               ScriptType = "MProg", 
               Arguments = "6", 
               MudProgType = "time_prog", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         LongDescr = "An guard keeps vigilant watch here.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21069, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the guard", 
         Name = "guard", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21070] = 
      {
         HitRoll = 0, 
         Description = "This fat, lumbering creature is tame and unkept. You find yourself\
wondering what it carries.\
", 
         Tag = "", 
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
         Position = "standing", 
         Level = 6, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 40, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A pack ratler lumbers about, carrying its master's belongings.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 3, 
            DamPlus = 8, 
         }, 
         ArmorClass = 150, 
         Vnum = 21070, 
         Race = "_86", 
         Sex = "undistinguished", 
         ShortDescr = "the pack ratler", 
         Name = "ratler", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21071] = 
      {
         HitRoll = 2, 
         Description = "", 
         Tag = "", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 15, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A E-Web guard peers over the area.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21071, 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "the E-web", 
         Name = "E-Web Guard", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 3, 
      }, 
      [21073] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21073, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created key", 
         Name = "Key", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21074] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21074, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created key", 
         Name = "Key", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21075] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21075, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created key", 
         Name = "Key", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21076] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21076, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created key", 
         Name = "Key", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21077] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21077, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created key", 
         Name = "Key", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21078] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21078, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created key", 
         Name = "Key", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21079] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21079, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created key", 
         Name = "Key", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21080] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21080, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created key", 
         Name = "Key", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21081] = 
      {
         HitRoll = 0, 
         Description = "This bearded human was jailed after he lost control and shot several Mon\
Calamari individuals. His clothes are ragged and it is rumored that at one\
time he was well known for his excellent Sci-Fiction writing. There is a\
small patch with writing on it. \
", 
         Tag = "", 
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
         Level = 15, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 150, 
            HitNoDice = 3, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Hey tell me your here to buy my new script... Intersteller Wars?\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "&p An elderly entertainment man rests on the bed contimplating filming a movie.\
&x\
\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 62, 
         Vnum = 21081, 
         Race = "Human", 
         Sex = "female", 
         ShortDescr = "&p An elderly entertainment man ", 
         Name = "man elderly george lucas", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21082] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 10, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "&G Toisk, A rather dumb Gamorrean male sits here counting the cracks in the\
floor.\
", 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 6, 
            DamPlus = 0, 
         }, 
         ArmorClass = 10, 
         Vnum = 21082, 
         Race = "Gamorrean", 
         Sex = "male", 
         ShortDescr = "&G Toisk, A rather dumb Gamorrean male", 
         Name = "gamorrean male Toisk", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21083] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         SpecFuns = 
         {
            [0] = "spec_customs_weapons", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 15, 
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
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         LongDescr = "&z A Tk-13y voice active security scanner frames the enterace. &z\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21083, 
         Race = "Human", 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "&z A Tk-13y Security scanner", 
         Name = "scanner enterance", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21084] = 
      {
         HitRoll = 0, 
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         Tag = "", 
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
         Level = 10, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A power droid is here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 75, 
         Vnum = 21084, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "&z Greeting Protocol Droid stands here.", 
         Name = "Greeting Protocol Droid", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [18] = "Mountable", 
            [0] = "Npc", 
            [30] = "Prototype", 
            [26] = "Droid", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21100] = 
      {
         HitRoll = 3, 
         Description = "As busy as this guy is he still takes the time to help each and\
every customer that walks into the room.  His silver coated frame\
gleems brightly and you can see that he will remain in service \
for some time barring any accidents.\
", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Protocol Droid Secretary Greets you\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 6, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21100, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "Protocol Droid", 
         Name = "Protocol Droid Secretary", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 2, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21101] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A janitor droid scoots about picking up your trash\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21101, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "A janitor Droid", 
         Name = "Janitor", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21445] = 
      {
         HitRoll = 0, 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         Tag = "", 
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
         Position = "standing", 
         Level = 11, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 110, 
            HitNoDice = 2, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say well thanks $n\
mpoload 21113\
give map $n\
", 
               ScriptType = "MProg", 
               Arguments = "200 ", 
               MudProgType = "bribe_prog", 
            }, 
            [2] = 
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
               ScriptType = "MProg", 
               Arguments = "hi hello", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A quarren drunk stumbles here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 72, 
         Vnum = 21445, 
         Race = "Human", 
         Sex = "female", 
         ShortDescr = "A quarren drunk ", 
         Name = "drunk quarren", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21448] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
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
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "&G A \"First Bank of Mon\" bank clerk counts credits to be sorted.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -25, 
         Vnum = 21448, 
         Race = "Human", 
         Sex = "female", 
         ShortDescr = "&G A \"First Bank of Mon\" bank clerk", 
         Name = "clerk mon bank", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21447] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A Mon child digs in the ground.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 3, 
            DamPlus = 3, 
         }, 
         ArmorClass = 0, 
         Vnum = 21447, 
         Race = "Human", 
         Sex = "male", 
         ShortDescr = "A Mon child", 
         Name = "child mon", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 1, 
      }, 
      [21446] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Position = "standing", 
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30, 
            HitNoDice = 1, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A Quarren child plays here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 3, 
            DamPlus = 3, 
         }, 
         ArmorClass = 0, 
         Vnum = 21446, 
         Race = "Quarren", 
         Sex = "male", 
         ShortDescr = "A Quarren child plays here.", 
         Name = "quarren child", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 1, 
      }, 
      [21499] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21499, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created final mob", 
         Name = "final mob", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21444] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Shop = 
         {
            KeeperShortDescr = "&R A XT-4y Food Dispensor ", 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "&R A XT-4y Food Dispensor sits here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21444, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "&R A XT-4y Food Dispensor ", 
         Name = "food dispensor", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21436] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
         Shop = 
         {
            KeeperShortDescr = "A TK-71 cooking droid", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         Level = 15, 
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
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         LongDescr = "&C A TK-71 cooking droid stands behind the grill waiting.\
", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Vnum = 21436, 
         Race = "Human", 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         ShortDescr = "A TK-71 cooking droid", 
         Name = "Cooking Droid", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 2, 
      }, 
      [21415] = 
      {
         HitRoll = 0, 
         Description = "", 
         Tag = "", 
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
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Vnum = 21415, 
         Race = "Human", 
         Sex = "undistinguished", 
         ShortDescr = "a newly created newbie mob", 
         Name = "newbie mob", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
      [21400] = 
      {
         HitRoll = 0, 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         Tag = "", 
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
         Position = "standing", 
         Level = 11, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 110, 
            HitNoDice = 2, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_police", 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Hello how can I help you....well come on..\
", 
               ScriptType = "MProg", 
               Arguments = "hi", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "Say Sorry $n come back with someone who cares.\
", 
               ScriptType = "MProg", 
               Arguments = "crime killed prison free", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Code = "mpecho As you enter the clerk looks up\
mpecho stares you down..\
laugh\
mpecho Then returns to work.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Stats = 
         {
            Wisdom = 10, 
            Dexterity = 10, 
            Force = 0, 
            Charisma = 10, 
            Luck = 10, 
            Constitution = 10, 
            Strength = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "Takiki, A Mon Calamarian police clerk\
", 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 72, 
         Vnum = 21400, 
         Race = "Human", 
         Sex = "female", 
         ShortDescr = "Takiki, A Mon Calamarian police clerk", 
         Name = "takiki mon police clerk", 
         Weight = 0, 
         Credits = 0, 
         DamRoll = 0, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
      }, 
   }, 
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
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
   Filename = "mon_cal.lua", 
}
