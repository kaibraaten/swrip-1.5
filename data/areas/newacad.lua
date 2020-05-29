-- Coruscant Academy
-- Last saved Thursday 28-May-2020 13:11:30

AreaEntry
{
   Name = "Coruscant Academy", 
   ResetFrequency = 3, 
   LowEconomy = 496055870, 
   FileFormatVersion = 1, 
   Author = "Scarab/Durga", 
   Rooms = 
   {
      [10304] = 
      {
         Name = "The Reading Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Vnum = 10304, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10314, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "A Marble Corridor\
", 
            }, 
            [2] = 
            {
               DestinationVnum = 10301, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "A Stone Corridor\
", 
            }, 
            [3] = 
            {
               DestinationVnum = 10307, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "Wandering the Academy\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10305] = 
      {
         Name = "Chamber of Trials for Rangers", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10305, 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10306] = 
      {
         Name = "Abbigayle's Language Lessons", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10306, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10301, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10307] = 
      {
         Name = "Wandering the Academy", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "Door", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10307, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "The Reading Room\
", 
            }, 
            [2] = 
            {
               DestinationVnum = 10309, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "Wandering Darkhaven Academy, it looks safe\
", 
            }, 
            [3] = 
            {
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10308] = 
      {
         Name = "A Dank Pit", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10308, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10316, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "A Dank Pit\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10309] = 
      {
         Name = "Wandering Coruscant Academy", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "door", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10309, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10310, 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "An Enclosed Room\
", 
            }, 
            [2] = 
            {
               DestinationVnum = 10307, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "Wandering the Academy\
", 
            }, 
            [3] = 
            {
               DestinationVnum = 10311, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This is where you will start learning about exits not listed under \"Exits\".\
Doors are not seen on the game. You must read room description and LOOK\
<direction> to find them. Another method of finding a door is to \"bump\" into\
the walls. Type N. OUCH! You ran into the door. You want to be careful not\
to be affected with the pass door spell while using the bump method, as you\
may end up in a room you would rather not visit. Now, type OPEN N or OPEN\
DOOR. Next type EXIT, you will now see the north exit listed under \"Exits\".\
Type HELP OPEN to find out more information on doors.\
", 
      }, 
      [10310] = 
      {
         Name = "An Enclosed Room", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10310, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10309, 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "Wandering Darkhaven Academy\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10311] = 
      {
         Name = "Lost in Coruscant Academy", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10311, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10312, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               DestinationVnum = 10309, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "Wandering Darkhaven Academy\
", 
            }, 
            [3] = 
            {
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10312] = 
      {
         Name = "Lost in Coruscant Academy", 
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
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10312, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10311, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               DestinationVnum = 10313, 
               Keyword = "tapestry door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "door\
", 
            }, 
            [3] = 
            {
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10313] = 
      {
         Name = "A Secret Alcove", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK.\
\13", 
               Keyword = "wall", 
            }, 
            [2] = 
            {
               Description = "You see an oak door.\
\13", 
               Keyword = "door", 
            }, 
            [3] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK. \
\13", 
               Keyword = "picture", 
            }, 
            [4] = 
            {
               Description = "This is a huge CRACK, you could probably squeeze through it. \
\13", 
               Keyword = "crack", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10313, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10312, 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
            [3] = 
            {
               DestinationVnum = 10302, 
               Keyword = "crack", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "somewhere", 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "Well Done! You have found this secret room. Sometimes these secret rooms\
will contain valuable items or will lead to other parts of the area you\
are exploring. Always pay close attention to room descriptions, mobiles\
descriptions and items, this will many times bring profitable results.\
This is a where you will experience a Somewhere exit. To find your way\
out, try looking at the picture on the wall. If you can not figure it out, \
you may leave by the up exit. Good luck!\
", 
      }, 
      [10314] = 
      {
         Name = "A Marble Corridor", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10314, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10315, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "Preparing for combat\
", 
            }, 
            [2] = 
            {
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "The Reading Room\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10315] = 
      {
         Name = "Preparing for combat", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10315, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10317, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 10314, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "A Marble Corridor\
", 
            }, 
            [3] = 
            {
               DestinationVnum = 10316, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "down", 
               Description = "A Dank Pit\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The time is drawing near to experience combat.  Directly below you  is the\
Chadoyn Pit, the home of a creature which will assist you in learning how\
to initiate combat. The Chadoyn is not aggressive, which means you must\
begin the fight.  There are many ways to do so.  The quickest is KILL\
<mob>. As you gain skills and spells, you may find many of them are also\
capable of initiating combat.  Some of the more popular spells that do so\
are:  DISPEL FORCE, SLEEP, DOMINATE, WEAKEN and BLINDNESS. Some of the\
most popular skills used are STEAL and BACKSTAB.\
", 
      }, 
      [10316] = 
      {
         Name = "A Dank Pit", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10316, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10308, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "A Dank Pit\
", 
            }, 
            [2] = 
            {
               DestinationVnum = 10315, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
               Description = "Preparing for combat\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10317] = 
      {
         Name = "Time To Take A Break", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10317, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10327, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 10315, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10318] = 
      {
         Name = "A Useless Item?", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10318, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "Sometimes an item may appear useless at first.  There are many junk items\
that are just that, junk.  But some items can come in handy.  Try making\
small talk with this student. HE seems to have found something that might\
prove useful to you.  Sometimes one item may be found inside another.  To\
look in to an object that is a container use :  LOOK IN <container>.  To\
get an item from a container, use :  GET <item> FROM <container> as well. \
                          Hint:  say hello. \
", 
      }, 
      [10319] = 
      {
         Name = "Up in a Small Loft", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10319, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "down", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "Sometimes items can be obtained by manipulating other items. Some classes\
can make items from other ones using skills such as MAKEBLASTER, MAKESPICE,\
or MAKELIGHTSABER. Other times it is as simple as opening a box or pushing\
a button as is the case in this room.\
", 
      }, 
      [10320] = 
      {
         Name = "Looting Your Kills", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10320, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The most common way in most muds to gain equipment is by looting the\
corpses of dead mobiles(monsters etc). After you kill this droid use\
EXAMINE CORPSE to see what it was carrying. Then use GET ALL FROM CORPSE\
to get the goodies from it. To automaticly loot corpses when you kill\
something you can set CONFIG +AUTOLOOT or CONFIG +AUTOCRED for just\
credits.\
", 
      }, 
      [10321] = 
      {
         Name = "Academy Store", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10321, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10322] = 
      {
         Name = "Getting More Useful Items", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10322, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10323, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 10320, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 10327, 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 10321, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 10319, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
               Description = "", 
            }, 
            [6] = 
            {
               DestinationVnum = 10318, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "down", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10323] = 
      {
         Name = "The Last Challenge", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10323, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10324, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 10423, 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "Congratulations, you're almost done. The graduation hall is just to the\
north. Only one problem though. The door's locked. Maybe this kid knows\
where the key is. If only he'd stop crying long enough for you to ask.\
hint: find his doll\
hint: give doll child\
hint: say where's the key\
", 
      }, 
      [10324] = 
      {
         Name = "Graduating from the Academy", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 10324, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "iamauthed", 
               MudProgType = "speech_prog", 
               Code = "if isimmort($n)\
mpechoat $n dumbass! trans yourself!\
else\
mptransfer $n 10325\
endif\
", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10323, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10325] = 
      {
         Name = "Academy Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10325, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10326, 
               Keyword = "", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "somewhere", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
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
         TeleDelay = 0, 
      }, 
      [10326] = 
      {
         Name = "The Shuttle home", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 10326, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10325, 
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "somewhere", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10327] = 
      {
         Name = "Some Important Words of Advice", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10327, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10322, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 10317, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10399] = 
      {
         Name = "This Room is used by a Mob program do not delete.", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 10399, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [10400] = 
      {
         Name = "A test workshop", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [26] = "Factory", 
         }, 
         Vnum = 10400, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [10401] = 
      {
         Name = "a quiet place", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Vnum = 10401, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [10340] = 
      {
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10340, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [10342] = 
      {
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10342, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [10430] = 
      {
         Name = "Student Lounge", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
         }, 
         Vnum = 10430, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10300, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "You stand in the player lounge.  It is the last safe zone in the galaxy.  \
Relax and have a cool drink, as this will be the last time you can let\
your guard down and not be marked for death.\
 \
A student message terminal is here for you to practice reading and writing\
messages.  Use NOTE LIST to get a list of the messages, and NOTE READ\
<message number> to read a specific message.\
Type HELP NOTE for more commands.\
", 
      }, 
      [10429] = 
      {
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10429, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [10300] = 
      {
         Name = "Coruscant Academy", 
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
         Vnum = 10300, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "throat", 
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n just slit his own throat at the creations room!\
mpat 101 mpecho $n just sucicided at the creations room.\
", 
            }, 
            [2] = 
            {
               Arguments = "entered", 
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n has just begun life!\
mpat 101 mpecho $n has just entered the game.\
", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10301, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 10430, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
      [10301] = 
      {
         Name = "A Duraplast Corridor", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10301, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "leave_prog", 
               Code = "if isimmort($n)\
else\
  mpforce $n vis\
endif\
", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "Reading Room\
", 
            }, 
            [2] = 
            {
               DestinationVnum = 10303, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Description = "The Laboratory of Skills.\
", 
            }, 
            [3] = 
            {
               DestinationVnum = 10300, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Description = "Entrance to Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               DestinationVnum = 10306, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "Abbigayle's Language Lessons.\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "To the west is Lady Abbigayle's room, and to the east is Domick.  Lady\
Abbigayle has information about languages, and Domick has information on\
practicing weapons and skills. When you are finished exploring these\
areas, come back here and continue north through the Academy.\
", 
      }, 
      [10302] = 
      {
         Name = "Somewhere", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10302, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Description = "The Reading Room\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "You did it! You are an excellent student! To continue your education,\
please leave north. That will return you to the Reading room.\
", 
      }, 
      [10303] = 
      {
         Name = "The Laboratory of Skills", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10303, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 10301, 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
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
      }, 
   }, 
   Objects = 
   {
      [10304] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
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
         Vnum = 10304, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Cost = 0, 
         ShortDescr = "an academy cap", 
         Weight = 2, 
         Name = "academy cap", 
         Layers = 0, 
         Description = "A Coruscant Academy cap is here.", 
      }, 
      [10305] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Vnum = 10305, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Cost = 0, 
         ShortDescr = "a black brocade cape", 
         Weight = 3, 
         Name = "cape brocade academy", 
         Layers = 0, 
         Description = "A black brocade cape from the academy", 
      }, 
      [10306] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Vnum = 10306, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Cost = 0, 
         ShortDescr = "a strong metal collar", 
         Weight = 5, 
         Name = "collar metal academy", 
         Layers = 0, 
         Description = "A strong metal collar from the academy", 
      }, 
      [10307] = 
      {
         ActionDescription = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n As you wear this visor, you feel more intelligent and wise!\
mpechoaround $n As $n wears the visor of completion, $e looks more complete!\
", 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         Flags = 
         {
            [6] = "Magic", 
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
         Vnum = 10307, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Cost = 0, 
         ShortDescr = "a visor of completion", 
         Weight = 1, 
         Name = "visor completion academy", 
         Layers = 0, 
         Description = "A visor of completion is here, emitting a faint glow.", 
      }, 
      [10308] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Vnum = 10308, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Cost = 0, 
         ShortDescr = "an academy vest", 
         Weight = 5, 
         Name = "academy vest", 
         Layers = 0, 
         Description = "An academy vest was left here.", 
      }, 
      [10309] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
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
         Vnum = 10309, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Cost = 0, 
         ShortDescr = "lightweight tin sleeves", 
         Weight = 1, 
         Name = "sleeves tin academy", 
         Layers = 0, 
         Description = "Lightweight tin sleeves from the academy", 
      }, 
      [10310] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Vnum = 10310, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Cost = 0, 
         ShortDescr = "an energy shield", 
         Weight = 5, 
         Name = "forceshield energyshield shields shield", 
         Layers = 0, 
         Description = "An energy shield was dropped here.", 
      }, 
      [10311] = 
      {
         ActionDescription = "", 
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
            [13] = "Inventory", 
            [6] = "Magic", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 24, 
               Modifier = -1, 
            }, 
         }, 
         Vnum = 10311, 
         ItemType = "light", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 5, 
         ShortDescr = "a glowrod", 
         Weight = 1, 
         Name = "light glowrod glowstick", 
         Layers = 0, 
         Description = "A glowrod would make a good light source.", 
      }, 
      [10312] = 
      {
         ActionDescription = "", 
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
            [6] = "Magic", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -2, 
            }, 
         }, 
         Vnum = 10312, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 2, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Cost = 250, 
         ShortDescr = "a vibro-blade", 
         Weight = 3, 
         Name = "academy vibro blade knife dagger vibro-blade", 
         Layers = 0, 
         Description = "You see a finely honed vibro-blade here.", 
      }, 
      [10313] = 
      {
         ActionDescription = "", 
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
         Vnum = 10313, 
         ItemType = "food", 
         ObjectValues = 
         {
            [1] = 50, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Cost = 5, 
         ShortDescr = "a packaged ration", 
         Weight = 2, 
         Name = "ration standard packaged", 
         Layers = 0, 
         Description = "A packaged ration is here, waiting to be eaten.", 
      }, 
      [10314] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10314, 
         ItemType = "drink_container", 
         ObjectValues = 
         {
            [1] = 40, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 40, 
         }, 
         Cost = 10, 
         ShortDescr = "a canteen", 
         Weight = 1, 
         Name = "canteen water grey stock", 
         Layers = 0, 
         Description = "A small grey canteen has been drooped here.", 
      }, 
      [10315] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10315, 
         ItemType = "fountain", 
         Name = "drinking fountain", 
         Cost = 0, 
         ShortDescr = "a fountain", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Layers = 0, 
         Description = "A drinking fountain rests against the wall.", 
      }, 
      [10316] = 
      {
         ActionDescription = "", 
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
            [13] = "Inventory", 
         }, 
         Vnum = 10316, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 5, 
         ShortDescr = "a pair of socks", 
         Weight = 1, 
         Name = "socks", 
         Layers = 1, 
         Description = "A pair of socks is in a ball on the floor.", 
      }, 
      [10317] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = -5, 
            }, 
         }, 
         Vnum = 10317, 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Cost = 5, 
         ShortDescr = "a backpack", 
         Weight = 1, 
         Name = "academy backpack", 
         Layers = 64, 
         Description = "An academy backpack was carelessly misplaced here.", 
      }, 
      [10318] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "push_prog", 
               Code = "mpoload 10316 1\
mpoload 10308 1\
mpoload 10303 1\
pull button\
drop all\
mpecho A small panel opens revealing several articles of clothing.\
", 
            }, 
         }, 
         Vnum = 10318, 
         ItemType = "button", 
         Name = "grey button", 
         Cost = 0, 
         ShortDescr = "a button", 
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
         Layers = 0, 
         Description = "A small grey button seems out of place on the wall here.", 
      }, 
      [10319] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10319, 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Cost = 0, 
         ShortDescr = "a box", 
         Weight = 1, 
         Name = "box", 
         Layers = 0, 
         Description = "A small box .. I wonder whats inside, maybe you should open it.", 
      }, 
      [10320] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10320, 
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
         Cost = 0, 
         ShortDescr = "a Luke Skywalker action figure", 
         Weight = 1, 
         Name = "luke toy action figure doll", 
         Layers = 0, 
         Description = "A Luke Skywalker action figure was misplaced here.", 
      }, 
      [10321] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10321, 
         ItemType = "paper", 
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
         ShortDescr = "a diploma", 
         Weight = 1, 
         Name = "diploma academy coruscant graduation", 
         Layers = 0, 
         Description = "Someone dropped their coruscant academy graduation diploma here.", 
      }, 
      [10322] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10322, 
         ItemType = "trash", 
         Name = "academy shuttle", 
         Cost = 0, 
         ShortDescr = "a shuttle", 
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
         Layers = 0, 
         Description = "A small shuttle is docked here.", 
      }, 
      [10323] = 
      {
         ActionDescription = "", 
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
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 3, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Cost = 500, 
         ShortDescr = "a practice lightsaber", 
         Weight = 1, 
         Name = "practice lightsaber", 
         Layers = 0, 
         Description = "A practice lightsaber is here.", 
      }, 
      [10324] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10324, 
         ItemType = "battery", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Cost = 50, 
         ShortDescr = "a lightsaber battery", 
         Weight = 1, 
         Name = "lightsaber battery", 
         Layers = 0, 
         Description = "A lightsaber battery is lying here.", 
      }, 
      [10499] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10499, 
         ItemType = "trash", 
         Name = "final object", 
         Cost = 0, 
         ShortDescr = "a newly created final object", 
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
         Layers = 0, 
         Description = "Some god dropped a newly created final object here.", 
      }, 
      [10498] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10498, 
         ItemType = "superconductor", 
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
         ShortDescr = "a superconductor", 
         Weight = 1, 
         Name = "superconductor", 
         Layers = 0, 
         Description = "A superconductor is lying here.", 
      }, 
      [10497] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10497, 
         ItemType = "circuit", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 120, 
         ShortDescr = "a circuit board", 
         Weight = 1, 
         Name = "circuit board", 
         Layers = 0, 
         Description = "A circuit board was dropped here.", 
      }, 
      [10496] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10496, 
         ItemType = "mirror", 
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
         ShortDescr = "a tiny, round mirror", 
         Weight = 1, 
         Name = "mirror", 
         Layers = 0, 
         Description = "A tiny, round mirror is lying here.", 
      }, 
      [10495] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10495, 
         ItemType = "crystal", 
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
         ShortDescr = "a non-adegan crystal", 
         Weight = 1, 
         Name = "non-adegan crystal", 
         Layers = 0, 
         Description = "A non-adegan crystal is lying here.", 
      }, 
      [10494] = 
      {
         ActionDescription = "", 
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
         Vnum = 10494, 
         ItemType = "durasteel", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 50, 
         ShortDescr = "some scrap durasteel", 
         Weight = 1, 
         Name = "some scrap durasteel", 
         Layers = 0, 
         Description = "A scrap of some material lies here.", 
      }, 
      [10493] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10493, 
         ItemType = "oven", 
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
         ShortDescr = "a portable oven", 
         Weight = 1, 
         Name = "portable oven", 
         Layers = 0, 
         Description = "A portable oven is here.", 
      }, 
      [10492] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10492, 
         ItemType = "battery", 
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
         ShortDescr = "a battery", 
         Weight = 1, 
         Name = "battery", 
         Layers = 0, 
         Description = "A battery is lying here.", 
      }, 
      [10491] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10491, 
         ItemType = "staff", 
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
         ShortDescr = "a durastaff", 
         Weight = 1, 
         Name = "staff durastaff", 
         Layers = 0, 
         Description = "A durastaff is lying here.", 
      }, 
      [10490] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10490, 
         ItemType = "toolkit", 
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
         ShortDescr = "a toolkit", 
         Weight = 1, 
         Name = "toolkit", 
         Layers = 0, 
         Description = "A toolkit is lying here.", 
      }, 
      [10489] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10489, 
         ItemType = "lens", 
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
         ShortDescr = "a small lens", 
         Weight = 1, 
         Name = "lens", 
         Layers = 0, 
         Description = "A small lens is lying here.", 
      }, 
      [10488] = 
      {
         ActionDescription = "", 
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
         Vnum = 10488, 
         ItemType = "ammo", 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Cost = 10, 
         ShortDescr = "an ammunition cell", 
         Weight = 1, 
         Name = "ammo cell amunition cartridge", 
         Layers = 0, 
         Description = "An ammunition cell was carelessly left here.", 
      }, 
      [10487] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10487, 
         ItemType = "spice", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Cost = 200, 
         ShortDescr = "some poorly refined carsanum", 
         Weight = 1, 
         Name = "carsanum spice", 
         Layers = 0, 
         Description = "Some carsanum was dropped here.", 
      }, 
      [10435] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10435, 
         ItemType = "spice", 
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
         ShortDescr = "a prototype spice", 
         Weight = 1, 
         Name = "prototype spice", 
         Layers = 0, 
         Description = "A prototype spice is here.", 
      }, 
      [10434] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10434, 
         ItemType = "disguise", 
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
         ShortDescr = "a prototype disguise", 
         Weight = 1, 
         Name = "prototype disguise", 
         Layers = 0, 
         Description = "A prototype disguise is here.", 
      }, 
      [10433] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10433, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 100, 
         ShortDescr = "a prototype armor", 
         Weight = 1, 
         Name = "prototype armor", 
         Layers = 0, 
         Description = "A prototype armor is here.", 
      }, 
      [10414] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10414, 
         ItemType = "furniture", 
         Name = "student message terminal", 
         Cost = 0, 
         ShortDescr = "a student message terminal", 
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
         Layers = 0, 
         Description = "A student message terminal is here for you to play with.", 
      }, 
      [10432] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10432, 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 100, 
         ShortDescr = "a prototype container", 
         Weight = 1, 
         Name = "prototype container", 
         Layers = 0, 
         Description = "A prototype container is here.", 
      }, 
      [10431] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10431, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         ShortDescr = "prototype bowcaster", 
         Weight = 1, 
         Name = "prototype bowcaster", 
         Layers = 0, 
         Description = "A proottype bowcaster is here", 
      }, 
      [10430] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10430, 
         ItemType = "comlink", 
         Name = "prototype comlink", 
         Cost = 0, 
         ShortDescr = "a newly created prototype comlink", 
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
         Layers = 0, 
         Description = "Some god dropped a newly created prototype comlink here.", 
      }, 
      [10429] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Vnum = 10429, 
         ItemType = "armor", 
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
         ShortDescr = "a newly created prototype shield", 
         Weight = 1, 
         Name = "prototype shield", 
         Layers = 0, 
         Description = "Some god dropped a newly created prototype shield here.", 
      }, 
      [10428] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10428, 
         ItemType = "light", 
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
         ShortDescr = "a newly created prototype light", 
         Weight = 1, 
         Name = "prototype light", 
         Layers = 0, 
         Description = "Some god dropped a newly created prototype light here.", 
      }, 
      [10420] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10420, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         ShortDescr = "prototype blaster", 
         Weight = 1, 
         Name = "prototype blaster", 
         Layers = 0, 
         Description = "A prototype blaster is here", 
      }, 
      [10421] = 
      {
         ActionDescription = "", 
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
            [4] = "Contraband", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "use_prog", 
               Code = "mpechoat $n Your lightsaber ignites with a soft hum and a bright glow.\
mpechoaround $n $n's lightsaber seemingly jumps into $s hand.\
mpechoaround $n &WIt ignites with a hum and a bright glow.\
", 
            }, 
         }, 
         Vnum = 10421, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         ShortDescr = "a prototype lightsaber", 
         Weight = 1, 
         Name = "prototype saber lightsaber", 
         Layers = 128, 
         Description = "A prototype lightsaber shouldn't be here", 
      }, 
      [10422] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10422, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         ShortDescr = "prototype vibro-blade", 
         Weight = 1, 
         Name = "prototype vibro-blade", 
         Layers = 0, 
         Description = "A prototype vibro-blade shouldn't be here", 
      }, 
      [10423] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10423, 
         ItemType = "key", 
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
         ShortDescr = "a key", 
         Weight = 1, 
         Name = "key", 
         Layers = 0, 
         Description = "An old fashioned mechanical key was left on the ground here.", 
      }, 
      [10424] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 10424, 
         ItemType = "comlink", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 50, 
         ShortDescr = "a comlink", 
         Weight = 1, 
         Name = "comlink radio communicator", 
         Layers = 0, 
         Description = "A small hand-held comlink.", 
      }, 
      [10425] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10425, 
         ItemType = "grenade", 
         Name = "prototype grenade", 
         Cost = 0, 
         ShortDescr = "a newly created prototype grenade", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 350, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         Layers = 0, 
         Description = "Some god dropped a newly created prototype grenade here.", 
      }, 
      [10426] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 10426, 
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
         Cost = 0, 
         ShortDescr = "a newly created generic armor", 
         Weight = 1, 
         Name = "generic armor", 
         Layers = 0, 
         Description = "Some god dropped a newly created generic armor here.", 
      }, 
      [10427] = 
      {
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10427, 
         ItemType = "landmine", 
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
         ShortDescr = "a newly created protoype landmine", 
         Weight = 1, 
         Name = "protoype landmine", 
         Layers = 0, 
         Description = "Some god dropped a newly created protoype landmine here.", 
      }, 
      [10300] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
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
         Vnum = 10300, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Cost = 0, 
         ShortDescr = "a charm bracelet", 
         Weight = 2, 
         Name = "bracelet charm academy", 
         Layers = 0, 
         Description = "A charm bracelet from the academy lies here", 
      }, 
      [10301] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
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
         Vnum = 10301, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Cost = 0, 
         ShortDescr = "a pair of black combat boots", 
         Weight = 3, 
         Name = "combat boots academy", 
         Layers = 126, 
         Description = "A pair of black combat boots from the Academy lies here", 
      }, 
      [10302] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
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
         Vnum = 10302, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Cost = 0, 
         ShortDescr = "a braided leather belt", 
         Weight = 2, 
         Name = "belt leather academy", 
         Layers = 0, 
         Description = "A braided leather belt from the Academy lies here", 
      }, 
      [10303] = 
      {
         ActionDescription = "", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Vnum = 10303, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Cost = 0, 
         ShortDescr = "some leggings", 
         Weight = 3, 
         Name = "pants trousers slacks leggings", 
         Layers = 0, 
         Description = "A pair of academy leggings is here.", 
      }, 
   }, 
   Mobiles = 
   {
      [10370] = 
      {
         Name = "shopkeeper droid", 
         DamRoll = 2, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 2, 
            DamPlus = 10, 
         }, 
         ShortDescr = "a shopkeeper", 
         Weight = 0, 
         Position = "standing", 
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
         ArmorClass = 80, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         HitRoll = 2, 
         Credits = 100, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 2, 
            HitSizeDice = 20, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Race = "Human", 
         Sex = "undistinguished", 
         Description = "", 
         LongDescr = "A droid is here selling useful items to students.\
", 
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
            KeeperShortDescr = "a shopkeeper", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
         }, 
         Level = 20, 
         Vnum = 10370, 
         NumberOfAttacks = 0, 
         Height = 0, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Alignment = 0, 
      }, 
      [10355] = 
      {
         Name = "pilot", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         SpecFuns = 
         {
            [0] = "spec_newbie_pilot", 
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
         LongDescr = "A Mon Calamarian pilot is here ferrying academy graduates.\
", 
         Vnum = 10355, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         ShortDescr = "a pilot", 
         Race = "Human", 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "bow $n\
say May I see your diploma please.\
", 
            }, 
            [2] = 
            {
               Arguments = "p gives you a diploma.", 
               MudProgType = "act_prog", 
               Code = "look diploma\
say Thank-you.\
give diploma $n\
", 
            }, 
         }, 
         Sex = "undistinguished", 
         Level = 1, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         ArmorClass = 0, 
      }, 
      [10340] = 
      {
         Name = "Domick Dom teacher", 
         DamRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "Domick", 
         Weight = 0, 
         LongDescr = "Domick, Lord of Knowledge, sits here reading, waiting for students.\
", 
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
         ArmorClass = 94, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         HitRoll = 0, 
         Credits = 100, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 1000, 
            HitSizeDice = 1, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Race = "Human", 
         Sex = "male", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "practices", 
               MudProgType = "act_prog", 
               Code = "tell $n That will be 10 credits.\
mpechoat $n All teachers will charge you a certain amount \
mpechoat $n of credits, depending on the level you receive the skill at.\
mpechoat $n It is taken out automatically, so do not give Domick 10\
mpechoat $n credits :).\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "tell $n Are you ready for your lessons?\
", 
            }, 
         }, 
         Position = "standing", 
         Level = 1, 
         Vnum = 10340, 
         NumberOfAttacks = 0, 
         Height = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Alignment = 1000, 
      }, 
      [10342] = 
      {
         Name = "academy student", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
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
         LongDescr = "An acadamy student is here taking a break from his studies.\
", 
         Vnum = 10342, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         ShortDescr = "a student", 
         Race = "Human", 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "no nope", 
               MudProgType = "speech_prog", 
               Code = "say You can have it anyways.\
give luke $n\
drop all\
", 
            }, 
            [2] = 
            {
               Arguments = "yes yep", 
               MudProgType = "speech_prog", 
               Code = "say Ok you can have it then.\
give luke $n\
drop all\
", 
            }, 
            [3] = 
            {
               Arguments = "hi hello", 
               MudProgType = "speech_prog", 
               Code = "say Hello.\
Say I found this toy ... is it yours?\
mpat 10399 mpoload 10320\
mpecho A student shows you a Luke Skywalker Action Figure.\
", 
            }, 
         }, 
         Sex = "undistinguished", 
         Level = 1, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         ArmorClass = 0, 
      }, 
      [10343] = 
      {
         Name = "kid child", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
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
         LongDescr = "A young child is sitting here.\
", 
         Vnum = 10343, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         ShortDescr = "a small child", 
         Race = "Human", 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "p gives you a Luke Skywalker action figure.", 
               MudProgType = "act_prog", 
               Code = "say thank you\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "snif\
say I lost my Luke Skywalker toy\
cry\
", 
            }, 
            [3] = 
            {
               Arguments = "key", 
               MudProgType = "speech_prog", 
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
            }, 
            [4] = 
            {
               Arguments = "door door? key?", 
               MudProgType = "speech_prog", 
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
            }, 
            [5] = 
            {
               Arguments = "door? north", 
               MudProgType = "speech_prog", 
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
            }, 
         }, 
         Sex = "male", 
         Level = 1, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         ArmorClass = 0, 
      }, 
      [10360] = 
      {
         Name = "practice droid", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 5, 
            HitSizeDice = 4, 
         }, 
         Weight = 0, 
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
         Vnum = 10360, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Credits = 10, 
         HitRoll = 0, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         ShortDescr = "a practice droid", 
         Race = "Human", 
         Description = "", 
         LongDescr = "A practice droid is here waiting for combat.\
", 
         Sex = "undistinguished", 
         Level = 1, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         ArmorClass = 100, 
      }, 
      [10345] = 
      {
         Name = "chadoyn cage", 
         DamRoll = 0, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 1, 
            HitSizeDice = 4, 
         }, 
         Weight = 0, 
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
         LongDescr = "The chadoyn is straining its leash, attempting to attack you.\
", 
         Vnum = 10345, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         ShortDescr = "the chadoyn", 
         Race = "_85", 
         Description = "He looks back at you with his beady little eyes and a snarl on his face.\
You are pretty sure you can best him in regards to combat.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "85", 
               MudProgType = "death_prog", 
               Code = "if level($n) >= 6\
if rand(50)\
mpechoat $n You feel an overwhelming desire for greater challenge.\
else\
mpechoat $n The chadoyn is far too easy for you to kill.\
endif\
endif\
", 
            }, 
         }, 
         Sex = "undistinguished", 
         Level = 2, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         ArmorClass = 25, 
      }, 
      [10394] = 
      {
         Name = "Abbigayle language teacher", 
         DamRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [20] = "Scholar", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 1, 
            DamPlus = 3, 
         }, 
         ShortDescr = "abbigayle", 
         Weight = 0, 
         LongDescr = "A beautiful lady stands here, waiting for her students.\
", 
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
         ArmorClass = 5, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         HitRoll = 0, 
         Credits = 50, 
         HitChance = 
         {
            HitNoDice = 1000, 
            HitPlus = 0, 
            HitSizeDice = 1, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Race = "Human", 
         Sex = "female", 
         Description = "This has to be one of the most beautiful women in these Realms, both inside\
and out. Her eyes have a sparkle of amusement and her face an easy smile.\
She knows you are admiring her, and she does not seem to mind. She is\
comfortable and confident that the picture she makes is breath taking. Her\
voice at last breaks the spell. Her voice is like satin, you can hardly\
wait for your lessons to begin. Any reason to hear her speak the tongues\
foreign to your ears.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
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
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "death_prog", 
               Code = "say You know, I am really a lover, not a fighter ...\
mpslay $n\
mpat $n mpechoat $n But alas, killing me was a slaying offense.\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
            }, 
            [3] = 
            {
               Arguments = "p flees head over heels!", 
               MudProgType = "act_prog", 
               Code = "mptrans 0.$n\
mpechoat $n Abbigayle says, 'You fled, so I shall spare your life!'\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
            }, 
         }, 
         Position = "standing", 
         Level = 5, 
         Vnum = 10394, 
         NumberOfAttacks = 0, 
         Height = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Alignment = 0, 
      }, 
      [10395] = 
      {
         Name = "sad student", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
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
         LongDescr = "A sad student leans against the wall.\
", 
         Vnum = 10395, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         ShortDescr = "a sad student", 
         Race = "Human", 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "", 
               MudProgType = "script_prog", 
               Code = "say My brother is dead.\
say Killed by a stray blaster shot.\
snif\
say If only he had made a clone.\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "close north\
say Don't let it happen to you $n\
", 
            }, 
         }, 
         Sex = "undistinguished", 
         Level = 1, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         ArmorClass = 0, 
      }, 
      [10365] = 
      {
         Name = "service droid", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 25, 
         }, 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 100, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
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
         LongDescr = "A service droid is here handing out canteens and rations.\
", 
         Vnum = 10365, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         ShortDescr = "a service droid", 
         Race = "Human", 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "food? ration? food ration", 
               MudProgType = "speech_prog", 
               Code = "mpoload 10313 1\
give ration $n\
drop all\
", 
            }, 
            [2] = 
            {
               Arguments = "canteen? canteen", 
               MudProgType = "speech_prog", 
               Code = "mpoload 10314 1\
give canteen $n\
drop all\
", 
            }, 
         }, 
         Sex = "undistinguished", 
         Level = 10, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         ArmorClass = 0, 
      }, 
      [10350] = 
      {
         Name = "professor schoolmaster teacher headmaster", 
         DamRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_auth", 
         }, 
         ShortDescr = "the Schoolmaster", 
         Weight = 0, 
         LongDescr = "The schoolmaster is here offering diplomas to academy graduates.\
", 
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
         ArmorClass = 94, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         HitRoll = 0, 
         Credits = 100, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 1000, 
            HitSizeDice = 1, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Race = "Human", 
         Sex = "male", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
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
            }, 
         }, 
         Position = "standing", 
         Level = 1, 
         Vnum = 10350, 
         NumberOfAttacks = 0, 
         Height = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Alignment = 1000, 
      }, 
      [10499] = 
      {
         Name = "final mob", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
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
         Vnum = 10499, 
         Stats = 
         {
            Constitution = 0, 
            Strength = 0, 
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
         }, 
         Credits = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         ShortDescr = "a newly created final mob", 
         Race = "Human", 
         Description = "", 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         Sex = "undistinguished", 
         Level = 1, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         ArmorClass = 0, 
      }, 
   }, 
   LevelRanges = 
   {
      Soft = 
      {
         High = 2, 
         Low = 0, 
      }, 
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
   }, 
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10303, 
         Arg1 = 10340, 
      }, 
      [2] = 
      {
         MiscData = 0, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10306, 
         Arg1 = 10394, 
      }, 
      [3] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         Arg1 = 10309, 
      }, 
      [4] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         Arg1 = 10310, 
      }, 
      [5] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 1, 
         Arg1 = 10312, 
      }, 
      [6] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 10313, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10430, 
         Arg1 = 10414, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10308, 
         Arg1 = 10345, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10320, 
         Arg1 = 10360, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 10301, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
         Arg1 = 10302, 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10304, 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10319, 
         Arg1 = 10318, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10318, 
         Arg1 = 10342, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10323, 
         Arg1 = 10343, 
      }, 
      [16] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 2, 
         Arg1 = 10323, 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10326, 
         Arg1 = 10355, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10317, 
         Arg1 = 10315, 
      }, 
      [19] = 
      {
         MiscData = 0, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10317, 
         Arg1 = 10365, 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10327, 
         Arg1 = 10395, 
      }, 
      [21] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         Arg1 = 10327, 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10321, 
         Arg1 = 10370, 
      }, 
      [23] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10317, 
      }, 
      [24] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10311, 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10324, 
         Arg1 = 10350, 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10423, 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10324, 
         Arg1 = 10414, 
      }, 
      [28] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         Arg1 = 10324, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10325, 
         Arg1 = 10322, 
      }, 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "NoPkill", 
   }, 
   Filename = "newacad.lua", 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 10499, 
         First = 10340, 
      }, 
      Room = 
      {
         Last = 10430, 
         First = 10300, 
      }, 
      Object = 
      {
         Last = 10499, 
         First = 10300, 
      }, 
   }, 
   ResetMessage = "You hear the hum of repulsorlifts powering up in the distance", 
}
