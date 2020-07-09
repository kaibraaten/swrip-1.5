-- Coruscant Academy
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   LowEconomy = 496053710, 
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
   Rooms = 
   {
      [10304] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "This is a silent room, which means while here you will not see any of the\
channels. In fact, you can only use socials, emotes and group tell here.\
The room was created to give you a quiet place to read our help files. You\
can reduce your own screen scroll by reducing the number of channels  you\
receive. You can get a full list of channels by typing CHAN. You may  turn\
off a channel by typing CHAN -<channel> and reactivate a channel by typing\
CHAN +all. Once you have finished reading, you are ready to test your\
ability to negotiate your way around. Going west will take you into\
another part of the Academy.  The test is to follow all the room\
descriptions until you can find your way back to this point. If you get\
lost at any time, type U to return here.  Once you have successfully\
returned here, please continue to the north to explore further.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10314, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "A Marble Corridor\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "A Stone Corridor\
", 
            }, 
            [3] = 
            {
               Direction = "west", 
               DestinationVnum = 10307, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Wandering the Academy\
", 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Vnum = 10304, 
         Name = "The Reading Room", 
         Sector = "inside", 
      }, 
      [10305] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Here you will experience your first full combat against MOBILES, also known\
as MOBS. Mobile is the name used for monsters and the like in the game.\
All exits, except down, lead to a CAGE mob. Some of these cage mobs may be\
aggressive and will attack you upon entering their room. As you kill them, \
you will gain experience, as well as academy equipment and gold. Once you \
have defeated a mob, type GET ALL CORPSE to loot the coins and equipment.\
You may also type CONFIG +AUTOLOOT or CONFIG +AUTOGOLD. Autoloot will take\
everything from the corpse when you kill it. Autogold will take only the\
gold from the corpse. When you loot a corpse of equipment, the items are\
transferred to your inventory. You may suffer injury during the battle, so \
return here and type REST or SLEEP. This will speed your healing process. \
When you are finished healing, type WAKE or STAND to continue.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10305, 
         Name = "Chamber of Trials for Rangers", 
         Sector = "inside", 
      }, 
      [10306] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "UNTIL FURTHER NOTICE:  ALL LANGUAGES CAN BE LEARNED FROM THE OLD MAN ON THE\
PLUOGUS. Some information about languages:  Languages are learned\
differently from skills, spells and weapons, as you must be adept at a\
language before you may use it. To learn a language, type LANGUAGE LEARN\
<language type>.   For more information on how to learn a language, type\
HELP LANGUAGES. To learn how to use languages, type HELP SPEAK and HELP\
TONGUE.   It will cost some money each time you wish to increase your\
fluency in a language. Those who are intelligent, wise and lucky will find\
it takes fewer practices to become adept at a language. Wookiees can NEVER\
learn to speak common.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10306, 
         Name = "Abbigayle's Language Lessons", 
         Sector = "inside", 
      }, 
      [10307] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Each player has a menu of items that the game controls automatically once\
it has been configured. To get a list of this menu, type CONFIG. For this\
part of your schooling, it is suggested you type CONFIG +AUTOEXIT. This\
will have the mud show you all obvious exits available to you. When you\
are moving around the game, EXIT is a very important command. When you\
type EXIT, it shows you the room names each exit shown under obvious exits.\
You can use this command to get hints of dangers and death traps that might\
be close by. You may also try to LOOK in adjoining rooms. You do this by\
typing LOOK <direction>. Your next move is to the west, to see what you\
are walking into, try typing EXIT and L W. \
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "Door", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "The Reading Room\
", 
            }, 
            [2] = 
            {
               Direction = "west", 
               DestinationVnum = 10309, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Wandering Darkhaven Academy, it looks safe\
", 
            }, 
            [3] = 
            {
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10307, 
         Name = "Wandering the Academy", 
         Sector = "inside", 
      }, 
      [10308] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Here stands a Chadoyn.  He was captured trying to slaughter the students\
of the Academy, and the Immortals decided to spare his life and throw him\
in chains for use as a teaching aid.  With him you can practice attacking\
and fleeing, but hopefully not dying.  You will also want to make use of\
the 'consider' command.  This command compares your level and hitpoints\
to that of the creature.  To use here, type 'con chadoyn'.\
 \
