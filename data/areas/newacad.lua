-- Coruscant Academy
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   Rooms = 
   {
      [10304] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10304, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10314, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "A Marble Corridor\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10301, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "A Stone Corridor\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10307, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "Wandering the Academy\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Name = "The Reading Room", 
      }, 
      [10305] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10305, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Chamber of Trials for Rangers", 
      }, 
      [10306] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10306, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10301, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Abbigayle's Language Lessons", 
      }, 
      [10307] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10307, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "The Reading Room\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10309, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "Wandering Darkhaven Academy, it looks safe\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "Door", 
            }, 
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Wandering the Academy", 
      }, 
      [10308] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10308, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10316, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "A Dank Pit\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Dank Pit", 
      }, 
      [10309] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "This is where you will start learning about exits not listed under \"Exits\".\
Doors are not seen on the game. You must read room description and LOOK\
<direction> to find them. Another method of finding a door is to \"bump\" into\
the walls. Type N. OUCH! You ran into the door. You want to be careful not\
to be affected with the pass door spell while using the bump method, as you\
may end up in a room you would rather not visit. Now, type OPEN N or OPEN\
DOOR. Next type EXIT, you will now see the north exit listed under \"Exits\".\
Type HELP OPEN to find out more information on doors.\
", 
         Vnum = 10309, 
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
               DestinationVnum = 10310, 
               Key = -1, 
               Keyword = "door", 
               Direction = "north", 
               Description = "An Enclosed Room\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10307, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "Wandering the Academy\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10311, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "door", 
            }, 
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Wandering Coruscant Academy", 
      }, 
      [10310] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10310, 
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
               DestinationVnum = 10309, 
               Key = -1, 
               Keyword = "door", 
               Direction = "south", 
               Description = "Wandering Darkhaven Academy\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "An Enclosed Room", 
      }, 
      [10311] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10311, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10312, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10309, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "Wandering Darkhaven Academy\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Lost in Coruscant Academy", 
      }, 
      [10312] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10312, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10311, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               Distance = 0, 
               DestinationVnum = 10313, 
               Key = -1, 
               Keyword = "tapestry door", 
               Direction = "west", 
               Description = "door\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
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
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Lost in Coruscant Academy", 
      }, 
      [10313] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "Well Done! You have found this secret room. Sometimes these secret rooms\
will contain valuable items or will lead to other parts of the area you\
are exploring. Always pay close attention to room descriptions, mobiles\
descriptions and items, this will many times bring profitable results.\
This is a where you will experience a Somewhere exit. To find your way\
out, try looking at the picture on the wall. If you can not figure it out, \
you may leave by the up exit. Good luck!\
", 
         Vnum = 10313, 
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
               DestinationVnum = 10312, 
               Key = -1, 
               Keyword = "door", 
               Direction = "east", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
               Direction = "up", 
               Description = "Back to the beginning\
", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 10302, 
               Key = -1, 
               Keyword = "crack", 
               Direction = "somewhere", 
               Description = "", 
            }, 
         }, 
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
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "A Secret Alcove", 
      }, 
      [10314] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10314, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10315, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "Preparing for combat\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "The Reading Room\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Marble Corridor", 
      }, 
      [10315] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "The time is drawing near to experience combat.  Directly below you  is the\
Chadoyn Pit, the home of a creature which will assist you in learning how\
to initiate combat. The Chadoyn is not aggressive, which means you must\
begin the fight.  There are many ways to do so.  The quickest is KILL\
<mob>. As you gain skills and spells, you may find many of them are also\
capable of initiating combat.  Some of the more popular spells that do so\
are:  DISPEL FORCE, SLEEP, DOMINATE, WEAKEN and BLINDNESS. Some of the\
most popular skills used are STEAL and BACKSTAB.\
", 
         Vnum = 10315, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10317, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10314, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "A Marble Corridor\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10316, 
               Key = -1, 
               Keyword = "", 
               Direction = "down", 
               Description = "A Dank Pit\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Preparing for combat", 
      }, 
      [10316] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10316, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10308, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "A Dank Pit\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10315, 
               Key = -1, 
               Keyword = "", 
               Direction = "up", 
               Description = "Preparing for combat\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "A Dank Pit", 
      }, 
      [10317] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
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
         Vnum = 10317, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10327, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10315, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Time To Take A Break", 
      }, 
      [10318] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Sometimes an item may appear useless at first.  There are many junk items\
