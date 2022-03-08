-- Coruscant Academy
-- Last saved Friday 04-Dec-2020 10:20:32

AreaEntry
{
   ResetMessage = "You hear the hum of repulsorlifts powering up in the distance", 
   Rooms = 
   {
      [10304] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "A Marble Corridor\
", 
               Direction = "north", 
               DestinationVnum = 10314, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "A Stone Corridor\
", 
               Direction = "south", 
               DestinationVnum = 10301, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "Wandering the Academy\
", 
               Direction = "west", 
               DestinationVnum = 10307, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "The Reading Room", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10304, 
      }, 
      [10305] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
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
         Name = "Chamber of Trials for Rangers", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10305, 
      }, 
      [10306] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "A Stone Corridor\
", 
               Direction = "east", 
               DestinationVnum = 10301, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Abbigayle's Language Lessons", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10306, 
      }, 
      [10307] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
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
               Distance = 0, 
               Description = "The Reading Room\
", 
               Direction = "east", 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "Wandering Darkhaven Academy, it looks safe\
", 
               Direction = "west", 
               DestinationVnum = 10309, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Wandering the Academy", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10307, 
      }, 
      [10308] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "A Dank Pit\
", 
               Direction = "west", 
               DestinationVnum = 10316, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "A Dank Pit", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10308, 
      }, 
      [10309] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
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
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "An Enclosed Room\
", 
               Direction = "north", 
               DestinationVnum = 10310, 
               Key = -1, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "Wandering the Academy\
", 
               Direction = "east", 
               DestinationVnum = 10307, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "west", 
               DestinationVnum = 10311, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Description = "This is where you will start learning about exits not listed under \"Exits\".\
Doors are not seen on the game. You must read room description and LOOK\
<direction> to find them. Another method of finding a door is to \"bump\" into\
the walls. Type N. OUCH! You ran into the door. You want to be careful not\
to be affected with the pass door spell while using the bump method, as you\
may end up in a room you would rather not visit. Now, type OPEN N or OPEN\
DOOR. Next type EXIT, you will now see the north exit listed under \"Exits\".\
Type HELP OPEN to find out more information on doors.\
", 
         Name = "Wandering Coruscant Academy", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10309, 
      }, 
      [10310] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "Wandering Darkhaven Academy\
", 
               Direction = "south", 
               DestinationVnum = 10309, 
               Key = -1, 
               Keyword = "door", 
            }, 
         }, 
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
         Name = "An Enclosed Room", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10310, 
      }, 
      [10311] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "north", 
               DestinationVnum = 10312, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "Wandering Darkhaven Academy\
", 
               Direction = "east", 
               DestinationVnum = 10309, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Lost in Coruscant Academy", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10311, 
      }, 
      [10312] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
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
               Distance = 0, 
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "south", 
               DestinationVnum = 10311, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               Description = "door\
", 
               Direction = "west", 
               DestinationVnum = 10313, 
               Key = -1, 
               Keyword = "tapestry door", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Lost in Coruscant Academy", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10312, 
      }, 
      [10313] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
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
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "east", 
               DestinationVnum = 10312, 
               Key = -1, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               DestinationVnum = 10302, 
               Key = -1, 
               Keyword = "crack", 
            }, 
         }, 
         Description = "Well Done! You have found this secret room. Sometimes these secret rooms\
will contain valuable items or will lead to other parts of the area you\
are exploring. Always pay close attention to room descriptions, mobiles\
descriptions and items, this will many times bring profitable results.\
This is a where you will experience a Somewhere exit. To find your way\
out, try looking at the picture on the wall. If you can not figure it out, \
you may leave by the up exit. Good luck!\
", 
         Name = "A Secret Alcove", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10313, 
      }, 
      [10314] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "Preparing for combat\
", 
               Direction = "north", 
               DestinationVnum = 10315, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "The Reading Room\
", 
               Direction = "south", 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "A Marble Corridor", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10314, 
      }, 
      [10315] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 10317, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "A Marble Corridor\
", 
               Direction = "south", 
               DestinationVnum = 10314, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "A Dank Pit\
", 
               Direction = "down", 
               DestinationVnum = 10316, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Description = "The time is drawing near to experience combat.  Directly below you  is the\
Chadoyn Pit, the home of a creature which will assist you in learning how\
to initiate combat. The Chadoyn is not aggressive, which means you must\
begin the fight.  There are many ways to do so.  The quickest is KILL\
<mob>. As you gain skills and spells, you may find many of them are also\
capable of initiating combat.  Some of the more popular spells that do so\
are:  DISPEL FORCE, SLEEP, DOMINATE, WEAKEN and BLINDNESS. Some of the\
most popular skills used are STEAL and BACKSTAB.\
", 
         Name = "Preparing for combat", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10315, 
      }, 
      [10316] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "A Dank Pit\
", 
               Direction = "east", 
               DestinationVnum = 10308, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "Preparing for combat\
", 
               Direction = "up", 
               DestinationVnum = 10315, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "A Dank Pit", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10316, 
      }, 
      [10317] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 10327, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 10315, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Time To Take A Break", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10317, 
      }, 
      [10318] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Description = "Sometimes an item may appear useless at first.  There are many junk items\
that are just that, junk.  But some items can come in handy.  Try making\
small talk with this student. HE seems to have found something that might\
prove useful to you.  Sometimes one item may be found inside another.  To\
look in to an object that is a container use :  LOOK IN <container>.  To\
get an item from a container, use :  GET <item> FROM <container> as well. \
                          Hint:  say hello. \
", 
         Name = "A Useless Item?", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10318, 
      }, 
      [10319] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Description = "Sometimes items can be obtained by manipulating other items. Some classes\
can make items from other ones using skills such as MAKEBLASTER, MAKESPICE,\
or MAKELIGHTSABER. Other times it is as simple as opening a box or pushing\
a button as is the case in this room.\
", 
         Name = "Up in a Small Loft", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10319, 
      }, 
      [10320] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Description = "The most common way in most muds to gain equipment is by looting the\
corpses of dead mobiles(monsters etc). After you kill this droid use\
EXAMINE CORPSE to see what it was carrying. Then use GET ALL FROM CORPSE\
to get the goodies from it. To automaticly loot corpses when you kill\
something you can set CONFIG +AUTOLOOT or CONFIG +AUTOCRED for just\
credits.\
", 
         Name = "Looting Your Kills", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10320, 
      }, 
      [10321] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Academy Store", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10321, 
      }, 
      [10322] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 10323, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 10320, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 10327, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 10321, 
               Key = -1, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 10319, 
               Key = -1, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 10318, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Getting More Useful Items", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10322, 
      }, 
      [10323] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 10324, 
               Key = 10423, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Description = "Congratulations, you're almost done. The graduation hall is just to the\
north. Only one problem though. The door's locked. Maybe this kid knows\
where the key is. If only he'd stop crying long enough for you to ask.\
hint: find his doll\
hint: give doll child\
hint: say where's the key\
", 
         Name = "The Last Challenge", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10323, 
      }, 
      [10324] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 10323, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Graduating from the Academy", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
               Code = "if isimmort($n)\
mpechoat $n dumbass! trans yourself!\
else\
mptransfer $n 10325\
endif\
", 
               Arguments = "iamauthed", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 10324, 
      }, 
      [10325] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               DestinationVnum = 10326, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Academy Docking Bay", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10325, 
      }, 
      [10326] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               DestinationVnum = 10325, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "The Shuttle home", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10326, 
      }, 
      [10327] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 10317, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Some Important Words of Advice", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10327, 
      }, 
      [10399] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Description = "", 
         Name = "This Room is used by a Mob program do not delete.", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10399, 
      }, 
      [10400] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [26] = "Factory", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Description = "", 
         Name = "A test workshop", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10400, 
      }, 
      [10401] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Description = "", 
         Name = "a quiet place", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10401, 
      }, 
      [10340] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10340, 
      }, 
      [10342] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10342, 
      }, 
      [10430] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 10300, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Description = "You stand in the player lounge.  It is the last safe zone in the galaxy.  \
Relax and have a cool drink, as this will be the last time you can let\
your guard down and not be marked for death.\
 \
A student message terminal is here for you to practice reading and writing\
messages.  Use NOTE LIST to get a list of the messages, and NOTE READ\
<message number> to read a specific message.\
Type HELP NOTE for more commands.\
", 
         Name = "Student Lounge", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10430, 
      }, 
      [10429] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10429, 
      }, 
      [10300] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 10301, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 10430, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "Coruscant Academy", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n just slit his own throat at the creations room!\