To use the consider command elsewhere, type CON <MOBNAME>.  It is wise to\
ALWAYS consider a mob before fighting it the first time.  This will many\
times save your life, as mobs are often a lot more difficult then they\
outwardly appear.  Be careful and enjoy your fight.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 10316, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "A Dank Pit\
", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10308, 
         Name = "A Dank Pit", 
         Sector = "inside", 
      }, 
      [10309] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "This is where you will start learning about exits not listed under \"Exits\".\
Doors are not seen on the game. You must read room description and LOOK\
<direction> to find them. Another method of finding a door is to \"bump\" into\
the walls. Type N. OUCH! You ran into the door. You want to be careful not\
to be affected with the pass door spell while using the bump method, as you\
may end up in a room you would rather not visit. Now, type OPEN N or OPEN\
DOOR. Next type EXIT, you will now see the north exit listed under \"Exits\".\
Type HELP OPEN to find out more information on doors.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "door", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10310, 
               Distance = 0, 
               Key = -1, 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "An Enclosed Room\
", 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 10307, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Wandering the Academy\
", 
            }, 
            [3] = 
            {
               Direction = "west", 
               DestinationVnum = 10311, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10309, 
         Name = "Wandering Coruscant Academy", 
         Sector = "inside", 
      }, 
      [10310] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "You did it! Well done. You will find many rooms such as this all over the\
game. Some are easy to find because of hints in the room descriptions.\
Some are very hard to find, as the clues could be rooms away. However, you\
are now armed with the tools to locate them. You know how to use \"look\", \
bump, and \"exit\". Many classes also get a spell called \"scry\". This spell\
will allow the person affected by it to see the into the adjoining rooms.\
It is used like \"look\", but gives you more detailed information. To see if\
you gain the scry spell at a later level, type SLIST. This will give you a\
list of all spells, skills and weapon types you may practice. Slist also\
gives you information on what level you may practice each, to what percent\
you are currently practiced in each, and what the maximum percent that you\
may practice each.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               DestinationVnum = 10309, 
               Distance = 0, 
               Key = -1, 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "Wandering Darkhaven Academy\
", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10310, 
         Name = "An Enclosed Room", 
         Sector = "inside", 
      }, 
      [10311] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "There are several special exit types that you may encounter in your travels.\
You have experienced open exits and closed doors to this point. There are\
also hidden doors. The hidden door can not be found with the \"bump\" method.\
Often they will not show up with the \"look\" method either. These exits are\
found by reading room descriptions, mobiles descriptions and looking at\
objects. You are looking for words that stand out, those words will be the\
door name. You will also find doors that are locked. You may get past some\
locked doors with the pass door spell, the pick door skill or bash door skill.\
Some doors may only be passed by using the matching key. Other exits you\
may find require you to be skilled in climb or affected by the fly spell.\
All exits are in real directions that can be abbreviated to the following:\
N, E, W, S, NE, NW, SE, SW, U, or D. There are also SOMEWHERE exits that\
use \"leave\", \"climb\", \"enter\", or just a word to use. To the north you\
will experience a hidden exit, use the room description to find the door name.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10312, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 10309, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Wandering Darkhaven Academy\
", 
            }, 
            [3] = 
            {
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10311, 
         Name = "Lost in Coruscant Academy", 
         Sector = "inside", 
      }, 
      [10312] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "You are standing in a richly decorated room. A large oak table surrounded\
by twelve chairs dominates a large portion of the area. Crystal globes with\
continual light spells cast on them hover about the room, providing a soft\
comfortable light. The walls are adorned with tapestries of the finest\
quality. The tapestry on the west wall draws your attention more so than\
the others. Now, you have many clues on the possible exit. Try to find the\
right word by typing LOOK <word>. For example, try LOOK GLOBES. Sometimes\
looking at other things in the rooms description will lead you to the word\
that will open the exit. \
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Upon closer inspection you realise that this is not even a tapestry, but\
\13a cunningly camouflaged wall! You can see the outline of a door as you\
\13look closer.\
\13", 
               Keyword = "tapestry", 
            }, 
            [2] = 
            {
               Description = "You see a tapestry on the wall here, something just isn't right about it.\
\13", 
               Keyword = "west", 
            }, 
            [3] = 
            {
               Description = "You see a tapestry on the wall.\
\13", 
               Keyword = "w", 
            }, 
            [4] = 
            {
               Description = "You see a cleverly disguised door.\
\13", 
               Keyword = "door", 
            }, 
            [5] = 
            {
               Description = "This globes cast shadows in the corners. The shadows on the west\
\13tapestry almost appears to be an opening.\
\13", 
               Keyword = "Crystal globes", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               DestinationVnum = 10311, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Direction = "west", 
               DestinationVnum = 10313, 
               Distance = 0, 
               Key = -1, 
               Keyword = "tapestry door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               Description = "door\
", 
            }, 
            [3] = 
            {
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10312, 
         Name = "Lost in Coruscant Academy", 
         Sector = "inside", 
      }, 
      [10313] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Well Done! You have found this secret room. Sometimes these secret rooms\
will contain valuable items or will lead to other parts of the area you\
are exploring. Always pay close attention to room descriptions, mobiles\
descriptions and items, this will many times bring profitable results.\
This is a where you will experience a Somewhere exit. To find your way\
out, try looking at the picture on the wall. If you can not figure it out, \
you may leave by the up exit. Good luck!\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK. \
\13", 
               Keyword = "picture", 
            }, 
            [2] = 
            {
               Description = "This is a huge CRACK, you could probably squeeze through it. \
\13", 
               Keyword = "crack", 
            }, 
            [3] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK.\
\13", 
               Keyword = "wall", 
            }, 
            [4] = 
            {
               Description = "You see an oak door.\
\13", 
               Keyword = "door", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 10312, 
               Distance = 0, 
               Key = -1, 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Back to the beginning\
", 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               DestinationVnum = 10302, 
               Distance = 0, 
               Key = -1, 
               Keyword = "crack", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10313, 
         Name = "A Secret Alcove", 
         Sector = "inside", 
      }, 
      [10314] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "This room will teach you several commands to check your statistics and \
character health. These commands are SCORE, EQUIPMENT, INVENTORY, and\
LEVEL. Score is used by typing SC, it tells you all the basic statistics\
about your character. Equipment is used by typing EQ, this shows you all \
the items you are currently wearing. Inventory is used by typing I, and \
shows you all items you are carrying other than your worn equipment.\
Level is used by typing LEVEL, it show your current level, your current\
experience points, and the experience needed for the next few levels.\
Use the help menu to get more information on the topics covered here,\
type HELP <subject>.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10315, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Preparing for combat\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "The Reading Room\
", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10314, 
         Name = "A Marble Corridor", 
         Sector = "inside", 
      }, 
      [10315] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "The time is drawing near to experience combat.  Directly below you  is the\
Chadoyn Pit, the home of a creature which will assist you in learning how\
to initiate combat. The Chadoyn is not aggressive, which means you must\
begin the fight.  There are many ways to do so.  The quickest is KILL\
<mob>. As you gain skills and spells, you may find many of them are also\
capable of initiating combat.  Some of the more popular spells that do so\
are:  DISPEL FORCE, SLEEP, DOMINATE, WEAKEN and BLINDNESS. Some of the\
most popular skills used are STEAL and BACKSTAB.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10317, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 10314, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "A Marble Corridor\
", 
            }, 
            [3] = 
            {
               Direction = "down", 
               DestinationVnum = 10316, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "A Dank Pit\
", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10315, 
         Name = "Preparing for combat", 
         Sector = "inside", 
      }, 
      [10316] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "This room explains about WIMPY, FLEE, and RECALL as a way to leave from\
combat. Wimpy is an automatic withdrawal from a fight when your hitpoints\
reach a set minimum. To set your wimpy, type WIMPY or WIMPY <number>. The\
number being the amount of hitpoints you want remaining when you leave the\
battle. You will lose experience for wimpying out of a fight, but the\
amount of experience lost will generally be less then the amount lost from\
death. You may also manually withdraw from a fight with flee. To use flee,\
just type FLEE. You may flee out of the fight at any amount of hitpoints.\
Fleeing will cost you loss of experience. \
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 10308, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "A Dank Pit\
", 
            }, 
            [2] = 
            {
               Direction = "up", 
               DestinationVnum = 10315, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Preparing for combat\
", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10316, 
         Name = "A Dank Pit", 
         Sector = "inside", 
      }, 
      [10317] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "After a long fight or even a long walk you character may need to rest. The\
safest way to do this is to type REST. You may also SLEEP but only do that\
in safe places as you will be more open to being attacked or robbed when\
you are sleeping. When you are done sleeping type WAKE, and when you are\
done resting type STAND.   You may find that occasionally your character\
begins to get hungry or thirsty as you travel around in Star Wars Reality.\
The droid in this room will give you food or a canteen if you ask it\
nicely. To use them type EAT <whatever> or DRINK <whatever>. If you are\
really hungry you might have to do this twice. There is also a fountain\
here you may drink out of or use to fill your canteen. (try: fill canteen\
fountain)\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10327, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 10315, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10317, 
         Name = "Time To Take A Break", 
         Sector = "city", 
      }, 
      [10318] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Sometimes an item may appear useless at first.  There are many junk items\