that are just that, junk.  But some items can come in handy.  Try making\
small talk with this student. HE seems to have found something that might\
prove useful to you.  Sometimes one item may be found inside another.  To\
look in to an object that is a container use :  LOOK IN <container>.  To\
get an item from a container, use :  GET <item> FROM <container> as well. \
                          Hint:  say hello. \
", 
         Vnum = 10318, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
               Direction = "up", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "A Useless Item?", 
      }, 
      [10319] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Sometimes items can be obtained by manipulating other items. Some classes\
can make items from other ones using skills such as MAKEBLASTER, MAKESPICE,\
or MAKELIGHTSABER. Other times it is as simple as opening a box or pushing\
a button as is the case in this room.\
", 
         Vnum = 10319, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
               Direction = "down", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Up in a Small Loft", 
      }, 
      [10320] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The most common way in most muds to gain equipment is by looting the\
corpses of dead mobiles(monsters etc). After you kill this droid use\
EXAMINE CORPSE to see what it was carrying. Then use GET ALL FROM CORPSE\
to get the goodies from it. To automaticly loot corpses when you kill\
something you can set CONFIG +AUTOLOOT or CONFIG +AUTOCRED for just\
credits.\
", 
         Vnum = 10320, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Looting Your Kills", 
      }, 
      [10321] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
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
         Vnum = 10321, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Academy Store", 
      }, 
      [10322] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
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
         Vnum = 10322, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10323, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10320, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 10327, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 10321, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
            [5] = 
            {
               Distance = 0, 
               DestinationVnum = 10319, 
               Key = -1, 
               Keyword = "", 
               Direction = "up", 
               Description = "", 
            }, 
            [6] = 
            {
               Distance = 0, 
               DestinationVnum = 10318, 
               Key = -1, 
               Keyword = "", 
               Direction = "down", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Getting More Useful Items", 
      }, 
      [10323] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Congratulations, you're almost done. The graduation hall is just to the\
north. Only one problem though. The door's locked. Maybe this kid knows\
where the key is. If only he'd stop crying long enough for you to ask.\
hint: find his doll\
hint: give doll child\
hint: say where's the key\
", 
         Vnum = 10323, 
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
               DestinationVnum = 10324, 
               Key = 10423, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "The Last Challenge", 
      }, 
      [10324] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
         Tunnel = 0, 
         Sector = "city", 
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
         Vnum = 10324, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 10323, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Name = "Graduating from the Academy", 
      }, 
      [10325] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
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
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 10326, 
               Key = -1, 
               Keyword = "", 
               Direction = "somewhere", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10325, 
      }, 
      [10326] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
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
         Vnum = 10326, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 10325, 
               Key = -1, 
               Keyword = "", 
               Direction = "somewhere", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "The Shuttle home", 
      }, 
      [10327] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
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
         Vnum = 10327, 
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
               DestinationVnum = 10322, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10317, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Some Important Words of Advice", 
      }, 
      [10399] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 10399, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "This Room is used by a Mob program do not delete.", 
      }, 
      [10400] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 10400, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [26] = "Factory", 
         }, 
         Name = "A test workshop", 
      }, 
      [10401] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 10401, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Name = "a quiet place", 
      }, 
      [10340] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 10340, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [10342] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 10342, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [10430] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "You stand in the player lounge.  It is the last safe zone in the galaxy.  \
Relax and have a cool drink, as this will be the last time you can let\
your guard down and not be marked for death.\
 \
A student message terminal is here for you to practice reading and writing\
messages.  Use NOTE LIST to get a list of the messages, and NOTE READ\
<message number> to read a specific message.\
Type HELP NOTE for more commands.\
", 
         Vnum = 10430, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10300, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
         }, 
         Name = "Student Lounge", 
      }, 
      [10429] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 10429, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [10300] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "throat", 
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n just slit his own throat at the creations room!\
mpat 101 mpecho $n just sucicided at the creations room.\
", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Arguments = "entered", 
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n has just begun life!\
mpat 101 mpecho $n has just entered the game.\
", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10300, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10301, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10430, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Coruscant Academy", 
      }, 
      [10301] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "leave_prog", 
               Code = "if isimmort($n)\
else\
  mpforce $n vis\
endif\
", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "To the west is Lady Abbigayle's room, and to the east is Domick.  Lady\
Abbigayle has information about languages, and Domick has information on\
practicing weapons and skills. When you are finished exploring these\
areas, come back here and continue north through the Academy.\
", 
         Vnum = 10301, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "Reading Room\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10303, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "The Laboratory of Skills.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10300, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "Entrance to Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 10306, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "Abbigayle's Language Lessons.\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Duraplast Corridor", 
      }, 
      [10302] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "You did it! You are an excellent student! To continue your education,\
please leave north. That will return you to the Reading room.\
", 
         Vnum = 10302, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10304, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "The Reading Room\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Somewhere", 
      }, 
      [10303] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
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
         Vnum = 10303, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10301, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "The Laboratory of Skills", 
      }, 
   }, 
   Name = "Coruscant Academy", 
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
   FileFormatVersion = 1, 
   Author = "Scarab/Durga", 
   Filename = "newacad.lua", 
   ResetMessage = "You hear the hum of repulsorlifts powering up in the distance", 
   VnumRanges = 
   {
      Object = 
      {
         Last = 10499, 
         First = 10300, 
      }, 
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
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 10303, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 10340, 
      }, 
      [2] = 
      {
         Arg3 = 10306, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 10394, 
      }, 
      [3] = 
      {
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 0, 
         MiscData = 0, 
         Arg1 = 10309, 
      }, 
      [4] = 
      {
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 2, 
         MiscData = 0, 
         Arg1 = 10310, 
      }, 
      [5] = 
      {
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 3, 
         MiscData = 0, 
         Arg1 = 10312, 
      }, 
      [6] = 
      {
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 10313, 
      }, 
      [7] = 
      {
         Arg3 = 10430, 
         Command = "O", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10414, 
      }, 
      [8] = 
      {
         Arg3 = 10308, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10345, 
      }, 
      [9] = 
      {
         Arg3 = 10320, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10360, 
      }, 
      [10] = 
      {
         Arg3 = 8, 
         Command = "E", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10301, 
      }, 
      [11] = 
      {
         Arg3 = 13, 
         Command = "E", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10302, 
      }, 
      [12] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10304, 
         Command = "G", 
      }, 
      [13] = 
      {
         Arg3 = 10319, 
         Command = "O", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10318, 
      }, 
      [14] = 
      {
         Arg3 = 10318, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10342, 
      }, 
      [15] = 
      {
         Arg3 = 10323, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10343, 
      }, 
      [16] = 
      {
         Arg3 = 2, 
         Command = "D", 
         Arg2 = 0, 
         MiscData = 0, 
         Arg1 = 10323, 
      }, 
      [17] = 
      {
         Arg3 = 10326, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10355, 
      }, 
      [18] = 
      {
         Arg3 = 10317, 
         Command = "O", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10315, 
      }, 
      [19] = 
      {
         Arg3 = 10317, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 10365, 
      }, 
      [20] = 
      {
         Arg3 = 10327, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10395, 
      }, 
      [21] = 
      {
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 0, 
         MiscData = 0, 
         Arg1 = 10327, 
      }, 
      [22] = 
      {
         Arg3 = 10321, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10370, 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10317, 
         Command = "G", 
      }, 
      [24] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10311, 
         Command = "G", 
      }, 
      [25] = 
      {
         Arg3 = 10324, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10350, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10423, 
         Command = "G", 
      }, 
      [27] = 
      {
         Arg3 = 10324, 
         Command = "O", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10414, 
      }, 
      [28] = 
      {
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 2, 
         MiscData = 0, 
         Arg1 = 10324, 
      }, 
      [29] = 
      {
         Arg3 = 10325, 
         Command = "O", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10322, 
      }, 
   }, 
   ResetFrequency = 3, 
   LowEconomy = 496052990, 
   HighEconomy = 0, 
   Mobiles = 
   {
      [10370] = 
      {
         HitRoll = 2, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 100, 
         Damage = 
         {
            DamPlus = 10, 
            DamNoDice = 2, 
            DamSizeDice = 10, 
         }, 
         Shop = 
         {
            ProfitBuy = 120, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "a shopkeeper", 
            ProfitSell = 90, 
         }, 
         LongDescr = "A droid is here selling useful items to students.\
", 
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Level = 20, 
         ArmorClass = 80, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a shopkeeper", 
         Vnum = 10370, 
         Height = 0, 
         DamRoll = 2, 
         Sex = "undistinguished", 
         Name = "shopkeeper droid", 
         HitChance = 
         {
            HitPlus = 2, 
            HitSizeDice = 20, 
            HitNoDice = 2, 
         }, 
      }, 
      [10355] = 
      {
         SpecFuns = 
         {
            [0] = "spec_newbie_pilot", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A Mon Calamarian pilot is here ferrying academy graduates.\
", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "bow $n\
say May I see your diploma please.\
", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Arguments = "p gives you a diploma.", 
               MudProgType = "act_prog", 
               Code = "look diploma\
say Thank-you.\
give diploma $n\
", 
            }, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a pilot", 
         Vnum = 10355, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "pilot", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [10340] = 
      {
         HitRoll = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         Credits = 100, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "tell $n Are you ready for your lessons?\
", 
            }, 
         }, 
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Level = 1, 
         ArmorClass = 94, 
         Race = "Human", 
         Alignment = 1000, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "Domick", 
         Vnum = 10340, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "male", 
         Name = "Domick Dom teacher", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
      }, 
      [10342] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "An acadamy student is here taking a break from his studies.\
", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "no nope", 
               MudProgType = "speech_prog", 
               Code = "say You can have it anyways.\
give luke $n\
drop all\
", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Arguments = "yes yep", 
               MudProgType = "speech_prog", 
               Code = "say Ok you can have it then.\
give luke $n\
drop all\
", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Arguments = "hi hello", 
               MudProgType = "speech_prog", 
               Code = "say Hello.\
Say I found this toy ... is it yours?\
mpat 10399 mpoload 10320\
mpecho A student shows you a Luke Skywalker Action Figure.\
", 
            }, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a student", 
         Vnum = 10342, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "academy student", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [10343] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A young child is sitting here.\
", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "p gives you a Luke Skywalker action figure.", 
               MudProgType = "act_prog", 
               Code = "say thank you\
", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "snif\
say I lost my Luke Skywalker toy\
cry\
", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a small child", 
         Vnum = 10343, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "male", 
         Name = "kid child", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [10360] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 10, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A practice droid is here waiting for combat.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 100, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a practice droid", 
         Vnum = 10360, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "practice droid", 
         HitChance = 
         {
            HitPlus = 5, 
            HitSizeDice = 4, 
            HitNoDice = 1, 
         }, 
      }, 
      [10345] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "He looks back at you with his beady little eyes and a snarl on his face.\
You are pretty sure you can best him in regards to combat.\
", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
         LongDescr = "The chadoyn is straining its leash, attempting to attack you.\
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Level = 2, 
         ArmorClass = 25, 
         Race = "_85", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "the chadoyn", 
         Vnum = 10345, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "chadoyn cage", 
         HitChance = 
         {
            HitPlus = 1, 
            HitSizeDice = 4, 
            HitNoDice = 2, 
         }, 
      }, 
      [10394] = 
      {
         HitRoll = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Description = "This has to be one of the most beautiful women in these Realms, both inside\
and out. Her eyes have a sparkle of amusement and her face an easy smile.\
She knows you are admiring her, and she does not seem to mind. She is\
comfortable and confident that the picture she makes is breath taking. Her\
voice at last breaks the spell. Her voice is like satin, you can hardly\
wait for your lessons to begin. Any reason to hear her speak the tongues\
foreign to your ears.\
", 
         Credits = 50, 
         Damage = 
         {
            DamPlus = 3, 
            DamNoDice = 1, 
            DamSizeDice = 6, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
               Arguments = "p flees head over heels!", 
               MudProgType = "act_prog", 
               Code = "mptrans 0.$n\
mpechoat $n Abbigayle says, 'You fled, so I shall spare your life!'\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
            }, 
         }, 
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [20] = "Scholar", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Level = 5, 
         ArmorClass = 5, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "abbigayle", 
         Vnum = 10394, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "female", 
         Name = "Abbigayle language teacher", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 1, 
            HitNoDice = 1000, 
         }, 
      }, 
      [10395] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A sad student leans against the wall.\
", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "close north\
say Don't let it happen to you $n\
", 
            }, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a sad student", 
         Vnum = 10395, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "sad student", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [10365] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 25, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A service droid is here handing out canteens and rations.\
", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "food? ration? food ration", 
               MudProgType = "speech_prog", 
               Code = "mpoload 10313 1\
give ration $n\
drop all\
", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Arguments = "canteen? canteen", 
               MudProgType = "speech_prog", 
               Code = "mpoload 10314 1\
give canteen $n\
drop all\
", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 10, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a service droid", 
         Vnum = 10365, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "service droid", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 0, 
            HitNoDice = 10, 
         }, 
      }, 
      [10350] = 
      {
         SpecFuns = 
         {
            [0] = "spec_auth", 
         }, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         Credits = 100, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Level = 1, 
         ArmorClass = 94, 
         Race = "Human", 
         Alignment = 1000, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "the Schoolmaster", 
         Vnum = 10350, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "male", 
         Name = "professor schoolmaster teacher headmaster", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
      }, 
      [10499] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a newly created final mob", 
         Vnum = 10499, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "final mob", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "NoPkill", 
   }, 
   Objects = 
   {
      [10304] = 
      {
         ActionDescription = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Description = "A Coruscant Academy cap is here.", 
         Weight = 2, 
         ShortDescr = "an academy cap", 
         Vnum = 10304, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
         }, 
         ItemType = "armor", 
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
         Name = "academy cap", 
      }, 
      [10305] = 
      {
         ActionDescription = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Description = "A black brocade cape from the academy", 
         ShortDescr = "a black brocade cape", 
         Vnum = 10305, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Weight = 3, 
         ItemType = "armor", 
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
         Name = "cape brocade academy", 
      }, 
      [10306] = 
      {
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Description = "A strong metal collar from the academy", 
         ShortDescr = "a strong metal collar", 
         Vnum = 10306, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Weight = 5, 
         ItemType = "armor", 
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
         Name = "collar metal academy", 
      }, 
      [10307] = 
      {
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n As you wear this visor, you feel more intelligent and wise!\
mpechoaround $n As $n wears the visor of completion, $e looks more complete!\
", 
            }, 
         }, 
         Layers = 0, 
         Weight = 1, 
         Description = "A visor of completion is here, emitting a faint glow.", 
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
         Name = "visor completion academy", 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
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
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 10307, 
      }, 
      [10308] = 
      {
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "An academy vest was left here.", 
         ShortDescr = "an academy vest", 
         Vnum = 10308, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Weight = 5, 
         ItemType = "armor", 
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
         Name = "academy vest", 
      }, 
      [10309] = 
      {
         ActionDescription = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Description = "Lightweight tin sleeves from the academy", 
         Weight = 1, 
         ShortDescr = "lightweight tin sleeves", 
         Vnum = 10309, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 1, 
            }, 
         }, 
         ItemType = "armor", 
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
         Name = "sleeves tin academy", 
      }, 
      [10310] = 
      {
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "An energy shield was dropped here.", 
         ShortDescr = "an energy shield", 
         Vnum = 10310, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Weight = 5, 
         ItemType = "armor", 
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
         Name = "forceshield energyshield shields shield", 
      }, 
      [10311] = 
      {
         ActionDescription = "", 
         Cost = 5, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Weight = 1, 
         Description = "A glowrod would make a good light source.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a glowrod", 
         Name = "light glowrod glowstick", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 24, 
            }, 
         }, 
         ItemType = "light", 
         Flags = 
         {
            [0] = "Glow", 
            [13] = "Inventory", 
            [6] = "Magic", 
         }, 
         Vnum = 10311, 
      }, 
      [10312] = 
      {
         ActionDescription = "", 
         Cost = 250, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 2, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Layers = 0, 
         Weight = 3, 
         Description = "You see a finely honed vibro-blade here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a vibro-blade", 
         Name = "academy vibro blade knife dagger vibro-blade", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -2, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 10312, 
      }, 
      [10313] = 
      {
         ActionDescription = "", 
         Cost = 5, 
         ObjectValues = 
         {
            [1] = 50, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Layers = 0, 
         Description = "A packaged ration is here, waiting to be eaten.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a packaged ration", 
         Name = "ration standard packaged", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 2, 
         ItemType = "food", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10313, 
      }, 
      [10314] = 
      {
         ActionDescription = "", 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 40, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 40, 
         }, 
         Layers = 0, 
         Description = "A small grey canteen has been drooped here.", 
         ShortDescr = "a canteen", 
         Vnum = 10314, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "drink_container", 
         ExtraDescriptions = 
         {
         }, 
         Name = "canteen water grey stock", 
      }, 
      [10315] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         ShortDescr = "a fountain", 
         Vnum = 10315, 
         Weight = 1, 
         ItemType = "fountain", 
         ExtraDescriptions = 
         {
         }, 
         Name = "drinking fountain", 
      }, 
      [10316] = 
      {
         ActionDescription = "", 
         Cost = 5, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 1, 
         Description = "A pair of socks is in a ball on the floor.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a pair of socks", 
         Name = "socks", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Weight = 1, 
         ItemType = "armor", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10316, 
      }, 
      [10317] = 
      {
         ActionDescription = "", 
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
         Layers = 64, 
         Description = "An academy backpack was carelessly misplaced here.", 
         Weight = 1, 
         ShortDescr = "a backpack", 
         Vnum = 10317, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -5, 
               Location = 17, 
            }, 
         }, 
         ItemType = "container", 
         ExtraDescriptions = 
         {
         }, 
         Name = "academy backpack", 
      }, 
      [10318] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
               ScriptType = "MProg", 
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
         Layers = 0, 
         Description = "A small grey button seems out of place on the wall here.", 
         ShortDescr = "a button", 
         Vnum = 10318, 
         Weight = 1, 
         ItemType = "button", 
         ExtraDescriptions = 
         {
         }, 
         Name = "grey button", 
      }, 
      [10319] = 
      {
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
         Description = "A small box .. I wonder whats inside, maybe you should open it.", 
         ShortDescr = "a box", 
         Vnum = 10319, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "container", 
         ExtraDescriptions = 
         {
         }, 
         Name = "box", 
      }, 
      [10320] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A Luke Skywalker action figure was misplaced here.", 
         ShortDescr = "a Luke Skywalker action figure", 
         Vnum = 10320, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Name = "luke toy action figure doll", 
      }, 
      [10321] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Someone dropped their coruscant academy graduation diploma here.", 
         ShortDescr = "a diploma", 
         Vnum = 10321, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "paper", 
         ExtraDescriptions = 
         {
         }, 
         Name = "diploma academy coruscant graduation", 
      }, 
      [10322] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         ShortDescr = "a shuttle", 
         Vnum = 10322, 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Name = "academy shuttle", 
      }, 
      [10323] = 
      {
         ActionDescription = "", 
         Cost = 500, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 3, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Layers = 0, 
         Description = "A practice lightsaber is here.", 
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
         Name = "practice lightsaber", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 1, 
         ItemType = "weapon", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10323, 
      }, 
      [10324] = 
      {
         ActionDescription = "", 
         Cost = 50, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Layers = 0, 
         Description = "A lightsaber battery is lying here.", 
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
         Name = "battery", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "battery", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10324, 
      }, 
      [10499] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         ShortDescr = "a newly created final object", 
         Vnum = 10499, 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Name = "final object", 
      }, 
      [10498] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A superconductor is lying here.", 
         ShortDescr = "a superconductor", 
         Vnum = 10498, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "superconductor", 
         ExtraDescriptions = 
         {
         }, 
         Name = "superconductor", 
      }, 
      [10497] = 
      {
         ActionDescription = "", 
         Cost = 120, 
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
         Description = "A circuit board was dropped here.", 
         ShortDescr = "a circuit board", 
         Vnum = 10497, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "circuit", 
         ExtraDescriptions = 
         {
         }, 
         Name = "circuit board", 
      }, 
      [10496] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A tiny, round mirror is lying here.", 
         ShortDescr = "a tiny, round mirror", 
         Vnum = 10496, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "mirror", 
         ExtraDescriptions = 
         {
         }, 
         Name = "mirror", 
      }, 
      [10495] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A non-adegan crystal is lying here.", 
         ShortDescr = "a non-adegan crystal", 
         Vnum = 10495, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "crystal", 
         ExtraDescriptions = 
         {
         }, 
         Name = "non-adegan crystal", 
      }, 
      [10494] = 
      {
         ActionDescription = "", 
         Cost = 50, 
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
         Description = "A scrap of some material lies here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "some scrap durasteel", 
         Name = "some scrap durasteel", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "durasteel", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10494, 
      }, 
      [10493] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A portable oven is here.", 
         ShortDescr = "a portable oven", 
         Vnum = 10493, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "oven", 
         ExtraDescriptions = 
         {
         }, 
         Name = "portable oven", 
      }, 
      [10492] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A battery is lying here.", 
         ShortDescr = "a battery", 
         Vnum = 10492, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "battery", 
         ExtraDescriptions = 
         {
         }, 
         Name = "battery", 
      }, 
      [10491] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A durastaff is lying here.", 
         ShortDescr = "a durastaff", 
         Vnum = 10491, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "staff", 
         ExtraDescriptions = 
         {
         }, 
         Name = "staff durastaff", 
      }, 
      [10490] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A toolkit is lying here.", 
         ShortDescr = "a toolkit", 
         Vnum = 10490, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "toolkit", 
         ExtraDescriptions = 
         {
         }, 
         Name = "toolkit", 
      }, 
      [10489] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A small lens is lying here.", 
         ShortDescr = "a small lens", 
         Vnum = 10489, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "lens", 
         ExtraDescriptions = 
         {
         }, 
         Name = "lens", 
      }, 
      [10488] = 
      {
         ActionDescription = "", 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Layers = 0, 
         Description = "An ammunition cell was carelessly left here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "an ammunition cell", 
         Name = "ammo cell amunition cartridge", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         ItemType = "ammo", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10488, 
      }, 
      [10487] = 
      {
         ActionDescription = "", 
         Cost = 200, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Layers = 0, 
         Description = "Some carsanum was dropped here.", 
         ShortDescr = "some poorly refined carsanum", 
         Vnum = 10487, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "spice", 
         ExtraDescriptions = 
         {
         }, 
         Name = "carsanum spice", 
      }, 
      [10435] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A prototype spice is here.", 
         ShortDescr = "a prototype spice", 
         Vnum = 10435, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "spice", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype spice", 
      }, 
      [10434] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A prototype disguise is here.", 
         ShortDescr = "a prototype disguise", 
         Vnum = 10434, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "disguise", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype disguise", 
      }, 
      [10433] = 
      {
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "A prototype armor is here.", 
         ShortDescr = "a prototype armor", 
         Vnum = 10433, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype armor", 
      }, 
      [10414] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         ShortDescr = "a student message terminal", 
         Vnum = 10414, 
         Weight = 1, 
         ItemType = "furniture", 
         ExtraDescriptions = 
         {
         }, 
         Name = "student message terminal", 
      }, 
      [10432] = 
      {
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "A prototype container is here.", 
         ShortDescr = "a prototype container", 
         Vnum = 10432, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "container", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype container", 
      }, 
      [10431] = 
      {
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "A proottype bowcaster is here", 
         ShortDescr = "prototype bowcaster", 
         Vnum = 10431, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 1, 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype bowcaster", 
      }, 
      [10430] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         ShortDescr = "a newly created prototype comlink", 
         Vnum = 10430, 
         Weight = 1, 
         ItemType = "comlink", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype comlink", 
      }, 
      [10429] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Some god dropped a newly created prototype shield here.", 
         ShortDescr = "a newly created prototype shield", 
         Vnum = 10429, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Weight = 1, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype shield", 
      }, 
      [10428] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Some god dropped a newly created prototype light here.", 
         ShortDescr = "a newly created prototype light", 
         Vnum = 10428, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "light", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype light", 
      }, 
      [10420] = 
      {
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "A prototype blaster is here", 
         ShortDescr = "prototype blaster", 
         Vnum = 10420, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 1, 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype blaster", 
      }, 
      [10421] = 
      {
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "use_prog", 
               Code = "mpechoat $n Your lightsaber ignites with a soft hum and a bright glow.\
mpechoaround $n $n's lightsaber seemingly jumps into $s hand.\
mpechoaround $n &WIt ignites with a hum and a bright glow.\
", 
            }, 
         }, 
         Layers = 128, 
         Description = "A prototype lightsaber shouldn't be here", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype lightsaber", 
         Name = "prototype saber lightsaber", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 1, 
         ItemType = "weapon", 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         Vnum = 10421, 
      }, 
      [10422] = 
      {
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "A prototype vibro-blade shouldn't be here", 
         ShortDescr = "prototype vibro-blade", 
         Vnum = 10422, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 1, 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype vibro-blade", 
      }, 
      [10423] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old fashioned mechanical key was left on the ground here.", 
         ShortDescr = "a key", 
         Vnum = 10423, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "key", 
         ExtraDescriptions = 
         {
         }, 
         Name = "key", 
      }, 
      [10424] = 
      {
         ActionDescription = "", 
         Cost = 50, 
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
         Description = "A small hand-held comlink.", 
         ShortDescr = "a comlink", 
         Vnum = 10424, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         ItemType = "comlink", 
         ExtraDescriptions = 
         {
         }, 
         Name = "comlink radio communicator", 
      }, 
      [10425] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         ShortDescr = "a newly created prototype grenade", 
         Vnum = 10425, 
         Weight = 1, 
         ItemType = "grenade", 
         ExtraDescriptions = 
         {
         }, 
         Name = "prototype grenade", 
      }, 
      [10426] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Some god dropped a newly created generic armor here.", 
         ShortDescr = "a newly created generic armor", 
         Name = "generic armor", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 10426, 
      }, 
      [10427] = 
      {
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Some god dropped a newly created protoype landmine here.", 
         ShortDescr = "a newly created protoype landmine", 
         Vnum = 10427, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "landmine", 
         ExtraDescriptions = 
         {
         }, 
         Name = "protoype landmine", 
      }, 
      [10300] = 
      {
         ActionDescription = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Description = "A charm bracelet from the academy lies here", 
         Weight = 2, 
         ShortDescr = "a charm bracelet", 
         Vnum = 10300, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 31, 
            }, 
         }, 
         ItemType = "armor", 
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
         Name = "bracelet charm academy", 
      }, 
      [10301] = 
      {
         ActionDescription = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 126, 
         Description = "A pair of black combat boots from the Academy lies here", 
         Weight = 3, 
         ShortDescr = "a pair of black combat boots", 
         Vnum = 10301, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 100, 
               Location = 14, 
            }, 
         }, 
         ItemType = "armor", 
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
         Name = "combat boots academy", 
      }, 
      [10302] = 
      {
         ActionDescription = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Description = "A braided leather belt from the Academy lies here", 
         Weight = 2, 
         ShortDescr = "a braided leather belt", 
         Vnum = 10302, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 5, 
            }, 
         }, 
         ItemType = "armor", 
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
         Name = "belt leather academy", 
      }, 
      [10303] = 
      {
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "A pair of academy leggings is here.", 
         ShortDescr = "some leggings", 
         Vnum = 10303, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Weight = 3, 
         ItemType = "armor", 
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
         Name = "pants trousers slacks leggings", 
      }, 
   }, 
}