mpat 101 mpecho $n just sucicided at the creations room.\
", 
               Arguments = "throat", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n has just begun life!\
mpat 101 mpecho $n has just entered the game.\
", 
               Arguments = "entered", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 10300, 
      }, 
      [10301] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "Reading Room\
", 
               Direction = "north", 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "The Laboratory of Skills.\
", 
               Direction = "east", 
               DestinationVnum = 10303, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "Entrance to Darkhaven Academy\
", 
               Direction = "south", 
               DestinationVnum = 10300, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "Abbigayle's Language Lessons.\
", 
               Direction = "west", 
               DestinationVnum = 10306, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Description = "To the west is Lady Abbigayle's room, and to the east is Domick.  Lady\
Abbigayle has information about languages, and Domick has information on\
practicing weapons and skills. When you are finished exploring these\
areas, come back here and continue north through the Academy.\
", 
         Name = "A Duraplast Corridor", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "leave_prog", 
               Code = "if isimmort($n)\
else\
  mpforce $n vis\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 10301, 
      }, 
      [10302] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "The Reading Room\
", 
               Direction = "north", 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Description = "You did it! You are an excellent student! To continue your education,\
please leave north. That will return you to the Reading room.\
", 
         Name = "Somewhere", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10302, 
      }, 
      [10303] = 
      {
         Tag = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "A Stone Corridor\
", 
               Direction = "west", 
               DestinationVnum = 10301, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
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
         Name = "The Laboratory of Skills", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 10303, 
      }, 
   }, 
   LowEconomy = 496050830, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 10340, 
         Arg3 = 10303, 
         MiscData = 0, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [2] = 
      {
         Arg1 = 10394, 
         Arg3 = 10306, 
         MiscData = 0, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [3] = 
      {
         Arg1 = 10309, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg2 = 0, 
         Command = "D", 
      }, 
      [4] = 
      {
         Arg1 = 10310, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg2 = 2, 
         Command = "D", 
      }, 
      [5] = 
      {
         Arg1 = 10312, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg2 = 3, 
         Command = "D", 
      }, 
      [6] = 
      {
         Arg1 = 10313, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg2 = 1, 
         Command = "D", 
      }, 
      [7] = 
      {
         Arg1 = 10414, 
         Arg3 = 10430, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [8] = 
      {
         Arg1 = 10345, 
         Arg3 = 10308, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [9] = 
      {
         Arg1 = 10360, 
         Arg3 = 10320, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [10] = 
      {
         Arg1 = 10301, 
         Arg3 = 8, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "E", 
      }, 
      [11] = 
      {
         Arg1 = 10302, 
         Arg3 = 13, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "E", 
      }, 
      [12] = 
      {
         Arg1 = 10304, 
         Arg3 = 0, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [13] = 
      {
         Arg1 = 10318, 
         Arg3 = 10319, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [14] = 
      {
         Arg1 = 10342, 
         Arg3 = 10318, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [15] = 
      {
         Arg1 = 10343, 
         Arg3 = 10323, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [16] = 
      {
         Arg1 = 10323, 
         Arg3 = 2, 
         MiscData = 0, 
         Arg2 = 0, 
         Command = "D", 
      }, 
      [17] = 
      {
         Arg1 = 10355, 
         Arg3 = 10326, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [18] = 
      {
         Arg1 = 10315, 
         Arg3 = 10317, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [19] = 
      {
         Arg1 = 10365, 
         Arg3 = 10317, 
         MiscData = 0, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [20] = 
      {
         Arg1 = 10395, 
         Arg3 = 10327, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [21] = 
      {
         Arg1 = 10327, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg2 = 0, 
         Command = "D", 
      }, 
      [22] = 
      {
         Arg1 = 10370, 
         Arg3 = 10321, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [23] = 
      {
         Arg1 = 10317, 
         Arg3 = 0, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [24] = 
      {
         Arg1 = 10311, 
         Arg3 = 0, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [25] = 
      {
         Arg1 = 10350, 
         Arg3 = 10324, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [26] = 
      {
         Arg1 = 10423, 
         Arg3 = 0, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [27] = 
      {
         Arg1 = 10414, 
         Arg3 = 10324, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [28] = 
      {
         Arg1 = 10324, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg2 = 2, 
         Command = "D", 
      }, 
      [29] = 
      {
         Arg1 = 10322, 
         Arg3 = 10325, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "O", 
      }, 
   }, 
   Filename = "newacad.lua", 
   Objects = 
   {
      [10304] = 
      {
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
            }, 
         }, 
         Layers = 0, 
         Cost = 0, 
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
         ShortDescr = "an academy cap", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A Coruscant Academy cap is here.", 
         Name = "academy cap", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Vnum = 10304, 
      }, 
      [10305] = 
      {
         Tag = "", 
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
            }, 
         }, 
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
         ShortDescr = "a black brocade cape", 
         Cost = 0, 
         ItemType = "armor", 
         Description = "A black brocade cape from the academy", 
         Name = "cape brocade academy", 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Vnum = 10305, 
      }, 
      [10306] = 
      {
         Tag = "", 
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
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
         ShortDescr = "a strong metal collar", 
         Cost = 0, 
         ItemType = "armor", 
         Description = "A strong metal collar from the academy", 
         Name = "collar metal academy", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Vnum = 10306, 
      }, 
      [10307] = 
      {
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n As you wear this visor, you feel more intelligent and wise!\
mpechoaround $n As $n wears the visor of completion, $e looks more complete!\
", 
               Arguments = "100", 
            }, 
         }, 
         Cost = 0, 
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
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
         ShortDescr = "a visor of completion", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 4, 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A visor of completion is here, emitting a faint glow.", 
         Name = "visor completion academy", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         Vnum = 10307, 
      }, 
      [10308] = 
      {
         Tag = "", 
         Layers = 0, 
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
         ShortDescr = "an academy vest", 
         Cost = 0, 
         ItemType = "armor", 
         Description = "An academy vest was left here.", 
         Name = "academy vest", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Vnum = 10308, 
      }, 
      [10309] = 
      {
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
            }, 
         }, 
         Layers = 0, 
         Cost = 0, 
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
         ShortDescr = "lightweight tin sleeves", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 1, 
            }, 
         }, 
         ItemType = "armor", 
         Description = "Lightweight tin sleeves from the academy", 
         Name = "sleeves tin academy", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Vnum = 10309, 
      }, 
      [10310] = 
      {
         Tag = "", 
         Layers = 0, 
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
         ShortDescr = "an energy shield", 
         Cost = 0, 
         ItemType = "armor", 
         Description = "An energy shield was dropped here.", 
         Name = "forceshield energyshield shields shield", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Vnum = 10310, 
      }, 
      [10311] = 
      {
         Tag = "", 
         Cost = 5, 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
            [13] = "Inventory", 
            [6] = "Magic", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a glowrod", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 24, 
            }, 
         }, 
         ItemType = "light", 
         Description = "A glowrod would make a good light source.", 
         Name = "light glowrod glowstick", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10311, 
      }, 
      [10312] = 
      {
         Tag = "", 
         Cost = 250, 
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 2, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a vibro-blade", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -2, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         Description = "You see a finely honed vibro-blade here.", 
         Name = "academy vibro blade knife dagger vibro-blade", 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10312, 
      }, 
      [10313] = 
      {
         Tag = "", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ObjectValues = 
         {
            [1] = 50, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a packaged ration", 
         Cost = 5, 
         ItemType = "food", 
         Description = "A packaged ration is here, waiting to be eaten.", 
         Name = "ration standard packaged", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10313, 
      }, 
      [10314] = 
      {
         Tag = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 40, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 40, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a canteen", 
         Cost = 10, 
         ItemType = "drink_container", 
         Description = "A small grey canteen has been drooped here.", 
         Name = "canteen water grey stock", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10314, 
      }, 
      [10315] = 
      {
         Tag = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a fountain", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "fountain", 
         Description = "A drinking fountain rests against the wall.", 
         Name = "drinking fountain", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 10315, 
      }, 
      [10316] = 
      {
         Tag = "", 
         Layers = 1, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a pair of socks", 
         Cost = 5, 
         ItemType = "armor", 
         Description = "A pair of socks is in a ball on the floor.", 
         Name = "socks", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Vnum = 10316, 
      }, 
      [10317] = 
      {
         Tag = "", 
         Layers = 64, 
         Cost = 5, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a backpack", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -5, 
               Location = 17, 
            }, 
         }, 
         ItemType = "container", 
         Description = "An academy backpack was carelessly misplaced here.", 
         Name = "academy backpack", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Vnum = 10317, 
      }, 
      [10318] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "push_prog", 
               Code = "mpoload 10316 1\
mpoload 10308 1\
mpoload 10303 1\
pull button\
drop all\
mpecho A small panel opens revealing several articles of clothing.\
", 
               Arguments = "100", 
            }, 
         }, 
         ShortDescr = "a button", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "button", 
         Description = "A small grey button seems out of place on the wall here.", 
         Name = "grey button", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 10318, 
      }, 
      [10319] = 
      {
         Tag = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a box", 
         Cost = 0, 
         ItemType = "container", 
         Description = "A small box .. I wonder whats inside, maybe you should open it.", 
         Name = "box", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10319, 
      }, 
      [10320] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a Luke Skywalker action figure", 
         Cost = 0, 
         ItemType = "trash", 
         Description = "A Luke Skywalker action figure was misplaced here.", 
         Name = "luke toy action figure doll", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10320, 
      }, 
      [10321] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a diploma", 
         Cost = 0, 
         ItemType = "paper", 
         Description = "Someone dropped their coruscant academy graduation diploma here.", 
         Name = "diploma academy coruscant graduation", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10321, 
      }, 
      [10322] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ShortDescr = "a shuttle", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Description = "A small shuttle is docked here.", 
         Name = "academy shuttle", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 10322, 
      }, 
      [10323] = 
      {
         Tag = "", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 3, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
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
         ShortDescr = "a practice lightsaber", 
         Cost = 500, 
         ItemType = "weapon", 
         Description = "A practice lightsaber is here.", 
         Name = "practice lightsaber", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10323, 
      }, 
      [10324] = 
      {
         Tag = "", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
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
         ShortDescr = "a lightsaber battery", 
         Cost = 50, 
         ItemType = "battery", 
         Description = "A lightsaber battery is lying here.", 
         Name = "battery", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10324, 
      }, 
      [10499] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ShortDescr = "a newly created final object", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Description = "Some god dropped a newly created final object here.", 
         Name = "final object", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 10499, 
      }, 
      [10498] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a superconductor", 
         Cost = 0, 
         ItemType = "superconductor", 
         Description = "A superconductor is lying here.", 
         Name = "superconductor", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10498, 
      }, 
      [10497] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a circuit board", 
         Cost = 120, 
         ItemType = "circuit", 
         Description = "A circuit board was dropped here.", 
         Name = "circuit board", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10497, 
      }, 
      [10496] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a tiny, round mirror", 
         Cost = 0, 
         ItemType = "mirror", 
         Description = "A tiny, round mirror is lying here.", 
         Name = "mirror", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10496, 
      }, 
      [10495] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a non-adegan crystal", 
         Cost = 0, 
         ItemType = "crystal", 
         Description = "A non-adegan crystal is lying here.", 
         Name = "non-adegan crystal", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10495, 
      }, 
      [10494] = 
      {
         Tag = "", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "some scrap durasteel", 
         Cost = 50, 
         ItemType = "durasteel", 
         Description = "A scrap of some material lies here.", 
         Name = "some scrap durasteel", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10494, 
      }, 
      [10493] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a portable oven", 
         Cost = 0, 
         ItemType = "oven", 
         Description = "A portable oven is here.", 
         Name = "portable oven", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10493, 
      }, 
      [10492] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a battery", 
         Cost = 0, 
         ItemType = "battery", 
         Description = "A battery is lying here.", 
         Name = "battery", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10492, 
      }, 
      [10491] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a durastaff", 
         Cost = 0, 
         ItemType = "staff", 
         Description = "A durastaff is lying here.", 
         Name = "staff durastaff", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10491, 
      }, 
      [10490] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a toolkit", 
         Cost = 0, 
         ItemType = "toolkit", 
         Description = "A toolkit is lying here.", 
         Name = "toolkit", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10490, 
      }, 
      [10489] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a small lens", 
         Cost = 0, 
         ItemType = "lens", 
         Description = "A small lens is lying here.", 
         Name = "lens", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10489, 
      }, 
      [10488] = 
      {
         Tag = "", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "an ammunition cell", 
         Cost = 10, 
         ItemType = "ammo", 
         Description = "An ammunition cell was carelessly left here.", 
         Name = "ammo cell amunition cartridge", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 10488, 
      }, 
      [10487] = 
      {
         Tag = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "some poorly refined carsanum", 
         Cost = 200, 
         ItemType = "spice", 
         Description = "Some carsanum was dropped here.", 
         Name = "carsanum spice", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10487, 
      }, 
      [10435] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype spice", 
         Cost = 0, 
         ItemType = "spice", 
         Description = "A prototype spice is here.", 
         Name = "prototype spice", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10435, 
      }, 
      [10434] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype disguise", 
         Cost = 0, 
         ItemType = "disguise", 
         Description = "A prototype disguise is here.", 
         Name = "prototype disguise", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10434, 
      }, 
      [10433] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype armor", 
         Cost = 100, 
         ItemType = "armor", 
         Description = "A prototype armor is here.", 
         Name = "prototype armor", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10433, 
      }, 
      [10414] = 
      {
         Tag = "student_message_terminal", 
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
         ActionDescription = "", 
         ShortDescr = "a student message terminal", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
         Description = "A student message terminal is here for you to play with.", 
         Name = "student message terminal", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 10414, 
      }, 
      [10432] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype container", 
         Cost = 100, 
         ItemType = "container", 
         Description = "A prototype container is here.", 
         Name = "prototype container", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10432, 
      }, 
      [10431] = 
      {
         Tag = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "prototype bowcaster", 
         Cost = 0, 
         ItemType = "weapon", 
         Description = "A proottype bowcaster is here", 
         Name = "prototype bowcaster", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10431, 
      }, 
      [10430] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ShortDescr = "a newly created prototype comlink", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "comlink", 
         Description = "Some god dropped a newly created prototype comlink here.", 
         Name = "prototype comlink", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 10430, 
      }, 
      [10429] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created prototype shield", 
         Cost = 0, 
         ItemType = "armor", 
         Description = "Some god dropped a newly created prototype shield here.", 
         Name = "prototype shield", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Vnum = 10429, 
      }, 
      [10428] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created prototype light", 
         Cost = 0, 
         ItemType = "light", 
         Description = "Some god dropped a newly created prototype light here.", 
         Name = "prototype light", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10428, 
      }, 
      [10420] = 
      {
         Tag = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "prototype blaster", 
         Cost = 0, 
         ItemType = "weapon", 
         Description = "A prototype blaster is here", 
         Name = "prototype blaster", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10420, 
      }, 
      [10421] = 
      {
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "use_prog", 
               Code = "mpechoat $n Your lightsaber ignites with a soft hum and a bright glow.\
mpechoaround $n $n's lightsaber seemingly jumps into $s hand.\
mpechoaround $n &WIt ignites with a hum and a bright glow.\
", 
               Arguments = "100", 
            }, 
         }, 
         Layers = 128, 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype lightsaber", 
         Cost = 0, 
         ItemType = "weapon", 
         Description = "A prototype lightsaber shouldn't be here", 
         Name = "prototype saber lightsaber", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10421, 
      }, 
      [10422] = 
      {
         Tag = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "prototype vibro-blade", 
         Cost = 0, 
         ItemType = "weapon", 
         Description = "A prototype vibro-blade shouldn't be here", 
         Name = "prototype vibro-blade", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 10422, 
      }, 
      [10423] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a key", 
         Cost = 0, 
         ItemType = "key", 
         Description = "An old fashioned mechanical key was left on the ground here.", 
         Name = "key", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10423, 
      }, 
      [10424] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a comlink", 
         Cost = 50, 
         ItemType = "comlink", 
         Description = "A small hand-held comlink.", 
         Name = "comlink radio communicator", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 10424, 
      }, 
      [10425] = 
      {
         Tag = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 350, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         ActionDescription = "", 
         ShortDescr = "a newly created prototype grenade", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "grenade", 
         Description = "Some god dropped a newly created prototype grenade here.", 
         Name = "prototype grenade", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 10425, 
      }, 
      [10426] = 
      {
         Tag = "", 
         Layers = 0, 
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
         ActionDescription = "", 
         ShortDescr = "a newly created generic armor", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Description = "Some god dropped a newly created generic armor here.", 
         Name = "generic armor", 
         Weight = 1, 
         Cost = 0, 
         Vnum = 10426, 
      }, 
      [10427] = 
      {
         Tag = "", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created protoype landmine", 
         Cost = 0, 
         ItemType = "landmine", 
         Description = "Some god dropped a newly created protoype landmine here.", 
         Name = "protoype landmine", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10427, 
      }, 
      [10300] = 
      {
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
            }, 
         }, 
         Layers = 0, 
         Cost = 0, 
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
         ShortDescr = "a charm bracelet", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 31, 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A charm bracelet from the academy lies here", 
         Name = "bracelet charm academy", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Vnum = 10300, 
      }, 
      [10301] = 
      {
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
            }, 
         }, 
         Layers = 126, 
         Cost = 0, 
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
         ShortDescr = "a pair of black combat boots", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 100, 
               Location = 14, 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A pair of black combat boots from the Academy lies here", 
         Name = "combat boots academy", 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Vnum = 10301, 
      }, 
      [10302] = 
      {
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
            }, 
         }, 
         Layers = 0, 
         Cost = 0, 
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
         ShortDescr = "a braided leather belt", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 5, 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A braided leather belt from the Academy lies here", 
         Name = "belt leather academy", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Vnum = 10302, 
      }, 
      [10303] = 
      {
         Tag = "", 
         Layers = 0, 
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
         ShortDescr = "some leggings", 
         Cost = 0, 
         ItemType = "armor", 
         Description = "A pair of academy leggings is here.", 
         Name = "pants trousers slacks leggings", 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Vnum = 10303, 
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
   Mobiles = 
   {
      [10370] = 
      {
         LongDescr = "A droid is here selling useful items to students.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         Credits = 100, 
         Alignment = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "", 
         Name = "shopkeeper droid", 
         Shop = 
         {
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "a shopkeeper", 
            ProfitSell = 90, 
         }, 
         HitRoll = 2, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 2, 
         }, 
         Height = 0, 
         Level = 20, 
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
         NumberOfAttacks = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 2, 
         Weight = 0, 
         ShortDescr = "a shopkeeper", 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Sex = "undistinguished", 
         ArmorClass = 80, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 2, 
            DamPlus = 10, 
         }, 
         Tag = "", 
         Vnum = 10370, 
      }, 
      [10355] = 
      {
         LongDescr = "A Mon Calamarian pilot is here ferrying academy graduates.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Credits = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "", 
         Name = "pilot", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "all_greet_prog", 
               Code = "bow $n\
say May I see your diploma please.\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
               Code = "look diploma\
say Thank-you.\
give diploma $n\
", 
               Arguments = "p gives you a diploma.", 
            }, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Level = 1, 
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
         NumberOfAttacks = 0, 
         SpecFuns = 
         {
            [0] = "spec_newbie_pilot", 
         }, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         ShortDescr = "a pilot", 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Tag = "", 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Sex = "undistinguished", 
         Vnum = 10355, 
      }, 
      [10340] = 
      {
         LongDescr = "Domick, Lord of Knowledge, sits here reading, waiting for students.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         Credits = 100, 
         Alignment = 1000, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         Name = "Domick Dom teacher", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
               Code = "tell $n That will be 10 credits.\
mpechoat $n All teachers will charge you a certain amount \
mpechoat $n of credits, depending on the level you receive the skill at.\
mpechoat $n It is taken out automatically, so do not give Domick 10\
mpechoat $n credits :).\
", 
               Arguments = "practices", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               MudProgType = "all_greet_prog", 
               Code = "tell $n Are you ready for your lessons?\
", 
               Arguments = "100", 
            }, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 1000, 
         }, 
         Height = 0, 
         Level = 1, 
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
         NumberOfAttacks = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "Domick", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Sex = "male", 
         ArmorClass = 94, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Tag = "", 
         Vnum = 10340, 
      }, 
      [10342] = 
      {
         LongDescr = "An acadamy student is here taking a break from his studies.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "", 
         Name = "academy student", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
               Code = "say You can have it anyways.\
give luke $n\
drop all\
", 
               Arguments = "no nope", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
               Code = "say Ok you can have it then.\
give luke $n\
drop all\
", 
               Arguments = "yes yep", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
               Code = "say Hello.\
Say I found this toy ... is it yours?\
mpat 10399 mpoload 10320\
mpecho A student shows you a Luke Skywalker Action Figure.\
", 
               Arguments = "hi hello", 
            }, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
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
         NumberOfAttacks = 0, 
         Height = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         ShortDescr = "a student", 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Tag = "", 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Sex = "undistinguished", 
         Vnum = 10342, 
      }, 
      [10343] = 
      {
         LongDescr = "A young child is sitting here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "", 
         Name = "kid child", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
               Code = "say thank you\
", 
               Arguments = "p gives you a Luke Skywalker action figure.", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               MudProgType = "all_greet_prog", 
               Code = "snif\
say I lost my Luke Skywalker toy\
cry\
", 
               Arguments = "100", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
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
               Arguments = "key", 
            }, 
            [4] = 
            {
               ScriptType = "MProg", 
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
               Arguments = "door door? key?", 
            }, 
            [5] = 
            {
               ScriptType = "MProg", 
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
               Arguments = "door? north", 
            }, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
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
         NumberOfAttacks = 0, 
         Height = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         ShortDescr = "a small child", 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Tag = "", 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Sex = "male", 
         Vnum = 10343, 
      }, 
      [10360] = 
      {
         LongDescr = "A practice droid is here waiting for combat.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Credits = 10, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "", 
         Name = "practice droid", 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 4, 
            HitPlus = 5, 
         }, 
         Level = 1, 
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
         NumberOfAttacks = 0, 
         Height = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         ShortDescr = "a practice droid", 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Tag = "", 
         ArmorClass = 100, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Sex = "undistinguished", 
         Vnum = 10360, 
      }, 
      [10345] = 
      {
         LongDescr = "The chadoyn is straining its leash, attempting to attack you.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Credits = 0, 
         Alignment = 0, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "He looks back at you with his beady little eyes and a snarl on his face.\
You are pretty sure you can best him in regards to combat.\
", 
         Name = "chadoyn cage", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "Imp", 
               MudProgType = "death_prog", 
               Code = "from newbieacad.chadoyn import *\
", 
               Arguments = "85", 
            }, 
         }, 
         HitRoll = 0, 
         Race = "_85", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 4, 
            HitPlus = 1, 
         }, 
         Level = 2, 
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
         NumberOfAttacks = 0, 
         Height = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         ShortDescr = "the chadoyn", 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Tag = "", 
         ArmorClass = 25, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Sex = "undistinguished", 
         Vnum = 10345, 
      }, 
      [10394] = 
      {
         LongDescr = "A beautiful lady stands here, waiting for her students.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [20] = "Scholar", 
         }, 
         Credits = 50, 
         Alignment = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "This has to be one of the most beautiful women in these Realms, both inside\
and out. Her eyes have a sparkle of amusement and her face an easy smile.\
She knows you are admiring her, and she does not seem to mind. She is\
comfortable and confident that the picture she makes is breath taking. Her\
voice at last breaks the spell. Her voice is like satin, you can hardly\
wait for your lessons to begin. Any reason to hear her speak the tongues\
foreign to your ears.\
", 
         Name = "Abbigayle language teacher", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
               Arguments = "100", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               MudProgType = "death_prog", 
               Code = "say You know, I am really a lover, not a fighter ...\
mpslay $n\
mpat $n mpechoat $n But alas, killing me was a slaying offense.\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               Arguments = "100", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
               Code = "mptrans 0.$n\
mpechoat $n Abbigayle says, 'You fled, so I shall spare your life!'\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               Arguments = "p flees head over heels!", 
            }, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 1000, 
            HitSizeDice = 1, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Level = 5, 
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
         NumberOfAttacks = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "abbigayle", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Sex = "female", 
         ArmorClass = 5, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 1, 
            DamPlus = 3, 
         }, 
         Tag = "", 
         Vnum = 10394, 
      }, 
      [10395] = 
      {
         LongDescr = "A sad student leans against the wall.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Credits = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "", 
         Name = "sad student", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "Imp", 
               MudProgType = "spawn_prog", 
               Code = "from newbieacad.sadstudent import *\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               ScriptType = "Imp", 
               MudProgType = "all_greet_prog", 
               Code = "from newbieacad.sadstudent import *\
", 
               Arguments = "100", 
            }, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
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
         NumberOfAttacks = 0, 
         Height = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         ShortDescr = "a sad student", 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Tag = "", 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Sex = "undistinguished", 
         Vnum = 10395, 
      }, 
      [10365] = 
      {
         LongDescr = "A service droid is here handing out canteens and rations.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Credits = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "", 
         Name = "service droid", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "Imp", 
               MudProgType = "speech_prog", 
               Code = "from newbieacad.servicedroid import *\
def on_speech(mob, actor, txt):\
    on_speech_canteen(mob, actor, txt)\
", 
               Arguments = "canteen? canteen", 
            }, 
            [2] = 
            {
               ScriptType = "Imp", 
               MudProgType = "speech_prog", 
               Code = "from newbieacad.servicedroid import *\
def on_speech(mob, actor, txt):\
    on_speech_ration(mob, actor, txt)\
", 
               Arguments = "food? ration? food ration", 
            }, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 0, 
            HitPlus = 100, 
         }, 
         Level = 10, 
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
         NumberOfAttacks = 0, 
         Height = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         ShortDescr = "a service droid", 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Tag = "", 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 25, 
         }, 
         Sex = "undistinguished", 
         Vnum = 10365, 
      }, 
      [10350] = 
      {
         LongDescr = "The schoolmaster is here offering diplomas to academy graduates.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         Credits = 100, 
         Alignment = 1000, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         Name = "professor schoolmaster teacher headmaster", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
               Arguments = "100", 
            }, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 1000, 
         }, 
         Height = 0, 
         Level = 1, 
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
         NumberOfAttacks = 0, 
         SpecFuns = 
         {
            [0] = "spec_auth", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "the Schoolmaster", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Sex = "male", 
         ArmorClass = 94, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Tag = "", 
         Vnum = 10350, 
      }, 
      [10499] = 
      {
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Description = "", 
         Name = "final mob", 
         HitRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
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
         NumberOfAttacks = 0, 
         Height = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
         }, 
         DamRoll = 0, 
         ShortDescr = "a newly created final mob", 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Tag = "", 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Sex = "undistinguished", 
         Vnum = 10499, 
      }, 
   }, 
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
   ResetFrequency = 3, 
   Author = "Scarab/Durga", 
   Name = "Coruscant Academy", 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
}