that are just that, junk.  But some items can come in handy.  Try making\
small talk with this student. HE seems to have found something that might\
prove useful to you.  Sometimes one item may be found inside another.  To\
look in to an object that is a container use :  LOOK IN <container>.  To\
get an item from a container, use :  GET <item> FROM <container> as well. \
                          Hint:  say hello. \
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10318, 
         Name = "A Useless Item?", 
         Sector = "city", 
      }, 
      [10319] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Sometimes items can be obtained by manipulating other items. Some classes\
can make items from other ones using skills such as MAKEBLASTER, MAKESPICE,\
or MAKELIGHTSABER. Other times it is as simple as opening a box or pushing\
a button as is the case in this room.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10319, 
         Name = "Up in a Small Loft", 
         Sector = "city", 
      }, 
      [10320] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "The most common way in most muds to gain equipment is by looting the\
corpses of dead mobiles(monsters etc). After you kill this droid use\
EXAMINE CORPSE to see what it was carrying. Then use GET ALL FROM CORPSE\
to get the goodies from it. To automaticly loot corpses when you kill\
something you can set CONFIG +AUTOLOOT or CONFIG +AUTOCRED for just\
credits.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10320, 
         Name = "Looting Your Kills", 
         Sector = "city", 
      }, 
      [10321] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Shops are a great way of aquiring equipment and getting rid of extras.\
To get a list of what a shopkeeper is selling type LIST. To buy an item\
type BUY <objectname>. If you have extra equipment or have found something\
that you want to sell type SELL <object>. To find out how much a shopkeeper\
will buy something for type VALUE <object>.\
 \
One of the more useful items in this shop is the backpack. Once you have\
bought one you can put any extra items you have in it for safe keeping.\
You may also wear it. If you don't have enough credits to buy anything try\
getting some from the droid a couple of rooms to the east.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10321, 
         Name = "Academy Store", 
         Sector = "city", 
      }, 
      [10322] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "One of the major goals you will have playing the mud, is finding better\
equipment to make your character's life safer and easier.  There are\
several ways of doing this. Two that you need to remember but won't yet be\
able to do, until you learn the skills, are SEARCHing and DIGging. \
STEALing is also a way to get items but only criminal characters who\
practice steal are able to do this. (Be warned: Even if you are not a\
criminal, this is a good way to lose eq.)   The rooms to the east and\
west, as well as the ones up and down from here, exhibit different ways of\
getting items. After exploring these four rooms and getting everything you\
need, you may move on to the next room to the north.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10323, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 10320, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 10327, 
               Distance = 0, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 10321, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               DestinationVnum = 10319, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [6] = 
            {
               Direction = "down", 
               DestinationVnum = 10318, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10322, 
         Name = "Getting More Useful Items", 
         Sector = "city", 
      }, 
      [10323] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Congratulations, you're almost done. The graduation hall is just to the\
north. Only one problem though. The door's locked. Maybe this kid knows\
where the key is. If only he'd stop crying long enough for you to ask.\
hint: find his doll\
hint: give doll child\
hint: say where's the key\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10324, 
               Distance = 0, 
               Key = 10423, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10323, 
         Name = "The Last Challenge", 
         Sector = "city", 
      }, 
      [10324] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Congratulations you did it... line up and get your diploma.   You are in a\
long wide hallway. The floor is covered in a plush red carpet. The walls\
are made of a tansparent duraplast and come together to form a dome over\
your head. Looking out the window you notice that the hallway is in fact a\
catwalk connecting the academy to a small landing platform at the end. You\
can't look much more than 20 or 30 levels into the city depths below, as\
many walkways criss-cross between the buildings, obscuring your view of\
the lower levels. Looking up you see several cloudcars slowly navigating\
Coruscant's many skyscrapers. A stairway at the end of the hall slopes up\
towards the docking bay. It is the only exit other than the door behind\
you, back into the academy. \
 \
&RSay 'iamauthed' and you will be authorized.&R&W\
PLEASE LOOK AT THE ROOM ONCE YOU HAVE SAID 'IAMAUTHED'!\
 \
When the schoolmaster shakes your hand, you are authed.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "iamauthed", 
               Code = "if isimmort($n)\
mpechoat $n dumbass! trans yourself!\
else\
mptransfer $n 10325\
endif\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               DestinationVnum = 10323, 
               Distance = 0, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 10324, 
         Name = "Graduating from the Academy", 
         Sector = "city", 
      }, 
      [10325] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "Detached from the rest of the Academy to leave room for ships to manuever,\
this docking bay is large enough to hold four or five shuttles. The space\
above is clear and you can see the clouds above you. Anyone launching\
a shuttle from here would have to fly straight though as several larger\
buildings box in the sides of the docking bay no less 30 feet out on each\
side. The noise of the city is blends together forming a loud pulsing hum\
pushing in from all directions. There is a slight and very rare breeze\
blowing down beetween the buildings and across the pad. It is an odd\
feeling in such a boxed in environment.\
 \
There is a small shuttle here waiting to take you home. To board it type\
ENTER.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "somewhere", 
               DestinationVnum = 10326, 
               Distance = 0, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
            }, 
         }, 
         Vnum = 10325, 
         Name = "Academy Docking Bay", 
         Sector = "city", 
      }, 
      [10326] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "You are in a small single compartment shuttle. The passenger seats are\
directly behind the pilots chair and slightly raised to give you a\
nice view for your journey. The seats recline back into a sleeping\
position in case you get tired. A small pantry and a restroom are at\
the back of the cabin.   The purpose of this shuttle is to take the\
newly graduated students home. Its a bit of a luxury compared to the\
rest of your stay at the academy. It must be as much for apearances\
as it is to honor the graduates. You will need to give your diploma\
to the driver before he will launch... Wouldn't want to spend this\
much money on drop outs. If you don't have a diploma yet type LEAVE,\
and then go look for the schoolmaster. \
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "somewhere", 
               DestinationVnum = 10325, 
               Distance = 0, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 10326, 
         Name = "The Shuttle home", 
         Sector = "city", 
      }, 
      [10327] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "A very important thing to learn about early is cloning. Death is permanent.\
When you die you loose everything. However... somewhere deep in the core\
worlds is a place that creates and stores the clones of those who are\
willing to pay a small fee. Having a clone makes a back up of your\
character at the moment of cloning that can be used in the event of an\
untimely death. My advice is to find the cloning facilities as soon as\
possible and make a new clone at least every five levels. Death is a lot\
less painful when you loose 5 levels as opposed to having to start over\
from the beginning.   To exit, open the door north of you by using the\
command open north. This can be used any place doors are located. Simply\
use 'open' and then the direction. \
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 10317, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10327, 
         Name = "Some Important Words of Advice", 
         Sector = "city", 
      }, 
      [10399] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 10399, 
         Name = "This Room is used by a Mob program do not delete.", 
         Sector = "city", 
      }, 
      [10400] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [26] = "Factory", 
         }, 
         Vnum = 10400, 
         Name = "A test workshop", 
         Sector = "city", 
      }, 
      [10401] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Vnum = 10401, 
         Name = "a quiet place", 
         Sector = "city", 
      }, 
      [10340] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10340, 
         Name = "Floating in a void", 
         Sector = "city", 
      }, 
      [10342] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10342, 
         Name = "Floating in a void", 
         Sector = "city", 
      }, 
      [10430] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "You stand in the player lounge.  It is the last safe zone in the galaxy.  \
Relax and have a cool drink, as this will be the last time you can let\
your guard down and not be marked for death.\
 \
A student message terminal is here for you to practice reading and writing\
messages.  Use NOTE LIST to get a list of the messages, and NOTE READ\
<message number> to read a specific message.\
Type HELP NOTE for more commands.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 10300, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
         }, 
         Vnum = 10430, 
         Name = "Student Lounge", 
         Sector = "inside", 
      }, 
      [10429] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10429, 
         Name = "Floating in a void", 
         Sector = "city", 
      }, 
      [10300] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "You stand inside the Coruscant Academy, an establishment designed to teach\
the basics of survival within the galaxy. Each room has a specific purpose\
and contains information on the various commands available to you for\
maneuvering around and interacting with other players. We recommend you\
explore the Academy in full, taking the time to read the instructions in\
each room. Check out the bulletin board to the west by typing w.  Then\
come back and explore the rest of the Academy to the north. There is no\
need to ask for authorization. You will be authorized as you leave the\
academy.\
&C\
HOWEVER:  Bios and descriptions are required for anyone over the level of\
newbie.  Type help bio and help desc for further information on creating\
these important documents.\
 \
&RMake sure you have an acceptable name, or you are just wasting your time,\
we -will- have you recreate if you have a bad name.&R&W\
\
Names such as Nathan, Jeff, George, or any other RL name of the like are\
no longer acceptable on this mud. Don't use them.\
 \
&RHere is a good website on naming conventions:&R&W\
http://themudjournal.com/rp/ABCs-A.html\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "throat", 
               Code = "mpat 122 mpecho $n just slit his own throat at the creations room!\
mpat 101 mpecho $n just sucicided at the creations room.\
", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Arguments = "entered", 
               Code = "mpat 122 mpecho $n has just begun life!\
mpat 101 mpecho $n has just entered the game.\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               DestinationVnum = 10430, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10300, 
         Name = "Coruscant Academy", 
         Sector = "inside", 
      }, 
      [10301] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "To the west is Lady Abbigayle's room, and to the east is Domick.  Lady\
Abbigayle has information about languages, and Domick has information on\
practicing weapons and skills. When you are finished exploring these\
areas, come back here and continue north through the Academy.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if isimmort($n)\
else\
  mpforce $n vis\
endif\
", 
               MudProgType = "leave_prog", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Reading Room\
", 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 10303, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "The Laboratory of Skills.\
", 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 10300, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Entrance to Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 10306, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "Abbigayle's Language Lessons.\
", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10301, 
         Name = "A Duraplast Corridor", 
         Sector = "inside", 
      }, 
      [10302] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "You did it! You are an excellent student! To continue your education,\
please leave north. That will return you to the Reading room.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "The Reading Room\
", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10302, 
         Name = "Somewhere", 
         Sector = "inside", 
      }, 
      [10303] = 
      {
         TeleDelay = 0, 
         Tunnel = 0, 
         Description = "This is where you will practice your arsenal of weapons and skills. Type\
PRACTICE to get a list of these currently available to you.  Everyone will\
have sections listing skills, weapons, and languages. You will also have\
an additional section for force powers. Force skills, including meditate,\
are taught elsewhere in the game. When training, there are some things you\
should know: When practicing a skill, one practice will earn you between\
15% and 20% proficiency. The amount is determined by the amount of wisdom\
you have. Additional knowledge is gained through usage of the skill/weapon\
until adepted. To see information about a specific skill or weapon, type\
HELP <skill or weapon style>.  For general questions on practicing, type\
HELP PRACTICE.\
", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10303, 
         Name = "The Laboratory of Skills", 
         Sector = "inside", 
      }, 
   }, 
   Objects = 
   {
      [10304] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 3, 
               Modifier = 1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a helmet made of fine iron, from the Darkhaven Academy.  It will\
\13protect you until you can find better.\
\13", 
               Keyword = "helmet iron", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "A Coruscant Academy cap is here.", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Vnum = 10304, 
         Name = "academy cap", 
         ShortDescr = "an academy cap", 
      }, 
      [10305] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This cape is made from a heavy brocade. It will offer you warmth and\
\13protection until you can find something better. You can find it at the\
\13Darkhave Academy.\
\13", 
               Keyword = "cape brocade", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "A black brocade cape from the academy", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 3, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Vnum = 10305, 
         Name = "cape brocade academy", 
         ShortDescr = "a black brocade cape", 
      }, 
      [10306] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This collar fits closely around your neck. It is thick with spikes to\
\13protect you in battle. You can find it in the Darkhaven Academy\
\13", 
               Keyword = "collar metal ", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "A strong metal collar from the academy", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Vnum = 10306, 
         Name = "collar metal academy", 
         ShortDescr = "a strong metal collar", 
      }, 
      [10307] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n As you wear this visor, you feel more intelligent and wise!\
mpechoaround $n As $n wears the visor of completion, $e looks more complete!\
", 
               MudProgType = "wear_prog", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 3, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 4, 
               Modifier = 1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Congratulations! You have completed the Darkhaven Academy and can now\
\13wear this visor with pride! It is magic too, type WEAR VISOR to use.\
\13", 
               Keyword = "visor completion", 
            }, 
         }, 
         Cost = 0, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "A visor of completion is here, emitting a faint glow.", 
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
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 10307, 
         Name = "visor completion academy", 
         ShortDescr = "a visor of completion", 
      }, 
      [10308] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This plate of armour will give you protection until you can find\
\13something better. \
\13", 
               Keyword = "plate armour", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "An academy vest was left here.", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Vnum = 10308, 
         Name = "academy vest", 
         ShortDescr = "an academy vest", 
      }, 
      [10309] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 1, 
               Modifier = 1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This sleeves will protect your arms until you can find something better.\
\13You can find them in the Darkhaven Academy.\
\13", 
               Keyword = "sleeves tin", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "Lightweight tin sleeves from the academy", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Vnum = 10309, 
         Name = "sleeves tin academy", 
         ShortDescr = "lightweight tin sleeves", 
      }, 
      [10310] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is your first shield, it will help keep you safe until you can\
\13find something better.\
\13", 
               Keyword = "shield crest", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "An energy shield was dropped here.", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Vnum = 10310, 
         Name = "forceshield energyshield shields shield", 
         ShortDescr = "an energy shield", 
      }, 
      [10311] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 24, 
               Modifier = -1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         Layers = 0, 
         ItemType = "light", 
         Description = "A glowrod would make a good light source.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [13] = "Inventory", 
            [6] = "Magic", 
         }, 
         Vnum = 10311, 
         Name = "light glowrod glowstick", 
         ShortDescr = "a glowrod", 
      }, 
      [10312] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -2, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 250, 
         Layers = 0, 
         ItemType = "weapon", 
         Description = "You see a finely honed vibro-blade here.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 2, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 10312, 
         Name = "academy vibro blade knife dagger vibro-blade", 
         ShortDescr = "a vibro-blade", 
      }, 
      [10313] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         Layers = 0, 
         ItemType = "food", 
         Description = "A packaged ration is here, waiting to be eaten.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 50, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10313, 
         Name = "ration standard packaged", 
         ShortDescr = "a packaged ration", 
      }, 
      [10314] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "drink_container", 
         Description = "A small grey canteen has been drooped here.", 
         ActionDescription = "", 
         Cost = 10, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 40, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 40, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10314, 
         Name = "canteen water grey stock", 
         ShortDescr = "a canteen", 
      }, 
      [10315] = 
      {
         Layers = 0, 
         ItemType = "fountain", 
         Description = "A drinking fountain rests against the wall.", 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Vnum = 10315, 
         Name = "drinking fountain", 
         ShortDescr = "a fountain", 
      }, 
      [10316] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         Layers = 1, 
         ItemType = "armor", 
         Description = "A pair of socks is in a ball on the floor.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10316, 
         Name = "socks", 
         ShortDescr = "a pair of socks", 
      }, 
      [10317] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = -5, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Layers = 64, 
         ItemType = "container", 
         Description = "An academy backpack was carelessly misplaced here.", 
         ActionDescription = "", 
         Cost = 5, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Vnum = 10317, 
         Name = "academy backpack", 
         ShortDescr = "a backpack", 
      }, 
      [10318] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpoload 10316 1\
mpoload 10308 1\
mpoload 10303 1\
pull button\
drop all\
mpecho A small panel opens revealing several articles of clothing.\
", 
               MudProgType = "push_prog", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "button", 
         Description = "A small grey button seems out of place on the wall here.", 
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
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Vnum = 10318, 
         Name = "grey button", 
         ShortDescr = "a button", 
      }, 
      [10319] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "container", 
         Description = "A small box .. I wonder whats inside, maybe you should open it.", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10319, 
         Name = "box", 
         ShortDescr = "a box", 
      }, 
      [10320] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "trash", 
         Description = "A Luke Skywalker action figure was misplaced here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10320, 
         Name = "luke toy action figure doll", 
         ShortDescr = "a Luke Skywalker action figure", 
      }, 
      [10321] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "paper", 
         Description = "Someone dropped their coruscant academy graduation diploma here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10321, 
         Name = "diploma academy coruscant graduation", 
         ShortDescr = "a diploma", 
      }, 
      [10322] = 
      {
         Layers = 0, 
         ItemType = "trash", 
         Description = "A small shuttle is docked here.", 
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
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Vnum = 10322, 
         Name = "academy shuttle", 
         ShortDescr = "a shuttle", 
      }, 
      [10323] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
               Keyword = "practice lightsaber", 
            }, 
            [2] = 
            {
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
               Keyword = "practice lightsaber", 
            }, 
         }, 
         Cost = 500, 
         Layers = 0, 
         ItemType = "weapon", 
         Description = "A practice lightsaber is here.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 3, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10323, 
         Name = "practice lightsaber", 
         ShortDescr = "a practice lightsaber", 
      }, 
      [10324] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This power cell, the size of a fingertip, is\
\13well suited for powering a lightsaber.\
\13", 
               Keyword = "lightsaber battery", 
            }, 
         }, 
         Cost = 50, 
         Layers = 0, 
         ItemType = "battery", 
         Description = "A lightsaber battery is lying here.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10324, 
         Name = "battery", 
         ShortDescr = "a lightsaber battery", 
      }, 
      [10499] = 
      {
         Layers = 0, 
         ItemType = "trash", 
         Description = "Some god dropped a newly created final object here.", 
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
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Vnum = 10499, 
         Name = "final object", 
         ShortDescr = "a newly created final object", 
      }, 
      [10498] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "superconductor", 
         Description = "A superconductor is lying here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10498, 
         Name = "superconductor", 
         ShortDescr = "a superconductor", 
      }, 
      [10497] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "circuit", 
         Description = "A circuit board was dropped here.", 
         ActionDescription = "", 
         Cost = 120, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10497, 
         Name = "circuit board", 
         ShortDescr = "a circuit board", 
      }, 
      [10496] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "mirror", 
         Description = "A tiny, round mirror is lying here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10496, 
         Name = "mirror", 
         ShortDescr = "a tiny, round mirror", 
      }, 
      [10495] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "crystal", 
         Description = "A non-adegan crystal is lying here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10495, 
         Name = "non-adegan crystal", 
         ShortDescr = "a non-adegan crystal", 
      }, 
      [10494] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Cost = 50, 
         Layers = 0, 
         ItemType = "durasteel", 
         Description = "A scrap of some material lies here.", 
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
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10494, 
         Name = "some scrap durasteel", 
         ShortDescr = "some scrap durasteel", 
      }, 
      [10493] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "oven", 
         Description = "A portable oven is here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10493, 
         Name = "portable oven", 
         ShortDescr = "a portable oven", 
      }, 
      [10492] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "battery", 
         Description = "A battery is lying here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10492, 
         Name = "battery", 
         ShortDescr = "a battery", 
      }, 
      [10491] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "staff", 
         Description = "A durastaff is lying here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10491, 
         Name = "staff durastaff", 
         ShortDescr = "a durastaff", 
      }, 
      [10490] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "toolkit", 
         Description = "A toolkit is lying here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10490, 
         Name = "toolkit", 
         ShortDescr = "a toolkit", 
      }, 
      [10489] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "lens", 
         Description = "A small lens is lying here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10489, 
         Name = "lens", 
         ShortDescr = "a small lens", 
      }, 
      [10488] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         Layers = 0, 
         ItemType = "ammo", 
         Description = "An ammunition cell was carelessly left here.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10488, 
         Name = "ammo cell amunition cartridge", 
         ShortDescr = "an ammunition cell", 
      }, 
      [10487] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "spice", 
         Description = "Some carsanum was dropped here.", 
         ActionDescription = "", 
         Cost = 200, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10487, 
         Name = "carsanum spice", 
         ShortDescr = "some poorly refined carsanum", 
      }, 
      [10435] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "spice", 
         Description = "A prototype spice is here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10435, 
         Name = "prototype spice", 
         ShortDescr = "a prototype spice", 
      }, 
      [10434] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "disguise", 
         Description = "A prototype disguise is here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10434, 
         Name = "prototype disguise", 
         ShortDescr = "a prototype disguise", 
      }, 
      [10433] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "A prototype armor is here.", 
         ActionDescription = "", 
         Cost = 100, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10433, 
         Name = "prototype armor", 
         ShortDescr = "a prototype armor", 
      }, 
      [10414] = 
      {
         Layers = 0, 
         ItemType = "furniture", 
         Description = "A student message terminal is here for you to play with.", 
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
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Vnum = 10414, 
         Name = "student message terminal", 
         ShortDescr = "a student message terminal", 
      }, 
      [10432] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "container", 
         Description = "A prototype container is here.", 
         ActionDescription = "", 
         Cost = 100, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10432, 
         Name = "prototype container", 
         ShortDescr = "a prototype container", 
      }, 
      [10431] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "weapon", 
         Description = "A proottype bowcaster is here", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10431, 
         Name = "prototype bowcaster", 
         ShortDescr = "prototype bowcaster", 
      }, 
      [10430] = 
      {
         Layers = 0, 
         ItemType = "comlink", 
         Description = "Some god dropped a newly created prototype comlink here.", 
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
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Vnum = 10430, 
         Name = "prototype comlink", 
         ShortDescr = "a newly created prototype comlink", 
      }, 
      [10429] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "Some god dropped a newly created prototype shield here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Vnum = 10429, 
         Name = "prototype shield", 
         ShortDescr = "a newly created prototype shield", 
      }, 
      [10428] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "light", 
         Description = "Some god dropped a newly created prototype light here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10428, 
         Name = "prototype light", 
         ShortDescr = "a newly created prototype light", 
      }, 
      [10420] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "weapon", 
         Description = "A prototype blaster is here", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10420, 
         Name = "prototype blaster", 
         ShortDescr = "prototype blaster", 
      }, 
      [10421] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n Your lightsaber ignites with a soft hum and a bright glow.\
mpechoaround $n $n's lightsaber seemingly jumps into $s hand.\
mpechoaround $n &WIt ignites with a hum and a bright glow.\
", 
               MudProgType = "use_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 128, 
         ItemType = "weapon", 
         Description = "A prototype lightsaber shouldn't be here", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         Vnum = 10421, 
         Name = "prototype saber lightsaber", 
         ShortDescr = "a prototype lightsaber", 
      }, 
      [10422] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "weapon", 
         Description = "A prototype vibro-blade shouldn't be here", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10422, 
         Name = "prototype vibro-blade", 
         ShortDescr = "prototype vibro-blade", 
      }, 
      [10423] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "key", 
         Description = "An old fashioned mechanical key was left on the ground here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10423, 
         Name = "key", 
         ShortDescr = "a key", 
      }, 
      [10424] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "comlink", 
         Description = "A small hand-held comlink.", 
         ActionDescription = "", 
         Cost = 50, 
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
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 10424, 
         Name = "comlink radio communicator", 
         ShortDescr = "a comlink", 
      }, 
      [10425] = 
      {
         Layers = 0, 
         ItemType = "grenade", 
         Description = "Some god dropped a newly created prototype grenade here.", 
         ObjectValues = 
         {
            [1] = 350, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Vnum = 10425, 
         Name = "prototype grenade", 
         ShortDescr = "a newly created prototype grenade", 
      }, 
      [10426] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "trash", 
         Description = "Some god dropped a newly created generic armor here.", 
         ActionDescription = "", 
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
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 10426, 
         Name = "generic armor", 
         ShortDescr = "a newly created generic armor", 
      }, 
      [10427] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "landmine", 
         Description = "Some god dropped a newly created protoype landmine here.", 
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10427, 
         Name = "protoype landmine", 
         ShortDescr = "a newly created protoype landmine", 
      }, 
      [10300] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 31, 
               Modifier = 1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a bracelet that will bring you luck in your travels. It can\
\13be found at the Darkhaven Acamdemy\
\13", 
               Keyword = "bracelet charm", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "A charm bracelet from the academy lies here", 
         ActionDescription = "", 
         Cost = 0, 
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
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Vnum = 10300, 
         Name = "bracelet charm academy", 
         ShortDescr = "a charm bracelet", 
      }, 
      [10301] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = 100, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This boots are so comfortable and light, you feel you can walk a lot\
\13farther. The can be found at the Darkhaven Academy.\
\13", 
               Keyword = "combat boots", 
            }, 
         }, 
         Layers = 126, 
         ItemType = "armor", 
         Description = "A pair of black combat boots from the Academy lies here", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 3, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Vnum = 10301, 
         Name = "combat boots academy", 
         ShortDescr = "a pair of black combat boots", 
      }, 
      [10302] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This belt is made of a fine leather, braided for strength. You can get\
\13it at the Darkhaven Academy.\
\13", 
               Keyword = "belt leather", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "A braided leather belt from the Academy lies here", 
         ActionDescription = "", 
         Cost = 0, 
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
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Vnum = 10302, 
         Name = "belt leather academy", 
         ShortDescr = "a braided leather belt", 
      }, 
      [10303] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "These leggings will offer good protection until you can get better. They\
\13can be found at the Darkhaven Academy.\
\13", 
               Keyword = "leggings", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Description = "A pair of academy leggings is here.", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 3, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Vnum = 10303, 
         Name = "pants trousers slacks leggings", 
         ShortDescr = "some leggings", 
      }, 
   }, 
   Mobiles = 
   {
      [10370] = 
      {
         Credits = 100, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a shopkeeper", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
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
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 2, 
            HitSizeDice = 20, 
         }, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 10, 
            DamSizeDice = 10, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Sex = "undistinguished", 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Name = "shopkeeper droid", 
         ShortDescr = "a shopkeeper", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Level = 20, 
         Weight = 0, 
         Race = "Human", 
         HitRoll = 2, 
         NumberOfAttacks = 0, 
         ArmorClass = 80, 
         Description = "", 
         DamRoll = 2, 
         Position = "standing", 
         Height = 0, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A droid is here selling useful items to students.\
", 
         Vnum = 10370, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         Alignment = 0, 
      }, 
      [10355] = 
      {
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "bow $n\
say May I see your diploma please.\
", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Arguments = "p gives you a diploma.", 
               Code = "look diploma\
say Thank-you.\
give diploma $n\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_newbie_pilot", 
         }, 
         Sex = "undistinguished", 
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
         Name = "pilot", 
         ShortDescr = "a pilot", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Description = "", 
         DamRoll = 0, 
         Position = "standing", 
         Weight = 0, 
         Height = 0, 
         Level = 1, 
         Vnum = 10355, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         LongDescr = "A Mon Calamarian pilot is here ferrying academy graduates.\
", 
      }, 
      [10340] = 
      {
         Credits = 100, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "practices", 
               Code = "tell $n That will be 10 credits.\
mpechoat $n All teachers will charge you a certain amount \
mpechoat $n of credits, depending on the level you receive the skill at.\
mpechoat $n It is taken out automatically, so do not give Domick 10\
mpechoat $n credits :).\
", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "tell $n Are you ready for your lessons?\
", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 1000, 
            HitSizeDice = 1, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Sex = "male", 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Name = "Domick Dom teacher", 
         ShortDescr = "Domick", 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Level = 1, 
         Weight = 0, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 94, 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         DamRoll = 0, 
         Position = "standing", 
         Height = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "Domick, Lord of Knowledge, sits here reading, waiting for students.\
", 
         Vnum = 10340, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         Alignment = 1000, 
      }, 
      [10342] = 
      {
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "no nope", 
               Code = "say You can have it anyways.\
give luke $n\
drop all\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "yes yep", 
               Code = "say Ok you can have it then.\
give luke $n\
drop all\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "hi hello", 
               Code = "say Hello.\
Say I found this toy ... is it yours?\
mpat 10399 mpoload 10320\
mpecho A student shows you a Luke Skywalker Action Figure.\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
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
               [18] = "_clan", 
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
         Name = "academy student", 
         ShortDescr = "a student", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Description = "", 
         DamRoll = 0, 
         Position = "standing", 
         Weight = 0, 
         Height = 0, 
         Level = 1, 
         Vnum = 10342, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         LongDescr = "An acadamy student is here taking a break from his studies.\
", 
      }, 
      [10343] = 
      {
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "p gives you a Luke Skywalker action figure.", 
               Code = "say thank you\
", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "snif\
say I lost my Luke Skywalker toy\
cry\
", 
               MudProgType = "all_greet_prog", 
            }, 
            [3] = 
            {
               Arguments = "key", 
               Code = "if ovnuminv (10320) >= 1\
say You want the key for this door?\
point north\
say here let me open it for you\
mpat 10399 mpoload 10423\
unlock north\
open north\
mpat 10399 drop all\
mpat 10399 purge\
else\
cry\
endif\
", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Arguments = "door door? key?", 
               Code = "if ovnuminv (10320) >= 1\
say You want the key for this door?\
point north\
say here let me open it for you\
mpat 10399 mpoload 10423\
unlock north\
open north\
mpat 10399 drop all\
mpat 10399 purge\
else\
cry\
endif\
", 
               MudProgType = "speech_prog", 
            }, 
            [5] = 
            {
               Arguments = "door? north", 
               Code = "if ovnuminv (10320) >= 1\
say You want the key for this door?\
point north\
say here let me open it for you\
mpat 10399 mpoload 10423\
unlock north\
open north\
mpat 10399 drop all\
mpat 10399 purge\
else\
cry\
endif\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
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
               [18] = "_clan", 
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
         Name = "kid child", 
         ShortDescr = "a small child", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Description = "", 
         DamRoll = 0, 
         Position = "standing", 
         Weight = 0, 
         Height = 0, 
         Level = 1, 
         Vnum = 10343, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         LongDescr = "A young child is sitting here.\
", 
      }, 
      [10360] = 
      {
         Credits = 10, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 5, 
            HitSizeDice = 4, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Name = "practice droid", 
         ShortDescr = "a practice droid", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 100, 
         Description = "", 
         DamRoll = 0, 
         Position = "standing", 
         Weight = 0, 
         Height = 0, 
         Level = 1, 
         Vnum = 10360, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         LongDescr = "A practice droid is here waiting for combat.\
", 
      }, 
      [10345] = 
      {
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "85", 
               Code = "if level($n) >= 6\
if rand(50)\
mpechoat $n You feel an overwhelming desire for greater challenge.\
else\
mpechoat $n The chadoyn is far too easy for you to kill.\
endif\
endif\
", 
               MudProgType = "death_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 1, 
            HitSizeDice = 4, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Name = "chadoyn cage", 
         ShortDescr = "the chadoyn", 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Alignment = 0, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Race = "_85", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 25, 
         Description = "He looks back at you with his beady little eyes and a snarl on his face.\
You are pretty sure you can best him in regards to combat.\
", 
         DamRoll = 0, 
         Position = "standing", 
         Weight = 0, 
         Height = 0, 
         Level = 2, 
         Vnum = 10345, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         LongDescr = "The chadoyn is straining its leash, attempting to attack you.\
", 
      }, 
      [10394] = 
      {
         Credits = 50, 
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
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
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
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [19] = "adarese", 
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if ispc($n)\
wink $n\
if level($n) < 20\
tell $n My lessons start when you reach level 20. Have fun until then.\
else\
tell $n I am ready to teach you, are you prepared for the lessons?\
endif\
grin $n\
endif\
", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "say You know, I am really a lover, not a fighter ...\
mpslay $n\
mpat $n mpechoat $n But alas, killing me was a slaying offense.\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               MudProgType = "death_prog", 
            }, 
            [3] = 
            {
               Arguments = "p flees head over heels!", 
               Code = "mptrans 0.$n\
mpechoat $n Abbigayle says, 'You fled, so I shall spare your life!'\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 1000, 
            HitPlus = 0, 
            HitSizeDice = 1, 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 3, 
            DamSizeDice = 6, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Sex = "female", 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Name = "Abbigayle language teacher", 
         ShortDescr = "abbigayle", 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Level = 5, 
         Weight = 0, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 5, 
         Description = "This has to be one of the most beautiful women in these Realms, both inside\
and out. Her eyes have a sparkle of amusement and her face an easy smile.\
She knows you are admiring her, and she does not seem to mind. She is\
comfortable and confident that the picture she makes is breath taking. Her\
voice at last breaks the spell. Her voice is like satin, you can hardly\
wait for your lessons to begin. Any reason to hear her speak the tongues\
foreign to your ears.\
", 
         DamRoll = 0, 
         Position = "standing", 
         Height = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A beautiful lady stands here, waiting for her students.\
", 
         Vnum = 10394, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [20] = "Scholar", 
         }, 
         Alignment = 0, 
      }, 
      [10395] = 
      {
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "", 
               Code = "say My brother is dead.\
say Killed by a stray blaster shot.\
snif\
say If only he had made a clone.\
", 
               MudProgType = "script_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "close north\
say Don't let it happen to you $n\
", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
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
               [18] = "_clan", 
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
         Name = "sad student", 
         ShortDescr = "a sad student", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Description = "", 
         DamRoll = 0, 
         Position = "standing", 
         Weight = 0, 
         Height = 0, 
         Level = 1, 
         Vnum = 10395, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         LongDescr = "A sad student leans against the wall.\
", 
      }, 
      [10365] = 
      {
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "food? ration? food ration", 
               Code = "mpoload 10313 1\
give ration $n\
drop all\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "canteen? canteen", 
               Code = "mpoload 10314 1\
give canteen $n\
drop all\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 100, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 25, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Name = "service droid", 
         ShortDescr = "a service droid", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Description = "", 
         DamRoll = 0, 
         Position = "standing", 
         Weight = 0, 
         Height = 0, 
         Level = 10, 
         Vnum = 10365, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         LongDescr = "A service droid is here handing out canteens and rations.\
", 
      }, 
      [10350] = 
      {
         Credits = 100, 
         SpecFuns = 
         {
            [0] = "spec_auth", 
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
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpadvance $n 2\
mpoload 10423\
mpat 10323 close n\
mpat 10323 lock n\
at 10299 drop 10423\
at 10299 mppurge\
 \
if goldamt($n) > 10500\
mpechoat $n &RDon't carry so much money as a newbie.\
mpechoat $n It's hazardous to your health.\
mpdamage $n 3000\
mppurge\
endif\
", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 1000, 
            HitSizeDice = 1, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Sex = "male", 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Name = "professor schoolmaster teacher headmaster", 
         ShortDescr = "the Schoolmaster", 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Level = 1, 
         Weight = 0, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 94, 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         DamRoll = 0, 
         Position = "standing", 
         Height = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "The schoolmaster is here offering diplomas to academy graduates.\
", 
         Vnum = 10350, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Alignment = 1000, 
      }, 
      [10499] = 
      {
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Name = "final mob", 
         ShortDescr = "a newly created final mob", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Description = "", 
         DamRoll = 0, 
         Position = "standing", 
         Weight = 0, 
         Height = 0, 
         Level = 1, 
         Vnum = 10499, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
      }, 
   }, 
   ResetFrequency = 3, 
   Filename = "newacad.lua", 
   VnumRanges = 
   {
      Room = 
      {
         Last = 10430, 
         First = 10300, 
      }, 
      Mob = 
      {
         Last = 10499, 
         First = 10340, 
      }, 
      Object = 
      {
         Last = 10499, 
         First = 10300, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10340, 
         Arg3 = 10303, 
         MiscData = 0, 
      }, 
      [2] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10394, 
         Arg3 = 10306, 
         MiscData = 0, 
      }, 
      [3] = 
      {
         Command = "D", 
         Arg2 = 0, 
         Arg1 = 10309, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [4] = 
      {
         Command = "D", 
         Arg2 = 2, 
         Arg1 = 10310, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [5] = 
      {
         Command = "D", 
         Arg2 = 3, 
         Arg1 = 10312, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [6] = 
      {
         Command = "D", 
         Arg2 = 1, 
         Arg1 = 10313, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [7] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 10414, 
         Arg3 = 10430, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10345, 
         Arg3 = 10308, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10360, 
         Arg3 = 10320, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg1 = 10301, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg1 = 10302, 
         Arg3 = 13, 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10304, 
      }, 
      [13] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 10318, 
         Arg3 = 10319, 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10342, 
         Arg3 = 10318, 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10343, 
         Arg3 = 10323, 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Command = "D", 
         Arg2 = 0, 
         Arg1 = 10323, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [17] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10355, 
         Arg3 = 10326, 
         MiscData = 1, 
      }, 
      [18] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 10315, 
         Arg3 = 10317, 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10365, 
         Arg3 = 10317, 
         MiscData = 0, 
      }, 
      [20] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10395, 
         Arg3 = 10327, 
         MiscData = 1, 
      }, 
      [21] = 
      {
         Command = "D", 
         Arg2 = 0, 
         Arg1 = 10327, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [22] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10370, 
         Arg3 = 10321, 
         MiscData = 1, 
      }, 
      [23] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10317, 
      }, 
      [24] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10311, 
      }, 
      [25] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10350, 
         Arg3 = 10324, 
         MiscData = 1, 
      }, 
      [26] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10423, 
      }, 
      [27] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 10414, 
         Arg3 = 10324, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Command = "D", 
         Arg2 = 2, 
         Arg1 = 10324, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [29] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 10322, 
         Arg3 = 10325, 
         MiscData = 1, 
      }, 
   }, 
   ResetMessage = "You hear the hum of repulsorlifts powering up in the distance", 
   Flags = 
   {
      [1] = "_01", 
      [0] = "NoPkill", 
   }, 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   Name = "Coruscant Academy", 
   Author = "Scarab/Durga", 
}
