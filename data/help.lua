-- Helps
-- Last saved Wednesday 03-Jun-2020 20:41:07

HelpEntry
{
   Text = "&CSyntax &W: &Y!\
  \
&c! repeats the last command you typed.\
", 
   Level = 0, 
   Keyword = "!", 
}

HelpEntry
{
   Text = "&C                       MOVING THROUGHOUT GAME:\
&W                     ---------------------------\
&cThe game divided into many rooms which are connected by various \
directionals to make up areas.  When you are in a room, you can \
find the exits in the room by typing &YEXITS&c.  Autoexit is a helpful \
command to initiate (type &YCONFIG +AUTOEXIT&c), because it will \
automatically show you what exits there are in the room.  Be warned \
however, you will only see the obvious exits.  You must pay attention \
to the room descriptions to see if there might be any doors or hidden \
passages in the room. \
 \
&CDirectional commands: &c(in parentheses you find the shorthand)\
&YNORTH (n)    SOUTH (s)    EAST (e)    WEST (w)     UP (u)     DOWN (d)\
NORTHEAST (Ne)  NORTHWEST (Nw)  SOUTHEAST (Se)  SOUTHWEST (Sw)\
 \
&RNote&w:&c  You will notice that in the prompt <20hp 10bp 20mv>, the 'mv'\
       refers to your movement points.  If your movement points were \
       to run out, you will be unable to move between rooms due to \
       exhaustion.  If you type &YSLEEP&c or &YREST&c your movement points\
       will slowly be replenished.  You must type &YSTAND&c or &YWAKE&c\
       before walking again. \
", 
   Level = 1, 
   Keyword = "A", 
}

HelpEntry
{
   Text = "Syntax: aassign <filename>.are  Example:  aassign edo.are\
 \
AASSIGN temporarily assigns all rooms, objects, and mobiles in the area\
range to your pfile.  This allows you to use rlist, olist, mlist, and\
reset list.  This also means that typing savearea, reset area, or \
instazone will affect this area.  \
 \
To save changes permenantly, type \"aassign none\" and foldarea.\
 \
Warning!! Do not have an area aassigned to yourself when getting personal\
vnums assigned to you.  The personal vnums will overwrite the area file.\
 \
In order to assign a proto area to yourself, you must either have that\
area bestowed to you or you must be Greater God+.\
 \
In order to assign a nonproto area to yourself, you must either have\
that area bestowed to you by a member of the Area Council or you must\
be Exalted+. Even if you have the area bestowed to you, only Lesser+\
can assign themselves nonproto areas.\
 \
See BESTOWAREA\
 \
", 
   Level = 101, 
   Keyword = "AASSIGN", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Speed (speed)\
&CSyntax &W:&Y Accelerate (speed) \
&CSyntax &W:&Y Velocity (speed) \
 \
&cThis command sets your ships speed when not in hyperspace. \
", 
   Level = 1, 
   Keyword = "ACCELERATE VELOCITY SPEED", 
}

HelpEntry
{
   Text = "sentinel       Mobile always stays at its post.\
scavenger      Mobile picks up items of value.\
aggressive     Mobile attacks players.\
stayarea       Mobile does not leave its home area.\
wimpy          Mobile flees when low in hits.\
practice       Players can \"practice\" at this mobile.\
immortal       Mobile is immortal (not implemented).\
deadly         Mobile has a deadly poison (not implemented).\
meta_aggr      Mobile is VERY aggressive (not implemented).\
nowander       Mobile doesn't wander unless attacked.\
mountable      Mobile can be mounted.\
prototype      Mobile is under construction.\
\
See MSET.\
", 
   Level = 101, 
   Keyword = "ACTFLAGS", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YAcuteAwareness\
 \
&cThis skill adds the ability to detect those who are stealthed for a short\
period of time.\
", 
   Level = 1, 
   Keyword = "'ACUTE AWARENESS' ACUTEAWARENESS", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YAcuteDamage\
 \
&cThis skill lets you focus your energy into increasing your damage and\
damroll.\
", 
   Level = 1, 
   Keyword = "'ACUTE DAMAGE' ACUTEDAMAGE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YAcute_awarness\
 \
&cThis skill adds the ability to detect those who are stealthed for a short\
period of time.\
", 
   Level = 1, 
   Keyword = "ACUTE_AWARNESS", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Adari System\
&CInhabitants &W:&W Adarian\
&c\
     This planet is the homeworld of the Adarian race. It is covered \
with volcanic mountains, most of which are perpetually covered with \
snow. Its year lasts 409 standard days. \
", 
   Level = 1, 
   Keyword = "ADARI", 
}

HelpEntry
{
   Text = "&COrigin: &YAdari \
 \
&c     An alien race native to the planet Adari, the Adarians are humanoids\
with unusual cranial structures.  Their skulls are elongated and tall, and\
have a large hole which goes completely through it.  They have no ears or\
noses, and their mouth is ringed with sharp, bony ridges instead of lips.\
Adarians make up to the lack of ears with a covering of fine hairs alon \
their skulls that pick up vibration of sound waves.  A series of glands \
near the skin's surface allows them to smell.  Their throats can be \
distended and filled with air, and the resulting \"long call\" can be useful\
as a communication method or a kind of defensive action.  The Adarians \
have a rigid caste system which dominates their society, and they have \
evolved an advanced technology based on the use of super-colled carbon-ice\
computers.  They were able to remain neutral during the Galactic Civil War\
by signing a non-aggression treaty with the Empire, providing the Empire \
with unlimited raw materials in return for their neutrality. \
 \
&RAlso type&W: &YShowstat Adarians\
", 
   Level = 0, 
   Keyword = "ADARIAN ADARIANS", 
}

HelpEntry
{
   Text = "&CSyntax&R&W : &YAddPatrol \
 \
&cThis allows you to call a guard from your clan or organization at your\
location.  These guards act like posted guards, but will walk around. \
 \
", 
   Level = 1, 
   Keyword = "'ADD PATROL' ADDPATROL", 
}

HelpEntry
{
   Text = "Syntax: addresident <player>\
Syntax: remresident <player>\
\
Addresident and remresident add and remove residents from a particular\
home. When adding or removing a resident, both the resident and the home\
owner must be in the home, where the home owner types addresident or\
remresident followed by the name of the player to be added or removed as a\
resident. Therefore, to add a resident to a home, the home owner must\
first invite the player to enter (see help invite). Residents may enter\
and invite others to enter the home, just as may the owner. However,\
residents cannot add or remove other residents, nor can they sell the\
home. Residents are not charged by the game and as such, any negotiations\
for payment must be made between the resident and the home owner.\
", 
   Level = 105, 
   Keyword = "ADDRESIDENT REMRESIDENT", 
}

HelpEntry
{
   Text = "&cYour tractorbeam has several settings.\
 \
&CSyntax: &Yadjusttractor land \
                      dock \
                      undock \
                      pull/none \
&c\
Undocking a ship with adjusttractor will damage the\
docking ring of both the target and the ship it is\
docked to, including if it is yours! \
 \
&RSee also&W: &Phelp TRACTOR\
", 
   Level = 1, 
   Keyword = "ADJUSTTRACTOR", 
}

HelpEntry
{
   Text = "Syntax: advance <character> <level>\
\
ADVANCE sets a character's level to the specified value.  It is the\
only way to create new immortal characters within the game.  ADVANCE\
may also be used to demote characters.\
", 
   Level = 101, 
   Keyword = "ADVANCE", 
}

HelpEntry
{
   Text = "SMAUG supports having more than one exit in the same direction,\
as well as the special direction 'somewhere', represented by a '?'.\
 \
If you already have an exit leading north, and would like another one,\
use a plus sign '+' in front of the direction:\
redit exit +n 3001          - Adds another exit north to room 3001\
 \
To modify an extra exit like this, or to remove it, you'll have to\
refer to it by number:\
redit exit #2 3002          - Change the second exit to go to room 3002\
 \
To know what number an exit is, do an \"rstat\".\
 \
For someone to be able to use the second north exit, you have to set one\
of the extra flags (see EXFLAGS) like CAN_CLIMB.  It is also usually a good\
idea to set the HIDDEN flag for any special exit so that it looks nicer\
with autoexits on.\
 \
The AUTO flag makes it possible to go in a direction by simply typing the\
keyword for that exit:\
redit exit ? 3001           - Create a 'somewhere' exit to 3001\
redit exflags ? auto hidden - Set the proper flags\
redit exname ? swim         - Set the keyword \"swim\"\
If a player types 'swim' in the room, they will move to room 3001.\
", 
   Level = 101, 
   Keyword = "ADVANCEDEXITS", 
}

HelpEntry
{
   Text = ".\
   In our efforts to give credit to everyone who deserves it, we almost\
   forgot to give credit to one of the \"grandfathers\" of computer adventure\
   games... David Platt, the author of the original \"Adventure\" (c)1979.\
\
   Also credit to Ken Wellsch for porting the original Fortran-77 version\
   to UNIX-C (over a period of about 3 years) (c)1984.\
", 
   Level = -1, 
   Keyword = "ADVENTURE", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Ka'Dedus\
&CInhabitants &W:&W Defel\
&c\
     Homeworld of the Defel race, it is a large, high-gravity world \
orbitting the ultraviolet supergiant Ka'Dedus. The planet has a thick \
atmosphere but no ozone layer, and so unltraviolet light passes \
directly to the surface. Heavy atmospheric gases then block most of the \
remaining wavelengths of light. For these reasons, all lifeforms on the \
planet have evolved with the ability to see in ultraviolet light. The \
planet's main export is the metal meleenium. At one time, Kuat Drive \
Yards mined Af'El for many of its natural minerals. \
", 
   Level = 1, 
   Keyword = "AF'EL", 
}

HelpEntry
{
   Text = "&CSyntax : &Yfeel 'affect mind' (victim)\
 \
&cThis attempts to control a person or monster.  If successful, they will\
follow you for a limited period.  Failure, however, will start a fight\
(Note, there are many creatures resistant or immune to charm).\
", 
   Level = 1, 
   Keyword = "'AFFECT MIND'", 
}

HelpEntry
{
   Text = "&CSyntax:  &Yaffected       &c(abbrevation:  &Yaf&c)\
&CSyntax:  &Yaffected by    &c(abbreviation: &Yaf by&c)\
 \
'Affected' is a powers-at-a-glance function, which displays only the powers\
(and skill affects) your character is currently under.  Each affect will be\
listed by name only for the sake of brevity (if you want to know what each\
is doing, use help <power/skill name> or 'score'). \
 \
Characters level 20 or above and deadly characters will also see the number\
of rounds remaining for each affect.  Affects with a remaining lifespan of\
less than 25 rounds are displayed in white, and those in immediate danger\
of wearing off will flash. \
 \
'Affected by' displays a character's affects separate from its power/skill\
affect list.  This is useful for ensuring that affects given from equipment\
are actually functioning.  For example, if you are wearing a visor with \
detect_invis but 'affected by' does not show you as having that affect, you\
are not detecting invisibility. \
 \
'Affected by' also displays your current susceptibilities, resistances and\
immunities if your character is level 20 or higher. \
", 
   Level = 0, 
   Keyword = "AFFECTED 'AFFECTED BY'", 
}

HelpEntry
{
   Text = "The following are affect flags that can be used when osetting an item\
(with oset <item> affect affected <affect flag>).  These flags can also\
be used when msetting a mobile (mset <mob name> affected <affect flag>).\
They may additionally be used to mset players if your level allows it.\
 \
Blind          Invisible    Detect_evil  Detect_invis  Detect_magic\
Detect_hidden  **Hold**     Sanctuary    Faerie_fire   Infrared\
Curse          **Flaming**  Poison       Protect       Paralysis\
Sneak          Hide         Sleep        Charm         Flying\
Pass_door      Floating     Truesight    Detect_traps  Scrying\
Fireshield     Shockshield  Iceshield    Aqua_breath   Possess\
 \
Note - Hold and Flaming are current not in use.\
 \
See also: OSET AFFECTTYPES\
", 
   Level = 101, 
   Keyword = "AFFECTEDBY AFFECTED_BY", 
}

HelpEntry
{
   Text = "none        strength    dexterity   intelligence  wisdom       constitution\
sex         level       age         height        weight       mana     \
hit         move        gold        experience    armor        hitroll\
damroll     save_para   save_rod    save_poison   save_breath  save_power\
charisma    resistant   immune      susceptible   affected     luck\
backstab    pick        track       steal         sneak        hide\
detrap      dodge       peek        scan          gouge        search\
mount       disarm      kick        parry         bash         stun\
punch       climb       grip        scribe        brew\
 \
Additionally:\
weaponpower <sn>    Will cast a power on victim with every blow of a weapon\
wearpower   <sn>    Will cast a power on wearer when object is worn\
removepower <sn>    Will cast a power on wearer when object is removed\
<skill> <modifier>  Will modifify a player's ability in a skill\
 \
See AFFECTEDBY\
", 
   Level = 101, 
   Keyword = "AFFECTTYPES APPLYTYPES", 
}

HelpEntry
{
   Text = "&CSyntax: &Yafk \
&c\
The afk command will place an &W[AFK]&c flag beside your name on the who\
list, when activated, as well as informing all incoming tells that you \
are afk.  It can be toggled on or off by typing &Yafk&c, and will also go\
off automatically when you enter any command. \
 \
&RAlso see&W:&P Help identify\
", 
   Level = 1, 
   Keyword = "AFK", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YAid &R&W<&YPlayer&R&W> \
 \
&cThis skill allows you to bring a stunned player back to consciousness.\
However, if a player is mortally wounded, it will not revive them.  You\
will need to perform &YFirstaid&c to save them.\
 \
&RSee also&W: &Phelp firstaid \
", 
   Level = 1, 
   Keyword = "AID", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Alderaan\
&CInhabitants &W:&W Human, Thranta\
&c\
this planet's human inhabitants were among the most peaceful beings in \
the galaxy. They were in continually harmony with the world around \
them, and chose to build their cities on top of sandstone bluffs and on \
stilts in the shallow seas. Their towering cities were built this way \
so that they wouldn't trample the grass or destroy the seas. The \
inhabitants of the planet catalogued over 8,000 species of grasses on \
the plains, and more than that in species of flowers. At the age of \
seventeen, an Alderaanian was considered and adult. It was a well-known \
custom that the adult members of Alderaans society never cut their \
hair, but allowed it to grow into long tresses. Alderaan was a staunch \
supporter of the Old Republic, and many of its inhabitants served in \
the armed forces. Following the Clone Wars and the widespread \
destruction caused by it, the government of Alderaan outlawed all \
weapons. They placed all weapons aboard a transport ship and sent the \
ship out on a never-ending series of random hyperspace jumps. The \
homeworld of the Organa family, Alderaan's role in galactici politics \
took a detour during the later years of the Old Republic. As Palpatine\
continued to gain power, the Organas began organizing a resistance to\
his Presidency. With the implementation of the New Order, Alderaan \
became one of the primary supporters of the newly-formed Alliance to\
Restore the Republic. However, the outspoken dissatisfaction with \
Palpatine's rule led to the destruction of the planet. When Leia Organa\
was captured aboard the Tantive IV over Tatooine, she was taken to \
Grand Moff Tarkin for questioning. Tarkin tried to obtain information \
from her, but she proved too strong. Even when Tarkin threatened to \
destroy Alderaan with the new Death Star, Leia lied to him about the \
location of the Alliance's base. Tarkin took no chances, however, and \
ordered the destruction of the planet. Alderaan was blown to pieces \
just before the Battle of Yavin, and all life on the planet was \
destroyed. Some 60,000 natives survived because they were off-world at\
the time, and were granted a unique status within the Alliance, as well\
as the New Republic\
", 
   Level = 1, 
   Keyword = "ALDERAAN", 
}

HelpEntry
{
   Text = "Syntax : feel alertness\
&G\
This makes you more alert for a period.\
&W\
", 
   Level = 1, 
   Keyword = "ALERTNESS", 
}

HelpEntry
{
   Text = "&CSyntax: &Yalias &w<&Yshortcut&w> <&Ycommand&w>\
&CSyntax: &Yalias &w<&Yshortcut&w>\
&c \
The &YALIAS&c command allows you to set shortcuts for commands or long \
strings of text. These can be quite useful for shortening routinely \
entered commands. Example: &Yalias heal cast heal darrik&c \
This assigns the command &Ycast heal darrik&c to the alias &Yheal&c \
so that typing in &Yheal&c will issue the full command. \
You can create up to 30 aliases. \
 \
Typing &YALIAS&c with no arguments will list your current aliases. \
Your aliases will save with your character upon leaving the game. \
An alias may only contain a shortcut for a single command. If more \
sophisticated aliases are needed, a mud client package would probably \
serve the purpose better. \
 \
To remove an alias, type &Yalias&c followed by the shortcut you \
wish to remove.\
 \
&RSee also&W:&P Help aliasfocus\
", 
   Level = 1, 
   Keyword = "ALIAS UNALIAS", 
}

HelpEntry
{
   Text = "&CSyntax: &Yaliasfocus &W<&YWord&W> \
        &Yunfocusalias \
 \
&cWhen set, the focus variable will replace all instances of $$ in any \
user input, including aliases. \
 \
unfocusalias will allow you to unset that variable and use $$ in \
normal conversation. \
 \
&RSee Also&W: &Phelp Alias \
", 
   Level = 1, 
   Keyword = "ALIASFOCUS UNFOCUSALIAS FOCUSALIAS", 
}

HelpEntry
{
   Text = "Syntax:  allow <site>\
Syntax:  ban   <site>\
Syntax:  ban\
Syntax:  ban <# of ban on ban list> level <level of char to ban and below>\
 \
BAN <site> prohibits players from that site from logging in.\
 \
BAN with no arguments returns an enumerated list of banned sites.\
 \
To set a specific level of character to ban from a site, use 'ban' to get\
the list number of the banned site and then use 'ban level'.\
Example:  ban 2 level 10\
 \
This will ban all characters level 10 and under from the second site on\
the 'ban' list.\
 \
ALLOW <site> removes a site from the ban list.\
 \
The site ban test works by suffix comparison, so if you ban 'foo.edu',\
all sites within 'foo.edu' are banned as well.\
", 
   Level = 101, 
   Keyword = "ALLOW BAN", 
}

HelpEntry
{
   Text = "This command will list all the ships in the universe and there current\
owner or sale price. \
 \
Arguments: imperial, rebel, civilian, mob, unowned \
", 
   Level = 1, 
   Keyword = "ALLSHIPS ALLSHIP", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YAutomatic &R&W<&R&YBlaster&R&W> \
&R&CSyntax &R&W: &R&YAmmo &R&W<&R&YHolding Battery&R&W> \
\
&R&cThe blaster skill allows you to use a blaster.  Blasters sometimes need\
to be recharged.  To recharge a blaster, you must find an ammunition cell.\
 Once you have an ammunition cell, you must load it into the blaster.\
&R&W\
", 
   Level = 1, 
   Keyword = "AMMO AMMUNITION BATTERIES BATTERY CHARGE CHARGES BLASTER BLASTERS", 
}

HelpEntry
{
   Text = "No message of the day for avatars.\
", 
   Level = 100, 
   Keyword = "AMOTD", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y ansi <on/off> \
&c\
The ansi command will either enable or disable ansi colour.  Ansi colour \
will work provided your terminal has a compatible mode. \
 \
&RAlso see&W:&P help color \
", 
   Level = 0, 
   Keyword = "ANSI", 
}

HelpEntry
{
   Text = "&CSyntax &W: &Yapply <item>\
&c\
In your travels you may come across various ointments and salves, use\
'apply' to rub them into your skin.\
", 
   Level = 0, 
   Keyword = "APPLY", 
}

HelpEntry
{
   Text = "&CSyntax:&Y appraise <item>\
        appraise all\
&c\
Appraise, when at a repairshop type mob, will tell you the condition of\
your equipment in question.  The mob will tell you if it needs repair or\
not, and if so, how much it will cost. \
", 
   Level = 1, 
   Keyword = "APPRAISE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YApprehend &R&W<&YMob&R&W>\
 \
&YApprehend&c is used by bounty hunters to subdue their prey.  It lets you\
force a mob to follow you.\
 \
&RNote:&r Using &YApprehend&r on a player will start combat. \
", 
   Level = 1, 
   Keyword = "APPREHEND", 
}

HelpEntry
{
   Text = "&CSee &PHelp Quest&R&W\
", 
   Level = 1, 
   Keyword = "AQUEST", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y areas \
&CSyntax &W:&Y commands \
&CSyntax &W:&Y socials \
 \
&YAREAS&c shows you all the areas in the game, with the author's name and\
the suggested levels.\
 \
&YCOMMANDS&c shows you all the (non-social) commands available to you. \
 \
&YSOCIALS&c shows you all the social commands available to you. (Special\
thanks to KaVir for mailing us lots of extra socials)\
", 
   Level = 0, 
   Keyword = "AREAS COMMANDS SOCIALS", 
}

HelpEntry
{
   Text = "&Y-&C* &WCode edited by Ulysses&C *&Y-&c \
The Arena is an area where players can challenge and duel each other, not\
to the death, but until one submits and cannot fight any longer.  When a\
player loses, they are transported to wherever they were before the fight\
started.  The general arena commands are as follows: \
 \
&CAwho &R&W- &YDisplays who is currently in the arena. \
 \
&CAhall &R&W- &YA list of the past winners in the arena. \
\
&CBet &Y<&WPlayer&Y> <&WAmount&Y> &W- &Y Bets on a player in the arena.\
 \
&cNormal Arena match commands: \
 \
&CChallenge &Y<&WPlayer&Y> &W- &YSends a challenge to the player. \
 \
&CAccept &W-&Y Accepts the challenge. \
 \
&CDecline &W-&Y Declines the challenge. \
 \
&cThere is another type of arena, called &WChaos mode&c.  Only immortals\
can start chaos mode.  In this, it is a free-for-all, a fight to the last. \
The winner being the last standing.  Commands in Chaos mode:\
\
&CChaos &Y<&WLow Lvl&Y> <&WHi Lvl&Y> <&WDelay&Y> <&WLength&Y>\
 \
&CArena &W- &YJoins the Chaos mode. \
", 
   Level = 1, 
   Keyword = "ARENA ACCEPT DECLINE CHALLENGE BET AHALL AWHO", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YArm (device)\
&c\
Used for arming of various devices (ie grenades) around the galaxy.\
 \
&RSee also&W:&P help grenade.\
", 
   Level = 1, 
   Keyword = "ARM", 
}

HelpEntry
{
   Text = "Syntax: feel armor <character>\
&C\
This power decreases (improves) the armor class of the target character\
by 20 points.\
&W\
", 
   Level = 0, 
   Keyword = "ARMOR", 
}

HelpEntry
{
   Text = "Syntax:  aset <area filename> <field> <value>\
 \
Aset is used to set the following fields for an individual area:\
author    - The name of the area's author\
name      - The full \"name\" of an area... ie: {10 20} Somegod  Some Area\
filename  - The filename (ie: somearea.are)\
lo_room   - The lowest room vnum\
hi_room   - The highest room vnum\
lo_obj    - The lowest obj vnum\
hi_obj    - The highest obj vnum\
lo_mob    - The lowest mob vnum\
hi_mob    - The highest mob vnum\
low_economy - minumum amount of gold the area will start with at reboot\
max_economy - maximum amount of gold the area _can_ start with at reboot\
resetmsg  - Message displayed throughout the area at reset\
resetfrq  - Number of minutes between area resets\
flags     - Area-wide flags:  nopkill\
 \
The area must be folded to make these changes permanent.\
 \
See FOLDAREA, ASTAT, ECONOMY\
", 
   Level = 101, 
   Keyword = "ASET", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Various\
&c\
    The name given to any number of droid types which are programmed seek\
out and eliminate a specific target. They can be programmed to\
kill an individual, or to take out an entire population. There were \
also the so-called war droids used as guards and soldiers in many \
upstart planetary armies. The IG-series of assassin droids was among \
the best as performed their duties. They were banned during Palpatine's \
rule as Emperor, after they started to be used against Imperial forces. \
 \
&RType Also&W:&Y 'SHOWSTAT ASSASSIN DROID'\
", 
   Level = 1, 
   Keyword = "ASSASSIN DROID ASSASSINDROIDS ASSASSIN_DROIDS 'ASSASSIN DROIDS'", 
}

HelpEntry
{
   Text = "Syntax:  astat                      (area stats for the area you are in)\
Syntax:  astat <filename of area>   (area stats for specified area)\
 \
Astat displays the vital stats of an area, including the following:\
Name:            title of the area\
Filename:        filename of the area\
Prototype:       If the area is prototype or under construction, will be 'yes'\
Max_players:     max # of players in the area as of last reboot\
IllegalPks:      number of illegal pkills in the area since last reboot\
Gold looted:     total amount of gold looted from the area since last reboot\
Area Economy:    current pool of gold for the area (not including player gold)\
Mdeaths:         number of players mobs killed in the area since last reboot\
Mkills:          number of mobs killed in the area since last reboot\
Pdeaths/Pkills:  number of players killed by players in area since reboot\
Author:          name of the area's author\
Number Players:  current number of players in the area\
Area flags:      area-wide flags (such as nopkill)\
Low/hi_room:     first/last room vnum of the area\
Low/hi_obj       first/last object vnum of the area\
Low/hi_mob       first/last mob vnum of the area\
Soft range:      level range recommended for the area\
Hard range:      level range enforced for area (outside range cannot enter)\
Resetmsg:        current reset message for the area at repop\
Reset frequency: frequency with which the area resets\
 \
See ASET\
", 
   Level = 101, 
   Keyword = "ASTAT", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Various\
&c\
     These small droids were designed for use with small starfighters.\
They are basically self-contained navigation computers, but also are \
programmed for starship maintenance. Industrial Automation produced \
many of the best astromech droids, including the R2, R5, and R7 series.\
 \
&RAlso Type&W:&Y SHOWSTAT ASTROMECH\
", 
   Level = 1, 
   Keyword = "ASTROMECH DROID 'ASTROMECH DROIDS'", 
}

HelpEntry
{
   Text = "Syntax: at <location> <command>\
\
AT executes the given command (which may have arguments) at the given\
location.  The location may be specified as a vnum, as the name of\
a mobile or player, or as the name of an object.\
\
AT works by temporarily moving you to that location, executing the\
command, and then moving you back (if the command didn't change your\
location).\
", 
   Level = 101, 
   Keyword = "AT", 
}

HelpEntry
{
   Text = "bite          claws        tail        sting      punch        kick\
trip          bash         stun        gouge      backstab     feed\
drain         firebreath   frostbreath acidbreath lightnbreath gasbreath\
poison        nastypoison  gaze        blindness  causeserious earthquake\
causecritical curse        flamestrike harm       fireball     colorspray\
weaken\
\
See MSET and DEFENSES  (Some are not implemented).\
", 
   Level = 101, 
   Keyword = "ATTACKS", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y auction \
&CSyntax &W:&Y auction <item name> <starting value> \
&CSyntax &W:&Y auction bid <value> \
&CSyntax &W:&Y auction stop \
&c\
The auction command is used for performing auctions.  Simply typing \
auction will display the current item being auctioned, if there is one. \
 \
If nothing is being auctioned, &Yauction <item name> <starting value>&c\
will \
begin an auction.  If no starting value is specified, it will start at 0\
gold. \
 \
&YAuction bid <value>&c will place a bet for the item, and \
&Yauction stop&c (immortals only) will stop an auction in progress. \
 \
Special thanks to Erwin Andreasen for writing this function. \
(Ported here from a publicly available source.) \
 \
At the present, if the mud crashes in mid auction, you will lose both \
your bidded money and the item.  This will soon be fixed. \
 \
You are able to see auction almost from the point of character creation,\
however, you cannot USE auction until level THREE or higher.  To remove\
the auction channel from your screen, type &YCHANNEL -AUCTION. \
", 
   Level = 0, 
   Keyword = "AUCTION", 
}

HelpEntry
{
   Text = "Associated help files: authorize\
 \
Authorize <player> name -- This is the command used to allow a player to\
continue in the Spectral Gate pre-auth area, but will make them choose\
a new name prior to entering the Academy.\
 \
Authorize <player> yes -- This is used to accept a players name.  Once\
this command is used, the player requires no further Immortal commands\
to enter the game.\
 \
Authorize <player> no -- denies a player's name and also forces them to\
leave the game.\
", 
   Level = 101, 
   Keyword = "AUTH AUTHORIZE AUTHORIZATION", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Autopilot\
&c\
&YAUTOPILOT&c allows the owner or designated pilots to toggle the ship's\
autopilot system on or off.  While in autopilot mode, the ship \"locks\
down\" and does not move or respond to controls.  It will also\
automatically respond to combat situations on it's own.\
", 
   Level = 102, 
   Keyword = "AUTOPILOT", 
}

HelpEntry
{
   Text = "&YSyntax &W:&Y Autorecharge\
 \
This will set your shields to automatically recharge.\
 \
&RSee also&W:&P Help ships\
", 
   Level = 1, 
   Keyword = "AUTORECHARGE", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Autotrack\
&c\
This will set your nav computer to automatically adjust course\
to keep you firing on a targeted ship.\
 \
&RSee also&W:&P help ships\
", 
   Level = 1, 
   Keyword = "AUTOTRACK", 
}

HelpEntry
{
   Text = "&c\
These are players that have shown enough devotion to the mud to\
attain level 100 in at least one skill area.  \
", 
   Level = 1, 
   Keyword = "AVATAR AVATARS", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y immtalk <message>\
&CSyntax &W:&Y avtalk  <message>\
&CAbbrevation &W:&Y \": <message>\"\
 \
&CThis allows you to use the avtalk (level 100+) channel.\
 \
&RSee also&W:&P Help Channels\
", 
   Level = 100, 
   Keyword = "AVTALK IMMTALK :", 
}

HelpEntry
{
   Text = "&C                      COMMANDS FOR VARIOUS ACTIONS \
&W                    -------------------------------- \
 &YLOOK (l)&c - can used by itself to look at the room you stand in \
            - you can look at objects: &YLOOK <object>&c \
            - you can look at mobs and players: &YLOOK <mob or player name>\
 &Y\
 SLEEP (sl) &c- sleeping will replenish your hitpoints, force, and movement\
 &Y\
 REST (r) &c- will replenish your hp, force, and mv, but slower than sleep\
          - you can still communicate when resting but not while sleeping\
 &Y\
 WAKE (wa)/ STAND (st) &c- will return you to the standing position \
 &Y\
 SIT &c- your character will sit down \
 &Y\
 OPEN/CLOSE <direction or object> &c- will open/close a door or container\
 &Y\
 LOCK/UNLOCK <direction or object> &c- will lock/unlock a door or container\
 &Y\
 PICK <direction or container> &c- will pick lock on door or container \
 &Y\
 INVENTORY (in) &c- will show you all the objects you are carrying \
 &Y\
 EQUIPMENT (eq) &c- will show you all the equipment you are wearing \
", 
   Level = 1, 
   Keyword = "B", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YBackstab &R&W<&YName&R&W> \
 \
&YBackstab &clets you try to attempt to sneak up on your opponent and stab\
them in the back.  In order to use backstab, you must wield a stabbing\
weapon.  It can only be used to start combat.\
", 
   Level = 1, 
   Keyword = "BACKSTAB BS", 
}

HelpEntry
{
   Text = "Syntax:  balzhur <character>\
 \
This is an instant demotion of a character to level 2, with the\
simultaneous destruction of all its belongings, and a mud-wide\
echo accompanying its execution.\
", 
   Level = 101, 
   Keyword = "BALZHUR", 
}

HelpEntry
{
   Text = "Syntax: bamfin  <message>\
Syntax: bamfout <message>\
\
The standard messages for GOTO are 'arrives in a swirling mist' and\
'leaves in a swirling mist'.  You can replace these messages with messages of\
your own choosing using the BAMFIN and BAMFOUT commands.\
", 
   Level = 101, 
   Keyword = "BAMFIN BAMFOUT", 
}

HelpEntry
{
   Text = "The following sites have been banned:\
\
156.29.1.x\
204.225.103.222 (for players level 50 and under)\
", 
   Level = 101, 
   Keyword = "BANNED", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Barab I\
&c\
   This bipedal race of reptiloids is covered in black scales much like \
fingernails. Known for their hunting and tracking abilities, Barabels \
have heavy claws and sharp, needle-like teeth. They are a communal \
race, with separate groups dominated by a pack leader. Their aggression \
is well-known, but they are also extremely loyal to their mates and \
parents. They are especially fond of fighting with their nearby \
neighbors, the Verpine, and often captured Verpine and gave their body \
parts to the Kubaz. Being a moral race by nature, they have a deep \
respect for the Jedi Knights. \
 \
&RAlso Type&W:&Y SHOWSTAT BARABEL\
", 
   Level = 1, 
   Keyword = "BARABEL", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YBash\
 \
&cBash can only be used once a fight has started.  It will inflict \
damage, and temporarily daze both yourself and your opponent for \
approximately two rounds, during which you cannot heal, flee, or perform \
other extraneous combat actions.  Note that bash has a drastically reduced\
chance of hitting if the basher is not one of the primary targets, ie is \
not tanking. \
", 
   Level = 0, 
   Keyword = "BASH", 
}

HelpEntry
{
   Text = "Syntax : feel beauty <target>\
&C\
Increases the charisma of target for a limited period.\
&W\
", 
   Level = 1, 
   Keyword = "BEAUTY", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YBeg <Mob>\
&c\
The beg skill is simply that, begging.  It's useful for gaining small \
amounts of credits for newbies or when you're desperate. \
", 
   Level = 1, 
   Keyword = "BEG", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y berserk\
&c \
Going berserk sends your warrior into a frenzied state, increasing its\
attacks per round to a maximum of six and your strength by one.  While\
you are berserking you cannot flee. \
", 
   Level = 1, 
   Keyword = "BERSERK", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Bespin\
&CInhabitants &W:&W Rawwk, Algae Sack, Human, Ugnaught\
&c\
     This cloud-covered gas giant was the third planet in the Bespin \
system. Along with Cloud City, it is known for the tibanna gas it \
exports as well as for being a major location for playing sabacc. One \
of the major variations of sabacc is named for the planet, another for \
Cloud City. It is located just off the Corellian Trade Route. It has a \
number of natural satellites, and is located near the Anoat System. The \
gas giant has a quick rotation, taking only twelve standard hours to \
complete one revolution. Bespin's diameter measures some 118,000 \
kilometers. Much of the cloud cover over Bespin is well over 1,000 \
kilometers thick, and surrounds an outer core of seething molten rethin \
and compressed gas some 52,000 kilometers deep. This outer core exceeds \
6,000 degrees, and covers a ball of solid metal 6,000 kilometers \
across. The average day on Bespin lasts twelve standard hours, but the \
year lasts 14 standard years. \
", 
   Level = 102, 
   Keyword = "BESPIN", 
}

HelpEntry
{
   Text = "Syntax:  bestow <victim> command [command] [command] etc\
Syntax:  bestow <victim> list\
Syntax:  bestow <victim> none\
 \
Bestow is used to give a command to a player that they would not normally \
have as a function of their level.\
 \
Bestow victim command will give the command to the person.\
 \
Bestow victim list will show all commands corrently bestowed on the person.\
 \
Bestow victim none will remove all bestowments.\
", 
   Level = 101, 
   Keyword = "BESTOW BESTOWMENTS", 
}

HelpEntry
{
   Text = "Syntax: bestowarea <victim> <filename>.are\
 \
This command allows members of the Area Council to bestow area names\
to immortals so that they can engage in group building.\
 \
Once an AC member bestows a proto area on a player, that player can\
use the aassign command to assign themselves that proto area in order\
to help the owner of the proto area.\
 \
Examples:\
 \
bestowarea joe bob.are           allows joe to work on bob's proto area\
bestowarea joe                   lists all of joe's bestowed areas\
bestowarea joe list              ditto\
bestowarea joe none              removes all of joe's bestowed areas\
 \
See AASSIGN\
", 
   Level = 101, 
   Keyword = "BESTOWAREA", 
}

HelpEntry
{
   Text = "&CSyntax &R&W:&Y Bind&R&W <&YPerson&R&W>\
 \
&cThis skill ties a person up, keeping them paralyzed for a set number of \
rounds.  However, it only works when that person is stunned. \
 \
&RNote:&r attacking someone while they are bound will kill them.\
", 
   Level = 1, 
   Keyword = "BIND", 
}

HelpEntry
{
   Text = "&R&cCertain powers and attacks can render a player blind for anywhere from\
a few rounds, to several hundred rounds.  If you are blinded, you will see\
only your name on the 'who' list, and will be unable to see neither your\
inventory, equipment, nor your location. \
 \
&R&CSyntax &R&W: &YGouge\
\
&R&cThis skill can only be used during combat. \
\
&R&CSyntax &R&W: &YFeel Blindness &R&W<&YVictim&R&W> \
&R&W\
", 
   Level = 1, 
   Keyword = "BLIND GOUGE BLINDNESS", 
}

HelpEntry
{
   Text = "Syntax:  boards\
 \
This command displays statistics on all boards in the game.  Example:\
 \
immortal.brd  Vnum:  1200 Read: 50 Post: 51 Rmv: 55 Max: 100 Posts: 0 Type: 0\
 \
The first column lists the board's filename (immortal.brd)\
Vnum   - object vnum to which the board is attached (the object vnum must be\
         present to read the board, allowing a board to be placed in one or\
         many places by simply placing that object where needed)\
Read   - minimum level required to read that board\
Post   - minumum level required to post to that board\
Remove - minumum level required to remove notes not addressed to 'All'\
Max    - maximum number of posts the board is set to hold\
Posts  - the current number of posts on the board\
Type   - not currently used\
 \
See BSTAT, BSET\
", 
   Level = 101, 
   Keyword = "BOARDS", 
}

HelpEntry
{
   Text = "Syntax:  bodybag <character>\
 \
Bodybag retrieves all of <character's> corpses and places them into your\
inventory, as well as removes the decay timer on each.  This is primarily\
used for performing corpse retrievals and the like.\
 \
", 
   Level = 101, 
   Keyword = "BODYBAG", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Bothawui\
&c\
    Furry, bipedal race native to the planet Bothawui and several other \
colony worlds, they are political and influential by nature. They are \
masters of brokering information, and had a spy network that rivalled \
the best the Empire or the Old Republic could create. As a race, \
Bothans took great pride in their clans, and it was documented that \
there were 608 registered clans on the Bothan Council. They joined the \
Alliance shortly after the Battle of Yavin. While the Bothans generally \
stayed out of the main fighting, there were two instances of Bothan \
exploits. The first came when they were leaked the information about \
the plans and data on the construction of the second Death Star near \
Endor. A number of Bothans assisted a shorthanded Rogue Squadron in \
recovering the plans from the Suprosa, but their lack of piloting \
skills got many of them killed. The plans were recovered and brought to \
Kothlis, where more Bothans were killed in an Imperial raid to recover \
the plans. Again, the Bothans retained possession of the plans, and \
eventually turned them over to Mon Mothma and the Alliance. The second \
came when they helped eliminate Imperial ships near New Cov. It was \
later revealed that the Bothans were also involved in bringing down the \
planetary shields of the planet Caamas, during the early reign of \
Emperor Palpatine, allowing the Empire to burn the surface of the \
planet to charred embers. Although the Bothans searched for several \
years to discover the clans invovled, Imperial records were too well-\
guarded to provide any clues. Then, some fifteen years after the Battle \
of Endor, records were discovered at Mount Tantiss that told of the \
Bothan involvement. \
 \
&RAlso Type&W:&Y SHOWSTAT BOTHAN\
", 
   Level = 1, 
   Keyword = "BOTHAN", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Addbounty (character) (amount) \
&CSyntax &W:&Y bounty \
&c\
Addbounty will allow you to add a bounty to a character as long \
as they are online and you are in a bounty placement office. \
Minimum bounty is 5k, Please realize that placing a bounty is  \
a serious thing.See help death. \
 \
Bounty by itself will list all the current unclaimd bounties. \
 \
&RSee also&W:&P Help Bounties\
", 
   Level = 1, 
   Keyword = "BOUNTY ADDBOUNTY", 
}

HelpEntry
{
   Text = "&cBounty hunters are some of the most feared people in the galaxy. \
Although they cannot roll force, their ability more than makes up for it.\
Backstab and circle provide an attacking ability to quickly take most of\
your marks.  Because of this extreme power, only hunters in the guild can\
practice their offensive skills.  Hunters are not for newbies. \
  \
&RAlso see: &PHelp Skin\
&P          Help Track\
&P          Help Backstab\
&P          Help Doorbash\
&P          Help PoisonWeapon\
&P          Help Apprehend\
&P          Help Bind\
&P          Help AcuteAwareness\
&P          Help Circle\
&P          Help SeeMasking\
&P          Help FocusStrength\
&P          Help InnerStrength\
&P          Help HeightenedAccuracy\
&P          Help Limber\
&P          Help AcuteDamage\
", 
   Level = 0, 
   Keyword = "'BOUNTY HUNTER'", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &R&YAutomatic\
\
&R&cThese skills allow you to succesfully wield some of the weapons found\
in the Galaxy. \
&R&W\
", 
   Level = 1, 
   Keyword = "BOWCASTERS \"FORCE PIKES\" LIGHTSABERS VIBRO-BLADES VIBRO-BLADE LIGHTSABER \"FORCE PIKE\" BOWCASTER", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YBribe &R&W<&YCitizen&R&W> <&YAmount&R&W> \
 \
&cIncreases support for your organization through bribery.  Only works on\
planets governed by your group.  Actual number varies with amount bribed.\
", 
   Level = 1, 
   Keyword = "BRIBE", 
}

HelpEntry
{
   Text = "Syntax:   bset <board filename> <command> <argument>\
Example:  bset immortal.brd vnum 1200\
 \
BSET is used to set fields governing an individual board's operation.\
 \
Filename - filename to store the board's information (should be set first)\
Vnum     - object vnum assigned to the board (see 'help boards')\
Read     - the mininum level required to read the board\
Post     - the minimum level required to post to the board\
Remove   - the minumum level required to remove notes from the board\
           NOTE: notes addressed to 'all' can be removed by anyone\
Maxpost  - maximum number of posts the board can hold\
Filename - filename to store the board's information\
Type     - not currently used\
 \
Board groups:  (example:  bset druid.brd read_group guild of druids)\
read_group    - group that may read that board, regardless of level\
post_group    - group that may post to that board, regardless of level\
extra_readers - characters who may read the board regardless of their level\
extra_removers- characters who may remove notes from this board regardless\
                  of their level or membership in a reader_group\
 \
See BOARDS\
", 
   Level = 101, 
   Keyword = "BSET", 
}

HelpEntry
{
   Text = "Syntax:  bstat <board filename>\
 \
BSTAT is used to display the fields of an individual board.\
 \
(see 'help bset' for an explanation of each field)\
 \
See BSET\
", 
   Level = 101, 
   Keyword = "BSTAT", 
}

HelpEntry
{
   Text = "Syntax: bug <message>\
Syntax: idea <message>\
Syntax: typo <message>\
\
These commands will take your message and record it into a file as feedback\
to the mud implementors.\
", 
   Level = 0, 
   Keyword = "BUG IDEA TYPO", 
}

HelpEntry
{
   Text = "SWreality Building:\
                           TABLE OF CONTENTS\
***************************************************************************\
\
HELP BUILD  - This file ( Contents )\
HELP BUILD1 - Assigning Areas\
HELP BUILD2 - Room Building Basics\
HELP BUILD3 - Mob Building Basics\
HELP BUILD4 - Object Building Basics\
HELP BUILD5 -\
HELP BUILD6 -\
HELP BUILD7 -\
HELP BUILD8 -\
HELP BUILD9 -\
\
***************************************************************************\
\
See HELP BUILD1\
", 
   Level = 101, 
   Keyword = "BUILD BUILDING", 
}

HelpEntry
{
   Text = "SWReality Building Page 1:\
 \
                        -- ASSIGNING AREAS --\
***************************************************************************\
If you are less than level 102 most of this information is useless to\
you. You can skip ahead to HELP BUILD2\
***************************************************************************\
\
ZONES  \9\9\9\9Gives you 3 lists of  zones being built, \
\9\9\9\9newly added zones, and permanent zones.\
\
CHECKVNUM  ALL  <min> <max>\9Gives you a list of conflicting mobs\
\9\9\9\9objects and rooms between zonenumbers\
\9\9\9\9<min> and <max>\
\
VASSIGN <player> <min> <max>    Creates a new area named <playername>.are\
\9\9\9\9and assigns it to the <player>. The vnums\
\9\9\9\9for the rooms, mobs and objects in the \
                                area will be between <min> and <max>.\
\9\9\9\
***************************************************************************\
\
see HELP BUILD2\
\9\9\9\9\9\9\9\9\9\9  \
", 
   Level = 101, 
   Keyword = "BUILD1 BUILDER1 BUILDING1", 
}

HelpEntry
{
   Text = "SWReality Building Pg 2:\
                          ROOM BUILDING BASICS\
***************************************************************************\
\
GOTO <vnum>                     You need to use this to goto the vnum where\
                                you wish to create the new room.\
\
RSTAT                           Gives you the current room statistics.\
\
RLIST                           Gives you a list of rooms in your area.\
\
REDIT NAME <name of the room>\
REDIT DESC                      Puts you into the description editor.\
                                Make sure you press enter after each line.\
REDIT SECTOR <sector value>     Type redit sector by itself for sector list.\
REDIT FLAGS <flag> <flag> ..    Type redit flag by itself fo a flag list.\
REDIT BEXIT <dir> <room>        Creates a two way exit to <room>\
REDIT EXFLAGS <flag> <flag>..   Type redit exflags by itself for choices.\
\
SAVEAREA\9\9\9Saves your area .. do this alot :)\
\
***************************************************************************\
\
see HELP BUILD3\
\
", 
   Level = 101, 
   Keyword = "BUILD2 BUILDING2 BUILDER2", 
}

HelpEntry
{
   Text = "SWReality Building Pg 3\
                         MOB BUILDING BASICS\
***************************************************************************\
\
MCREATE <vnum> [cvnum] <names>  Creates a mob with the vnum/names specified.\
                                A mob with Empire or Republic (or other clan\
                                name) as one of their names will give less\
                                xp when killed by someone of that clan.\
\
MLIST                           Lists mobs in your area.\
MLIST <lowvnum> <hivnum>        Lists mobs between those numbers.\
\
MFIND <name>                    Returns a list of all mobs with that name.\
\
MSET <mob> HP <value>           these are the most important values\
MSET <mob> ALIGN <value>          to set although there are many optional \
MSET <mob> HITROLL <value>        choices type MSET by itself for a list\
MSET <mob> DAMROLL <value>\
MSET <mob> LEVEL <value>\
MSET <mob> CLASS <value>        class 0 citizens don't give as much xp when\
MSET <mob> SHORT <short desc>     killed for obvious reasons\
MSET <mob> LONG <long desc>\
MSET <mob> DESCRIPTION          puts you into the editor\
MSET <mob> HITNUMDIE <amount>\
MSET <mob> HITSIZEDIE <amount>\
MSET <mob> DAMNUMDIE <amount>\
MSET <mob> DAMSIZEDIE <amount>\
\
MINVOKE <vnum>                  Loads a previously created mob.\
\
SAVEAREA                        Do this alot.\
\
***************************************************************************\
see HELP BUILD4\
", 
   Level = 101, 
   Keyword = "BUILD3", 
}

HelpEntry
{
   Text = "SWReality Building Pg 4\
                       OBJECT BUILDING BASICS\
***************************************************************************\
\
OCREATE <vnum> [cvnum] <namelist>  Creates a new object.                        \
\
OLIST                              Lists objects in your area.\
OLIST <from> <to>                  Lists objects within the given range.\
\
OFIND <name>                       Lists all objects with that name.\
\
OINVOKE <vnum>                     Creates a new instance of the object.\
\
OSET <object> <field> <value>      Try typing oset by itself to get a list\
                                   of fields. Then \"oset <object> <field>\
                                   to get a list of values for that field.\
                                   You should set the type first.\
\
SAVEAREA                           Do this alot                      \
\
***************************************************************************\
", 
   Level = 101, 
   Keyword = "BUILD4", 
}

HelpEntry
{
   Text = "&c \
To apply to build for Star Wars: Rise in Power: \
 \
Send an email to <insert@email.here>. \
Include your past experience \
    ( Not necessary for hiring, we just like to know ) \
Past characters on the mud, if any. \
And 3 sample room descriptions. If you wish, you can \
include mobs and objects in each room, if you like. \
 \
We are curently looking for builders! Feel free to apply! \
&R&w\
A final thought. Any applications sent using anything other than third\
person perespective will be thrown out.\
", 
   Level = 1, 
   Keyword = "BUILDERS BUILDER", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y buy   <object>\
&CSyntax &W:&Y buy   <# of object> <object>\
&CSyntax &W:&Y list\
&CSyntax &W:&Y list  <object>\
&CSyntax &W:&Y sell  <object>\
&CSyntax &W:&Y value <object>\
 \
&YBUY&c buys an object from a shop keeper.\
&YBUY <# of object> <object>&c will allow you to buy up to twenty of a\
normal store item at once.\
 \
&YLIST&c lists the objects the shop keeper will sell you.\
&YLIST <object>&c lists just the objects with that name.\
 \
&YSELL&c sells an object to a shop keeper.\
 \
&YVALUE&c asks the shop keeper how much he, she, or it will buy the item\
for. \
", 
   Level = 0, 
   Keyword = "BUY LIST SELL VALUE", 
}

HelpEntry
{
   Text = "A player home is a place where you can safely quit and store equipment.\
You can also control who are allowed to enter.\
\
To get started you must enter an empty home and use the BUYHOME command.\
The basic features that comes with your new home is that you can quit\
there and that any objects you drop to the floor are saved across\
reboots.\
\
You can add others as residents. They will be able to freely enter\
the home, access the objects stored there, and to quit. Use the\
ADDRESIDENT command for this. You will both need to be inside the\
home. To get others into the home without them already being\
a resident you must do the following: The new resident must walk\
up to your home and BUZZ the door. You can now INVITE them.\
This will transfer them into the home so that you can use\
ADDRESIDENT on them. A resident can not sell or upgrade\
the home.\
\
You can use REMRESIDENT to revoke their residency.\
\
You can only own one home, but you can be resident of any number\
of homes.\
\
You can add features to your home with the UPGRADEHOME command.\
\
The DECORATE command allows you to change title and room description.\
\
If you no longer want your home, use the SELLHOME command.\
\
See also: BUYHOME, SELLHOME, ADDRESIDENT, REMRESIDENT,\
          UPGRADEHOME, BUZZ, INVITE.\
", 
   Level = 1, 
   Keyword = "BUYHOME HOMES HOME \"PLAYER HOME\" ", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Buyship (ship name)\
&CSyntax &W:&Y Sellship (ship name)\
&c\
Ships may only be bought from the port that they are currently docked\
in.\
 \
&RSee also&W: &Phelp ships\
", 
   Level = 1, 
   Keyword = "BUYSHIP SELLSHIP", 
}

HelpEntry
{
   Text = "&CSyntax: &Ybuyvendor &w[&Yyes&w]\
&c\
From any shop keeper, you can buy a deed to a shop for a fee.  If you\
already own a shop, you can override it buy typing buyvendor yes. This\
will erased any evidence of your shop on the shell IMMEDIATELY.  The \
old vendor will remain in the game, along with the items you gave him,\
until the next reboot.\
&R \
Current cost for a deed: &W1 Million Credits\
", 
   Level = 1, 
   Keyword = "BUYVENDOR", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y buzz <direction>\
&CSyntax &W:&Y invite <player>\
&c\
Buzz and invite allow visitors to enter homes. The guest types &Ybuzz \
<direction>&c, where direction is the direction to which the home he/she \
wishes to enter lies. The home owner will have to use some means of \
identifying the player who has pressed the buzzer, for the home owner \
types &Yinvite <player>&c, where player is the guest who buzzed, after\
which the guest will enter.\
", 
   Level = 1, 
   Keyword = "BUZZ INVITE", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Beshqek\
&CInhabitants &W:&W (Unknown)\
&c\
A planet located in the Deep Core that is incredibly strong with the \
Dark Side of The Force. Originally used as a private retreat for the \
Emperor Palpatine, it was touted as a paradise. Much of its surface was\
covered with tranquil lakes, and it was lit with an unusual blue-green\
sunlight. Thus, Palpatine was able to get millions of people to \
voluntarily bring their life energies to the planet. Once they were \
there, Palpatine enslaved them by using the Dark Side of the Force, \
feeding the growing evil that existed on the planet. He then built it \
into a model of a society that was ruled by the Dark Side. The reborn \
Emperor used the planet as his stronghold for his cloning activities, \
and for the source of his power during his resurrection. It had a \
normal day of 31 standard hours, and a year which lasts 207 local days. \
", 
   Level = 1, 
   Keyword = "BYSS", 
}

HelpEntry
{
   Text = "&C                       COMMANDS TO USE WITH OBJECTS\
&W                     ----------------------------------&C\
  GET - &YGET <object> <container>&c will get an item from a container \
      - &YGET <object>&c will get an object from the ground \
&C\
  PUT - &YPUT <object> <container>&c will put an item in a container \
&Y\
  DROP <object> -&c will drop the object from your inventory to the ground\
&Y\
  GIVE <object> <player> -&c you will give the object to that player \
&Y\
  SACRIFICE (sac) <object> -&c the object disappears \
&Y\
  USE <object> <target> -&c invokes a device's function on a target\
&Y\
  EAT/DRINK <object> -&c you can eat or drink different foods and drinks \
&C\
  EMPTY - &YFILL <object> -&c fills a drink container from a water source\
        - &YEMPTY <object> -&c empties a container onto the ground \
        - &YEMPTY <object> <container> -&c empties a container into another\
", 
   Level = 1, 
   Keyword = "C", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Calamari\
&CInhabitants &W:&W Mon Calamari, Quarren, Mermen\
&c\
     An ocean-covered world with little solid land mass, Calamari is\
home to two amphibious races: the land-dwelling Mon Calamari and the\
ocean-dwelling Quarren. It is a tectonically stable world, without \
mountains. The planet is covered with deep oceans, with many islands\
and coral atolls. Much of the exposed land is marshy, and incapable of\
supporting any kind of civilization. Thus, the two native species \
turned to building floating cities from the ores mined from the ocean\
floor. Some parts of the cities are exposed above the ocean's surface,\
but the majority of the space in Calamari cities is underwater. It is\
famous for its shipyards. It has a single moon. Its day lasts about 21\
standard hours, and its year spans 398 local days. \
", 
   Level = 1, 
   Keyword = "CALAMARI", 
}

HelpEntry
{
   Text = "&CSyntax &YCalculatediff &W<&Yx&W> <&Yy&W> <&Yz&W>\
&c\
This is the same as calculate <x> <y> <z>, except it\
uses the coordinates you would use for course... shown\
next to ships in radar, and the second set of coords \
under a planet or sun. \
 \
&RSee also&W: &PCALCULATE, HYPERSPACE, COURSE, COURSEACTUAL \
", 
   Level = 1, 
   Keyword = "CALCULATEDIFF", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YAutomatic\
  \
&cThese skills allow you to fly ships of their respective size. \
Without\
these skills, you will not be able to move a ship.\
  \
&RAlso see&W: &PHelp Ships\
", 
   Level = 1, 
   Keyword = "'CAPITAL SHIPS' MIDSHIPS STARFIGHTERS", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y feel <force power> <target>\
&c\
Before you can use a force power, you have to practice it.  The more you\
practice, the higher chance you have of success.  You also must also \
be force sensitive and have enough force energy to use the powers. \
 \
The <target> is optional.  Many powers which need targets will use an \
appropriate default target, especially during combat. \
 \
If the power name is more than one word, then you must quote the power name\
Example: feel 'cure critic' frag.  Quoting is optional for single-word\
powers.  You can abbreviate the power name.\
 \
When you use an offensive power, the victim usually gets a saving throw.\
The effect of the power is reduced or eliminated if the victim makes the\
saving throw successfully. \
 \
See also the help sections for individual powers. \
", 
   Level = 0, 
   Keyword = "CAST FEEL", 
}

HelpEntry
{
   Text = "Syntax:  cedit save\
Syntax:  cedit <command> create [code]\
Syntax:  cedit <command> delete\
Syntax:  cedit <command> show\
Syntax:  cedit <command> [field]\
 \
Field being one of:\
  level position log code\
 \
Cedit create is used to create the entry and name for a new command.\
Cedit delete is used to delete a command.\
Cedit code is used to assign a defined section of code to a command.\
Cedit show displays current statistics on a command.\
Cedit level sets the minimum level for usage of a command.\
Cedit position sets the min_pos for execution of the command.\
Cedit log determines the manner in which the command will be logged.\
 \
Use 'cedit save' to save changes permanently.\
 \
See RESTRICT\
", 
   Level = 103, 
   Keyword = "CEDIT", 
}

HelpEntry
{
   Text = "&COrigin: &YChad \
 \
&c     The small, quick witted inhabitants of Chad, the Chadra-Fan, \
resemble humanoid rodents, with large ears, dark eyes, and flat, circular\
noses with four nostrils.  The fur-covered, rodent-like Chadra-Fan have \
seven senses.  In addition to the five shared by most intelligent species,\
they are also blessed with infrared sight and an advanced chemoreceptive \
smell.  These small, one meter tall beings love to have fun.  They tend to\
be flighty and have short attention spans, though they enjoy tinkering \
with technological items. \
 \
&RAlso type&W:&Y showstat chadra-fan\
", 
   Level = 0, 
   Keyword = "CHADRA FAN CHADRA-FAN CHAD CHADRAFAN", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y channels\
Syntax &W:&Y channels +<channel|all>\
Syntax &W:&Y channels -<channel|all>\
&c\
With no options, &YCHANNELS&c show you your current channels.  With a plus\
or minus sign and an option, &YCHANNELS&c turns that channel on or off. \
With all as the option, &YCHANNELS&c will turn on/off all normal channels\
 \
The first channels you will have available as a new player are &YSAY&c,\
&YTELL&c, and &YNEWBIE.&c  To use say, the person you want to talk to must\
be in the same room, just type &YSAY <message>&c.  To use tell, the target\
person may be anywhere, just type &YTELL <name or 0.name> [message]&c.\
 \
", 
   Level = 1, 
   Keyword = "CHANNELS", 
}

HelpEntry
{
   Text = "&cCharisma &Y(CHA)&c represents your character's physical beauty and charm,\
how pretty your character is.\
 \
&CCharisma affects:\
&c\
 &Y*&c The practice rate with a language scholar. &Y*\
 \
 *&c Prices charged by shopkeepers. &Y*\
 \
 *&c Increases max leadership level. &Y*\
 \
 *&c Increases max diplomacy level. &Y*\
", 
   Level = 1, 
   Keyword = "CHARISMA CHA", 
}

HelpEntry
{
   Text = "&CSyntax&W:&Y chat     <message>\
&CSyntax&W:&Y music    <message>\
&CSyntax&W:&Y ask      <message>\
&CSyntax&W:&Y answer   <message>\
&CSyntax&W:&Y shout    <message>\
&CSyntax&W:&Y yell     <message>\
&CSyntax&W:&Y ooc      <message>\
&c\
These commands send messages through communication channels to other\
players.\
 \
&YSHOUT&c sends a message to all awake players in the world.  To curb\
excessive shouting, &YSHOUT&c imposes a three-second delay on the shouter.\
 \
&YCHAT&c, &YMUSIC&c, and &YQUESTION&c and &YANSWER&c also send messages to\
all interested players.  '&Y.&c' is a synonym for &YCHAT&c.  The &YASK&c\
and &YANSWER&c commands both use the same 'question' channel\
 \
&YYELL&c sends a message to all awake players within your area.\
 \
You can use the &YCHANNELS&c command to hear, or not hear, any of these\
channels.\
 \
&YOOC&c stands for out of character and is the only chennel that should be\
used for real world chatting as opposed to roleplaying. \
 \
&RNote&W: Most channels now require a comlink.\
", 
   Level = 0, 
   Keyword = "CHAT . MUSIC ASK ANSWER SHOUT YELL OOC", 
}

HelpEntry
{
   Text = "Syntax: checkvnums all <begin vnum range> <end vnum range>\
 \
Used to check the specified range of vnums to ensure they are not\
already assigned to another immortal or are otherwise being used.\
 \
Examples:\
checkvnums all 9000 9099\
 \
If no vnum within the specified range is either assigned as part of\
someone's prototype area, and no vnum within the specified range is\
a part of a live (non-prototype) area, there will be no result from\
this command and the vnums are safe to assign.  If any vnum in the\
specified range is already allocated, the area file to which it is\
allocated will be displayed.\
 \
See ASSIGN, ZONES\
", 
   Level = 101, 
   Keyword = "CHECK CECKV CHECKVNUMS", 
}

HelpEntry
{
   Text = ".\
Syntax : Feel 'Choke' (victim)\
&r\
This nasty spell allows you to choke the life from your victim.\
&w\
", 
   Level = 1, 
   Keyword = "CHOKE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YCircle &R&W<&YTarget&R&W> \
 \
&YCircle&c is basically a &YBackstab &cin the middle of a fight.  It\
requires a piercing weapon, and can only be used during combat.\
", 
   Level = 1, 
   Keyword = "'CIRCLE'", 
}

HelpEntry
{
   Text = ".\
&CCivilian Upgrades:\
 \
&cshields:    &W100 units for 200k\
&chull:       &W4000 units for 500k\
&cspeed:      &W25 units for 100k\
&cenergy:     &W1000 units for 200k\
&clasers:     &W1 for 100k\
&chyperspeed: &W25 units for 150k\
&cmissiles:   &W1 missile for 20k\
&ctorpedos:   &W1 torpedo for 30k\
&crockets:    &W1 rocket for 75k\
&cchaff:      &Winstallation and 10 chaff for 100k\
            &Weach addition chaff is 5k\
            &Wif a launcher is already installed,\
            &W(chaff is > 0) 1 chaff for 5k\
&ctractor:    &WInstallation for 1m\
&calarm:      &WInstallation for 500k\
 \
&cSensors:    &W5k a point\
&cAstroArray: &W10k a point\
&cComm:       &W10k a point\
 \
&RAlso See&W: &PCIVILIANUPG2\
", 
   Level = 1, 
   Keyword = "'CIVILIAN UPGRADES' CIVILIANUPG", 
}

HelpEntry
{
   Text = "&CStarfighter maxes:\
&c          lasers:&W 4\
&c  missiles-types:&W 12 missiles, 6 torpedos, or 4 rockets\
&c         shields:&W 100\
&c           speed:&W 120\
&c      hyperspeed:&W 150\
&c            hull:&W 1000\
&c         sensors:&W 100\
&c      Astroarray:&W 100\
&c            Comm:&W 100\
 \
&CMidShip maxes:\
&c          lasers:&W 6\
&c  missiles-types:&W 20 missiles, 10 torpedos, or 6 rockets\
&c         shields:&W 300\
&c           speed:&W 90\
&c      hyperspeed:&W 200\
&c            hull:&W 2500\
&c         sensors:&W 150\
&c      astroarray:&W 100\
&c            comm:&W 150\
 \
&CCapShip maxes:\
&c          lasers:&W 8\
&c  missiles-types:&W 60 missiles, 30 torpedos, or 20 rockets\
&c         shields:&W 500\
&c           speed:&W 30\
&c      hyperspeed:&W 150\
&c            hull:&W 10000\
&c         sensors:&W 150\
&c      astroarray:&W 150\
&c            comm:&W 200\
", 
   Level = 1, 
   Keyword = "CIVILIANUPG2", 
}

HelpEntry
{
   Text = "&CThe following are commands used with clans or organizations:\
 \
&Yclans &c....... shows a list of organizations. \
&Ydonate &c...... donates money to the clan funds. \
&Ywithdraw &c.... withdraws money from the clan funds. \
&Yappoint &c..... allows leader to appoint a number1 and number2\
&Ydemote &c...... takes away members status in the clan. \
&Yempower &c..... gives member special powers (ie. withdraw or induct)\
&Yinduct &c...... inducts a person into your clan. \
&Youtcast &c..... kicks a person out of the clan. \
&Yresign &c...... to quit a clan. \
&Yclanbuyship &c. to purchas spacecraft and other vehicles for clan \
&Ycapture &c..... allows a clan to capture the government and declare\
              leadership over an area. \
&Yroster &c...... Lists all members of your clan. \
&Yclanfunds &c... shows the amount of funds available to your clan. \
 \
&RNote&W: not all of these are functional yet.....\
", 
   Level = 1, 
   Keyword = "CLAN CLANS ORGANIZATION ORGANIZATIONS ORGANISATION ORGANISATIONS", 
}

HelpEntry
{
   Text = "&CClan Creation:\
&c\
A clan will start out as an rp clan.  It wont exist in the clan list, but\
it exists in roleplay.  After a few weeks, if the clan is growing and has\
achieved a good amount of members, that clan may be added as a coded clan,\
with ships, funds, and a clan channel. An immortal does not have to be \
consulted to start a rp clan, although if an administrator has a problem \
with it, he or she may ask you to disband. \
", 
   Level = 1, 
   Keyword = "'CLAN CREATION'", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y clantalk <message>\
&c\
Provided that you are in a clan, clantalk will send the message to all\
current members, as well as the deity.\
", 
   Level = 0, 
   Keyword = "CLANTALK", 
}

HelpEntry
{
   Text = "&cThe old classes have been removed in favor of an ability system that lets\
you advance in several areas at once.   These ability classes are as\
follows:\
 \
&CCombat         &PHelp Class_Combat\
&CPiloting       &PHelp Piloting\
&CEngineering    &PHelp Engineer\
&CBounty Hunters &PHelp BH\
&CSmuggling      &PHelp Smuggler\
&CDiplomacy      &PHelp Diplomat\
&CLeadership     &PHelp Leader\
&CCommando       &PHelp Commandos\
", 
   Level = 0, 
   Keyword = "CLASS CLASSES", 
}

HelpEntry
{
   Text = "Bounty hunters are the most feared people in the galaxy, next to forcers.\
Although bounty hunters can not roll force, their ability more than makes\
up for it. Backstab and circle provide an attacking ability to quickly\
take most of your marks. Because of this extreme power, only hunters in\
the guild can practice their skills, and the leader is very strict about\
inducting people into the guild. The hunters guild is not for the newbie.\
", 
   Level = 0, 
   Keyword = "CLASS_BH", 
}

HelpEntry
{
   Text = "&cCombat gives you many fighting abilities. It is ideal for someone who\
just wishes to act the grunt, as a imperial stormtrooper, a rebel ground\
trooper, or even a black sun basher. With abilities varying from wielding\
two weapons to a third attack to a 'hitall' ability to going 'berserk' to\
demolitions, it can be a fun class. Most combat specialists also get high\
leadership levels.\
 \
&RAlso see&W:  &Phelp scan \
           help vibro-blades \
           help snipe \
           help blasters \
           help 'force pikes' \
           help bowcasters \
           help throw \
           help kick \
           help mount \
           help rescue \
           help 'enhanced damage' \
           help 'dual wield' \
           help gouge \
           help punch \
           help disarm \
           help 'second attack' \
           help bash \
           help dodge \
           help grip \
           help grenades \
           help berserk \
           help hitall \
           help mine \
           help 'third attack' \
           help 'fourth attack' \
           help 'fifth attack' \
 \
&RAlso type&W:&Y showstat combat\
", 
   Level = 0, 
   Keyword = "CLASS_COMBAT", 
}

HelpEntry
{
   Text = "Diplomat's also tend to have high leadership levels as well. Diplomat's can\
'MassPropaganda', which will raise or lower popular support on a planet.\
'Seduce' will force a person or mob to follow you.   There are not many\
diplomatic skills, but most get all the leadership skills as well.\
", 
   Level = 0, 
   Keyword = "CLASS_DIPLOMAT", 
}

HelpEntry
{
   Text = "Engineering is one of the more profitable classes. The ability to make\
anything from a comlink to armor to a blaster makes you popular with a lot\
of people, because a master engineer provides better goods than anything\
ound in the shops of the game. One of the downsides of engineering is it\
takes a lot of time, and it is not very active sitting in a workshop\
making item after item. But hey, no pain, no gain!\
", 
   Level = 105, 
   Keyword = "CLASS_ENGINEER", 
}

HelpEntry
{
   Text = "Leadership main's get a few interesting abilities. Not only can they post\
guards, but they can post *elite* guards, as well as call special\
forces... a more powerful form of reinforcements.  They also get dominate,\
which will make a mob your slave, and torture, which will permanently\
remove hitpoints from a person or a mob.  Another skill,\
GatherIntelligence, will gather information on an individual in the\
game... anything from where he/she/it is at that moment, to what clan it\
is in.\
", 
   Level = 0, 
   Keyword = "CLASS_LEADER", 
}

HelpEntry
{
   Text = "Piloting is one of the more popular classes. One of the more fun features\
of the Star Wars Reality codebase is its space system, and especially its\
space combat. The piloting class gives you not only the best space combat\
abilities,  but also the ability to fly the most powerful ships in the\
game, the capital-class ships, from the SSD Executor to the MC80 Cruiser\
to one of the faction clans custom ships.\
", 
   Level = 0, 
   Keyword = "CLASS_PILOTING", 
}

HelpEntry
{
   Text = "The smuggler has many abilities other classes can not get. The ability to\
pick doors, and even ship hatches, is combined with the ability to hijack\
other people's ships. This, coupled with the ability to hide from and\
sneak by other players, makes the smuggler a popular choice.\
", 
   Level = 0, 
   Keyword = "CLASS_SMUGGLER", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YClimb &R&W<&YDirection&R&W>\
 \
&cThis skill enables you to climb into and out of rooms that have no floors\
or require it. \
", 
   Level = 1, 
   Keyword = "'CLIMB'", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &Yclone\
&cCloning is a vital part of your existance.  Since death is permanent, the\
only way to continue a character is to have a clone.\
 \
&RNote: &WClones start at the last point you cloned,\
      not the point you died.\
 \
&RNote: &WAs of March 2nd, clones have no memory\
      of their past lives.\
", 
   Level = 1, 
   Keyword = "CLONES CLONE CLONING", 
}

HelpEntry
{
   Text = "Syntax: cmdtable\
\
Lists all of the commands in the game, and how many times they have been used\
since the last startup.\
", 
   Level = 101, 
   Keyword = "CMDTABLE", 
}

HelpEntry
{
   Text = "Syntax:  cmenu\
 \
Invokes an online menu to ease entering 'cset' arguments.  May not be\
fully functional at this time.\
", 
   Level = 102, 
   Keyword = "CMENU", 
}

HelpEntry
{
   Text = "void do_openbay( CHAR_DATA *ch, char *argument )\
{ \
  SHIP_DATA *ship;\
   if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )\
   {\
        send_to_char(\"&RYou aren't in the pilots chair!\\n\\r\",ch);\
        return;\
   }\
   if (ship->bayopen == TRUE)\
   {\
      echo_to_cockpit( AT_YELLOW , ship, \"Bay doors are already open!\");   \
    \
      return;\
   }\
   act( AT_PLAIN, \"$n flips a switch on the control panel.\", ch,\
         NULL, argument , TO_ROOM );\
      ship->bayopen = TRUE;\
      echo_to_cockpit( AT_YELLOW , ship, \"Bay Doors Open\");\
   }\
}\
", 
   Level = 102, 
   Keyword = "CODETEST", 
}

HelpEntry
{
   Text = "&w^xThe foreground special character is:  &&\
Tokens for && are:\
  &w&&x  -&x Black                    &w &&r  -&r Red (blood)\
  &w&&g  -&g Green                    &w &&O  -&O Orange (brown)\
  &w&&b  -&b Dark Blue                &w &&p  -&p Purple\
  &w&&c  -&c Cyan                     &w &&w  -&w Gray (default color)\
  &w&&z  -&z Dark Grey                &w &&R  -&R Light Red\
  &w&&G  -&G Light Green              &w &&Y  -&Y Yellow\
  &w&&B  -&B Blue                     &w &&P  -&P Pink\
  &w&&C  -&C Light Blue               &w &&W  -&W White\
 \
&wThe background special character is:  ^^\
Tokens for ^^ are:\
^x  ^^x(z)  - ^xBlack               ^x   ^^r(R)  - ^rRed\
^x  ^^g(G)  - &x^gGreen&w               ^x   ^^O(Y)  - &x^OOrange&w\
^x  ^^b(B)  - ^bBlue                ^x   ^^p(P)  - ^pPurple\
^x  ^^c(C)  - &x^cCyan&w                ^x   ^^w(W)  - &x^wGrey&w\
^zThe tokens in brackets are the same colors, but cause the foreground color\
to flash.\
^x \
Note: If setting both foreground and background colors. The foreground must\
      precede the background color.\
 \
See also: HELP PROMPT\
", 
   Level = 0, 
   Keyword = "COLOUR COLOR COLOURS COLORS PCOLORS", 
}

HelpEntry
{
   Text = "&cYou may choose a fight by finding a mob, and using &YLOOK&c,\
&YCONSIDER&c, and &YIDENTIFY&c to gauge the difficulty of the opponent. \
You can &YLOOK <mob>&c to get a look at its equipment and description,\
this will often help indictate how hard a fight might be.  You can\
&YCONSIDER <mob>&c for a one on one comparison of the mobs hitpoints and\
level to your own.  You may also &YFEEL 'KNOW ESSENCE' <mob>&c to get more\
detailed information about the mob if you have force ability.  For those\
that don't have this ability, a scanner can do the same thing. \
 \
You may start a fight by using &YKILL&c, &YMURDER&c, or many powers and\
skills available to players.  The easiest way to start a fight is to\
&YKILL <mob>&c. Currently, you may also &YMURDER <mob>&c, but this causes\
the mob to yell out. \
 \
You may find yourself in trouble during a fight, and wish to leave, this\
can be done by using &YFLEE&c. \
 \
&RSEE ALSO&W: &PKILL, MURDER, WIMPY, RESCUE, AID \
", 
   Level = 1, 
   Keyword = "COMBAT", 
}

HelpEntry
{
   Text = "&WCommando Class\
&c\
The commando class is a new type of class. It does not have its own levels,\
but gives bonuses to a set of classes.  Instead of the 100 levels that a \
normal class gives to its main ability, the commando classes spreads it \
out. Combat gets 50, piloting gets 25, and smuggling gets 25.  \
 \
At the moment, there is only one of these classes. If this type of class is\
in demand, others will follow. New skills with these classes in mind will \
also be added if this type of class is popular. \
 \
Please post any comments you have on this type on the Suggestions boards. \
&W \
Darrik Vequir \
", 
   Level = 1, 
   Keyword = "COMMANDO CLASS", 
}

HelpEntry
{
   Text = ".        &pCombat  Pilot  Engineer  B.Hunter  Smug.  Diplo.  Leader.\
&p--Human    &Y110     65       40        1      56     60      60\
&pWookiee    &Y146     63       50       10      56      4      55\
&pTwi'lek    &Y111     69       44       10      96     32      38\
&p-Rodian    &Y114     71       30       50      56     37      39\
&p---Hutt    &Y103     37       36        1      56     32     104\
&pMonCal.    &Y109     63       58       30      36     70      96\
&pGamorrean  &Y150     55       20        1      56     44      48\
&p---Jawa    &Y110     71       40        1      86     44      49\
&pAdarian    &Y106     63       44        1      36    106      76\
&p---Ewok    &Y106     63       30        1      56     75      57\
&pVerpine    &Y108     65      100        1      36     50      66\
&p--Defel    &Y140     71       34        1      81     30      54\
&pTrando.    &Y137     65       30       30      56     27      49\
&pChadra.    &Y109     71       44        1      56     60      62\
&pQuarren    &Y109     77       42        1      76     40      51\
&pSullustan  &Y 88     95       70        1      66     73      58\
&pFalleen    &Y110     67       42        1      56     72      68\
&pIthorian   &Y110     71       40        1      56     48      59\
&pDevaronian &Y104     71       38        1      56     51      57\
&p--Gotal    &Y110     65       40        1      56     60      60\
&p--Droid    &Y104     51       68        1      36     53      56\
&p-Shista    &Y149     78       20       20      71     40     140\
", 
   Level = 1, 
   Keyword = "COMMANDO_STATS", 
}

HelpEntry
{
   Text = "Syntax: comment write\
Syntax: comment subject <subject>\
Syntax: comment post <player>\
Syntax: comment list <player>\
Syntax: comment read <player> #\
 \
Comment write puts you into the buffer, and the commands work just like\
writing a note.  You may only read and post comments on players currently\
online (works on link-dead players as well).\
", 
   Level = 101, 
   Keyword = "COMMENT", 
}

HelpEntry
{
   Text = "&c\
There are many channels of communication on Rise in Power: \
 \
&RSee also&W: &Psocial quest clantalk ooc yell shout say tell chat auction\
wartalk avtalk newbie emote\
", 
   Level = 1, 
   Keyword = "COMMUNICATION", 
}

HelpEntry
{
   Text = "&CSyntax:&Y compare <object-1> <object-2>\
&CSyntax:&Y compare <object>\
 \
&YCOMPARE&c compares two objects in your inventory.  If both objects are\
weapons, it will report the one with the better average damage.  If both\
objects are armor, it will report the one with the better armor\
class.\
 \
&YCOMPARE&c with one argument compares an object in your inventory to the\
object you are currently wearing or wielding of the same type.\
 \
&YCOMPARE&c doesn't consider any special modifiers of the objects.\
", 
   Level = 0, 
   Keyword = "COMPARE", 
}

HelpEntry
{
   Text = "&CSyntax: &Yconfig + or - &W<&Yoption&W>\
&c\
This command configures some of your character behavior.  Typing &YCONFIG&c\
alone shows you your current settings.  With a plus or minus sign and an \
option, &YCONFIG&c turns that option on or off. \
 \
&CThe options are: \
&Y    AUTOEXIT  &cYou automatically see exits. \
&Y    NORECALL  &cToggle automatic recall if you lose link during combat \
&Y    AUTOLOOT  &cYou automatically loot corpses. \
&Y    AUTOSAC   &cYou automatically sacrifice corpses. \
&Y    AUTOGOLD  &cYou automatically split gold from kills with your group.\
&Y    BLANK     &cYou have a blank line before your prompt. \
&Y    BRIEF     &cYou see brief descriptions only. \
&Y    COMBINE   &cYou see object lists in combined format. \
&Y    PROMPT    &cYou have a prompt. \
&Y    TELNTGA   &cYou receive a telnet GA sequence. \
&Y    NOINTRO   &cToggle whether you see the graphic screen at login \
&Y    GAG       &cToggle whether battle outputs in full or brief form. \
&Y    PAGER     &cToggle how many lines pass before a pause\
&Y    SOUND     &cToggle sound support \
", 
   Level = 1, 
   Keyword = "CONFIG", 
}

HelpEntry
{
   Text = "Toggling the ROOMFLAG option in config will allow you to see\
all the flags which are set ON in a room.  It also causes the\
room number to be displayed to you.  This command is very\
useful when building new areas, as it allows you to see what a\
room already has set.\
", 
   Level = 103, 
   Keyword = "CONFIG +ROOMFLAG", 
}

HelpEntry
{
   Text = "&CSyntax:&Y consider <character>\
 \
CONSIDER &ctells you what your chances are of killing a character.\
Of course, it's only a rough estimate.\
", 
   Level = 0, 
   Keyword = "CONSIDER", 
}

HelpEntry
{
   Text = "State | Description\
-----------------------------------------------------------\
    0 | Player is playing.\
    1 | Player is prompted for his or her name.\
    2 | Player is prompted for his or her password.\
    3 | Player is prompted to confirm his or her name.\
    4 | Player is prompted to select a password.\
    5 | Player is prompted to confirm the password.\
    6 | Player is prompted to select his or her sex.\
    7 | Player is prompted to select a class.\
    8 | Player is reading the message of the day.\
    9 | Player is prompted to select a race.\
   10 | Unused.\
   11 | Player is in the line editor.\
   12 | Player is prompted to select RIP, ANSI or NONE.\
   13 | Player is viewing the title screen.\
   14 | Player is prompted to PRESS ENTER.\
   15 | Player is waiting for authorization (1).\
   16 | Player is waiting for authorization (2).\
   17 | Player is waiting for authorization (3).\
   18 | Player has been authorized.\
", 
   Level = 101, 
   Keyword = "CONSTATES", 
}

HelpEntry
{
   Text = "&CConstitution &Y(CON)&C represents your character's physical stamina, and\
how well he/she can take a hit.  It's your character's toughness.\
 \
&cConstitution also affects:\
\
 * The number of hitpoints regenerated per tick. *\
 \
 * Improvement or worsening of a character's mental *\
 * state, thus affecting general endurance.         *\
 \
 * Increase resistances to stun and poison. *\
 \
 * Increases max combat level. *\
&R&W\
", 
   Level = 1, 
   Keyword = "CONSTITUTION CON", 
}

HelpEntry
{
   Text = "Containers are almost a necessity in the game.  They are used to carry\
items, food, and drinks.  They help allow you to sort things, by using two\
or more types of containers at once.  Corpses use many of the same commands\
as regular containers. \
 \
&YEXAM <container>&c or &YLOOK IN <container>&c allows you to see what it\
contains. \
 \
&YGET <item> <container>&c allows you to take one item from a container.\
&YGET ALL <container>&c allows you to take everything from a container.\
&YGET ALL.<item> <container>&c allows you to take all of a particular item\
 \
&YPUT <item> <container>&c puts an item inside a container. \
&YPUT ALL <container>&c will put as much of your inventory in the container\
as possible, until the container is full.\
&YPUT ALL.<item> <container>&c will put as much of one type of item into\
the container as possible, until the container is full.\
", 
   Level = 1, 
   Keyword = "'CONTAINERS' 'CONTAINER'", 
}

HelpEntry
{
   Text = "A contraband flag has been added for objects .. DO NOT SET IT ... it\
will be added and removed automaticly by customs officers and\
crimelords etc.  Its purpose is to give experience for smuggling\
illegal goods from planet to planet.\
", 
   Level = 100, 
   Keyword = "CONTRA CONTRABAND", 
}

HelpEntry
{
   Text = ".\
Syntax : Calculate (x) (y) (z)\
 \
Cordinates are used for Hyperspace jumps into systems\
Below is a list of last know posistions of planets in \
the current known systems: \
 \
 \
Coruscant System:\
 \
   Menari Spaceport (Coruscant)  -345 -987 1562\
   Outer System Landing Area   902011 -1003651 1100331\
   Coruscant Shipyard    2796 3074 -487\
   MC90 Mon Calamari Starcruiser    (moves)\
 \
Byss System\
 \
   Spaceport Landing Area (Byss)  1325 -1095 3287\
   Star Destroyer Dark Hand    (moves)\
   Byss Shipyard    4534 1211 -3150\
 \
See also Help Cordinates1, Help Cordinates2 ect.\
", 
   Level = 1, 
   Keyword = "COORDINATES", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Calculate (x) (y) (z)\
&c\
Cordinates are used for Hyperspace jumps into systems\
 \
Syntax is completely different. Here are the options.\
&Y \
Calculate <planet/sun> [distance]\
&c  This calculates a course to a planet or sun.\
  How far away depends on the optional second\
  argument.\
&Y\
Calculate <x> <y> <z>\
&c This calculates to a specific set of coords.\
  &WTHIS IS NOT THE SAME COORDINATES AS WHAT YOU\
  USE FOR TRAJECTORY/COURSE!!!\
 \
&RSEE ALSO&W:&P Calculatediff\
", 
   Level = 1, 
   Keyword = "COORDINATES COORDINATE CALC CALCULATE \"NAV COMPUTER\"", 
}

HelpEntry
{
   Text = "Honoghr System :\
 \
   Nystao Port (Honoghr)  3943 4782 4419 \
 \
Tatooine System :\
 \
   Docking bay 92 (Tatooine)  2799 -3279 -4166 \
 \
Adari System :\
\
   System Barren Landing Facility (Adari)  1213 -1813 -4760\
   Lighted Landing Zone (Adari)  1213 -1813 -4760\
   Baituh City Landing Strip (Adari)  1213 -1813 -4760\
\
Endor Starsystem :\
\
   Forest Landing Area (Endors Forest Moon)  1400 7000 -2600\
", 
   Level = 1, 
   Keyword = "COORDINATES1", 
}

HelpEntry
{
   Text = "Core Starsystem 11A3 :\
\
   Small Landing Area (bojklinn)  1000 -1000 -500\
\
Mon Calamari System :\
\
   East Docking Bay (Mon Calamari)  -2709 23 10013\
   West Docking Bay (Mon Calamari)  -2709 23 10013\
   South Docking Bay (Mon Calamari)  -2709 23 10013\
\
Kashyyyk System :\
\
   Rwookrrorro Landing Pad (Kashyyyk)  -8762 -123 -3702\
", 
   Level = 1, 
   Keyword = "COORDINATES2", 
}

HelpEntry
{
   Text = "Corporate Sector I : \
\
   CF-90 Barricade Runner    (moves)\
    Corporate Sector Space Mall (moves) \
\
Gamors System :\
\
   Gamorr Landing Area (Gamorr)  -8723 -2355 86\
\
Yavin :\
\
   Academy Landing Area (Yavin IV)  4000 4000 4000\
\
Ryloth System             None\
Rodia System              None\
Nal Hutta System          None\
Af'el Starsystem          None\
Chad Starsystem           None\
", 
   Level = 1, 
   Keyword = "COORDINATES3", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Corellian\
&CInhabitants &W:&W Human, Drall, Selonian\
&c\
  Homeworld of Han Solo and Garm Bel Iblis, Corellia is located in the \
Corellian System, in the Corellian Sector of the galaxy, somewhere near \
the Core Worlds. It was once a democracy (in the days of Berethon e \
Solo), and reverted temporarily to a monarchy when Korol Solo tried to \
raise himself to kingship. Following his hanging, Corellia returned to \
being a republic (about 250 years before Han was born). Since then, it \
has become an introverted world, keeping mainly to intself and not \
getting involved with outside politics. The planet has a temperate \
ecology, with many large oceans. \
", 
   Level = 1, 
   Keyword = "CORELLIA", 
}

HelpEntry
{
   Text = "&cCorpses last approximately 15 minutes after the time of death. \
Corpse decay will happen even while you are linkdead or after you quit.\
 \
If you know how to skin a corpse, you can take its skin and leave bones\
behind as a warning.\
", 
   Level = 1, 
   Keyword = "CORPSE", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Corulag\
&CInhabitants &W:&W Human\
&c\
    A planet in the Deep Core, located in the Bormea Sector. It is the \
primary planet in the Corulag System, and is a temperate world covered \
with forests and plains. A satellite of the Academy is located in the \
capital city of Curamalle. The planet's economy was maintained because \
of its position, located along the Perlemian Trade Route, as well as \
the presence of the Academy buildings. In many respects, Corulag was \
one of the most cosmopolitan worlds of the Empire. \
", 
   Level = 1, 
   Keyword = "CORULAG", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Coruscant\
&CInhabitants &W:&W Human, (Various)\
&c\
Located at galactic coordinates (0,0,0), this planet in the Core Worlds\
was home to the Old Republic. Most xenoarchaeologists believe that the\
human race evolved on Coruscant, which was also the homeworld of the \
Taung and the Zell races. It was renamed Imperial Center by Emperor \
Palpatine. When the New Republic was born, the planet was renamed to \
Coruscant. Located some 10,000 light-years from the actual galactic \
core, Coruscant had two moons and orbited a small white sun. The \
planet's entire landmass has been covered - over the thousands of \
generations spanning galactic history - by multiple levels of the \
buildings that make up Imperial City. The oceans which once covered \
part of the planet's surface had been drained and stored in vast, \
underground caverns for eventual reuse. Several of these immense \
skyscrapers reach over 6,000 meters into the atmosphere. This means \
that there is little land available for growing food, and no natural\
rivers or lakes to provide water. To solve the dilemma of feeding and\
watering millions of inhabitants, many of Coruscant's architects build\
self-contained ecosystems into their buildings. Engineers have \
developed a series of huge pipes through which polar ice water is \
pumped to the cities. Nearly everything on the planet is recyclable, \
from clothing to packaging and machinery. One problem with a cityworld\
like Coruscant was that it generated incredible amounts of carbon \
dioxide, so atmosphereic dampeners were placed in orbit to reactively\
remove it. It was the center of all the Old Republic's activities, and\
helped describe Galactic Standard time. The Imperial Senate was \
convened there. When Palpatine assumed control of the Senate and the \
rest of the government, he established that Coruscant would remain the\
center of his Empire. He began a massive work effort to shape Coruscant\
to his desires, including installing a large number of surveillance\
systems. Following the Battle of Endor, Mon Mothma moved the New \
Republic onto Coruscant and again re-established the center of the\
Republic there. This came after the planet was liberated from Ysanne\
Isard, and the New Republic overcame the threat of the Krytos virus.\
", 
   Level = 1, 
   Keyword = "CORUSCANT", 
}

HelpEntry
{
   Text = "There are three levels of government: 1. ORGANIZATIONS: The major player\
run superpowers are the New Repubic, The Empire, and The Corperate\
Authority. There are also several small organizations and crime families\
operating independantly. Type CLANS for a list. 2. regional GOVERNMENTS:\
These are small areas that may be controlled and profited from by player\
organizations. They may be captured by organizations with the capture\
command. Type GOVERNMENTS for a list. 3. The SENATE: The senate was\
restored by the New republic shortly after the battle of Endor. It has\
since then broken off its direct ties with the New Republic in order to\
include the council heads from all worlds including Imperial controlled\
worlds. The senate meets monthly at the traditional senate hall on\
coruscant. However because of the difficulty that imperials face flying\
near coruscant a shuttle has been set up that provides safe transportation\
from a nuetral outpost to the Senate hall. The senate hall also has a\
series of opinion booths were council heads can comunicate with their\
people. These opinion booths are also used for electing new council heads.\
Type SENATE for a list of senators.\
 \
See also ORGANIZATIONS\
", 
   Level = 1, 
   Keyword = "COUNCIL COUNCILS SENATE SENATOR GOVERNMENT GOVERNMENTS POWER", 
}

HelpEntry
{
   Text = "&CSyntax: &YCourseactual &W<&Yx&W> <&Yy&W> <&Yz&W> \
&c\
This is the old trajectory/course. It uses the actual \
coordinates, seen as the first set of coordinates in \
radar for a planet or sun. \
 \
&RSEE ALSO&W: &PCOURSE, CALCULATE, RADAR\
", 
   Level = 1, 
   Keyword = "COURSEACTUAL", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Coyn\
&c\
     The fierce, warrior race which was native to the planet Coyn, the \
Coynites stand nearly three meters tall. Their bodies are covered with \
fine fur, which ranged in color from white or gold to brown and black. \
Their heads were crowned by a mane of longer hair, and the length of \
the mane indicated the individual's social status. Coynites are natural \
warriors, and almost always wear some form of battle armor and weapon. \
Xenobiologists have guessed that the average Coynite could live to be \
250 standards years old, but most males died in combat by the time they \
were 55. They hold to a rigid system of ritual and honor codes known as \
the En'Tra'Sol, that governed not only battle but politics. Offworlders \
have been killed for not adhering to this code. The Coynites respected \
and admired the Jedi Knights of the Old Republic, since the Jedi Code \
was similar to the En'Tra'Sol in many respects. One code is known as \
the Cradle Law. \
\
&RAlso Type&W:&Y SHOWSTAT COYNITE\
", 
   Level = 1, 
   Keyword = "COYNITE", 
}

HelpEntry
{
   Text = "SWReality 1.0 is an extention of Smaug which was expanded from Merc\
which was derived from the original Dikumud code.\
 \
SWReality 1.0 copyright (c) 1997, 1998 was created by Sean Cooper\
(specs@golden.net) based on a concept and ideas from the original\
SWReality immortals: Himself (Durga), Mark Matt (Merth), Jp Coldarone\
(Exar), Greg Baily (Thrawn), Ackbar, Satin, Streen and Bib as well as much\
input from our other builders and players.\
 \
DikuMud (c) program and concept by Sebastian Hammer\
(quinn@freja.diku.dk), Michael Seifert (seifert@freja.diku.dk),\
Hans Henrik (bombman@freja.diku.dk), Tom Madsen (noop@freja.diku.dk),\
and Katja Nyboe(katz@freja.diku.dk).\
 \
Merc 2.1 (c) was created by Furey (mec@shell.portal.com), Hatchet\
(hatchet@uclink.berkeley.edu), and Kahn\
(michael@uclink.berkeley.edu).\
 \
Smaug (c) was created by Derek Snider with the help of  Altrag,\
Blodkai, Narn, Haus, Scryn, Rennard, Swordbearer, Gorog, Grishnakh\
and Tricops.\
 \
Star Wars and Star Wars names are the copyright (c) of Lucasfilm Ltd\
and the authors of the many Star Wars related books.\
 \
Quest Code (c) 1996 Ryan Addams\
Ported to SMAUG by Vir of Eternal Struggle\
\
Arena Code by LrdElder 10/24/98\
Bug fixes and modifications to SWRiP by Ulysses\
\
SW: Rise in Power MUD Codebase v1.0 (c) 2001 was created by Mark Miller (\
Darrik Vequir ) with the advice and input of his staff. \
\
see HELP DIKU, HELP SMAUG, HELP MERC, HELP SWREALITY, and HELP SWRIP for\
more detailed credits. \
", 
   Level = -1, 
   Keyword = "CREDITS", 
}

HelpEntry
{
   Text = "Cset is used to set the system's 'control panel' settings.\
Syntax: cset <field> <level>\
Fields: save - saves the control panel settings\
        stun - sets normal (mob vs. player / player vs. mob) stun modifier\
        stun_pvp - as above, for player vs. player\
        dam_pvp - percentage adjustment for player vs. player fighting\
        dam_pvm - as above, for player vs. mob\
        dam_mvp - as above, for mob vs. player\
        dam_mvm - as above, for mob vs. mob\
        get_notake - level to pick up notake flagged items\
        read_all - level to read all mail\
        read_free - level to read mail for free\
        write_free - level to write mail for free (no items necessary)\
        take_all - level to take all mail\
        muse - level to see/use muse channel\
        think - level to see/use think channel\
        log - level to see log channel\
        build - level to see build channel\
        proto_modify - level to modify prototype objects\
        override_private - level to override private/solitary rooms\
        forcepc - level to force pc's\
        saveflag - flags/actions on which to save a pfile (drop, give, get,\
                   receive, auction, zap, death, auction, auto, password)\
        guild_overseer - name of the Overseer of Guilds\
        guild_advisor - name of the Advisor to Guilds\
        permadeath - toggle permadeath\
        can_choose_jedi - can pick jedi at chargen\
        disable_hunger - toggle hunger/thirst system\
        extended_race_selection - enable huge selection of races\
        allow_multiplaying - allow multiplaying\
", 
   Level = 102, 
   Keyword = "CSET", 
}

HelpEntry
{
   Text = ".\
&CSyntax &W:&Y feel 'cure blindness' <target>\
 \
&cCures blindness of the target. \
 \
", 
   Level = 1, 
   Keyword = "'CURE BLINDNESS'", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y feel 'cure light' <target>\
&CSyntax &W:&Y feel 'cure serious' <target>\
&CSyntax &W:&Y feel 'cure critical' <target>\
&CSyntax &W:&Y feel heal <target>\
  \
&cHeals the tagert.  The stregnth of the healing depends on the ability, as\
cure light does very little to heal a wound, wheras \"heal\" can perform \
miracle healings. \
", 
   Level = 1, 
   Keyword = "'CURE CRITICAL' 'CURE LIGHT' 'CURE SERIOUS' HEAL", 
}

HelpEntry
{
   Text = ".\
&CSyntax &W:&Y feel 'cure poison' <target>\
 \
&cRemoves poison from target's blood.\
", 
   Level = 1, 
   Keyword = "'CURE POISON'", 
}

HelpEntry
{
   Text = "&C                 WEARING AND SELLING EQUIPMENT\
&W                -------------------------------&Y\
   WEAR <object> - &cyou will wear that piece of equipment \
&Y\
   WIELD <weapon> - &cyou will wield that weapon \
&Y\
   HOLD <object> - &cyou will hold that object in your hands \
&Y\
   REMOVE (rem) <object> - &cthe object is remove and placed in inventory\
&Y\
   COMPARE (com) <object1> <object2> - &ccompares the value of two items \
&Y\
   REPAIR (repa) <object> - &ca blacksmith will repair your damaged item\
&Y\
   APPRAISE <object> - &ca blacksmith will tell the cost to repair the item\
&Y\
   LIST - &cwhen in a store, the items for sale will be listed \
&Y\
   BUY <object> - &cyou will purchase the item for the given price \
&Y\
   SELL <object> - &cyou will sell the item to the store and receive money\
&Y\
   VALUE <object> - &cstorekeepers will say how much they will pay for item\
", 
   Level = 1, 
   Keyword = "D", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Dagobah\
&CInhabitants &W:&W Dragonsnake, Swampslug\
&c\
     Primary planet in the Dagobah system, this swamp planet was home\
to Yoda. It is located in the Sluis sector. Near the end of the Bpfassh\
Dark Jedi Insurrection, one of the fleeing Dark Jedi hid on Dagobah. No\
one knows what happened to the Dark Jedi, but it is surmised that he \
died there. Furthermore, his knowledge of the Dark Side of the Force\
caused the planet to be bathed in Dark Side energy. This might also\
explain why the Jedi Master Yoda was able to hide on Dagobah during\
Palpatine's purge of the Jedi, since his Light Side strength would have\
been masked by the amount of Dark Side energy on the planet. The \
planet's day lasts 23 standard hours, and its year is 341 local days \
long. \
", 
   Level = 1, 
   Keyword = "DAGOBAH", 
}

HelpEntry
{
   Text = "&cWhen one character attacks another, the severity of the damage is shown\
in the verb used in the damage message.  Here are all the damage verbs\
listed from least damage to most damage: \
&Y \
   barely scratch               scratch                     graze\
   bruise                       hit                         injure\
   wound                        maul                        thrash\
   decimate                     devastate                   maim\
   MUTILATE                     DISEMBOWEL                  EVISCERATE\
   MASSACRE                     OBLITERATE                  ANNIHILATE\
&c\
The message shown will reflect the actual damage you are inflicting on (or\
receiving from) your opponent, and not a specific fixed amount.\
", 
   Level = 0, 
   Keyword = "DAMAGE", 
}

HelpEntry
{
   Text = "DAMAGE          ACTION       CLASS         POWER       SAVES\
none            none         none          none        none\
fire            create       lunar         minor       poison_death\
cold            destroy      solar         greater     wands\
electricity     resist       travel        major       para_petri\
energy          suscept      summon                    breath\
acid            divinate     life                      power_staff\
poison          obscure      death\
drain           change       illusion\
", 
   Level = 101, 
   Keyword = "DAMTYPES ACTTYPES CLASSTYPES POWERTYPES", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Quellii\
&CInhabitants &W:&W Human, Rancor\
&c\
     A planet where the outcasts from the Old Republic were sent to \
die, it is the home of the Rancor, and home to a group of Force-\
sensitive witches who use spells to control The Force. It is located in\
the Quelii system, where Zsinj has established a prison colony and a \
new shipyard. The planet's gravity is somewhat lighter than standard. \
It is full of the Dark Side of The Force, moreso than Dagobah. Han \
'won' the planet from Omogg in a sabacc game; its value is somewhere \
around three billion credits. It has 3 continents in a vast ocean.\
", 
   Level = 1, 
   Keyword = "DATHOMIR", 
}

HelpEntry
{
   Text = "&cDeath is now permanent unless you have made a clone.\
 \
&YNote &C: You lose all posessions upon dying\
       even if you have a clone.  This\
       includes ships, homes, and bank\
       accounts.\
&R&W\
Also see: &PHelp Clone&R&W\
", 
   Level = 0, 
   Keyword = "DEATH DYING", 
}

HelpEntry
{
   Text = ".-------------=======[ Debugging / Coding Credits ]=======-------------.\
|                                                                      |\
|    Most of the extensive debugging and coding of Rise in Power       |\
|    was done by Darrik in his large amounts of free time since he has |\
|    no life.                                                          |\
|                                                                      |\
|     Other credits go out to Ulysses who set aside time in his busy   |\
|     life to help code the big projects that Darrik was too lazy to   |\
|     do. Oh, yeah, and he started this mud way back when :)           |\
`----------------------------------------------------------------------'\
", 
   Level = -1, 
   Keyword = "DEBUG DEBUGGING BUGS THORIC CODING SOURCE CODE DEVELOPMENT", 
}

HelpEntry
{
   Text = "&COrigin: &YAf'El\
 \
&c     Defel are an alien species that appear as large, red-eyed shadows\
under most lighting conditions. For this reason, they are commonly \
referred to as \"Wraiths\". Under ultraviolet light, Defels appear as \
stocky, fur covered bipeds with protruding snouts and long, clawed, triple\
jointed fingers. They stand about 1.3 meters tall, with shoulders as wide\
as 1.2 meters across. \
     This species lives in underground cities on the planet Af'El, where\
most inhabitants make their living through mining and metallurgy.  In the\
galaxy at large, Defel often find employment as hired muscle, spies, and\
assassins due to their shadowy forms. \
 \
&RAlso type&W: &YShowstat Defel\
", 
   Level = 0, 
   Keyword = "DEFEL", 
}

HelpEntry
{
   Text = "parry        dodge      heal       curelight   cureserious   curecritical\
dispelmagic  dispelevil sanctuary  fireshield  shockshield   shield\
bless        stoneskin  teleport   monsum1     monsum2       monsum3\
monsum4      disarm\
\
See MSET and ATTACKS  (Some are not implemented).\
", 
   Level = 101, 
   Keyword = "DEFENSES", 
}

HelpEntry
{
   Text = "Syntax:  deities\
Syntax:  deities <deity>\
 \
The deities command displays all the deities of the world.  Using an\
argument will display the target deity's description.\
 \
SEE ALSO:  supplicate, favor, devote.\
 \
", 
   Level = 10, 
   Keyword = "DEITIES DEITY", 
}

HelpEntry
{
   Text = "Syntax:  deny       <character>\
Syntax:  disconnect <character>\
Syntax:  freeze     <character>\
 \
DENY denies access to a particular player and throws them out of the game.\
 \
DENY is permanent (persists across reboots) and can only be undone offline\
by someone with access to the player files directory.\
 \
DISCONNECT <character> immediately disconnects that character.\
 \
FREEZE <character> is a toggle which prevents a character from issuing any\
commands at all.\
 \
", 
   Level = 101, 
   Keyword = "DENY DISCONNECT FREEZE", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y BANK (deposit|withdraw|ballance) (amount) \
&CSyntax &W:&Y BANK transfer (amount) (person) \
&c\
A bank is the safest place to keep your credits \
people get killed for money quite often in the \
star wars universe. \
 \
&RNote&W:  You most have a comlink for this to work \
", 
   Level = 1, 
   Keyword = "DEPOSIT WITHDRAW BALANCE BANK", 
}

HelpEntry
{
   Text = "Syntax:  destroy <character>\
 \
This command immediately deletes the pfile of the victim, and will\
simultaneously force the character offline if they are connected.\
 \
", 
   Level = 101, 
   Keyword = "DESTRO DESTROY", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y feel 'detect <ability>'\
 \
&CDetect Darkness\
&cPlaces a red aura around those who follow the ways of evil.\
 \
&CDetect Force\
&cPlaces a blue aura around those able to feel the Force.\
 \
&CDetect Intent\
Tells the emotions and general alignment of a being. \
 \
&CDetect Masking\
&cAllows one to see the invisible\
 \
&CDetect Poison\
&cAllows one to detect poisonous objects\
 \
&CDetect Traps\
&cAllows one to foresee trapped objects\
 \
", 
   Level = 1, 
   Keyword = "'DETECT DARKNESS' 'DETECT FORCE' 'DETECT INTENT' 'DETECT MASKING' 'DETECT POISON' 'DETECT TRAPS'", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YDetrap &R&W<&YObject&R&W>\
 \
&cThis skill allows you to try to disarm a trapped object.  Failure will\
usually set off the trap. \
", 
   Level = 0, 
   Keyword = "DETRAP", 
}

HelpEntry
{
   Text = "&COrigin: &YDevaron&R&W\
 \
&c     Devaronians come from the temperate world of Devaron.  Although near\
humanoid in appearnace many feel uncomfortable in their presence, since \
they resemble devils of a thousand myths.  The males are hairless, with a \
pair of horns springing from the tops of their heads and sharp incisors \
filling their mouths.  About two percent of males are born with two sets \
of teeh.  The females are larger, with think fur and no horns.  The males \
have 'galactic wanderlust', the need to always travel, while the females \
prefer to stay at home and keep their advanced industries running.  Their \
language is low, guttural, and full of snarling consonant. \
 \
&RAlso type&W: &YShowstat Devaronian\
", 
   Level = 0, 
   Keyword = "DEVARONIAN DEVARONIANS", 
}

HelpEntry
{
   Text = "&ORace: &YDevaronian\
&OSpecial Abilities: &YNone\
&ORestrictions: &YNone\
 \
&OStr: &Y21 &OInt:&Y 19 &OWis:&Y 21&O Dex:&Y 23 &OCon:&Y 19&O Cha:&Y 17\
 \
&OProfession:\
\
          Combat  Pilot  Engineer  B.Hunter  Smug.  Diplo.  Leader.\
Combat&Y     150     63       63        88      63      63      63&O\
Pilot&Y      46      146      71        71      96      46      46&O\
Engine.&Y    38      58       138       38      38      38      38&O\
B.Hunt&Y     1       1        1         100     1       1       1&O\
Smugg.&Y     6+      26+      31+       6+      106+    6+      6+&O\
Diplo.&Y     51      61       51        51      51      150     101&O\
Lead.&Y      107     57       57        57      57      107     150&O\
 \
", 
   Level = 0, 
   Keyword = "DEVARONIAN_STATS", 
}

HelpEntry
{
   Text = "&CDexterity &Y(dex)&C represents your character's agility and quickness. A\
common concern with dexterity deals with how many items your character can\
carry at once in his/her inventory.  For each additional point of\
dexterity, you gain an additional amount of items you can carry.  A\
character starts off being able to carry 5 items.  One's level also\
affects how many things you can carry. \
 \
&cDexterity also affects:\
 \
 * Improves natural armor class. *\
\
 * Amount of movement points regenerated per tick. *\
 \
 * Chances of success of bash, poison weapon. *\
 \
 * Increases max piloting level. *\
 \
 * Increases max combat level. *\
&R&W\
", 
   Level = 1, 
   Keyword = "DEXTERITY DEX", 
}

HelpEntry
{
   Text = "Syntax:  diagnose of 20\
 \
Diagnose of n - object frequency of top \"n\" objects.  The above example will\
return the 20 most numerous object vnums in the game at that time.\
", 
   Level = 101, 
   Keyword = "DIAGNOSE", 
}

HelpEntry
{
   Text = "To make the special SMAUG powers possible, special dice formula handling\
had to be coded in.  (At least to make it nice).  This dice formula code\
supports full BEDMAS expressions ( ) ^^ / * + -, plus extra mud related\
operators and variables:\
\
D dice         L level          H hit points      M force\
V movement     S strength       I intelligence    W wisdom\
X dexterity    C consitution    A charisma        U luck\
Y age\
 \
See SMAUGSPELLS and SSET.\
", 
   Level = 101, 
   Keyword = "DICEFORMULAS", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YDig\
         Dig &R&W<&YDirection&R&W>\
         &YBury &R&W<&YItem&R&W>\
\
&cYou can dig and bury items through the use of the dig skill and bury\
command.  Buried items are not easily visible to players.  To dig an item\
up, type &Ydig&c with no arguments.  Having a shovel raises your chance\
of success.  If you dig in a direction, you will attempt to dig open an\
exit. \
 \
To bury an item (or corpse), drop the item on the ground and &Ybury\
&R&W<&YItem&R&W>&c.  Depending on the size and weight of the object, you\
might need a shovel.\
 \
Items buried will not last beyond crash or reboot.  Do not attempt to use\
this skill for storage of items you wish to keep.\
", 
   Level = 0, 
   Keyword = "DIG DIGGING BURY BURYING", 
}

HelpEntry
{
   Text = "Realms of Despair was originally based on the Merc 2.1 code which was\
              based on the orignal DIKUMud code created by:\
\
                       The Original DIKUMud Team:\
\
          Katja Nyboe               [Superwoman] (katz@freja.diku.dk)\
          Tom Madsen              [Stormbringer] (noop@freja.diku.dk)\
          Hans Henrik Staerfeldt           [God] (bombman@freja.diku.dk)\
          Michael Seifert                 [Papi] (seifert@freja.diku.dk)\
          Sebastian Hammer               [Quinn] (quinn@freja.diku.dk)\
\
                     Additional contributions from:\
\
 Michael Curran  - the player title collection and additional locations.\
 Bill Wisner     - for being the first to successfully port the game,\
                   uncovering several old bugs, uh, inconsistencies,\
                   in the process.\
\
         And: Mads Haar and Stephan Dahl for additional locations.\
\
  The Original DIKUMud was Developed at the Department of Computer Science\
                     at the University of Copenhagen.\
", 
   Level = -1, 
   Keyword = "DIKU", 
}

HelpEntry
{
   Text = "&cThose who choose to be a diplomat also tend to have high leadership\
abilities as well.  A diplomat's primary skill is mass propaganda, which\
raises or lowers population support considerably.  Diplomats are needed in\
the galaxy to deal with the citizens, and sway their way of thinking.  In\
order to use many diplomatic skills, one must be a part of a clan or\
organization. \
 \
&RAlso see&W: &PHelp Aid\
          Help FirstAid\
          Help Smalltalk\
          Help Bribe\
          Help Propaganda\
          Help Seduce\
          Help MassPropaganda\
 \
&RAlso type&W: &Yshowstat diplomat\
", 
   Level = 0, 
   Keyword = "DIPLOMACY DIPLOMAT", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YDisarm\
\
&R&cThis skill lets you attempt to remove your opponent's weapon using your\
own, forcing them to drop it on the floor.  To use this skill, you\
must also be wielding a weapon.  Can only be used during combat. \
&R&W\
", 
   Level = 1, 
   Keyword = "DISARM", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YDisguise &R&W<&YTitle&R&W>\
 \
&cThis skill allows you to change your title to one that does not include\
your name.  Great for impersonating others.\
 \
&RNote:&r Please keep disguises &YIC&r, if you are unsure, ask an Imm.\
", 
   Level = 1, 
   Keyword = "DISGUISE", 
}

HelpEntry
{
   Text = ".\
&CSyntax &W:Y feel 'dispel dark' <target>\
 \
&cDamages characters aligned with the Dark Side\
 \
", 
   Level = 1, 
   Keyword = "'DISPEL DARK'", 
}

HelpEntry
{
   Text = "Syntax : feel \"dispel force\" <target>\
&G\
Removes any force affecting the victim.\
&w\
", 
   Level = 1, 
   Keyword = "'DISPEL FORCE'", 
}

HelpEntry
{
   Text = "Syntax: dmesg\
\
Displays the contents of the boot log.\
\
", 
   Level = 101, 
   Keyword = "DMESG", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Automatic\
 \
&cThis skill lets you dodge incoming attacks, taking no damage from them. \
Use and refinement of this skill is automatic once you train in it.\
", 
   Level = 0, 
   Keyword = "DODGE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YDominate &R&W<&Ymob&R&W> \
 \
&cAllows you to overpower a mob, and make them follow you and your\
commands.\
 \
&R&WAlso see: &PHelp Order\
", 
   Level = 1, 
   Keyword = "DOMINATE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YDoorbash &R&W<&YDirection&R&W>\
 \
&cUseful for getting rid of locked doors, although some doors are bash\
resistant. \
", 
   Level = 1, 
   Keyword = "DOORBASH", 
}

HelpEntry
{
   Text = "Here is the order of the exits, and their corresponding values:\
\
  ---------------------\
  | Direction | Value |\
  |--------------------\
  | NORTH     |   0   |\
  | EAST      |   1   |\
  | SOUTH     |   2   |\
  | WEST      |   3   |\
  | UP        |   4   |\
  | DOWN      |   5   |\
  | NORTHEAST |   6   | Exits 6 - 10 are relatively new, and may not be\
  | NORTHWEST |   7   | fully supported by all of the code yet.\
  | SOUTHEAST |   8   |\
  | SOUTHWEST |   9   |\
  | SOMEWHERE |  10   |\
  ---------------------\
\
See REDIT, RSTAT and RESETCMDS.\
", 
   Level = 101, 
   Keyword = "DOORDIRS", 
}

HelpEntry
{
   Text = "Syntax : feel 'drain essence' <victim>\
&r\
Drains XP, MANA and HP from victim.\
User gains HP.\
&w\
", 
   Level = 1, 
   Keyword = "'DRAIN ESSENCE'", 
}

HelpEntry
{
   Text = "&CSyntax: &Ydraw \
 \
&cThis will map out the surrounding area and display the results. \
 \
This requires a scanner to be held during use. It will use one  \
charge. \
", 
   Level = 1, 
   Keyword = "DRAW", 
}

HelpEntry
{
   Text = "Syntax:  cast 'dream' <player>  <message>\
 \
This power enables you to cast a dream or message on a sleeping player.\
", 
   Level = 1, 
   Keyword = "'DREAM'", 
}

HelpEntry
{
   Text = "&COrigin: &YVarious \
 \
&c     Droids are artifically intelligent beings built by various species,\
for various uses.  They range in shape, model, and design, but most are\
either humanoid in appearance or squat, cylindrical bodies topped by a\
domed swiveling head.  They are all designed to perform one duty or\
another, ranging from astromechs to protocol droids.  Most of them are\
associated with mechanical devices or computer systems in one way or\
another.  Majority of droids are loyal to their master without a single\
rebellious thought in their programmed minds, but there has been rumors of\
droids with their own free will, although it is rare.\
 \
&RAlso Type&W: &Yshowstat Protocol\
           showstat Gladiator \
           showstat Assassin\
           showstat Astromech\
           showstat Interrogation\
", 
   Level = 0, 
   Keyword = "DROID DROIDS", 
}

HelpEntry
{
   Text = "&gRace: &YDroid\
&gSpecial Abilities:&Y Infrared, Aqua Breath\
&gRestrictions: &YCombat Penalty\
 \
&gStr:&Y 20&g Int:&Y 24&g Wis:&Y 21&g Dex:&Y 18 &gCon:&Y 16&g Cha:&Y 21 \
 \
&gProfession:\
 \
          Combat  Pilot  Engineer  B.Hunter  Smug.  Diplo.  Leader. \
Combat&Y     150     54       54        79      54      54      54&g \
Pilot&Y      26      126      51        51      76      26      26&g \
Engine.&Y    68      88       150       68      68      68      68&g \
B.Hunt&Y     1       1        1         60      1       1       1&g \
Smugg.&Y     1+      6+       11+       1+      86+     1+      1+&g \
Diplo.&Y     53      63       53        53      53      150     103&g \
Lead.&Y      106     56       56        56      56      106     150&g \
 \
", 
   Level = 0, 
   Keyword = "DROID_STATS", 
}

HelpEntry
{
   Text = "&BYou are now able to upgrade your droid player for the price of half a\
million credits per level. There is a maximum of 75 levels able to be\
added to your droid's memory. Consider it a memory limit. To have this\
done, politely request an admin or above to work with your character.&w \
", 
   Level = 1, 
   Keyword = "DROID_UPGRADES", 
}

HelpEntry
{
   Text = "&CSyntax&W:&Y  drop <object> \
         drop <amount>  credits \
&CSyntax&W:&Y  get  <object> \
         get  <object>  <container> \
&CSyntax&W:&Y  give <object>  <character> \
         give <amount>  credits <character> \
&CSyntax&W:&Y  put  <object>  <container> \
&CSyntax&W:&Y  get/put/drop   <# amount>  <object> \
&CSyntax&W:&Y  get/put        <# amount>  <object> <container> \
 \
DROP&c drops an object, or some credits, on the ground. \
&Y\
GET&c takes an object, either lying on the ground, or from a container, or\
even from a corpse (&YTAKE&c is a synonym for get). \
&Y\
GIVE&c gives an object, or some credits, to another character.\
&Y\
PUT&c puts an object into a container.\
 \
Use '&Ydrop/get/put all&c' to reference all objects present. \
Use '&Ydrop/get/put all.object&c' to reference all objects of the same\
name. \
&C\
Examples:&Y\
 - drop 1000 coins\
 - get all.ball backpack\
 - get 5 sword\
 - put 15 potion backpack\
", 
   Level = 0, 
   Keyword = "DROP GET GIVE PUT TAKE", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YAutomatic\
\
&R&cThis skill allows you to wield two weapons simultaneously.  The higher\
the skill, the more times you will use the weapon in your offhand.\
", 
   Level = 1, 
   Keyword = "'DUAL WIELD'", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Malastare\
&c\
     This alien race resembles a small horse, although it is completely \
hairless. The Dug have leathery, grey skin and small, beady eyes. They \
can easily walk on their hind legs, their forelegs, or all fours. They \
used their four hands to help them move through the trees of their \
homeworld of Malastare. Much of their language is punctuated with \
knuckle rapping and foot stomping. Dugs became the sworn enemies of the \
Gran when a group of Gran established a settlement on Malastare. They \
fought viciously for many years before the Old Republic intervened. \
Unfortunately for the Dugs, the Republic ruled in favor of the Gran, \
and the Dugs were pushed to the fringes of Malastare's economy. Dug \
society became insular, and they turned into self-congratulatory \
braggarts. \
 \
&RAlso Type&W:&Y SHOWSTAT DUG\
", 
   Level = 1, 
   Keyword = "DUG DUGS", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Duro\
&c\
     A humanoid race characterized by their blue skin, red eyes and \
long, thin faces. There is no nose on their face. They are a calm, \
peaceful race (although the Star Wars Screen Entertainment software \
claims that they are reckless innature) and are considered dependable \
workers and gifted storytellers. Their society was formed many \
millennia before the Galactic Civil War, and was very advanced \
technologically. Most Duros are interested in space travel, and are \
employed in one of the many industries that deal in travel between the \
stars. Those Duros who remain near their homeworld work for one of the \
many starship construction facilities that orbit the planet Duro. Many \
of the Duros found off-planet are graduates of the Duro Academy of Deep \
Space Exploration, and can navigate a hyperspace jump with limited star \
charting. During the Galactic Civil War, the Duros were ostensibly \
loyal to the Empire, although the Empire established observation \
centers at many starship yards to keep an eye on them. During the \
Yuuzhan Vong invasion of the galaxy, many Duros felt that the New \
Republic was too lax in its defense against the alien invaders, and \
several Duros claimed that the galaxy would have been better prepared \
to defend itself if Emperor Palpatine had still been in power. \
 \
&RAlso Type&W:&Y SHOWSTAT DUROS\
", 
   Level = 1, 
   Keyword = "DUROS", 
}

HelpEntry
{
   Text = "Chidee La Maak\
Lai Nootka\
Jenssar So Billes \
Jiuk'chtna \
Jivis\
Kalend Thora\
Kandar\
Kir Vantai\
Krudar\
Kuuda De Nall\
Hes Glillto\
", 
   Level = 0, 
   Keyword = "DUROS_NAMES", 
}

HelpEntry
{
   Text = "&C                  GROUPING WITH OTHER PLAYERS\
&W                 -----------------------------&c\
If another character is following your character, you have the ability \
to group with that character.  However, you cannot joint he group of a \
character you're following unless they bring you in themself.  When you \
are grouped with another player, you attack mobs together and share the \
experience for each kill. \
&C \
Group Commands:\
&Y\
  FOLLOW <player>&c - you will follow that player so long you are with them\
                  - to remove yourself from group type:&Y FOLLOW SELF \
 \
  GROUP <player>&c - you add that player to your group \
                 - typing &YGROUP&c alone will list those in your group \
                 - to remove someone from group use &YGROUP <player name>\
&c                 - to disband the group, type &YGROUP DISBAND \
 \
  GTELL <message>&c - you tell the group a message \
&Y\
  SPLIT <amount>&c - splits the credits among the group \
", 
   Level = 1, 
   Keyword = "E", 
}

HelpEntry
{
   Text = "Syntax : feel earthquake\
\
Damages all players in the room on the ground.\
", 
   Level = 1, 
   Keyword = "EARTHQUAKE", 
}

HelpEntry
{
   Text = "&CSyntax&W:&Y  drink <object> &c- drink liquid from a drink container)\
&CSyntax&W:&Y  eat   <object> &c- eat food or a magical pill)\
&Y         eat   <object> <container> &c- eat from a container)\
&c\
Drink instructs your character to drink from a fountain or a drink container\
to alleviate thirst.\
 \
Eat instructs your character to eat an item of food or a magical pill (which\
function in a similar fashion as potions); pills do not fill stomach space.\
 \
When you are hungry or thirsty (you will see messages at each tick that\
tell you if you are starving or dying of thirst, and can check your\
current state with either 'score' or 'oldscore'), you will not regain\
hitpoints, movement points or force back as rapidly as if you were well\
fed and hydrated.\
 \
If you stay hungry or thirsty too long and you are not an Avatar, your\
mental state will begin to suffer.  Your combat skills will be affected,\
your coordination will suffer and you may begin to either hallucinate or\
become depressed.  Eating, drinking and a little rest will solve this\
problem after a short period of time.\
 \
", 
   Level = 0, 
   Keyword = "EAT DRINK", 
}

HelpEntry
{
   Text = "Syntax:  echo  <message>\
Syntax:  recho <message>\
 \
ECHO sends a message to all players in the game, without any prefix\
indicating who sent it. \
 \
RECHO sends a message to all players in your room, without any prefix\
indicating who sent it.\
", 
   Level = 101, 
   Keyword = "ECHO RECHO", 
}

HelpEntry
{
   Text = ".\
The following 16 colors are supported in the commands echo, recho,\
mpecho, mpechoat and mpechoaround.\
\
_whi  White\
_yel  Yellow\
_blu  Blue\
_dbl  Dark Blue\
_lbl  Light Blue\
_cya  Cyan (sort of turquoise)\
_gre  Green\
_dgr  Dark Green\
_cha  Charcoal (grey)\
_dch  Dark Charcoal (dark grey)\
_pur  Purple\
_red  Red\
_ora  Orange\
_bro  Brown\
_pin  Pink\
_bla  Black\
\
  If the indicator is preceded by an asterisk, the message will blink.\
\
recho _red              This is an example of recho in red.\
recho *red              This is an example of recho in blinking red.\
mpecho _yel             This is an example of mpecho in yellow.\
mpe _yel                This is an example of mpecho in yellow.\
mpechoat $n _blu        This is an example of mpechoat in blue.\
mea $n _blu             This is an example of mpechoat in blue.\
mpechoaround $n _bro    This is an example of mpechoaround in brown.\
mer $n _bro             This is an example of mpechoaround in brown.\
 \
You only need to enter as much of the color indicator as required to\
uniquely identify it.\
 \
mpe _r                  This is an example of mpecho in red.\
 \
", 
   Level = 101, 
   Keyword = "ECOLOR ECOLOUR", 
}

HelpEntry
{
   Text = "Each area will initialize (on bootup of the mud) with a pool of gold based\
on the area's range and the wealth of each mob in that area.\
 \
The shopkeepers and thieves will automatically deposit gold into the economy\
if they are carrying more than a certain amount (the higher the level of the\
shopkeeper, the greater they will carry before depositing).\
 \
To allow mobprogs to be created to manipulate area economies, making them\
interactive and interdependent, there are two mpcommands:  mpdeposit, and\
mpwithdraw (see related helpfiles).  There is also an 'if economy' ifcheck.\
 \
The aset command can also be used to adjust an area's economy by hand\
(example:  aset <area filename> low_economy <amount>, this will give\
the specified area a minimum economy at the level you set).\
 \
Mobs will not repop with more gold than what they were originally created\
with, but if the area economy runs low they will begin to repop with less\
until the economy is replenished (as they all share the same gold pool).\
 \
Use foldarea to make changes to an area's economy with aset permenent.\
 \
See ASET, FOLDAREA\
", 
   Level = 101, 
   Keyword = "ECONOMY", 
}

HelpEntry
{
   Text = "The SMAUG Editor is used when you're writing mail, notes, your bio,\
description or other long bodies of text. The commands in the editor are:\
\
/? [command]     Displays editor help in general, or about a command.\
/l [line range]  Lists the current contents of the note.\
/c               Clears the current contents of the note.\
/d <line>        Delete line.\
/g <line>        Goto line. This is useful for inserting lines,\
                 deleting and fixing lines, etc.\
/i <line>        Insert line. Inserts a new blank line where specified.\
/r <old> <new>   Global replace text.\
/a               Abort editing. No changes you made are kept.\
/! <command>     Execute mud command. '/! smile' sends the smile\
                 command, without exiting the editor.\
/s               Save buffer, and exit the editor.\
/p               Print information about the current editing session.\
", 
   Level = 1, 
   Keyword = "EDITOR", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YEliteGuard\
 \
&cThis skill allows you to call an elite guard to your location.  Elite\
guards act like posted guards, but are much stronger and experienced.\
", 
   Level = 1, 
   Keyword = "'ELITE GUARD' ELITEGUARD", 
}

HelpEntry
{
   Text = "&CSyntax&W:&Y emote <action>\
&CExample&W:&Y emote leans forward and glares at Silphion\
&COutput&W:&Y Darrik leans forward and glares at Silphion.\
 \
EMOTE &cis used to express emotions or actions.  Besides &YEMOTE&c,there\
are several dozen built-in social commands, such as &YCACKLE&c, &YHUG&c,\
And &YTHANK&c.  The acronym for &YEMOTE&c is &Y, <action>&c\
\
&CExample&W: &Y, leans forward and glares at Silphion\
 \
&RAlso type&W: &Ysocials\
", 
   Level = 1, 
   Keyword = "EMOTE SOCIAL ,", 
}

HelpEntry
{
   Text = "&CSyntax&W:*Y  empty <container> \
&CSyntax&W:&Y  empty <container> <container> \
&c\
This command allows you to empty a container of its contents. \
 \
Use &Yempty <container>&c to dump the contents to the ground. \
 \
Use &Yempty <container> <container>&c will empty the contents of the first\
container into the second container.\
", 
   Level = 0, 
   Keyword = "EMPTY", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Endor\
&CInhabitants &W:&W None\
&c\
     This silvery gas giant planet, located in the Moddell Sector, was\
orbited by nine moons, including the Forest Moon of Endor. It was not\
located near any hyperspace node, and required a fairly complex series\
of jumps in order to get there. \
", 
   Level = 1, 
   Keyword = "ENDOR", 
}

HelpEntry
{
   Text = "&cThose who choose to be engineers have access to many useful skills, but\
it is a very tedious job.  They are capable of making extremely powerful\
weapons as well as armor.  There are few engineers in the galaxy, but\
those who are, find it very profitable.  Engineers are the only ones that\
can use fake signal. \
\
&R&WAlso see:&P Help Makecontainer\
          Help Makecomlink\
          Help Makeflashlight\
          Help \"Ship Maintenance\"\
          Help Makeblade\
          Help \"Spice Refining\"\
          Help Makeshield\
          Help Makearmor\
          Help Makejewelry\
          Help Makelandmine\
          Help Makeblaster\
          Help Makegrenade\
          Help \"Fake Signal\"\
 \
&RAlso type&W:&Y showstat engineering\
", 
   Level = 0, 
   Keyword = "ENGINEER ENGINEERING", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YAutomatic \
\
&R&cThis skill increases the damage you inflict in combat.  The higher it\
is, the more often you will receive that bonus.\
", 
   Level = 0, 
   Keyword = "'ENHANCED DAMAGE'", 
}

HelpEntry
{
   Text = "&CSyntax&W:&Y  enter\
&CSyntax&W:&Y  leave\
&c\
In rooms either 'somewhere' exits or exits responding only to keywords,\
you can simply type 'enter' or 'leave' to pass through that exit.\
", 
   Level = 0, 
   Keyword = "ENTER LEAVE", 
}

HelpEntry
{
   Text = "Syntax: equipment\
Syntax: inventory\
\
EQUIPMENT lists your equipment (armor, weapons, and held items).\
INVENTORY lists your inventory.\
", 
   Level = 0, 
   Keyword = "EQ INV EQUIP EQUIPMENT INVENTORY", 
}

HelpEntry
{
   Text = "&cWhile in combat, you may notice that your equipment is taking damage. \
For example, you may see \"Your lifebane gets damaged.\"  Each time this\
happens, the AC of the item is damaged by one.  If the AC on an item is 5,\
after it is damaged more than five times it will be destroyed or scraped.\
If you wish to preserve the equipment, you must repair it by taking it to\
the a blacksmith.\
 \
&RNOTE&W: Not all equipment can be repaired.\
 \
&RSee also&W:&P REPAIR\
", 
   Level = 1, 
   Keyword = "EQDAMAGE", 
}

HelpEntry
{
   Text = "&COrigin: &YEndor\
 \
&c     The native race to Endor.  Ewoks grow to be about 1 meter tall and\
are primitive two-legged furry creatures.  They are tribal and still use\
primitive weapons, like sling shots and bow and arrows, but their keen \
understanding of their environment and keen teamwork give Ewoks skills \
that just cannot be equaled, even by the most technologically advanced \
species.  Ewok religion focuses around the giant conifer trees in whith\
they habitate.  Each village plants a seedling for every new ewok born and\
nurture it as it grows.  Each ewok is linked to his or her totem tree, and\
believe when they die, their spirit goes to live in their special tree. \
Curious by nature, they are prone to getting into trouble.  Their \
appearance makes them cute and charming to most other species, and ewoks \
use this to their advantage.  It's wise note to underestimate them for \
they are a clever species.  They also love to hear stories and are very \
musical. \
 \
&RAlso type&W: &YSHOWSTAT EWOK \
", 
   Level = 0, 
   Keyword = "EWOK EWOKS", 
}

HelpEntry
{
   Text = "&CSyntax&W:&Y look\
&CSyntax&W:&Y look    <object>\
&CSyntax&W:&Y look    <character>\
&CSyntax&W:&Y look    <direction>\
&CSyntax&W:&Y look    <keyword>\
&CSyntax&W:&Y look in <container>\
&CSyntax&W:&Y look in <corpse>\
&CSyntax&W:&Y examine <container>\
&CSyntax&W:&Y examine <corpse>\
 \
LOOK&c looks at something and sees what you can see. \
&Y\
EXAMINE&c is short for &YLOOK container&c \
    followed by &YLOOK IN container&c. \
", 
   Level = 0, 
   Keyword = "EXAMINE LOOK", 
}

HelpEntry
{
   Text = "The redit exflags <dir> [flag] ... command accepts the following flags:\
ISDOOR        | There is a door in that direction\
CLOSED        | The door is closed\
LOCKED        | The door is locked\
SECRET        | The door is a secret door\
SWIM        * | Must be able to swim to go that way (or have a boat or float)\
PICKPROOF     | Door is pickproof\
FLY           | Must be able to fly to go that way\
CLIMB         | Must be able to climb to go that way\
DIG           | Passage is blocked and must be dug out\
NOPASSDOOR    | Door is resistant to the passdoor power\
HIDDEN        | Door is not \"obvious\" -- doesn't appear with autoexits\
CAN_CLIMB     | Can use the climb command to go this way\
CAN_ENTER     | Can use the enter command to go this way\
CAN_LEAVE     | Can use the leave command to go this way\
AUTO          | Keyword can be typed to go this way\
SEARCHABLE    | Searching in this direction can remove the SECRET flag\
WINDOW        | Cannot go through this exit (doesn't appear with autoexits)\
\
* Not yet implemented\
", 
   Level = 101, 
   Keyword = "EXFLAGS", 
}

HelpEntry
{
   Text = "The 'redit exit' command is used to create, modify and remove exits in a room.\
For more than one exit in the same direction see ADVANCEDEXITS.\
\
The syntax of the 'redit exit' command is as follows:\
redit exit <direction> [vnum] [exit-type] [key] [keyword(s)]\
direction: one of: n, s, e, w, u, d, ne, nw, se, sw or ?\
vnum     : the room number in which the exit leads to.\
exit-type: a number detailing the exit -- has a door, open/closed/locked etc.\
key      : a number corresponding to a key object which can unlock the door.\
keywords : keywords used to refer to the door, (or exit).\
\
If only 'redit exit <direction>' is specified, the exit will be removed.\
The 'key' field is optional when specifying keywords.  All other fields are\
required previous to the field desired.\
\
Examples:\
redit exit n 3001           - Creates an exit north to room 3001\
redit exit n 3001 3 gate    - Changes the exit north to have a closed \"gate\"\
redit exit n 3001 3 15 gate - Changes the gate to allow use of a key vnum 15\
redit exit n                - Removes the north exit\
\
See EXITTYPES for generating the exit-type value.\
", 
   Level = 101, 
   Keyword = "EXITMAKING", 
}

HelpEntry
{
   Text = "&CSyntax&W:&Y exits\
&c\
Tells you the visible exits of the room you are in.  Not all exits are\
visible. You can use the 'bump' technique to find hidden exits.  (Try to\
walk in a certain direction and see what you bump into).\
", 
   Level = 0, 
   Keyword = "EXITS", 
}

HelpEntry
{
   Text = "These are the currently valid exit-types:\
      0 - Plain exit\
      1 - Door exists         (Required to be closed or locked)\
      2 - Door is Closed\
      4 - Door is Locked\
      8 - Door is Secret      (Trying to go that way won't reveal door)\
     32 - Door is Pickproof   (Door can't be picked by power or skill)\
     64 - Need to be able to fly to go that way\
    128 - Need to be able to climb to go that way\
   1024 - Door is Passdoor proof\
\
NOTE: You must ADD the values together to generate an exit-type:\
        3 = a closed door\
        7 = a closed and locked door\
       11 = a closed secret door\
       15 = a closed, locked and secret door\
\
-- Use the 'redit exflags' command to change these flags, and to set the\
   advanced exit flags, most of which are not shown above.\
\
See EXFLAGS and EXITMAKING.\
", 
   Level = 101, 
   Keyword = "EXITTYPES", 
}

HelpEntry
{
   Text = "&CSyntax&W:&Y  level\
&c\
Your character advances in power by gaining experience.  Type &YLEVEL&c to\
see how many experience points you'll need for the next few levels.\
 \
&CYou gain experience by:&c\
    inflicting damage upon an opponent \
    being part of a group that kills an opponent \
    succeeding while learning a skill or a power through real world usage\
 \
&CYou lose experience by:&c\
    fleeing from combat\
    recalling out of combat\
    being the target of some powers (energy drain, etc.)\
    dying\
 \
The experience you get from a kill depends on several things:  how many \
players are in your group; your level versus the level of the monster;\
your alignment versus the monster's alignment and some random variation.\
 \
Your last 25 kills are recorded.  Each time you kill a creature that has\
been one of your last 25 kills you will receive less and less exp for it.\
The creature will also learn from its experience with you over time; if\
its intelligence is higher than your own it will begin to gain an\
advantage over you in combat.\
", 
   Level = 0, 
   Keyword = "EXPERIANCE LEVEL XP EXP", 
}

HelpEntry
{
   Text = "&C                        COMMANDS FOR COMBAT\
&W                       ---------------------&Y\
   KILL <mob> &cyou begin to attack the mob (you need only type once)\
&Y\
   FLEE &cyou attempt to flee from the fight \
&Y\
   FEEL <force power>&c you use the power (see &PHELP <power>&c for more)\
&Y\
   GLANCE <mob or player> &ctells you how wounded the target is \
&Y \
   CONSIDER (con) <mob> &cgives you an idea on how tough the mobile is \
&Y\
   LEVEL &cshows you how many experience points you need till next level\
&Y\
   WIMPY <number> &cif your hitpoints go under that number, you flee combat\
&Y\
   CONFIG +/-FLEE &cyou do/don't flee when attacked \
&Y\
   RESCUE <player> &cyou replace a player in a fight \
&Y\
   SHOVE <player> <direction> &ca player is shoved in a given direction \
&Y\
   DRAG <player> <direction> &ca sitting player is moved that direction \
", 
   Level = 1, 
   Keyword = "F", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YUsed with Request \
 \
&cFake signal enables you to 'request' a ship to open it's hanger bays,\
even when you do not have a pilot for them.\
 \
&RNote: &YFake Signal &ris a level 105 engineering skill. \
\
&RAlso see&w: &PREQUEST\
", 
   Level = 1, 
   Keyword = "'FAKE SIGNAL' FAKE SIGNAL", 
}

HelpEntry
{
   Text = "&COrigin: &YFalleen \
 \
&c     The Falleen are reptilian in ancestry, with scales, cold blood, and\
skin that can change color according to their mood.  A Falleen's lung \
capacity is great, and they are able to stay underwater for up to twelve \
hours.  Coolly calculating beings, the Falleen are considered among the \
most beautiful of all humanoid races.  In addition, both males and females\
have enhanced hormones, exuding a pheromone that makes them practically \
irresistible to the opposite sex. \
 \
&RAlso Type&W: &YSHOWSTAT FALLEEN \
", 
   Level = 0, 
   Keyword = "FALLEEN", 
}

HelpEntry
{
   Text = "Syntax : feel farsight <victim>\
\
Gives a room description of victims location.\
", 
   Level = 1, 
   Keyword = "FARSIGHT", 
}

HelpEntry
{
   Text = "Syntax : feel fatigue <victim>\
\
Makes victim more susceptable.\
", 
   Level = 1, 
   Keyword = "FATIGUE", 
}

HelpEntry
{
   Text = "Syntax : feel feebleness <victim>\
\
Makes victim more susceptable.\
", 
   Level = 1, 
   Keyword = "FEEBLENESS", 
}

HelpEntry
{
   Text = "When naming files, follow this convention:\
* Areas should have the extension .are (though areas have their own\
directory, when areasare modified they are moved to the building\
directory, so it is best to have an\
extension).\
* Planets should have no extension (planets have their own\
directory).\
* Starsystems should have the extension .system (starsystems share the\
space directory with ships).\
* Ships should have the extension .ship (see starsystems for reason).\
* Clans should have no extension (clans have their own directory).\
Avoid using fullstops in file names, but use underlines (_) or dashes (-)\
instead.\
", 
   Level = 101, 
   Keyword = "FILENAMES", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y fill <drincon>\
&CSyntax &W:&Y fill <container>\
 \
&YFILL&c can be used with drink containers, regular containers or pipes.\
 - to fill a drink container, go to a fountain and &Yfill <drinkcon> \
&c - to fill a container such as a backpack with items from the ground,\
   type &Yfill <container>   \
", 
   Level = 0, 
   Keyword = "FILL", 
}

HelpEntry
{
   Text = "Syntax : feel fireball <victim>\
\
Sends a fireball at victim.\
", 
   Level = 1, 
   Keyword = "FIREBALL", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Firrerre\
&c\
   Tall humanoids native to the planet Firrerre, they beings have \
unique striped hair, nictitating mebranes covering their eyes, and \
golden skin which turns silver when scarred. They possessed limited \
spacefaring technology, and had only recently perfected sublight travel \
when Hethrir convinced them to head for nearby planets while being held \
in hibernation. Those that were placed on the colony ships are the only \
surviving Firrerreo, because Hethrir later turned the planet over to \
the Empire, which destroyed the ecosystem with a biological weapon. \
Hethrir had been raiding the colony ships for slaves over the years, \
until his death at the hands of the being Waru. The Firrerreo have strong\
clan affiliations, and a fair amount of Force sensitivity. \
 \
&RAlso Type&W:&Y SHOWSTAT FIRRERREO\
", 
   Level = 1, 
   Keyword = "FIRRERREO", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YFirstAid &R&W<&YPlayer&R&W>\
         &YFirstAid self\
 \
&cFirstAid, along with a medpac, allows you to heal minor damage to\
yourself, or another character.\
 \
&RSee also&W:&P AID\
", 
   Level = 1, 
   Keyword = "'FIRST AID' FIRSTAID MEDPAC", 
}

HelpEntry
{
   Text = "Syntax:  fixchar <character>\
 \
Resets a character's saving throws and mentalstate.  Should probably\
not be done while the character is equipped.\
", 
   Level = 0, 
   Keyword = "FIXCHAR", 
}

HelpEntry
{
   Text = "&YOn ships:\
&BBacta - 100,000\
&BHotel - 100,000\
Home - 100,000\
Hidden or Locked Door - 100,000\
Fountain/sink - 50,000\
Hanger - 500,000\
Passworded Doors (cap only) - 500k\
Ration Dispensor (cap only) - 1m\
 \
&OPlayer homes:\
&cBacta - 75,000\
 \
&W&zNote: Bacta costs an additional\
100k for every 100 hp restored.\
 \
&cStorerooms:\
&RShip: 125,000\
&RHome: 100,000\
\
 \
&R&WNotes:\
Player homes are no longer being added to fighters \
or midships.\
 \
Government boards <NR and Imperial> may not be added \
onto non-aligned ships. No civilian ships may have\
government boards on them.\
 \
To rename your ship, there's a new command 'renameship' \
to be used at the normal upgrade site for ships.\
", 
   Level = 1, 
   Keyword = "FLAGPRICES", 
}

HelpEntry
{
   Text = "Syntax: feel 'flamestrike' <victim>\
\
This power inflicts damage on the victim.\
", 
   Level = 0, 
   Keyword = "FLAMESTRIKE", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YFlee \
&R&CSyntax &R&W: &YRescue &R&W<&YPlayer&R&W> \
\
&R&cOnce you start a fight, you can't just walk away from it.  If the fight\
is not going well, you can attempt to &Yflee&R&c, or another character can\
try to &Yrescue&R&c you, thereby taking the hits for you.\
 \
If you lose your link during a fight, then your character will keep\
fighting, or flee, depending on your settings in config.\
 \
&RAlso see&W:&P CONFIG\
", 
   Level = 0, 
   Keyword = "FLEE RESCUE", 
}

HelpEntry
{
   Text = "Syntax: feel 'float' <character>\
 \
This power enables the target character to float.  It is useful in saving\
mv (movement points), makes a character float slowly to the ground when\
falling from in the air, and allows you to move over water and through the\
air.\
 \
Some water areas require the use of float to prevent damage from drowning.\
If you are in an area and your movement suddenly begins to drop, then you\
begin losing hps <hitpoints>, you should cast float immediately.\
", 
   Level = 1, 
   Keyword = "FLOAT", 
}

HelpEntry
{
   Text = "Syntax:  cast 'fly' <character>\
 \
This power enables the target character to fly.  It is useful in saving\
mv (movement points), preventing a character from falling when in the\
air, moving over water or through the air, and in preventing an opponent\
from tripping you.\
 \
Some water areas require the use of fly to prevent damage from drowning.\
If you are in an area and your movement suddenly begins to drop, then you\
begin losing hps <hitpoints>, you should cast fly immediately.\
", 
   Level = 0, 
   Keyword = "FLY", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YFocusStrength\
 \
&cThis skill allows you to focus your energy, increasing your strength for\
a period of time. During this time, you can carry more, and hit harder.\
", 
   Level = 1, 
   Keyword = "'FOCUS STRENGTH' FOCUSSTRENGTH", 
}

HelpEntry
{
   Text = "Syntax:  foldarea <area filename>\
Syntax:  foldarea all\
\
This command is used to save a live (non-prototype) area file, usually after\
it has been modified.  It should be used with extreme care.\
 \
See ASET and INSTALLAREA.\
", 
   Level = 101, 
   Keyword = "FOLDAREA", 
}

HelpEntry
{
   Text = "&CSyntax: &Yfollow &W<&YCharacter/NPC&W>\
&c\
'Follow' starts you following another character.  \
To stop following, type 'follow self'. \
 \
 \
&RSee Also: &WGROUP\
", 
   Level = 105, 
   Keyword = "FOLLOW", 
}

HelpEntry
{
   Text = "Syntax:  for <argument> <command>\
Syntax:  for <argument> <command> <target>\
 \
For allows an immortal to perform a command at or even on a large\
number of targets.  The arguments include:  all, mobs, gods.\
 \
Example:  for gods gl, you will 'glance' in the room of every god\
who is online (include link-dead)\
 \
You can also perform an action on the argument target.\
Example:  for mobs poke #, you will perform the 'poke' social on\
every mob in the game.\
 \
'For' does not override private flags.\
", 
   Level = 101, 
   Keyword = "FOR", 
}

HelpEntry
{
   Text = "Syntax:  force <victim> <command>\
Syntax:  force all <command>\
 \
Force forces one mob or character to execute a command.\
 \
FORCE 'all' forces _all_ everywhere in the game to execute a command,\
typically used for 'force all save'.\
 \
Note that the level required to use force on mobs can be different\
than the level required to use force on players, and can be adjusted\
via 'cset' (see 'help cset').\
 \
", 
   Level = 101, 
   Keyword = "FORCE", 
}

HelpEntry
{
   Text = "Syntax : feel 'force blast wrath'\
\
Require THREE people and causes heavy damage to all in the room,\
and then blinds everyone, including casters.\
", 
   Level = 1, 
   Keyword = "'FORCE BLAST WRATH'", 
}

HelpEntry
{
   Text = "Syntax : feel 'force bolt' <victim>\
\
Sends a bolt of force at the victim.\
", 
   Level = 1, 
   Keyword = "'FORCE BOLT'", 
}

HelpEntry
{
   Text = "Syntax : feel 'force bubble'\
Syntax : feel 'force shield'\
\
Creates a force bubble/shield that lowers AC and increase resistance.\
", 
   Level = 1, 
   Keyword = "'FORCE BUBBLE' 'FORCE SHIELD'", 
}

HelpEntry
{
   Text = "Syntax : feel 'force funnel' <victim>\
\
Makes victim more susceptable.\
", 
   Level = 1, 
   Keyword = "'FORCE FUNNEL'", 
}

HelpEntry
{
   Text = "&bForce Imbue (Dark Side, Light Side) \
 \
&p&w     Imbue is a sacrificial roleplaying device. It is another way \
for Jedi and Dark Jedi masters to suicide and save a life or pass on \
their energy by death. When Imbue is used on another character who does\
not have any ability in the force, it will fully restore them to life \
and also give them extra hitpoints from tight bonding with the force. \
Consider it a suicidal way to heal another person. When Imbue is used on\
a student of the force (force level 5+) the student is able to absorb \
the energy given. The student gains no HP, but does advance their max \
force level and also raises their mana level to a corosponding amount. \
Permission to use this power will rarely be given, especially not to \
someone who simply wishes to suicide their forcer and give a friend a \
gift and use their clone. On this not note, be aware that the forcer who\
sacrifices themselves for the player recieving, will lose the chance of\
force capable clones. Also, if one is aiding a dying comrade, it must not\
be due to a mob. It must be entirely player related. For imbuing between\
two forcers, both players must be of the same alignment. \
", 
   Level = 1, 
   Keyword = "'FORCE IMBUE'", 
}

HelpEntry
{
   Text = "Syntax : feel 'force lightning' <victim>\
\
Sends bolts of lightning into victim.\
", 
   Level = 1, 
   Keyword = "'FORCE LIGHTNING'", 
}

HelpEntry
{
   Text = "Syntax : feel 'force sight'\
\
Allows user to see in the dark.\
", 
   Level = 1, 
   Keyword = "'FORCE SIGHT'", 
}

HelpEntry
{
   Text = "Syntax : feel 'force spray' <victim>\
\
Cause minor damage to victim.\
", 
   Level = 1, 
   Keyword = "'FORCE SPRAY'", 
}

HelpEntry
{
   Text = "Syntax: forceclose <descriptor>\
\
This command will force a certain descriptor to close.\
This is useful to disconnect connections that aren't really connected\
due to a poor TCP connection.\
\
It can also be used to forceclose a connection before a potential\
problem player can even get to the authorization state of connection.\
\
See USERS, CONSTATES and DISCONNECT.\
", 
   Level = 101, 
   Keyword = "FORCECLOSE", 
}

HelpEntry
{
   Text = "&cThe entire forcers system has been reset. Force able characters are\
expected to RP properly. This means Dark Jedi are not out to save the\
galaxy, and Light Jedi are not murdering fiends. For those of you new to\
the SW Universe, Jedi are the protectors of justice and the innocent. Dark\
Jedi are a more open class, because, although any action they do is\
ultimately self benifiting, it may well aid an evil or good cause. Forcers\
will no longer learn from mobs past the level of 5. Once a Dark/Light Jedi\
passes their fifth level, they must turn to more experienced forcers under\
the following system. \
&pMasters (Force max of 90-120)\
&WKnight and Learners may be taught by masters.\
&WMasters may teach a maximum of three students.\
 \
&YKnights (Force max of 30-89)\
&WKnights may take on a single apprentice.\
 \
&RLearners (Force max of 1-29)\
&WLearners may practice under Masters or Knights.\
 \
&GNOTES- There are NO Sith in this time period.\
         Jedi may not join the Empire.\
         Dark Jedi may join any group.\
         RP correctly your forcer correctly, or\
         your force will be removed. No excuses.\
", 
   Level = 1, 
   Keyword = "FORCERS", 
}

HelpEntry
{
   Text = "&BLight Jedi RP&c\
 - Jedi may enter any order/clan except the Empire without\
   approval of the Admins\
 - Jedi entering service/training within the Empire must seek \
   admin approval \
 - Jedi act only in defense \
 - Jedi are not to provoke attacks \
 - Jedi are not to purposefully cause trouble, lest they are sided \
   with a clan \
 \
&RDark Jedi RP&W&c \
 - Being a Dark Jedi is not a license to kill \
 - Dark Jedi are interested in self profit or profit for the Dark \
   Side of the Force \
 - Dark Jedi may, with proper RP, innitiate an attack \
 - Dark Jedi cause trouble to suit their moods, or their profit \
 - Clanned Dark Jedi may attack, without warning, as long as \
   commanded to do so by their clan's hierarchy \
 - Dark Jedi may join ANY group, without approval of the admins \
 \
&RRemember, your RP determines if you keep your force. Improper RP \
will bring about the removal of your force. So do nothing brash, or \
act without thinking about the consequences before hand. \
", 
   Level = 1, 
   Keyword = "FORCE_RP", 
}

HelpEntry
{
   Text = "Syntax : feel forethought\
\
Increases wisdom for a limited period.\
", 
   Level = 1, 
   Keyword = "FORETHOUGHT", 
}

HelpEntry
{
   Text = "Syntax:  formpass <new password> <character name>\
Example: formpass temporary Joseph\
                                       \
Used to help in changing a character's password if they have forgotten or\
misplaced their own.\
 \
This command will return the encrypted form of the specified password for\
the specified character name.  Password and character name are case\
sensitive, and the character name _must_ be capitalized.  The resulting\
encrypted password must then be pasted into the character's pfile offline\
by someone with access to player files.\
 \
", 
   Level = 101, 
   Keyword = "FORMPASS", 
}

HelpEntry
{
   Text = "Syntax:  fquit <character>\
 \
Can be used by low-level imms to force a level 1 player to quit the game,\
for example if the player is accidentally authorized or is causing problems\
and there are no higher immortals around to deal with the problem.  Fquit\
does not work on any player higher than level 1.\
 \
", 
   Level = 101, 
   Keyword = "FQUIT", 
}

HelpEntry
{
   Text = "&CForce stat &Y(FRC)&C represents your character's ability in the force. \
It stays invisible to players throughout their lifetime.  You never truly\
know how strong you are in the force.  This is another stat that cannot be\
raised by any trainer. \
&R&W\
", 
   Level = 1, 
   Keyword = "FRC", 
}

HelpEntry
{
   Text = "&C                       COMMUNICATION COMMANDS \
&Y                      ------------------------&Y \
CHAT message &ceveryone can hear this message \
&Y \
TELL player message&c only that player will see your message \
&Y \
ASK/ANSWER message &cfor asking and answering questions \
&Y\
EMOTE message &cthis prints Your name message on the screen \
&Y \
QUEST message &cchannel used for questing players \
&Y\
REPLY message &csends a messages to the last person who sent you a tell \
&Y \
SAY message &cthe message is only heard by the people in the room \
&Y\
SHOUT message &cmessage is only heard by people who are awake \
&Y\
YELL message &cmessage is only heard by people in the area \
&Y\
CLANTALK, ORDERTALK, AND GUILDTALK &cchannels for clans, guilds, and orders\
&Y\
&RAlso see&W:&P LANGUAGES, NOTES, and MAIL \
", 
   Level = 1, 
   Keyword = "G", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Opoku\
&CInhabitants &W:&W Gamorrean\
&c\
     This planet is the homeworld of the Gamorreans. It has a varied \
but temperate climate and ecology. The planet's poles are covered with \
frozen tundra, while the equator is covered with deep forests and \
jungles. The average day on Gamorr lasts 28 standard hours, and its \
year lasts 380 local days. There are very few large settlements on the \
planet, and the largest are controlled and populated by entire clans of \
powerful females. \
", 
   Level = 1, 
   Keyword = "GAMORR", 
}

HelpEntry
{
   Text = "&COrigin: &YGamorr \
 \
&c     A pig-like brutish race with green skin and snouts, small horns, and\
upturned tusks.  They average in height of about 1.8 meters.  They make \
excellent heavy laborers and mercenaries due to their raw strength. \
Gamorreans are known for their irrational violent tendencies.  Their \
native world is the planet Gamorr.  The females handle most of the work \
load, while the males constantly train for war and fight.  They live in \
clans headed by matrons who order the males to fight from early spring to \
the late fall.  Often hired as personal bodyguards, Gamorreans are even \
hired as bounty hunters on occasion. \
 \
&RAlso type&W: &YShowstat Gamorrean \
", 
   Level = 0, 
   Keyword = "GAMORREAN", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Gand\
 \
&c     A species of sentient life that has developed in the gases of the\
planet Gand. Able to survive in the various gases, they require special\
breathing apparatus in order to survive in oxygen-based atmospheres. \
The lungs of the Gand are quite efficient, able to utilize nearly 85 \
percent of the atmosphere they breathe in with each breath. The Gand \
have developed a totalitarian monarchy, and various colonies of Gand \
live in pockets of mist in the gas giant's atmosphere. When renegade \
Gand are sought, findsmen are sent out to locate them. When the Empire\
overran the planet, the findsmen were presented with advanced \
technology with which to hunt their targets. The better findsmen became\
bounty hunters. The Gand hold their names in great reverence. A Gand \
who has accomplished nothing in his life is simply known as \"Gand.\" \
When a Gand completes a task, they are given their family's surname. A\
further accomplishment provides the Gand with a proper name. Pronouns\
are almost never used, and are reserved for those famous Gand who have\
accomplished so much that their deeds are known by all. If a Gand does\
something to be ashamed of, or causes offense to another Gand, their \
name is reduced. It was discovered, after the Galactic Civil War, that\
the Gand have certain regenerative properties. \
&RAlso Type&W:&Y SHOWSTAT GAND\
", 
   Level = 1, 
   Keyword = "GAND", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YGatherIntelligence <Player> \
 \
&cThis skill will attempt to retrieve information about a character, such\
as their location, skill focus, organization they belong to, and others.\
It takes time to use, and will only work on players. \
", 
   Level = 1, 
   Keyword = "'GATHER INTELLIGENCE' GATHERINTELLIGENCE", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y getcredits\
&c\
After a vendor has sold your items, you can claim the money earned by\
typing the &YGETCREDITS&c command.  Keep in mind, this only works if\
someone has actually bought something. \
", 
   Level = 102, 
   Keyword = "GETCREDITS", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Various\
&c\
     Any droid which is programmed for armed combat in a controlled \
setting (such as an arena). It is programmed to fight to the death with \
its opponent. They were popular late in the Old Republic, when decadent \
and lawless activities began to get overlooked. \
 \
&RAlso Type&W:&Y SHOWSTAT GLADIATOR DROID\
", 
   Level = 1, 
   Keyword = "GLADIATOR DROID 'GLADIATOR DROID'", 
}

HelpEntry
{
   Text = "&Csyntax &W:&Y glance\
&Csyntax &W:&Y glance <victim>\
&c\
Glance alone shows you only the contents of the room you are in, \
eliminating the description.  &YGlance <victim>&c shows only the health\
condition, eliminating their description and equipment from your \
screen. \
 \
Glance may be abbreviated as &Ygl&c. \
", 
   Level = 1, 
   Keyword = "GLANCE", 
}

HelpEntry
{
   Text = "&Csyntax &W:&Y gold\
 \
Displays the current total credits you are carrying.\
", 
   Level = 1, 
   Keyword = "GOLD", 
}

HelpEntry
{
   Text = "Syntax : feel 'good fortune' <target>\
\
Increase hitroll and improves saving roll against the force.\
", 
   Level = 1, 
   Keyword = "'GOOD FORTUNE'", 
}

HelpEntry
{
   Text = "&COrigin: &YAntar Four \
 \
&c     A Gotal is any member of the intelligent, technologically advanced,\
bipedal species from the moon called Antar Four.  They have two cone \
shaped growths rising from their heads, flat noses, protruding brows, and\
shaggy gray fur.  The head cones serve as additional sensory organs, able\
to pick up and distinguish different forms of energy waves.  Most other \
species feel uncomfortable around Gotals because of their additional \
senses.  For their part, Gotals do not like droids due to the high energy\
output they give off, which tends to overload the Godals' senses.  They \
have a hard time interpreting the emotions of other alien species, often\
mistaking affection for love and anger for hatred.  They make excellent\
scouts, bounty hunters, trackers, and mercenaries, though they tend to try\
to remain neutral in galactic conflicts. \
 \
&RAlso type&W:&Y SHOWSTAT GOTAL\
", 
   Level = 0, 
   Keyword = "GOTAL GOTALS", 
}

HelpEntry
{
   Text = "Syntax: goto <location>\
\
GOTO takes you to a location.  The location may be specified as a vnum,\
as the name of a mobile, or as the name of an object.\
\
If the location is a vnum, and it does not already exist, and it is within\
your room vnum range; it shall be created for your to edit further with\
REDIT.\
\
You may not GOTO a room if it is PRIVATE and has two (or more) characters\
already present, or if it is SOLITARY and has one (or more) characters\
already present.\
\
See REDIT.\
", 
   Level = 101, 
   Keyword = "GOTO", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Kinyen\
&c\
     A race of three-eyed humanoids native to the planet Kinyen, the \
Gran have tan skin. Their eyes are set out away from their heads on \
thick stalks, and they have large ears. Their eyes are adapted for \
seeing into the visible spectrum as well as the infrared spectrum. They\
evolved from a herbivorous species, and have two stomachs to digest \
their food. The females have three breasts, which they use to suckle \
their young. In general, Gran are peaceful and hospitable, and no \
conflicts have been noted in their 10,000 year history. They are \
strongly attached to their families and their race in general; all Gran\
mate for life, with the survivor usually dying of a broken heart hortly\
after its mate's death. Their infrared sight allows the Gran to detect\
their companion's emotional state. The Gran race was hesitant to join\
the galactic community of the Old Republic, fearing that they would \
become diluted by huge distances. They remained isolated from the \
Republic, for the most part, and the Old Republic respected their \
wishes. After the birth of the New Order, the Gran organized peaceful\
protests against Palpatine's rule. However, they were quickly \
subjugated by the Empire. On their own, the Gran developed space travel,\
and have developed a healthy trade route with the Herglics. \
 \
&RAlso type&W:&Y SHOWSTAT GRAN\
", 
   Level = 1, 
   Keyword = "GRAN", 
}

HelpEntry
{
   Text = ".               _________________      ____         __________\
 .       .    /                 |    /    \\    .  |          \\\
     .       /    ______   _____| . /      \\      |    ___    |     .   \
             \\    \\    |   |       /   /\\   \\     |   |___>   |\
           .  \\    \\   |   |      /   /__\\   \\  . |         _/          \
 .     ________>    |  |   | .   /            \\   |   |\\    \\_______    \
      |            /   |   |    /    ______    \\  |   | \\           |\
      |___________/    |___|   /____/      \\____\\ |___|  \\__________|   \
  .     ____    __  . _____   ____      .  __________   .  _________\
       \\    \\  /  \\  /    /  /    \\       |          \\    /         |      \
        \\    \\/    \\/    /  /      \\      |    ___    |  /    ______|  .\
         \\              /  /   /\\   \\ .   |   |___>   |  \\    \\\
   .      \\            /  /   /__\\   \\    |         _/.   \\    \\      \
           \\    /\\    /  /            \\   |   |\\    \\______>    |   .\
            \\  /  \\  /  /    ______    \\  |   | \\              /      \
 .       .   \\/    \\/  /____/      \\____\\ |___|  \\____________/  \
\
                                                         *** REALITY ***\
\
Star Wars: Rise in Power\
based on SWReality 1.0 by Sean (Durga the Hutt) Cooper -\
specs@golden.net\
Original SMAUG 1.0 written by Thoric (Derek Snider) with help from \
Altrag, Blodkai, Narn, Haus, Scryn, Swordbearer, Rennard, Tricops and Gorog.\
Original MERC 2.1 code by Hatchet, Furey, and Kahn. Original DikuMUD code by:\
Hans Staerfeldt, Katja Nyboe, Tom Madsen, Michael Seifert && Sebastian Hammer\
Star Wars and Star Wars names are a copyright of Lucasfilm ltd.\
\
 \
Please enter your name:\
", 
   Level = -1, 
   Keyword = "GREETING", 
}

HelpEntry
{
   Text = "&Csyntax &W:&YArm (grenade)\
&c\
This skill allows you to arm grenades, before using them. \
Ussually combined with the throw skill. \
 \
&RSee also&W:&P MINES, THROW\
", 
   Level = 1, 
   Keyword = "GRENADES", 
}

HelpEntry
{
   Text = "&cThis skill is automatic, once practiced.  The skill causes you to grip\
your weapon tightly as someone tries to disarm you, making it far more \
difficult to successfully disarm you.  This skill will only increase as\
you are engaged in fights where someone is attempting to disarm you. \
&RSee also&W:&P DISARM\
", 
   Level = 1, 
   Keyword = "GRIP", 
}

HelpEntry
{
   Text = "&cGroup members share experience from kills, and may use the &YGTELL&c and\
&YSPLIT&c commands.  If anyone in your group is attacked, you will \
automatically join the fight. \
 \
A character can also leave your group by using the &Yfollow self&c command,\
in which case they will both leave your group and stop following you. \
 \
&RSee also&W:&P GTELL SPLIT GROUPSYNTAX FOLLOW\
", 
   Level = 0, 
   Keyword = "GROUP", 
}

HelpEntry
{
   Text = "Syntax : feel \"group masking\"\
\
Masks all those in your group (including you).\
", 
   Level = 1, 
   Keyword = "'GROUP MASKING'", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Ygroup <argument>\
 \
&YGroup <character>&c adds someone who is following you into your group, \
making them a group member. \
 \
&YGroup <character>&c will remove someone who is already in your group from\
your party.  Removing the character from the group does not stop them from\
following you, however. \
 \
&YGroup&c with no argument shows statistics for each character in your\
group. \
 \
&YGroup all&c groups all eligible players following you in the room. \
 \
&YGroup disband&c allows a leader to disband his group (members stop\
following  and are ungrouped). \
 \
&RSee Also&W: &PFOLLOW \
", 
   Level = 1, 
   Keyword = "GROUPSYNTAX", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y gtell <message>\
&CSyntax &W:&Y say   <message>\
&CSyntax &W:&Y tell  <character> <message>\
&c\
All of these commands send messages to other players. &YGTELL&c sends a\
message \
to all of the characters in your group, wherever they are, even if they are\
sleeping or stunned or dying.  '&Y;&c' is a synonym for &YGTELL&c. \
 \
&YSAY&c sends a message to all awake players in your room.  The single\
quote '&Y'&c' is a synonym for &YSAY&c. \
 \
&YTELL&c sends a message to one awake player anywhere in the world. \
 \
&YREPLY&c sends a message to the last player who sent you a &YTELL&c.\
&YREPLY&c will work even if you can't see the player, and without revealing\
their identity.  This is handy for talking to invisible or switched\
immortal players. \
", 
   Level = 0, 
   Keyword = "GTELL ; REPLY SAY TELL '", 
}

HelpEntry
{
   Text = "&CSyntax &YGuard [on/off]\
&c\
For capital ships only.  This sets a planetary guarding program. The ship\
will not move from its current location unless under direct control.\
 \
&RNOTE: &wGuard is a level 30 command. \
 \
&RSEE ALSO&W:&P AUTOPILOT\
", 
   Level = 1, 
   Keyword = "GUARD", 
}

HelpEntry
{
   Text = "&C                  COMMANDS FOR GENERAL INFORMATION\
&W                 -----------------------------------&Y\
  WIZLIST &cshows a list of all the immortals\
&Y\
  AREAS &clists of areas and their level ranges\
&Y\
  COMMANDS &clists all the commands available\
&Y\
  SCORE &cwill show the stats on your character\
&Y\
  SOCIALS &clists the socials available to you\
&Y\
  TIME &cgives the mud time\
&Y\
  WEATHER &ctells you what the weather is like\
&Y\
  WHO &cshows all the people playing at the time\
&Y\
  CLANS &clists the names of different primary organizations in SWR\
", 
   Level = 1, 
   Keyword = "H", 
}

HelpEntry
{
   Text = "Syntax: hail\
or:     hail <ship name> <message>\
 \
The hail command has two different uses:\
1. To hail a speederbike to take you to a hotel where you can quit (see\
help quit)\
2. To communicate with another ship while in space.\
In the latter use, ship name is obviously the name of the ship and the\
message is the message you wish to be sent.\
", 
   Level = 1, 
   Keyword = "HAIL", 
}

HelpEntry
{
   Text = "Syntax : feel 'hand of darkness' <victim>\
\
Cause heavy damage to target.\
", 
   Level = 1, 
   Keyword = "'HAND OF DARKNESS'", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Hapan\
&CInhabitants &W:&W Human\
&c\
    Originally settled by a group of pirates called the Lorell Raiders,\
the planet Hapes later became a neutral system when the Jedi Knights \
wiped out the Raiders when they started making raids into Old Republic\
supply centers. The surviving women swore never to let a man run the \
government following this defeat. The system was later overrun by the\
Empire, but Ta'a Chume (the Queen Mother at the time) built a powerful\
armed forces and drove the Imperial out. The Hapans are known for their\
belligerence. The planet orbits the star Hapes, and has been the seat \
of the Hapan government for as long as anyone can remember. The planet\
has seven moons. The light from these moons, as well as from the star\
Hapes, has caused the natives to lose much of their ability to see at\
night. The average day on Hapes lasts 22 standard hours, and the year\
on Hapes encompasses 240 local days. \
", 
   Level = 1, 
   Keyword = "HAPES", 
}

HelpEntry
{
   Text = "Syntax: feel \"harden\"\
 \
Improves constitution and hit points for a limited period.\
 \
Dark Jedi Spell\
", 
   Level = 1, 
   Keyword = "HARDEN", 
}

HelpEntry
{
   Text = "Syntax : feel harm <victim>\
\
Causes damage to victim.\
", 
   Level = 1, 
   Keyword = "HARM", 
}

HelpEntry
{
   Text = "Syntax:  hedit [help topic]\
 \
This command allows you to edit a help topic.  If the specified help topic\
does not exist, it will be created for you.  The default help page (summary)\
will be selected if you do not specify a page.\
 \
NOTE - Always, when creating a new help entry, type Help <new entry name>\
       prior to creating your entry. A pre-existing help file associated\
       with that keyword may already exist.\
&Y\
Colors &wcan now be added to help files using the same command set that changes\
a player prompt.  &bMultiple &Ycolor &wcombinations can be set on a given line\
including ^bbackground^x colors.  However, there are a couple of quirks to take\
note of:\
&Y\
    1) If the first line of your help file containers a color code and you are\
       experiencing a display problem with the file, use a . to begin the file.\
    2) Color changes should be separated by at least one character.  Example:\
       '&&Y.^^r' will work, '&&Y^^r' may cause problems.\
 \
See HSET, PCOLORS.\
", 
   Level = 101, 
   Keyword = "HEDIT", 
}

HelpEntry
{
   Text = "|--------------------------------------|--------------------------------------|\
|                MOVEMENT              |                 GROUP                |\
| north east west south northeast exit |  follow group gtell ; split          |\
| northwest southeast southwest sleep  |--------------------------------------|\
| rest sit wake stand somewhere unlock |               INFORMATION            |\
| lock open close scan scry look leave | death CR reimb rules damage commands |\
| up down enter climb where fly float  | areas experience score title weather |\
|--------------------------------------| channels description experience note |\
|              CONFIG OPTIONS          | who wizlist story tick MOTD news bug |\
| autoloot autogold telnetga autoexit  | mail time password slist report typo |\
| nice flee norecall blank combine rip | powers skills weapons languages idea |\
| nointro prompt ansi autosac shovedrag|--------------------------------------|\
|--------------------------------------|               COMMUNICATION          |\
|                 OBJECTS              | social quest clan ordertalk guildtalk|\
|  get put  drop give  sacrifice hold  | say tell chat question answer auction|\
|  wield  wear remove  inventory value | avatar shout yell counciltalk newbie |\
|  appraise list  buy sell  equipment  |--------------------------------------|\
|  recite  quaff zap  brandish compare |                COMBAT                |\
|  empty fill  eat drink  examine pick |kill flee wimpy rescue aid murder cast|\
|--------------------------------------|--------------------------------------|\
Also see help on: !, save, quit, pagelength, and practice.\
To use the help menu, just type \"help <topic>\".\
To see help on individual areas, you can now type \"help <full area name>\".\
If you are new to the game, type HELP NEWBIE to see a special help series.\
", 
   Level = 101, 
   Keyword = "HEIGHTENED", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YHeightenedAccuracy\
 \
&cThis skill allows you to focus your energy to increase your accuracy. It\
raises your hitroll for a limited period.\
", 
   Level = 1, 
   Keyword = "'HEIGHTENED ACCURACY' HEIGHTENEDACCURACY", 
}

HelpEntry
{
   Text = "Syntax : feel 'heightened awareness'\
\
Allows user to detect characters sneaking around.\
", 
   Level = 1, 
   Keyword = "'HEIGHTENED AWARENESS'", 
}

HelpEntry
{
   Text = ".\
Syntax : HeightenedStrength\
 \
 Increase your hitroll for a short time.\
", 
   Level = 1, 
   Keyword = "'HEIGHTENED STRENGTH' HEIGHTENEDSTRENGTH", 
}

HelpEntry
{
   Text = "Syntax: hell <character> <number> <hours or days>\
Syntax: unhell <character>\
 \
The hell command sends a character to hell for a given period of time.  It\
automatically releases the character when their time has been served.  Upon\
being helled, the character receives the message, \"The immortals are not \
pleased with your actions.  You shall remain in hell for <time period>.\"\
 \
Hell takes arguments of either hours or days.  To hell someone for 3 hours,\
\"hell <character> 3 hours.\"  To hell someone for three days, \"hell <character>\
3 days\".  Hell will default to hours if hours or days is not specified.\
\
To release a player from hell early, simply \"unhell <character>\".  \
", 
   Level = 101, 
   Keyword = "HELL UNHELL", 
}

HelpEntry
{
   Text = "&cYou may look up help files under many subjects:\
\
          MOVEMENT                  GROUP\
\
           CONFIG                INFORMATION\
\
          OBJECTS               COMMUNICATION\
\
           COMBAT\
\
To use the help menu, just type \"help <topic>\".  \
If you are new to the game, type HELP NEWBIE to see a special help series.\
You can also type hlist to get a list of ALL help topics. \
\
&RAlso see: &W!, save, quit, pagelength, and practice. \
", 
   Level = 0, 
   Keyword = "HELP", 
}

HelpEntry
{
   Text = "SWreality Building Pg 5\
", 
   Level = 101, 
   Keyword = "HELP BUILD5", 
}

HelpEntry
{
   Text = "SWreality Building Pg 6\
", 
   Level = 101, 
   Keyword = "HELP BUILD6", 
}

HelpEntry
{
   Text = "SWreality Building Pg 7\
", 
   Level = 101, 
   Keyword = "HELP BUILD7", 
}

HelpEntry
{
   Text = "SWreality Building Pg 8\
", 
   Level = 101, 
   Keyword = "HELP BUILD8", 
}

HelpEntry
{
   Text = "SWreality Building Pg 9\
", 
   Level = 101, 
   Keyword = "HELP BUILD9", 
}

HelpEntry
{
   Text = "To edit/make a help file there are some basic and yet confusing\
commands\
necessary.  So here we go...\
hedit <helpfile>\
hset level 1 <helpfile>\
hset keyword \"<word list>\" <helpfile>\
hset save <helpfile>\
", 
   Level = 101, 
   Keyword = "HELPFILE FILE HELPFILES", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YHijack\
 \
&cThis skill lets you \"borrow\" other people's ships.  Must be used in the\
cockpit of a ship. \
", 
   Level = 1, 
   Keyword = "HIJACK", 
}

HelpEntry
{
   Text = "Syntax: hitall\
 \
", 
   Level = 1, 
   Keyword = "HITALL", 
}

HelpEntry
{
   Text = "Syntax: hlist <low level range> <high level range>\
 \
This command will give you a listing of available help files. The list\
is in alphabetical order based on the first triggering keyword. While\
this command was initially designed as a maintenance tool to help us\
track help files, it is also available to players so that they can\
capture a listing of the help files available to them. \
 \
Note - You may only view help files that are coded for viewing by your\
       level or lower.\
 \
Note - The list of help files is quite extensive, and the command does\
       not as yet have a way to filter/shorten the list. Screen capture\
       is, at present, your only recourse.\
 \
", 
   Level = 1, 
   Keyword = "HLIST", 
}

HelpEntry
{
   Text = "Syntax:  hold   <object>\
Syntax:  remove <object>\
Syntax:  remove all\
Syntax:  wear   <object>\
Syntax:  wear   all\
Syntax:  wield  <object>\
 \
Three of these commands will cause you to take an object from your inventory\
and use it as equipment:\
 \
HOLD is for lights, wands and staves; WEAR is for armor; WIELD is for weapons.\
 \
You may not be able to HOLD, WEAR, or WIELD an item if its alignment does not\
match yours, if it is too heavy for you, or if you are not experienced enough\
to use it properly.\
 \
WEAR ALL will attempt to HOLD/WEAR/WIELD each suitable item in inventory.\
 \
REMOVE will take an object from your equipment and place it into inventory.\
 \
REMOVE ALL will remove all your equipment and place it into inventory.\
 \
", 
   Level = 0, 
   Keyword = "HOLD REMOVE WEAR WIELD", 
}

HelpEntry
{
   Text = "Syntax: holylight\
Syntax: invis\
\
HOLYLIGHT is a toggle that allows you to see (almost) every character and\
mobile in the game.  With holy light, you can see what's in the game more\
easily.  Without holy light, you can see what mortal players see.\
\
INVIS is a toggle which makes you completely invisible to all player characters\
of lower level than you, and to all mobiles.\
\
When an immortal is INVIS, they will have a flag on the who list which \
indicates their level of invisibility, such as (51) for INVIS 51.  A \
similar flag will also appear when you 'LOOK' in a room - this flag will \
say (Invis 51).\
\
HOLYLIGHT will not allow you to see immortal INVIS characters who are\
higher level than you.\
", 
   Level = 101, 
   Keyword = "HOLYLIGHT INVIS", 
}

HelpEntry
{
   Text = "syntax: homepage <url>\
 \
example: homepage http://www.idirect.com/test.html\
 \
If you have a web page somewhere, you can use the homepage\
command to show people a link to that page whenever they\
select the 'see who's on' link from the Realms of Despair\
home page.\
 \
To remove your homepage setting, type 'homepage clear'.\
", 
   Level = 10, 
   Keyword = "HOMEPAGE", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Honoghr\
&CInhabitants &W:&W Noghri\
&c\
     This once-lush paradise of a planet is the homeworld of the \
Noghri, and was virtually unknown until it was nearly devastated \
following a starship battle in its orbit. The Emperor, upon discovering \
the Noghri, conceived of a plot to enslave Noghri, with the help of \
Darth Vader. The huge space battle took place above the planet, and one \
of the ships was destroyed. It plummeted to the planet's surface, \
setting off earthquakes and releasing toxic chemicals into the \
atmosphere. When Vader arrived to offer aid, the Noghri readily \
accepted, and made Vader their Lord and Savior. However, Palpatine had \
arranged that the decon droids sent to the planet would continue to \
poison it by planting modified kholm grass. This modified grass would \
choke out all other vegetation, while making it appear that the planet \
could still support life.\
 \
", 
   Level = 1, 
   Keyword = "HONOGHR", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Hoth\
&CInhabitants &W:&W Wampa, Tauntaun\
&c\
     This snow planet is the sixth planet in the Hoth system, located \
in the Ison Corridor. It orbits a distant, blue-white star, and has \
three natural satellites. Just outside the orbit of Hoth is a huge \
asteroid belt, which is believed to be the result of the collision of \
two planets eons ago. Its remote location made it the perfect site for \
an Alliance base three years after the Battle of Yavin. It orbits its \
star inside a treacherous belt of asteroids, making any approach to the\
planet very hazardous. Many smaller asteroids get pulled in by Hoth's \
gravity, and rain down on the planet as meteors. The planet's normal\
daytime temperature was some thirty-degrees below zero, and its\
high-\
velocity wind and snow storms make it extremely inhospitable. Hoth has\
a fair amount of seismic activity, which is constantly changing the \
various ice formations and creating vast, natural ice caves and \
tunnels. It is for these reasons that Alliance Major Kem Monnon chose\
it for Echo Base. Its harsh, frozen climate has given rise to only two\
major lifeforms, the Wampa ice creature and the tauntaun. Small \
rodents, wirelike ice worms, and hardy lichens complete a minimal \
foodchain. \
", 
   Level = 1, 
   Keyword = "HOTH", 
}

HelpEntry
{
   Text = "This is an abbreviation for hit points.  All classes begin with 20 hp\
at creation and gain between 6 and 19 hp per gained level, depending on\
class, race and CON.  Equipment can also add to your total hp.\
", 
   Level = 1, 
   Keyword = "'HP'", 
}

HelpEntry
{
   Text = "&pHuman Replicant Droid:\
 \
&YOnly assassin droids will be allowed to roleplay as HRDs, and even\
then only with the express permission of a Head Admin. Gladiator droids\
and protocol droids and the like will not be allowed to.\
", 
   Level = 1, 
   Keyword = "'HRD' 'HUMAN REPLICANT DROID'", 
}

HelpEntry
{
   Text = "Syntax:  hset  <command> [value] [help topic]\
 save                            Saves all help pages (to help.are)\
 level <level> <help topic>      Sets help topic to specified level\
 keyword <keyword> <help topic>  Sets help keyword to specified keyword\
 remove <level.><help topic>     Removes the specified help page\
 \
Note:  If you wish to set more than one keyword to a help topic, enclose all\
       the keywords, space separated inside quotes.  (Like in powercasting)\
Note:  If you have instances of multiple help files with the same keyname,\
       using Hset Remove without a level designation will remove the one with\
       the lowest level of access. ie:\
 \
       Help file XYZZY at level 57, and help file 'SAVE XYZZY' at level 58.\
       Typing 'HSET REMOVE XYZZY' will remove the level 57 XYZZY.\
       Typing 'HSET REMOVE 58.XYZZY' will remove the level 58 'SAVE XYZZY'.\
 \
See also: HEDIT\
", 
   Level = 101, 
   Keyword = "HSET", 
}

HelpEntry
{
   Text = "&GOrigin: &YVarious\
\
     &gHumans are the most numerous and least unusual of the races. They\
possess no special abilities or bonuses, but also have no penalties. \
Because of that, humans are extremely adaptable and are able to assume a\
variety of classes and roles \
     Humans are bipedal beings, boasting two arms, two legs, and a roundish\
head.  Amazingly, they have a strange tendency to look different from each\
other, almost none look exactly alike.\
 \
&GAlso see: &PHelp Human_stats\
&R&W\
", 
   Level = 0, 
   Keyword = "HUMAN HUMANS", 
}

HelpEntry
{
   Text = "&GRace: &YHuman\
&GSpecial Abilities: &YNone\
&GRestrictions: &YNone\
 \
&GStr: &Y20 &GInt: &Y20 &GWis: &Y20 &GDex: &Y20 &GCon: &Y20 &GCha: &Y20\
 \
&GProfession:\
 \
           Combat  Pilot  Engineer  B.Hunter  Smug.  Diplo.  Leader.\
Combat      &Y150     60       60        85      60     60       60&G\
Pilot&Y       40      140      65        65      90     40       40&G\
Engine.&Y     40      60       140       40      40     40       40&G\
B.Hunt&Y      1       1        1         100     1      1        1&G\
Smugg.&Y      6+      12+      31+       12+     106+   6+       6+&G\
Diplo.&Y      60      70       60        60      60     150      110&G\
Lead.&Y       110     60       60        60      60     110      150\
 \
", 
   Level = 0, 
   Keyword = "HUMAN_STATS HUMAN_STAT", 
}

HelpEntry
{
   Text = "&POrigin: &YVarl\
\
&p     Hutts resemble large slug-like creatures, having no legs and very\
short stubby arms.  They can use their muscular tails to slither forward,\
much like a snake.  Most hutts use hoversleds or repulsor lifts to ferry\
themselves around however.  They are hermaphrodites, containing both male\
and female reproductive organs.  A Hutt's skin is impervious to most\
weapons and is highly protected against poisons.  Hutts are alos notably\
arrogant and consider themselves to be the supreme race.  Originally from\
the planet Varl, they escaped disaster on their homeworld many millenia\
ago.  They migrated to the planet Nal Hutta, which means \"Glorious Jewel\"\
in their language.  Throughout the galaxy's history, Hutts have been the\
tough, immoral, criminal underlords by taking and excercising power and\
control over other beings.  They live long, some claim to be nearly 1000\
years old.  Their business philosophy is known as 'Kajidic', which means\
\"Somebody's going to have it, so why not it be us?\"\
 \
&PAlso see: &YHelp Hutt_stats&R&W\
 \
", 
   Level = 0, 
   Keyword = "HUTT HUTTS", 
}

HelpEntry
{
   Text = "&PRace: &YHutt\
&PSpecial Abilities:&Y None \
&PRestrictions: &YCan Only Speak Hutt, Large Size\
 \
&PStr:&Y 17 &PInt: &Y23 &PWis:&Y 17 &PDex:&Y 11&P Con:&Y 25&P Cha:&Y 14\
 \
&PProfession:\
 \
          Combat  Pilot  Engineer  B.Hunter  Smug.  Diplo.  Leader. \
Combat&Y     150     53       53        78      53      53      53&P \
Pilot&Y      12      112      37        37      62      12      12&P \
Engine.&Y    36      56       136       36      36      36      36&P \
B.Hunt&Y     1       1        1         80      1       1       1&P \
Smugg.&Y     6+      26+      31+       6+      106+    6+      6+&P \
Diplo.&Y     32      42       32        32      32      132     82&P \
Lead.&Y      150     104      104       104     104     150     150&P\
&R&W\
", 
   Level = 0, 
   Keyword = "HUTT_STATS", 
}

HelpEntry
{
   Text = ".\
 Syntax :  Calculate <system>/< <x> <y> <z> >\
             Then Hyperspace\
 \
Hyperspace is used to jump from one system to another in the\
galaxy. It is much faster than conventional space travel\
as well as a bit more dangerous. If you get a Jump warning\
odds are you will collide with something when you jump into\
the system\
 \
Syntax: Hyperspace off \
 \
Drops you immediately out of hyperspace. \
", 
   Level = 1, 
   Keyword = "HYPERSPACE", 
}

HelpEntry
{
   Text = "&C               COMMANDS FOR YOUR CHARACTER \
&W              -----------------------------&Y \
  AFK &cthis adds an 'Away From Keyboard' flag to your name \
&Y\
  CONFIG &clists all the config options available to you \
&Y \
  DESCRIPTION &cyou can write a description for your character \
&Y \
  PASSWORD <old> <new> &cchanges your password \
&Y \
  TITLE <sentence> &cchanges the sentence behind your name \
&Y \
  SAVE &csaves your progress (good idea to do it often) \
&Y \
  PRACTICE <skill, power, weapons> &ctrains you to use a skill, power, etc.\
  &RNOTE&c Typing &YPRACTICE&c will show you all your powers, skills, etc.\
         &YHELP <power, skill, etc> &cwill define the power, skill, etc. \
&Y \
  SLIST &clists the powers you will receive and at what level \
&R  NOTE: &rnot all powers are revealed in this list. \
&Y \
  QUIT &cquits the game \
&Y \
  ! &cwill repeat the last command \
", 
   Level = 1, 
   Keyword = "I", 
}

HelpEntry
{
   Text = "&C\
\
IC - In character - Means that you're not chatting with your friends about\
friday nights plans, or what to wear to the mall, it means what your MUD\
CHARACTER is saying. Ignorance is  no excuse for misusing channels, if you\
mean to jokingly tell someone OOC you're going to kill them but do it IC\
they have every right to defend themselves and attack you if they feel\
threatened. You can use the ask and answer, as well as tell channels (if\
you don't understand  them there's a reason someone teaches languages)\
if;you want to talk OOC or just go to a hotel, it's not that difficult and\
it's cheaper then using IC and clears up any confusion and lessens whining\
because someone was killed because they \"accidentally said the wrong\
thing on the wrong channel\".\
&Y\
OOC - Out of Character - Means you're talking about issues not\
game related like a bug or have another mud-based question, this\
does not mean you go \"Hey Jim I need food pick me up\" or \"Hey \
So and So just killed me I'm gonna get you!\" however there are a \
constantly growing number of help files and most of your basic \
questions should be there for answering, but yes there are times\
here there are questions only an imm or a fellow player can answer.\
However Excessive abuse of OOC will result in possibly being silenced.\
&g\
", 
   Level = 0, 
   Keyword = "IC OOC \"IN CHARACTER\" \" OUT OF CHARACTER\"", 
}

HelpEntry
{
   Text = "&cAny ship can ask for an identify, if it is &YIC&c.  Details will be asked\
on any pkill, a ship pkill especially, so be prepared to explain why your\
actions were &YIC&c.\
 \
It is HIGHLY inadvisable to go AFK, while you are in a ship.  Being AFK is\
NOT an excuse if you are killed when you did not ID.  A ship requesting an\
ID does not know if you are AFK, so they can legally kill you.  There will\
be no player restores or punishments given out if you are killed in a ship\
while afk. \
 \
&cTo ID yourself, type: \
\
           &Ysystem &R&W<&Yship name&R&W>&Y ID: &R&W<&YYour name&R&W> \
 \
&cWhen IDing a ship, remember to have the name of the ship you are IDing.\
Example:\
 \
           &Ysystem Requesting ID from &R&W<&Yship name&R&W>&Y. \
&R&W\
", 
   Level = 1, 
   Keyword = "IDENTIFY ID", 
}

HelpEntry
{
   Text = "VALUE CHECKS                          TRUE/FALSE CHECKS\
(If check == #/string/vnum)\
Ifcheck   Question                    Ifcheck       Question\
--------- --------------------------- ----------    ------------------------\
Hitprcnt  Percentage of hit/max_hit?  Isnpc         Mob?                       \
Inroom    Room #?                     Ispc          Player character?          \
Sex       Sex #?                      Isgood        Align +350 or higher?      \
Position  Position #?                 Isneutral     Align < 350 and > -350?    \
Level     Experience level?           Isevil        Align -350 or lower?       \
Objtype   Type of Object?             Ispkill       Pkill?                     \
Objval#   Value# equal to this?       Isfight       Fighting?                  \
Number    Is its vnum equal to this?  Isimmort      Immortal?                  \
Name      Name?  (STRING)             Ischarmed     Charmed?                   \
Clan      Clan name?  (STRING)        Isfollow      Follow master in room?     \
Race      Race name?  (STRING)        Rand (#)      Equal to or less?          \
Mobinroom How many of mob? (VNUM)     Isaffected    Affected_by name?          \
Guild     Guild name? (STRING)        Canpkill      Pkill >lev 5,18 or older?\
Goldamt   How much gold ya got?       Ismounted     Mounted?\
Class     Class name? (STRING)        Ismobinvis    Mobinvis? (versus invis)\
Str       What's your strength?       Mobinvislevel Level of invis?\
Int       What's your intelligence?   economy       if economy >=< xxx\
Wis       What's your wisdom?\
Dex       What's your dexterity?\
Con       What's your constitution?\
Cha       What's your charisma?\
Lck       What's your luck?            Not implemented: DOING_QUEST\
Deity     What's your deity?          Favor         What's your favor?\
Norecall  Is target's room norecall?  Isdevoted     Is target devoted?\
 \
*    New ifchecks :  see HELP IFCHECKS2\
** - Value checks can use == (equals), > (greater than), < (less than) and\
     ! (not).  Combine for:  != (not equal), >= (greater than or equal).\
 \
Also: MPSTAT, RPSTAT, OPSTAT, MPEDIT, RPEDIT, OPEDIT, TRIGGER, MPTRIGGERS,\
      RPTRIGGERS, OPTRIGGERS, MPCOMMANDS, RPCOMMANDS, OPCOMMANDS, VARIABLES,\
      AFFECTEDBY (for a list of affect types)\
", 
   Level = 101, 
   Keyword = "IFCHECKS", 
}

HelpEntry
{
   Text = "TimesKilled\
if timeskilled($* OR vnum) == amount\
   - for character checks only, can use any normal mobprog operator\
           \
OvnumHere, OvnumRoom, OvnumCarry, OvnumWear, OvnumInv\
if ovnum<place>(vnum) == amount\
  - for objects only, counts how many objects of vnum 'vnum' exist in <place>\
  - can use any normal mobprog operator\
 \
OtypeHere, OtypeRoom, OtypeCarry, OtypeWear, OtypeInv\
if otype<place>(type OR value) == amount\
  - for objects only, counts how many objects of type 'value' are in <place>\
  - can use any normal mobprog operator\
  - will convert the type names (light is 1, for example)\
 \
<place> definitions:\
 ... room  - in the room the mobile is in\
 ... wear  - worn by the mobile as equipment\
 ... inv   - in the mobile's inventory\
 ... carry - worn or in inventory\
 ... here  - all of the above\
 \
", 
   Level = 101, 
   Keyword = "IFCHECKS 2", 
}

HelpEntry
{
   Text = "TimesKilled\
if timeskilled($* OR vnum) == amount\
   - for character checks only, can use any normal mobprog operator\
           \
OvnumHere, OvnumRoom, OvnumCarry, OvnumWear, OvnumInv\
if ovnum<place>(vnum) == amount\
  - for objects only, counts how many objects of vnum 'vnum' exist in <place>\
  - can use any normal mobprog operator\
 \
OtypeHere, OtypeRoom, OtypeCarry, OtypeWear, OtypeInv\
if otype<place>(type OR value) == amount\
  - for objects only, counts how many objects of type 'value' are in <place>\
  - can use any normal mobprog operator\
  - will convert the type names (light is 1, for example)\
 \
<place> definitions:\
 ... room  - in the room the mobile is in\
 ... wear  - worn by the mobile as equipment\
 ... inv   - in the mobile's inventory\
 ... carry - worn or in inventory\
 ... here  - all of the above\
 \
Also: MPSTAT, RPSTAT, OPSTAT, MPEDIT, RPEDIT, OPEDIT, TRIGGER, MPTRIGGERS,\
      RPTRIGGERS, OPTRIGGERS, MPCOMMANDS, RPCOMMANDS, OPCOMMANDS, VARIABLES,\
      AFFECTEDBY (for a list of affect types) and IFCHECKS\
", 
   Level = 101, 
   Keyword = "IFCHECKS2", 
}

HelpEntry
{
   Text = "Syntax : feel illuminate\
\
Creates a ball of force light.\
", 
   Level = 1, 
   Keyword = "ILLUMINATE", 
}

HelpEntry
{
   Text = "Syntax:  immortalize <character>\
 \
Used to advance a level 50 character (avatar) to level 51 (the first\
level of immortality).  This command will destroy the character's\
inventory and display to them a pre-written message.\
", 
   Level = 101, 
   Keyword = "IMMORTALIZE", 
}

HelpEntry
{
   Text = "No message of the day for immortals.\
", 
   Level = 101, 
   Keyword = "IMOTD", 
}

HelpEntry
{
   Text = "&cThese are the Imperial Military's ranks and equivalencies.\
Yes, we stole this from Sote. \
 \
&CArmy            &YNavy            &PPilot Corps   &WStormtroopers \
&cMaster General  &OGrand Admiral   &p-----------   &w----------- \
&cMajor General   &OHigh Admiral    &p-----------   &w----------- \
&cGeneral         &OFleet Admiral   &p-----------   &wGeneral \
&cBrig. General   &OAdmiral         &pWing Cmdr.    &w----------- \
&cField Marshal   &OVice Admiral    &pGeneral       &w----------- \
&cMarshal         &ORear Admiral    &p-----------   &w----------- \
&cSr. Colonel     &OCommodore       &p-----------   &w----------- \
&cColonel         &OLine Captain    &pColonel       &wColonel \
&cLt. Colonel     &OCaptain         &p-----------   &w----------- \
&cMajor           &OCommander       &pCommander     &wMajor  \
&cCaptain         &OLt. Cmdr.       &pLt. Cmdr.     &wCaptain  \
&c1st Lieutenant  &OLieutenant      &pLieutenant    &w----------- \
&c2nd Lieutenant  &OEnsign          &pFlight Off.   &wLieutenant \
&cCadet           &OCadet           &pFlight Cad.   &w----------- \
  \
&cMasterSergeant  &OSr. Petty Off.                &wMaster Sergeant \
&cSergeant        &OPetty Officer                 &wSergeant \
&cLance Corporal  &OMidshipman                    &wLance Corporal \
&cCorporal        &OJr. Midshipman                &wCorporal \
&cPrivate 1st     &OSr. Deckman                   &wPrivate \
&cPrivate         &ODeckman                       &wRecruit \
&cRecruit         &ORecruit \
", 
   Level = 1, 
   Keyword = "IMPRANKS", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y induct  <player>\
         outcast <player>\
&c\
Induct and outcast are clan commands.  The leader and number 1 of the\
clan receive the induct commands, while the deity, leader, number 1 and\
number 2 all receive outcast.  Induct will bring a new player into the\
clan, while outcast will remove them. \
", 
   Level = 101, 
   Keyword = "INDUCT OUTCAST", 
}

HelpEntry
{
   Text = "Infiltrations by clan members require an ICly issued order by the clan\
leader and/or the first of your clan. You must have logged proof of this\
order. \
 It is slayable to infiltrate a clan with intention to assassinate any\
member of the clan. The ONLY exceptions to this rule involves clans where\
leadership can be taken in combat\
You CAN infiltrate a clan to place a mole. The sole purpose of that mole is\
to gather/relay information. If you have any question to the\
legality of placing a mole..Contact an Admin.\
", 
   Level = 1, 
   Keyword = "INFILTRATE INFILTRATION", 
}

HelpEntry
{
   Text = ".\
&YSLIST   - &ca command that lists all your powers and skills and the\
          level at which you may practice them. \
&YAREAS   - &cTyping &YAREAS&c will get you a list of all areas.  You may\
          sometimes get more information on each area by typing out\
          &YHELP <full area name>&c.\
&YWIZLIST - &cThis is a list of all Immortals of the game.\
&YCOMMANDS- &cThis is a list of all commands available to you.\
&YSOCIALS - &cThis is a list of all socials available.\
&YTIME    - &cThis will tell you the current times inside the game, the\
          time the game was last rebooted, and the current time at the site\
&YSAVE    - &cAfter being authorized, typing &YSAVE&c will save your char.\
&YQUIT    - &cIf you want to leave the game, type &YQUIT&c. \
&YWHO     - &cA list of other players visible to you in the game. \
&YTITLE   - &cOnce you reach level five, you may make your own title. \
&YPASSWORD- &cYour character's password can be changed with\
          &YPASSWORD <old> <new>. \
DESC    - &cYou may set up a personal description, type DESC to edit. \
 \
&RSee Also&W: &PEXPERIENCE LEVEL TITLE WEATHER NOTE BUG IDEA TYPO MAIL\
          PRACTICE SCORE CHANNELS\
", 
   Level = 1, 
   Keyword = "INFORMATION", 
}

HelpEntry
{
   Text = "Syntax: feel infravision <character>\
\
This power enables the target character to see other players and mobiles\
that are in the room with them.  This power will also allow you to get\
items from a corpse, but will not allow you to see the corpse.  You\
must have a light source to see items, room descriptions, or \"exits\" in\
a dark room.\
", 
   Level = 0, 
   Keyword = "INFRAVISION", 
}

HelpEntry
{
   Text = "Syntax : feel 'inner fortress'\
\
Improves constitution for a limited period.\
", 
   Level = 1, 
   Keyword = "'INNER FORTRESS'", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YInnerStrength\
 \
&cThis skill will increase both your constitution and your max hit points\
for a short period of time.\
", 
   Level = 1, 
   Keyword = "'INNER STRENGTH' INNERSTRENGTH", 
}

HelpEntry
{
   Text = "Syntax:  installarea <old area filename> [new filename] [full area name/title]\
 \
Installs a prototype area into the mud as a non-prototype area. The\
filename can be fixed with aset (don't forget to foldarea afterwards).\
Or you can supply it on the command line.\
", 
   Level = 101, 
   Keyword = "INSTALLAREA", 
}

HelpEntry
{
   Text = "Syntax:  instaroom\
 \
Functions the same as instazone, but is room-based instead of area-based.\
 \
Syntax:  instazone [nodoors]\
 \
This command lets your instantly create a whole set of resets for your area\
based on all the mobiles and objects contained within your area.\
All you have to do is place each mob in its proper room, wearing what it\
should be wearing, carrying what it should be carrying, and objects in their\
proper places, or in their proper containers, and doors in their proper\
states, (open, closed, locked).  The instazone command will clear out your\
current resets (if any), and create new ones for you.\
You may optionally specify \"nodoors\" so that door resets will not be\
created.\
 \
NOTE: This command will wipe out any existing resets! Do not use this\
command after you have added your own resets with 'reset add'.\
The recommended procedure is to use instazone, then use the 'reset' command\
to add any special resets, and NOT use instazone again.\
 \
See RESET and RESETCMDS.\
", 
   Level = 101, 
   Keyword = "INSTAROOM INSTAZONE", 
}

HelpEntry
{
   Text = "&CIntelligence &Y(int)&C represents your character's mental capacity.  It\
is an important factor in learning between combatants.  If a character\
fights a creature several times, the more intelligent of the two opponents\
will gain an advantage over time. \
 \
&cIt also affects:\
 \
 * Amount of force regenerated per tick. *\
 \
 * Percentage rate one learns a skill or power. *\
 \
 * Percentage rage one practices a new language. *\
 \
 * Increases max engineering level. *\
 \
 * Increases max leadership level. *\
&R&W\
", 
   Level = 1, 
   Keyword = "INTELLIGENCE INT", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Various\
&c\
     A spherical droid with a built-in repulsorlift, it has many devices \
suited for torture and other information-gathering activities. \
One such droid was employed by Darth Vader against princess Leia, and, \
despite her strength, she eventually revealed the location of the Rebel \
Force's base in Yavin IV. \
 \
&RAlso Type&W:&Y SHOWSTAT INTERROGATION DROID \
", 
   Level = 1, 
   Keyword = "INTERROGATION DROID 'INTERROGATION DROID'", 
}

HelpEntry
{
   Text = "Syntax : feel 'invade essence' <victim>\
\
Causes damage to victim.\
", 
   Level = 1, 
   Keyword = "'INVADE ESSENCE'", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y fire ion\
&c\
Ion cannons target a ship's shield and other systems,\
without harming the actual hull of the ship. Basically\
disables a ship.\
", 
   Level = 1, 
   Keyword = "ION IONS 'ION CANNONS'", 
}

HelpEntry
{
   Text = "In these values, 'sn' is a power number;  a negative value means 'no power'.\
Item Type |V0         |V1          |V2         |V3         |V4       |V5\
----------|-----------|------------|-----------|-----------|---------|-------\
armor     |current AC |original AC |           |obj timer  |         |\
container |capacity   |flags       |key vnum   |condition  |         |\
drinkcon  |capacity   |quantity    |liquid #   |poison?    |         |\
food      |food value |(condition) |           |poison?    |         |\
herb      |           |charges     |herb #     |           |         |\
key       |(lock #)   |            |           |           |         |\
lever     |leverflags |vnum/sn     |vnum       |vnum/value |         |\
light     |           |            |hours left |           |         |\
money     |# of coins |coin type   |           |           |         |\
pill      |power level|sn 1        |sn 2       |sn 3       |food val |\
potion    |power level|sn 1        |sn 2       |sn 3       |         |\
salve     |power level|max charge  |charges    |delay      |sn       |sn\
scroll    |power level|sn 1        |sn 2       |sn3        |         |\
staff     |power level|max charges |charges    |sn         |         |\
switch    |leverflags |vnum/sn     |vnum       |vnum/value |         |\
trap      |charges    |type        |level      |flags      |         |\
treasure  |(type)     |(condition) |           |           |         |\
wand      |level      |max charges |charges    |sn         |         |\
weapon    |condition  |num dice    |size dice  |weapontype |         |\
                                  \
See OBJECTTYPES, WEAPONTYPES, SLOOKUP, LIQUIDTYPES, LEVERFLAGS, OSET,\
ARMORCLASS, and WEAPONCONDITION.\
", 
   Level = 101, 
   Keyword = "ITEMVALUES", 
}

HelpEntry
{
   Text = "&COrigin: &YIthor \
 \
     &cThe species name for the aliens commonly referred to as Hammerheads\
is Ithorian. Their common name comes from their T-shaped heads, which rest\
atop long, curved necks. Ithorians come from the Ottega star system, in \
the Lesser Plooriod Cluster. They speak Basic with a strange twist due to\
their two mouths, each located on one side of their necks. This generates\
a stereo effect, which produces one of the most beautiful and difficult \
native languages in the galaxy. \
     Ithorians are a gentle, peace loving species and as such they are \
particularly adept at healing, but much worse in fights that they have \
provoked. They have great respect for all forms of life, making them \
particularly bad bounty hunters. They are gregarious and curious people,\
who enjoy their roles as space merchants almost as much as ecological \
preservers. \
 \
&RAlso type&W: &Yshowstat ithorian\
", 
   Level = 0, 
   Keyword = "ITHORIAN ITHORIANS", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Jail <player> # <days/hours>\
&CSyntax &W:&Y Unjail\
 \
&cSends a stunned player to your clan's jail for a certain amount of\
time.  Jailed persons will log in to their prison, even after going\
link-dead.\
 \
To unjail a person, &Yjail &R&W<&Yperson&R&W> &Y0&c.  Someone who breaks\
them out of prison will have to do this as well, to avoid the person\
relogging back into the prison.  This can also be done with &YUNJAIL&c.\
", 
   Level = 1, 
   Keyword = "JAIL UNJAIL", 
}

HelpEntry
{
   Text = "&COrigin: &YTatooine\
 \
  &c     Jawas are smelly, rodent-like creatures but very intelligent. \
They stand about a meter tall and constantly are jabbering away in their\
native tongue.  They are desert dwellers of the planet Tatooine.  They \
protect themselves from the fierce double suns by wearing a course \
homespun cloak with hoods around their bodies with only their glowing eyes\
being visible.  Having a clan mentality, they live and travel in bands \
using giant treaded vehicles known as 'sandcrawlers'.  They are very \
family oriented, and collect any kind of junk that doesn't have an owner \
attached to it.  They love to barter and make deals, as well as trade with\
other races.  Once a year, each clan makes the trek across the Dune Sea \
for a huge secret rendevous, that becomes a huge swapmeet, where they \
exchange salvaged items and tell stories of their greatest trades made to\
date.  \
 \
&RAlso type&W:&Y showstat jawa\
", 
   Level = 0, 
   Keyword = "JAWA JAWAS", 
}

HelpEntry
{
   Text = "Example Jawa Names. These are used in the books, and are not acceptable to\
be used, just as examples of the common format for Jawa names.\
 \
R'kik D'nec\
Het Nkik\
Rkok <clan name>\
Iasa\
Herat <female>\
Hrar Kkak \
Aguilae\
Dathcha \
Eet Ptaa\
Wimateeka\
Wittin\
Akkik\
", 
   Level = 0, 
   Keyword = "JAWA_NAMES", 
}

HelpEntry
{
   Text = "&CJedi Apprentice:&c\
A jedi apprentice must have a max force of 25+ and must be inducted by\
a master. \
 \
&CJedi Knight:&c\
A jedi knight must be skilled in combat (Thats 75%), and must be at least\
level 10 in leadership.  A knight must be maxed out in at least two \
specialties, one being force, which must be at least 25.  Your stats must\
be maxed. \
 \
You must also have created your first lightsaber. \
 \
&CJedi Master:&c \
You must be level 75 Force, maxed out combat, leadership, and piloting. \
The only way you can be advanced to Master is to complete a quest, \
which will be roleplay related in that it will have something to do \
with the force. \
 \
These are simply the qualifications to make you eligible.  Read help \
&Pforcers&c for the restrictions for promotions. \
", 
   Level = 1, 
   Keyword = "JEDIS \"JEDI KNIGHT\" JEDI", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YJumpvector &R&W<&YShip&R&W> \
 \
&cThis gives you a ships course that has hypered out \
from near your position.\
 \
SEE ALSO: &WHELP SHIPTRACK\
&w\
", 
   Level = 1, 
   Keyword = "JUMPVECTOR", 
}

HelpEntry
{
   Text = "&CSyntax:  &Yjunk &W<&Yobject&W> \
&c \
Junk will remove an object from a room. You can only junk certain items:\
 \
Armor \
Containers/Drink Containers \
Trash \
Keys \
Medpacks \
", 
   Level = 1, 
   Keyword = "JUNK", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Kashyyyk\
&CInhabitants &W:&W Wookiee, Kroyie\
&c\
     This jungle planet, known for its deadly flora and fauna, is the\
Wookiee home world, although there are legends that say the Wookiees\
settled Kashyyyk after travelling from another planet. There are four\
main continents on the planet, separated by bands of ocean studded with\
archipelagoes. There is a small region of desert near the equator. The\
Wookiees live in huge tree cities built to elevate them from the \
dangerous lower levels of the jungle. The Wookies discovered that the\
jungle had seven distinct levels, each defined by the amount of light\
it receives. The lower levels - designated first, second, and third -\
have plants which are phosphorescent, providing their own light. \
Wookiees never traveled below the fourth level. The normal Kashyyyk \
rotational period lasts about 26 standard hours; its year lasts 381 \
local days. It is located in the Sumitra Sector, and has three moons.\
", 
   Level = 1, 
   Keyword = "KASHYYYK", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Kessel\
&CInhabitants &W:&W Human, Energy Spider, Bogey\
&c\
     A planet with large spice mining operation, Kessel is the second \
and primary world in the Kessel System, far out in the Outer Rim. It \
has no natural atmosphere, so one is generated by huge processors. It\
has one moon. Kessel is doomed to be swallowed by the nearby Maw in the\
next few millennia, as the intense gravity of the multiple black holes\
draw it in. It was used as an Imperial penal colony, with an Imperial\
garrison stationed on the moon. The prisoners were used as spice \
miners. The miners work in near-absolute darkness, so as not to \
activate the spice. When Emperor Palpatine died at Endor, the Imperials\
stationed there were not prepared for autonomy. When the prisoners \
heard about the death of the Emperor, they revolted against the \
Imperial guards, overthrowing them and establishing control of the \
planet and the production of spice. Moruth Doole, a prisoner who had \
risen to the top of the Imperial's list, became the de facto ruler of \
the mines. He continued to use the lowest of the prisoners as spice \
miners, keeping a handful of the upper-level prisoners as advisors and\
crew chiefs. Doole had the atmospheric production reduced in an effort\
to save money; he felt that since the prisoners worked underground, an\
above-ground atmosphere was a frivolous waste of money. \
", 
   Level = 1, 
   Keyword = "KESSEL", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YKick \
\
&R&cThis skill allows you to deliver a powerful blow in the form of a kick\
to your opponent.  Can only be used during combat. \
&R&W\
", 
   Level = 0, 
   Keyword = "KICK", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Farfin\
&CInhabitants &W:&W Gran\
&c\
     This planet is the homeworld of the three-eyes humanoid race of the\
Gran. \
", 
   Level = 1, 
   Keyword = "KINYEN", 
}

HelpEntry
{
   Text = "Syntax : feel 'know essence' <target>\
\
Displays information on target.\
", 
   Level = 1, 
   Keyword = "'KNOW ESSENCE'", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Kuat\
&CInhabitants &W:&W Human\
&c\
     This planet was of prime importance to the New Order, for the Kuat\
Drive Yards shipyards there were among the first to mass-produce \
warships for the Empire. The relationship blossomed, and the Kuat Drive\
Yards were made into the primary facility for the construction of Star\
Destroyers. A forested world of pastoral beauty, Kuat was one of four\
planets located in the Kuat Sector, located in the most densely-\
populated area of the galaxy. The planet was orbited by three immense\
space stations, built by the Empire to manage traffic in and out of the\
system. The Kuat Passenger Port was dedicated to civilian and tourist \
traffic. The Kuat Freight Port was dedicated to the transport of goods\
to and from Kuat. The third station was strictly for use by the \
Imperial military,and controlled all access to the surface of Kuat. \
", 
   Level = 1, 
   Keyword = "KUAT", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Kubindi\
&c\
     An alien race hailing from the planet Kubindi, the Kubaz have dark \
reen skin, a prehensile trunk, and large eyes. Their eyes are sensitive \
to the red spectrum of light, and often wear large goggles when they \
are away from their homeworld. They tend to be clan-oriented, with each \
clan protecting its property from other rival clans. The intense solar \
flares from their planet's sun nearly destroyed the majority of food \
sources on the planet, and the Kubaz were forced to hunt insects as a \
staple diet. This led to the rival clans raiding each others' insect \
farms. These so-called Hive Wars were resolved when the Kubaz found a \
way to alter the genetics of their insects to not only improve their \
reproduction, but to identify each hive by its colorings as property of \
a certain clan. This newly-formed science of Insecticulture helped keep \
the rival clans from feuding, and also allowed the Kubaz to expand \
their horizons. They eventually discovered space travel, and eventually \
populated three of the 11 worlds orbiting the sun Ku'Bakai. This ability \
to move off-planet then introduced the Kubaz to their neighbors, the \
Verpine. Since the Verpine are an insectile race by nature, the space- \
faring Kubaz found that the Verpine were tasty, and began to hunt them \
as an additional food source. \
 \
&RAlso Type&W:&Y SHOWSTAT KUBAZ\
", 
   Level = 1, 
   Keyword = "KUBAZ", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y languages\
&CSyntax &W:&Y language learn <language name>\
 \
Languages &calone shows which languages you know, and &Ylanguage learn \
<name>&c will add to your percentage of language knowledge.  To learn a \
language, a scholar who is knowledgable in that tongue must be present. \
 \
If someone is speaking in a language, and you know it, you will \
understand what they are saying.  However, to change the language in which\
you are speaking, you must change that manually. \
 \
&RSee also&W: &PTONGUES SPEAK \
", 
   Level = 0, 
   Keyword = "LANGUAGES LANGUAGE LEARN", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y last <character>\
&c\
Returns the last connected date of the victim.\
", 
   Level = 101, 
   Keyword = "LAST", 
}

HelpEntry
{
   Text = ".\
&gLayers are currently available on the following wear locations:\
 \
&GAbout, Arms, Body, Feet, Hands, Legs, Waist.\
 \
&gLayers are set with a numeric value, or combination of values.  The lower\
the value, the lower the layer, or thinner the item of clothing/armor is.\
 \
Valid numeric values are:\
 \
&G0, 1, 2, 4, 8, 16, 32, 64, 128.\
 \
&gOr any combination of the above. A value of zero means no other items came\
be layered with this item. Items of clothing can be layered over one another\
as long as their layer values do not overlap. ie, if leather armor were set\
to a value of 56 (8, 16, and 32), it could not layer with, say, a set of\
heavy chain that is set to a value of 96 (32 and 64), as they overlap on the\
layer value of 32.\
 \
See also OSET, AFFECTTYPES, WEARFLAGS, OBJECTFLAGS, OBJECTTYPES, ITEMVALUES,  \
WEAPONTYPES, VARIABLES, ARMORCLASS, LAYERS2, and OMENU.\
", 
   Level = 101, 
   Keyword = "LAYERS", 
}

HelpEntry
{
   Text = ".\
&gLayer Bit Vectors\
&G|1              |       | \
|2|6|3|1        |       |\
|8|4|2|6|8|4|2|1| Layer | Suggested Armor Type\
+-+-+-+-+-+-+-+-+-------+---------------------------------------------\
|0 0 0 0 0 0 0 0|   0   | (Default - Nothing Layers)\
|0 0 0 0 0 0 0 1|   1   | silk shirt, light cloth tunic (Lowest Layer)  \
|0 0 0 0 0 0 1 0|   2   | leather vest, heavy cloth\
|0 0 0 0 0 1 0 0|   4   | light chainmail, padded gambeson\
|0 0 0 0 0 1 1 0|   6   | padded chainmail\
|0 0 0 0 1 0 0 0|   8   | leather jacket, reinforced chainmail\
|0 0 0 0 1 1 0 0|  12   | platemail, similarly rigid armor\
|0 0 0 1 0 0 0 0|  16   | light cloak, loose robes\
|0 0 0 1 1 0 0 0|  24   | heavy fur cloak\
|0 0 0 1 0 0 0 0|  16   | light cloak, loose robes\
|0 0 0 1 1 0 0 0|  24   | heavy fur cloak\
|0 0 1 0 0 0 0 0|  32   | loose cloaks, surcoats\
|0 1 0 0 0 0 0 0|  64   | capes\
|1 0 0 0 0 0 0 0| 128   | magical effects (auras, clouds of dust, etc)\
|1 1 1 1 1 1 1 1| 255   | (Highest Layer - Nothing Layers)\
+-+-+-+-+-+-+-+-+-------+---------------------------------------------\
&g* Thick or bulky items may need to occupy more than one layer.\
  (example; padded chain covers 2 layers)\
* A \"body\" wear position will have more layers than other positions such\
  as \"arms\", \"hands\", \"legs\", and \"feet\".\
  (example for \"hands\"; silk gloves | leather gloves | chain gauntlets)\
\
See also OSET, AFFECTTYPES, WEARFLAGS, OBJECTFLAGS, OBJECTTYPES, ITEMVALUES,\
WEAPONTYPES, VARIABLES, ARMORCLASS, LAYERS, and OMENU.\
", 
   Level = 101, 
   Keyword = "LAYERS2", 
}

HelpEntry
{
   Text = "&cPlayers that pick leadership as their main get a few interesting\
abilities.  Not only can they post guards, but they can post *elite*\
guards, as well as call special forces, a more powerful form of\
reinforcements.  They also receive dominate, which will make a mob your\
follower, and torture, which will permanently remove the hit points from a\
person or a mob.  A leadership centered character is usually weaker in\
areas such as combat and piloting, and stronger in diplomacy.\
 \
&RSee also&W: &PHelp Jail\
          Help PostGuard\
          Help AddPatrol\
          Help Reinforcements\
          Help Dominate\
          Help EliteGuard\
          Help Torture\
          Help SpecialForces\
          Help GatherIntelligence\
", 
   Level = 0, 
   Keyword = "LEADERSHIP LEADER", 
}

HelpEntry
{
   Text = "FLAG NAME     |  BITVECTOR  |  DESCRIPTION\
----------------------------------------------------------------------\
UP            |          1  |  Trigger is UP \
UNLOCK        |          2  |  Trigger unlocks something\
LOCK          |          4  |  Trigger locks something\
D_NORTH       |          8  |  Affects the north exit\
D_SOUTH       |         16  |  Affects the south exit\
D_EAST        |         32  |  Affects the east exit\
D_WEST        |         64  |  Affects the west exit\
D_UP          |        128  |  Affects the exit up\
D_DOWN        |        256  |  Affects the exit down\
DOOR          |        512  |  Affects a door\
CONTAINER    *|       1024  |  Affects a container\
OPEN          |       2048  |  Opens something\
CLOSE         |       4096  |  Closes something\
PASSAGE       |       8192  |  Creates a passage\
OLOAD        *|      16384  |  Loads up an object\
MLOAD        *|      32768  |  Loads up a mobile\
TELEPORT      |      65536  |  Teleports the puller\
TELEPORTALL  *|     131072  |  Teleports everyone in the room\
TELEPORTPLUS *|     262144  |  Teleports everything in the room\
DEATH        *|     524288  |  Causes instant death\
CAST         *|    1048567  |  Casts a power (sn in value1)\
FAKEBLADE    *|    2097152  |  Lever is a wax covered sword blade (OUCH)\
RAND4         |    4194304  |  Randomizes the exits N, S, E, W\
RAND6         |    8388608  |  Randomizes the exits N, S, E, W, U, D\
TRAPDOOR     *|   16777216  |  Opens a trap door, everthing falls down\
\
See OSET and ITEMVALUES.  * = not yet implemented.\
", 
   Level = 101, 
   Keyword = "LEVERFLAGS SWITCHFLAGS BUTTONFLAGS PULLCHAINFLAGS DIALFLAGS", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YLift Credits &R&W<&YName&R&W> \
         &YLift &R&W<&YObject&R&W> <&YName&R&W> \
 \
&YSteal&c attempts to steal credits, or an object, from a mob or player.\
", 
   Level = 0, 
   Keyword = "LIFT STEAL", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YLimber\
 \
&cThis skill lets you focus your energy so you can be more agile.\
", 
   Level = 1, 
   Keyword = "LIMBER", 
}

HelpEntry
{
   Text = ".   &cName                &WColor     &RAlcohol    Food Worth  Liq. Worth\
1.  &cwater,              &Wclear,        &R0,        &Y1,       &C10 \
2.  &cbeer,               &Wamber,        &R3,        &Y2,        &C5 \
3.  &cwine,               &Wrose,         &R5,        &Y2,        &C5 \
4.  &cale,                &Wbrown,        &R2,        &Y2,        &C5 \
5.  &cdarkale,            &Wdark,         &R1,        &Y2,        &C5 \
6.  &cwhisky,             &Wgolden,       &R6,        &Y1,        &C4 \
7.  &clemonade,           &Wpink,         &R0,        &Y1,        &C8 \
8.  &cfirebreather,       &Wboiling,     &R10,        &Y0,        &C0 \
9.  &clocalspecialty,     &Weverclear,    &R3,        &Y3,        &C3  \
10. &cslimemoldjuice,     &Wgreen,        &R0,        &Y4,       &C-8 \
11. &cmilk,               &Wwhite,        &R0,        &Y3,        &C6 \
12. &ctea,                &Wtan,          &R0,        &Y1,        &C6 \
13. &ccoffee,             &Wblack,        &R0,        &Y1,        &C6 \
14. &cblood,              &Wred,          &R0,        &Y2,       &C-1 \
15. &csaltwater,          &Wclear,        &R0,        &Y1,       &C-2 \
16. &ccola,               &Wcherry,       &R0,        &Y1,        &C5 \
17. &cmead,               &Whoneycolor,   &R4,        &Y2,        &C5 \
18. &cgrog,               &Wthickbrown,   &R3,        &Y2,        &C5 \
19. &cmilkshake,          &Wcreamy,       &R0,        &Y8,        &C5 \
20. &cgin,                &Wclear,        &R6,        &Y1,        &C5 \
21. &cbrandy,             &Wdarkyellow,   &R7,        &Y1,        &C5 \
22. &crum,                &Wclear,        &R7,        &Y2,        &C7 \
23. &cheavyliquor,        &Wclear,        &R8,        &Y1,        &C5 \
24. &cliquor,             &Wclear,        &R5,        &Y1,        &C5 \
25. &cchampagne,          &Wgolden,       &R6,        &Y1,        &C1 \
26. &ccognac,             &Wrust,         &R6,        &Y2,        &C4 \
27. &calcohol,            &Weverclear,    &R6,        &Y1,        &C6 \
28. &cmixedalcohol,       &Weverclear,    &R4,        &Y1,        &C7 \
29. &cfrozenalcohol,      &Weverclear,    &R6,        &Y5,        &C5 \
30. &cbluealcohol,        &Wblue,         &R5,        &Y1,        &C1 \
31. &credalcohol,         &Wred,          &R5,        &Y1,        &C1 \
32. &corangealcohol,      &Worange,       &R5,        &Y1,        &C1 \
33. &cgreenalcohol,       &Wgreen,        &R5,        &Y1,        &C1 \
34. &cmineralwater,       &Wclear,        &R0,        &Y0,       &C10 \
35. &cethanol,            &Wclear,       &R15,        &Y0,        &C0 \
36. &capplejuice,         &Wyellow,       &R0,        &Y4,        &C6 \
37. &cfruitbeverage,      &Wcherry,       &R0,        &Y3,        &C8 \
38. &cmixedspritzer,      &Wclear,        &R3,        &Y1,        &C3 \
39. &csweettea,           &Wtan,          &R0,        &Y2,        &C6 \
", 
   Level = 101, 
   Keyword = "LIQUIDTYPES", 
}

HelpEntry
{
   Text = "Syntax: litterbug <player>\
\
Places/removes the litterbug flag, allowing/prohibiting a player from\
dropping any objects.\
", 
   Level = 101, 
   Keyword = "LITTERBUG", 
}

HelpEntry
{
   Text = "Syntax: loadup <player>\
\
LOADUP allows one to load up a player's character (playing or not), to do\
whatever needs be done to the character.  (Modifying a flag, changing a\
password... etc).  Use FORCE to make the character do your bidding.\
\
See FORCE.\
", 
   Level = 101, 
   Keyword = "LOADUP", 
}

HelpEntry
{
   Text = "Syntax:  log   <character>\
Syntax:  log   all\
Syntax:  snoop <character>\
 \
LOG <character> causes all of a character's commands to be logged into the\
server's log file and to the log channel.  Like FREEZE, it is a permanent\
character toggle that persists across reboots until removed.\
 \
Certain commands (such as password) are protected against LOG.  Conversely,\
certain commands (especially immortal commands) are always logged.\
 \
LOG ALL logs all character and mob commands and actions to the server's log\
file, but does not send the output to the log channel.  It is a server-wide\
toggle; it does not persist across reboots.\
 \
SNOOP shows you a copy of all the input and output going to a character.  The\
character must have an open channel.  You may snoop more than one character\
at a time.  The input from the player will be displayed with a header of the\
players  name and a percentage sign (i.e. Mudder%)\
 \
SNOOP yourself to cancel all outstanding snoops.\
 \
", 
   Level = 101, 
   Keyword = "LOG SNOOP", 
}

HelpEntry
{
   Text = "&CLuck &Y(LCK)&C represents your character's chance, and basically how\
lucky he/she is.  You cannot train this statistic at any trainer.\
Your luck stat does not show up on your score.\
 \
&cLuck also affects:\
 \
 * Overall success with engineering. *\
 \
 * Determines one's max smuggling level. *\
&R&W\
", 
   Level = 1, 
   Keyword = "LUCK LCK", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y mail list\
&CSyntax &W:&Y mail read    <number>\
&CSyntax &W:&Y mail read    all\
&CSyntax &W:&Y mail write\
&CSyntax &W:&Y mail subject <string>\
&CSyntax &W:&Y mail to      <to-list>\
&CSyntax &W:&Y mail take    <number>\
&CSyntax &W:&Y mail show\
&CSyntax &W:&Y mail post\
&CSyntax &W:&Y mail remove  <number>\
&c\
The mail command is very similar to the note command.  To write mail, as\
in notes, you must have a blank note held in your hands, and a quill or\
pen in your inventory.  Mail can only be addressed to real players, or\
'all'.  There is a charge for reading and taking mail.\
", 
   Level = 0, 
   Keyword = "MAIL", 
}

HelpEntry
{
   Text = "&CSyntax &R&W:&Y Makearmor &R&W<&YLocation&R&W> <&YName&R&W> \
\
&cThis allows you to create custom armor for yourself and others using some\
material, and a sewing needle. \
", 
   Level = 1, 
   Keyword = "MAKEARMOR", 
}

HelpEntry
{
   Text = "&CSyntax &R&W:&Y Makeblade &R&W<&YName&R&W> \
 \
&cThis allows you to make a custom vibroblade, using a toolkit, some\
SCRAP durasteel, a battery, and an oven.\
", 
   Level = 1, 
   Keyword = "MAKEBLADE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YMakeblaster &R&W<&YName&R&W> \
 \
&cThis lets you make a blaster using a toolkit, some duraplast, a battery,\
an oven, some circuitry, and some sort of conductor.\
", 
   Level = 1, 
   Keyword = "MAKEBLASTER", 
}

HelpEntry
{
   Text = "Syntax:  makeboard <board filename>\
Example: makeboard newboard.brd\
 \
Used to create a board file, which can then be defined using 'bset'.\
 \
See BSET, BSTAT and BOARDS\
", 
   Level = 101, 
   Keyword = "MAKEBOARD", 
}

HelpEntry
{
   Text = "Syntax:  makeclan <clan name>\
Example: makeclan Retribution\
\
Used to create a new clan, Order or guild, which can then be defined using\
the 'setclan' command.  Orders, guilds and clans are distinguished using the\
'type' field in 'setclan'.\
 \
See SETCLAN, SHOWCLAN\
", 
   Level = 101, 
   Keyword = "MAKECLAN", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YMakecomlink &R&W<&YLocation&R&W> <&YName&R&W> \
 \
&cThis skill allows you to make a custom comlink, using a toolkit, a\
battery, some circuitry, and a crystal.\
", 
   Level = 1, 
   Keyword = "MAKECOMLINK", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YMakecontainer &R&W<&YLocation&R&W> <&YName&R&W> \
 \
&cThis skill is used to make containers that can be worn all over the body.\
 The better you skill, the better the containers.\
 \
&RNote:&r Different fabrics are worn on different layers.  There are four\
layers. \
 \
&R&WAlso see:&P Help Wearlocs\
", 
   Level = 1, 
   Keyword = "MAKECONTAINER \"MAKE CONTAINER\"", 
}

HelpEntry
{
   Text = "Syntax:  makecouncil <council name>\
Example: makecouncil Newbie Council\
 \
Used to create a new council, which can then de defined using 'setcouncil'.\
 \
See SETCOUNCIL\
", 
   Level = 101, 
   Keyword = "MAKECOUNCIL", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YMakeflashlight &R&W<&YName&R&W> \
 \
&cThis allows you to make a flashlight using a toolkit, a battery, a lens,\
some circuitry, and some chemicals.\
", 
   Level = 1, 
   Keyword = "MAKEFLASHLIGHT", 
}

HelpEntry
{
   Text = "&CSyntax&R&W :&Y Makegrenade &R&W<&YName&R&W> \
 \
&cThis allows you to make a grenade using a toolkit, a drink container, a\
battery, some circuitry, and some chemicals.\
", 
   Level = 1, 
   Keyword = "MAKEGRENADE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YMakejewelry &R&W<&YLocation&R&W> <&YName&R&W>\
 \
&cThis skill lets you make jewelry from a precious metal.  A toolkit and an\
oven are also needed.\
 \
&R&WAlso see:&P Help Wearlocs\
", 
   Level = 1, 
   Keyword = "MAKEJEWELRY", 
}

HelpEntry
{
   Text = "Syntax : makelandmine <mine name>\
\
This makes a landmine using a toolkit(reuseable), a drink container, a battery, some\
circuitry and some chemicals.\
", 
   Level = 1, 
   Keyword = "MAKELANDMIND", 
}

HelpEntry
{
   Text = "&CSyntax&R&W : &YMakelandmine&R&W <&YName&R&W> \
 \
&cThis allows you to make a landmine using a toolkit, a drinking container,\
a battery, some circuitry, and some chemicals.\
", 
   Level = 1, 
   Keyword = "MAKELANDMINE", 
}

HelpEntry
{
   Text = "Syntax:  makerepair <mobvnum>\
 \
Automatically gives the mobile the ability to repair damaged equipment.\
Use 'repairset' to set the parameters by which the shop will function.\
 \
See REPAIRSET, REPAIRSTAT, REPAIRSHOPS\
", 
   Level = 101, 
   Keyword = "MAKEREPAIR", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YMakeshield &R&W<&YName&R&W> \
 \
&cThis skill lets you make an energy shield using a toolkit, a battery,\
some circuitry, a conductor, and a crystal.\
 \
&RNote:&r Sometimes failing this skill will cause the shield to explode.\
", 
   Level = 1, 
   Keyword = "MAKESHIELD", 
}

HelpEntry
{
   Text = "Syntax: makeshop <mobile vnum>\
\
Creates a new shop and assigns it to a mobile.\
\
The levels of the items in the shop are picked randomly based on item type:\
\
--------------------------------------------\
|Item Type | Level Range                   |\
--------------------------------------------\
| default  | 0                             |\
| pill     | 0 to 10                       |\
| potion   | 0 to 10                       |\
| scroll   | value[0] of the scroll object |\
| wand     | 10 to 20                      |\
| staff    | 15 to 25                      |\
| armor    | 5 to 15                       |\
| weapon   | 5 to 15                       |\
--------------------------------------------\
\
See SHOPSTAT, SHOPSET, SHOPS and SHOPVALUES\
", 
   Level = 101, 
   Keyword = "MAKESHOP", 
}

HelpEntry
{
   Text = "Syntax:  makewizlist\
 \
Used to generate a new wizlist during game operation (a new wizlist\
is automatically created at each reboot).  A character recently\
immortalized may need to 'save' first if they don't show up on the\
newly created wizlist.\
 \
", 
   Level = 101, 
   Keyword = "MAKEWIZLIST", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y feel mask\
 \
&cMasks User for a limited period.\
", 
   Level = 1, 
   Keyword = "MASK", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YMassPropaganda &R&W<&YCitizen&R&W> \
 \
&cThis allows you to spread propaganda to all the citizens on a planet\
through one citizen.  The actual number for this is +/-&R&W(Number of\
citizens on the planet)&Y*&c2.5.\
", 
   Level = 1, 
   Keyword = "'MASS PROPAGANDA' MASSPROPAGANDA", 
}

HelpEntry
{
   Text = "Syntax: mcreate <vnum> <keywords>\
Syntax: ocreate <vnum> <keywords>\
\
Create and new mobile / object.\
A prototype monster or object will be created with the selected vnum, and\
set up with the plainest of default values.  A material image of the magical\
prototype will appear before you, for you to futher modify with MSET or OSET.\
\
See MSET or OSET.\
", 
   Level = 101, 
   Keyword = "MCREATE OCREATE", 
}

HelpEntry
{
   Text = "We all know this, but put up with you anyways!\
", 
   Level = 1, 
   Keyword = "'ME I'M A MORON'", 
}

HelpEntry
{
   Text = ".\
&CSyntax &W:&Y Meditate\
&c\
This is the entry skill into becoming a jedi. Meditating will\
allow you to become one with the Force.\
 \
&RSee also&W:&P FRC, JEDI\
", 
   Level = 1, 
   Keyword = "MEDITATE", 
}

HelpEntry
{
   Text = "Syntax:  memory\
 \
Reports the current counts of objects, mobiles, rooms, etc...\
 \
Affects   (# of affects)                Areas   (# of areas loaded)\
ExtDes    (# of exdescs)                Exits   (# of exits)\
Helps     (# of help files)             Resets  (# of resets)\
IdxMobs   (# of unique mob indexes)     Mobs    (# of mobs in game total)\
IdxObjs   (# of unique obj indexes)     Objs    (unique items) (total items)\
Rooms     (# of rooms in the game)      VRooms  (# of virtual rooms present)\
Shops     (# of shops defined)          RepShps (# of repair shops defined)\
CurOq's   (Not used)                    CurCq's (Not used)\
Players   (Current # link-live players) Maxplrs (max players this reboot)\
MaxEver   (Max # of players ever)       Topsn   (top sn used) (top sn open)\
MaxEver time recorded at:   (date and time max users was reached)\
 \
", 
   Level = 101, 
   Keyword = "MEM MEMORY", 
}

HelpEntry
{
   Text = "When in one of the menu systems (RMENU, OMENU, MMENU), to switch from one\
page to another, type '- <letter>'.  (For example, '- a' will bring you to\
the first page in the current menu system).\
\
'- h' will bring up a help file in any menu system.\
\
'+ <name>' in OMENU or MMENU will change the object or mobile being edited\
if it exists in your inventory/room respectively.\
\
See RMENU, OMENU, MMENU.\
", 
   Level = 101, 
   Keyword = "MENU", 
}

HelpEntry
{
   Text = "Originally based on the Merc 2.1 code which was created by Furey, \
Hatchet, and Kahn.\
This original code base is available as Merc_21.tar.gz via FTP from:\
ftp.tcp.com, ftp.math.okstate.edu and game.org.\
E-mail to 'merc-request@kpc.com' to join the merc mailing list.\
\
Merc would like to thank ...\
  ... Diku Mud for their code base.\
  ... The Free Software Foundation and DJ Delorie for kick-ass tools.\
  ... Copper Mud and Alfa Mud for releasing their code and worlds.\
  ... Aod of Generic for ... well, everything.  You're a hoopy frood, Aod.\
  ... Alander for many ideas and contributions.\
  ... John Brothers of Silly for permission to use Silly code and worlds.\
  ... Zrin for administering the mailing list.\
  ... Abaddon for proofreading our comm.c.\
  ... Hind, Quin, Vic, Diavolo, Oleg, Trienne, and others for porting help.\
  ... Diavolo, Grodyn, Morgenes, and others for code and bug fixes.\
  ... Raff, Doctor, VampLestat, Nirrad, Tyrst, PinkF, Chris, Glop for worlds.\
  ... the players and imps of Mud Dome, Final Mud, Mud Lite, Vego Mud, Rivers\
      of Mud, Ruhr Mud, and Mystic Realms for bug reports, ideas, new code,\
      and hours of enjoyment.\
                                Share and enjoy.\
", 
   Level = -1, 
   Keyword = "MERC FUREY KHAN HATCHET", 
}

HelpEntry
{
   Text = "Syntax: mfind <name>\
Syntax: ofind <name>\
\
MFIND finds all mobile types with a particular name.\
\
OFIND finds all object types with a particular name.\
", 
   Level = 101, 
   Keyword = "MFIND OFIND", 
}

HelpEntry
{
   Text = "&CMilitary Upgrades\
 \
&cshields:    &W100 units for 1m\
&chull:       &W4000 units for 1.5m\
&cspeed:      &W25 units for 750k\
&cenergy:     &W1000 units for 1m\
&clasers:     &W1 for 500k\
&chyperspeed: &W25 units for 500k\
 \
&cmissiles:   &W1 missile for 60k\
&ctorpedos:   &W1 torpedo for 90k\
&crockets:    &W1 rocket for 200k\
 \
&cSensors:    &W50k a point\
&cAstroArray: &W30k a point\
&cComm:       &W30k a point\
 \
&RSee also&W:&P MILITARYUPG2\
", 
   Level = 1, 
   Keyword = "'MILITARY UPGRADES' MILITARYUPG", 
}

HelpEntry
{
   Text = "&CStarfighter maxes:\
&c          lasers: &W4\
&c  missiles-types: &W16 missiles, 8 torpedos, or 6 rockets\
&c         shields: &W150\
&c           speed: &W150\
&c      hyperspeed: &W255\
&c            hull: &W1500\
&c         sensors: &W150\
&c      Astroarray: &W150\
&c            Comm: &W150\
 \
&CMidShip maxes:\
&c          lasers: &W8\
&c  missiles-types: &W30 missiles, 15 torpedos, or 10 rockets\
&c         shields: &W500\
&c           speed: &W120\
&c      hyperspeed: &W255\
&c            hull: &W4500\
&c         sensors: &W200\
&c      astroarray: &W200\
&c            comm: &W200\
 \
&CCapShip maxes:\
&c          lasers: &W10\
&c  missiles-types: &W30 missiles, 30 torpedos, AND 30 rockets\
&c         shields: &W1000\
&c           speed: &W85\
&c      hyperspeed: &W255\
&c            hull: &W20000\
&c         sensors: &W255\
&c      astroarray: &W255\
&c            comm: &W255\
", 
   Level = 1, 
   Keyword = "MILITARYUPG2", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y mine <object>\
 \
&cAllows you to place a landmine using a shovel.\
", 
   Level = 1, 
   Keyword = "MINE", 
}

HelpEntry
{
   Text = "Syntax:  minvoke <vnum>\
         minvoke <keyword of mob>\
Syntax:  oinvoke <vnum>\
         oinvoke <keyword of obj>\
         oinvoke <vnum/keyword of obj> <level>\
 \
MINVOKE invokes an instance of the mobile specified.\
 \
OINVOKE invokes an copy of the object specified.  It accepts an optional\
parameter for the level of the object to be invoked.\
 \
", 
   Level = 101, 
   Keyword = "MINVOKE OINVOKE", 
}

HelpEntry
{
   Text = "Syntax: mlist\
      :\9mlist <first mob>\
      :\9mlist <first mob> <last mob>\
\
This command will list all of the prototype mobs in your area, when used \
with no arguments.  When used with a single argument it will list all \
mobs including and after the argument, and when used with two arguments, \
it will list all mobs including and between the two. \
", 
   Level = 101, 
   Keyword = "MLIST", 
}

HelpEntry
{
   Text = "Syntax: mmenu <mob name> [menu page] (defaults to 'a' if none given)\
\
Mmenu will bring you into a menu system of editing mobiles.  To use mmenu,\
the mobile that you are editing should be in the same room as you.  To\
choose an option in the menu, type the number of the section followed by the\
desired letter, and any variables that may follow.\
\
See MENU for generic menu commands.\
", 
   Level = 101, 
   Keyword = "MMENU", 
}

HelpEntry
{
   Text = ".\
         The MOBprograms have been contributed by N'Atas-ha.\
\
         Haus hacked together room && obj programs 'cause\
          he got sick of failing to add lever bitvectors,\
               and cause he thought Carnage was a\
                  Trancendentally Cool Mud.\
", 
   Level = -1, 
   Keyword = "MOBPROG MOBPROGRAMS OBJPROG ROOMPROG MUDPROG", 
}

HelpEntry
{
   Text = "Trigger Optnl Triggering Variable Explanation\
------- ----- ------------------- -----------\
Act      {p}  <keyword / phrase>  [emotes, socials, actions, bamfs]\
Speech   {p}  <keyword / phrase>  [says or tells from same room as mob]\
Rand          <percentage>        [randomly triggered based on percentile]\
Fight         <percentage>        [random, within a fight, based on percentile]\
Hitprcnt      <percentage>        [percent is % of mob's max H.P.]\
Greet         <percentage>        [entry that mob can see, by mob/player]\
Allgreet      <percentage>        [entry by a mob/player, regardless if seen]\
Entry         <percentage>        [when the mob itself enters a room]\
Bribe         <amount of gold>    [when a player gives the mob money]\
Death         <percentage>        [when the mob dies]\
Script {hour}                     [loops a line at a time. Hour triggers start]\
Time          <hour>              [script prog, runs once on hour specified]\
Hour          <hour>              [loops as Script for an hour from start hour]\
 \
*NOTE* {hour}/<hour> is in military time. ie, 15 hours is 3p.m. mud time.\
*NOTE* The mpcommand MPDONOTHING currently only works in Script progs,\
       NOT in Time or Hour progs.\
 \
For mobs, see also: MPSTAT, MPEDIT, TRIGGER, MPCOMMANDS, IFCHECKS, VARIABLES.\
", 
   Level = 101, 
   Keyword = "MOBTRIGGERS MUDTRIGGERS MPTRIGGERS", 
}

HelpEntry
{
   Text = "&COrigin&W: &YMon Calamari\
 \
&c     The Mon Calamari are a bipedal, amphibious species who come from a\
planet with the same name.  They are shore-dwellers with an affinity for\
water, and have developed a symbiotic relationship with the water-dwelling\
Quarren.  With the Quarren to mine ore from the ocean floor and the Mon \
Calamari to design practical uses for the metal, the great floating \
cities of Mon Calamari were built. \
     These cities extend above and below the water, and the technology was\
eventually used to create orbiting space platforms.  The Mon Calamari see\
space as an endless ocean of stars, and they were tempted to explore \
those depths from the earlist periods of their civilization.  First they\
colonized their own star system, then they discovered the secret of the\
hyperdrive.  But before they could reach out to find the galactic community\
they dreamed of, they met the Empire. \
 \
&RAlso type&W: &W'&YSHOWSTAT MON CALAMARI&W'\
", 
   Level = 0, 
   Keyword = "MON_CALAMARI 'MON CALAMARI'", 
}

HelpEntry
{
   Text = "If your reading this you've obviously done something Moronic.\
 \
So next time take the time to look at things , read room\
descriptions or read the helps, or have respect for your\
fellow players, without screaming over OOC or acting...\
moronic.\
", 
   Level = 1, 
   Keyword = "MORON", 
}

HelpEntry
{
   Text = "No message of the day.\
", 
   Level = -1, 
   Keyword = "MOTD", 
}

HelpEntry
{
   Text = "The motds are 'messages of the day', and there are several:\
 \
New characters will see the 'nmotd', containing info relevant only to\
new characters (level 1).\
 \
Leveling characters (2 through 49) will see the 'motd', containing\
information relevant to those who are still playing to level.\
 \
Avatars (level 50) will see the 'amotd', containing information\
relevant to avatar characters.\
 \
Immortals (level 51 and higher) will see the 'imotd', containing\
information specifically relevant to all immortals.\
 \
Any of the motds may be seen with 'help <name of motd>' ... for\
example:  'help nmotd'\
 \
The motds are edited with hedit and saved with hset like all helpfiles.\
", 
   Level = 101, 
   Keyword = "MOTDS", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YMount &R&W<&YMob&R&W>\
&R&CSyntax &R&W: &YDismount \
\
&R&cMount is a skill which allows you to mount certain mobs.  Being mounted\
on a mob cuts down on movement points that are used whenever you move. \
 \
New water sectors allow a mounted person to traverse through without\
damage from drowning.  If you are in an area where your movements begin to\
drop suddenly, and/or you begin to lose hitpoints quickly, you should try\
to mount immediately.\
", 
   Level = 0, 
   Keyword = "MOUNT DISMOUNT", 
}

HelpEntry
{
   Text = "&c\
This discusses the process of moving your character from one place in the \
game to another.  The common movements are north, east, south, west, up \
down, northeast, southeast, southwest, and northwest.  You may also move \
in these directions by the use of &Yn, e, s, w, u, d, ne, se, sw, and nw. \
&c\
If you need to pass through a door, at times they require being unlocked \
and opened. To unlock a door, you type &YUNLOCK <direction or door name>&c.\
To open a door, you type &YOPEN <direction or door name>&c. \
 \
At times, you may run out of movement points or require healing.  To allow\
for faster recovery, you may &YSIT, REST, or SLEEP&c.  When are finished \
with your recovery, and wish to continue adventuring, type &YWAKE or STAND.\
", 
   Level = 1, 
   Keyword = "MOVE", 
}

HelpEntry
{
   Text = "&cThis discusses the process of moving your character from one place in the\
game to another.  The common movements are north, east, south, west, up \
down, northeast, southeast, southwest, and northwest.  You may also move \
in these directions by the use of n, e, s, w, u, d, ne, se, sw, and nw. \
If you need to pass through a door, at times they require being unlocked\
and opened. To unlock a door, you type UNLOCK <direction or door name>. To\
open a door, you type OPEN <direction or door name>.\
 \
At times, you may run out of movement points or require healing.  To allow\
for faster recovery, you may SIT, REST, or SLEEP.  When are finished with\
your recovery, and wish to continue adventuring, type WAKE or STAND.\
 \
&RSee also: &WEXIT SLEEP REST SIT WAKE STAND SOMEWHERE UNLOCK ENTER CLIMB\
FLY DRIVE \
", 
   Level = 1, 
   Keyword = "MOVEMENT", 
}

HelpEntry
{
   Text = "Syntax: MPADVANCE <name> <level>\
\
Advances the level of a player (not functional in prototype programs).\
", 
   Level = 101, 
   Keyword = "MPADVANCE", 
}

HelpEntry
{
   Text = "Syntax:  mpapply <victim>\
Syntax:  mpapplyb <victim>\
 \
These commands are used in the pre-auth area to signal a new character's\
authorization status.  When a character first enters the game, it will\
be targeted by an 'mpapply <victim>' which will inform the immortals that\
the character is waiting for authorization.  Once the character is\
authorized, a mob will attempt to 'mapplyb <victim>' the character, and\
the character will be sent into the actual game.\
", 
   Level = 101, 
   Keyword = "MPAPPLY MPAPPLYB", 
}

HelpEntry
{
   Text = "Syntax: MPASOUND <phrase>\
\
Displays a phrase to all surrounding rooms.\
", 
   Level = 101, 
   Keyword = "MPASOUND", 
}

HelpEntry
{
   Text = "Syntax: MPAT <vnum> <command>\
\
Lets the mobile perform a command at another location.\
", 
   Level = 101, 
   Keyword = "MPAT", 
}

HelpEntry
{
   Text = "The following commands can be used for Room, Mob and Object progs. The commands\
listed at the bottom are for mob progs only. A ** indicates command under \
development. Each command also has its own help file. Type HELP <COMMAND>.\
 \
MPCOMMAND       PARAMETERS            MPCOMMAND      PARAMETERS\
--------------  --------------------  -------------  --------------------\
MPASOUND        <phrase>              MPJUNK         <name/var>\
MPECHOAROUND    <name/var> <phrase>   MPECHOAT       <name/var> <phrase>\
MPECHO          <phrase>              MPMLOAD        <mob vnum>\
MPOLOAD         <object vnum>         MPPURGE        <object/mobile name>\
MPADVANCE       <player name> <level> MPTRANSFER     <name/all>\
MPFORCE         <name/all> <actions>  MPSLAY         <victim>\
MPDREAM         <name> <phrase>       MPDAMAGE       <name> <#hps> \
MPCLOSEPASSAGE  <room> <direction>    MPOPENPASSAGE  <origin> <dest> <dir>\
** MPPRACTICE   <victim> (skill|power) (max_percent)\
Mobs only:\
MPKILL           <name>                 MPGOTO <vnum>\
MPAT             <vnum> <command>\
 \
See also: MPSTAT, RPSTAT, OPSTAT, MPEDIT, RPEDIT, OPEDIT, TRIGGER, MPTRIGGERS,\
          RPTRIGGERS, OPTRIGGERS, IFCHECKS, VARIABLES.\
", 
   Level = 101, 
   Keyword = "MPCOMMANDS RPCOMMANDS OPCOMMANDS", 
}

HelpEntry
{
   Text = "Syntax:  mpdamage <victim> <amount>\
 \
This command inflicts a specified amount of damage on the victim.\
This damage will be affected by sanctuary, but is not affected by\
protect, saving throws or resists.\
 \
A mob should _never_ mpdamage itself, at risk of crashing.\
", 
   Level = 101, 
   Keyword = "MPDAMAGE", 
}

HelpEntry
{
   Text = "Syntax:  mpdeposit <amount>\
Syntax:  mpwithdraw <amount>\
 \
This command orders the mobile to deposit or withdraw a specified number\
of gold coins from an area.  These can be used in conjunction with mpat\
to tell the mob which area to withdraw/deposit money in.\
 \
Example:  mpat 21000 mpwithdraw 5000000\
 \
This would cause the mob to withdraw 5 million coins from the new Darkhaven\
area, as that is the area vnum 21000 is in.\
 \
If no mpat is used, the mob will withdraw or deposit the gold from the\
area in which it is located at the time.\
 \
", 
   Level = 101, 
   Keyword = "MPDEPOSIT MPWITHDRAW", 
}

HelpEntry
{
   Text = "Syntax: MPDREAM <name> <phrase>\
Sends a message to a sleeping character.\
", 
   Level = 101, 
   Keyword = "MPDREAM", 
}

HelpEntry
{
   Text = "Syntax: MPECHO <phrase>\
\
Displays a phrase to the entire room.\
", 
   Level = 101, 
   Keyword = "MPECHO", 
}

HelpEntry
{
   Text = "Syntax: MPECHOAROUND <name> <phrase>\
\
Displays a phrase to all in the room except victim.\
The abbreviation \"mer\" may be used for mpechoaround.\
", 
   Level = 101, 
   Keyword = "MPECHOAROUND", 
}

HelpEntry
{
   Text = "Syntax: MPECHOAT <name> <phrase>\
\
Displays a phrase to only the victim.\
The abbreviation \"mea\" may be used for mpechoat.\
", 
   Level = 101, 
   Keyword = "MPECHOAT", 
}

HelpEntry
{
   Text = "Syntax:  mpedit <mobile> <command> [number]  [program] [arguments]\
Syntax:  mpedit <mobile> add       <program> <arguments>\
Syntax:  mpedit <mobile> insert    <number>  <program> <arguments>\
Syntax:  mpedit <mobile> edit      <number>  [program] [arguments]\
Syntax:  mpedit <mobile> delete    <number>\
Syntax:  mpedit <mobile> list\
 \
Add, insert and edit will put you into the line editor to edit your\
program.  The arguments consist of a trigger, plus any arguments\
associated with that trigger.\
 \
For complete infomation, reference the mob program documentation available\
via FTP on realms.game.org:  (building.tar.gz/building.tar.Z/building.zip )\
 \
See MPSTAT, TRIGGER, MPTRIGGERS, MPCOMMANDS, IFCHECKS, IFCHECKS2, VARIABLES\
", 
   Level = 101, 
   Keyword = "MPEDIT", 
}

HelpEntry
{
   Text = "Syntax: MPFORCE <name/all>\
\
Forces a player/mob to do a command (non-functional on immortals, all will\
only force all in room).\
", 
   Level = 101, 
   Keyword = "MPFORCE", 
}

HelpEntry
{
   Text = "Syntax: MPGOTO <vnum>\
\
Goes to any room which is not private.\
", 
   Level = 101, 
   Keyword = "MPGOTO", 
}

HelpEntry
{
   Text = "Syntax:  mpinvis\
Syntax:  mpinvis <level>\
 \
This command controls a mob's ability to use a modified form of wizinvis.\
 \
Use 'mpinvis' alone to toggle the invisibility.\
 \
Use 'mpinvis <level>' to set the level at which the mob will be invis.\
 \
Mortals under the mobinvis level of the mob will be unable to see the mob\
when it goes mobinvis; they cannot see it with any power, it will be\
completely invisible to them.\
 \
Be warned, however, that its programs will still function as normal, the\
mortal will simply see a 'someone' if it performs an action or an echo\
that they see, just as if a wizinvis immortal performed the action.\
 \
Also be warned that at the present time, area attacks _will_ hit a mobinvis\
creature even if it is invisible.\
 \
", 
   Level = 101, 
   Keyword = "MPINVIS", 
}

HelpEntry
{
   Text = "Syntax: MPJUNK <name>\
\
Destroys an object in inventory/being worn - can be used with all.object .\
", 
   Level = 101, 
   Keyword = "MPJUNK", 
}

HelpEntry
{
   Text = "Syntax: MPKILL <name>\
\
Kills a player without using murder.\
", 
   Level = 101, 
   Keyword = "MPKILL", 
}

HelpEntry
{
   Text = "Syntax: MPMLOAD <vnum>\
        MPOLOAD <vnum> [<level> timer]\
\
Loads a mob or object.\
", 
   Level = 101, 
   Keyword = "MPMLOAD MPOLOAD", 
}

HelpEntry
{
   Text = "Syntax: MPOPENPASSAGE <origin> <destination> <direction>\
\
Opens a passage to a room (does not affect pre-existing doors)\
\
Syntax: MPCLOSEPASSAGE <room> <direction>\
\
Closes a passage to a room (does not affect pre-existing doors that were\
not created with mpopenpassage)\
", 
   Level = 101, 
   Keyword = "MPOPENPASSAGE MPCLOSEPASSAGE", 
}

HelpEntry
{
   Text = "Syntax:  mppkset <victim> yes/no\
 \
This command tells the mob to set the victim to either deadly or\
non-deadly status.\
 \
Mppkset yes will set the victim to deadly status.\
 \
Mppkset no will set the victim to non-deadly status.\
 \
", 
   Level = 101, 
   Keyword = "MPPKSET", 
}

HelpEntry
{
   Text = "Syntax:  mppractice <victim> <skill/power/language> <amount>\
 \
This command will set the victim's percentage of proficiency in the\
specified skill/power/language to the specified amount.\
 \
It cannot train a character in a skill/power/language the character does\
not have as a part of its class and that it does not already have as a\
result of its level.  In other words, it canot train a warrior in\
fireball, or a level 1 thief in gouge.\
", 
   Level = 101, 
   Keyword = "MPPRACTICE", 
}

HelpEntry
{
   Text = "Syntax: MPPURGE <object/mobile>\
\
Purges the room, or a specified object/mobile.\
", 
   Level = 101, 
   Keyword = "MPPURGE", 
}

HelpEntry
{
   Text = "Syntax:  mprestore <victim> <amount>\
 \
This command restores a specified number of hitpoints to the victim.\
", 
   Level = 101, 
   Keyword = "MPRESTORE", 
}

HelpEntry
{
   Text = "Syntax:  mpslay <victim>\
 \
This command orders the mob to slay the victim in cold blood; the\
victim gets no saving throw.\
", 
   Level = 101, 
   Keyword = "MPSLAY", 
}

HelpEntry
{
   Text = "Syntax:  mpstat <mob/mobvnum>\
 \
Mpstat will display all of the mobprograms that have been written for the\
specified mob.  If an instance of that mob exists in the game, it can be\
accessed with its vnum.\
 \
See MPEDIT, TRIGGER, MPTRIGGERS, MPCOMMANDS, IFCHECKS, IFCHECKS2, VARIABLES\
", 
   Level = 101, 
   Keyword = "MPSTAT", 
}

HelpEntry
{
   Text = "Syntax: MPTRANSFER <name/all>\
\
Transfers one or all in the room to a specified location.\
", 
   Level = 101, 
   Keyword = "MPTRANSFER", 
}

HelpEntry
{
   Text = "These functions, when complete, will function similarly to 'rat', but\
will be used to manipulate ranges of mobiles and objects instead of\
rooms.\
", 
   Level = 101, 
   Keyword = "MRANGE ORANGE", 
}

HelpEntry
{
   Text = "Syntax: mset <character> <field> <value>\
Syntax: rset <location>  <field> <value>\
\
MSET and RSET set the properties of mobiles and rooms respectively.\
\
RSET has been replaced with REDIT, which allows you to change every part\
of a room.\
\
MSET: See ACTFLAGS, SPECFUNCS, SAVINGTHROWS, RIS, NPC_RACES, ATTACKS,\
DEFENSES and MSTAT.\
\
If a mobile has the PROTOTYPE flag, modifying an instance of the mobile\
will also modify the index mobile, which all other instances of the\
mobile are based on.\
\
See MCREATE and REDIT.  For objects see OSET.\
\
Also see MMENU, RMENU, and OMENU for the menu editing system.\
", 
   Level = 101, 
   Keyword = "MSET RSET", 
}

HelpEntry
{
   Text = "Syntax:  mstat <character/mob or mobvnum>\
Syntax:  ostat <object/object vnum>\
Syntax:  rstat \
Syntax:  rstat <location>\
 \
MSTAT shows you statistics on a character or mobile.  If a copy of the mobile\
is present in the game, you can access it using its vnum.\
 \
OSTAT shows you statistics on an object.  If a copy of the object is present\
in the game, you can acces it using its vnum.\
 \
RSTAT shows you statistics on a location.  The location may be specified as\
a roomvnum, as the name of a mobile, or as the name of an object.  Rstat\
with no argument returns the statistics on your present room.\
 \
See MSET OSET and REDIT\
", 
   Level = 101, 
   Keyword = "MSTAT OSTAT RSTAT", 
}

HelpEntry
{
   Text = "&rMultiplaying &Ris illegal here in any way, shape, or form.\
We only allow one character per player.\
 \
&rNote:&R This includes sharing passwords.\
 \
&cOffenders will be dealt with harshly.\
 \
Any families who play here MUST inform the immortals BEFOREHAND. If they\
are caught logging onto the same IP without informing anyone, one of those\
characters WILL be slayed. \
 \
&R&WAlso see: &PHelp Rules&R&W,&P Help Rules2&R&W, &PHelp Suicide\
 \
&R&W\
", 
   Level = 1, 
   Keyword = "MULTIPLAYER MULTIPLAYING MULTI MULTIPLAY", 
}

HelpEntry
{
   Text = "Syntax:  muse <message>\
 \
Allows you to use the 'muse' channel, which functions the same as all\
other channels and can only be seen by those of high enough level.\
The level for access to muse can be controlled with 'cset'.\
 \
See CSET\
", 
   Level = 101, 
   Keyword = "MUSE", 
}

HelpEntry
{
   Text = "Well done!\
\
", 
   Level = -1, 
   Keyword = "M_ADVHERO_", 
}

HelpEntry
{
   Text = "Suddenly you are thrust into the stream of the force, and you find yourself\
without any means of movement, without means of defense, without means of\
survival.\
 \
Before your horrified eyes, a stream of pure darkness suddenly rushes into\
your heart, and slams into your very bieng, ripping at your soul. \
 \
To the lack of your salvation, a stream of white simultaniously whiplashes\
at your mind, robbing you of all knowledge and memories... \
 \
Woe to those who are attacked by the fury of the Force, for their\
punishment is great... \
", 
   Level = -1, 
   Keyword = "M_BALZHUR_", 
}

HelpEntry
{
   Text = "You are all powerful!\
", 
   Level = -1, 
   Keyword = "M_GODLVL10_", 
}

HelpEntry
{
   Text = "...Everything begins to fade to black.\
\
You feel yourself leaving your body... rising up into the air, you feel\
indeed much more free than you have ever felt before...\
\
You float high into the heavens... a vortex of ever-changing curved beams\
of colored light swirling around you faster and faster...\
\
Your soul is bursting with emotions you can barely conceive...\
You feel a burning inside... both cold and hot... a tingle of electricity\
grows into a powerful buzzing surge jolting through every inch of your body.\
\
A strange chorus of voices begins to sing indecipherable and long forgotten\
words... the singing grows louder and louder... a million voices as one.\
\
You feel yourself losing touch with reality... and all goes quiet.\
", 
   Level = -1, 
   Keyword = "M_GODLVL1_", 
}

HelpEntry
{
   Text = "...You begin to feel light-headed.\
\
Your hands begin to tingle softly...\
The feeling quickly grows into a strange radiating pulse of energy! \
\
The tingle rises up your arms and into your head, filing your mind with\
visions of worlds of wonder, far off places, great towers, vast mountains,\
oceans, seas, lush valleys, dark caverns and twisted passages...\
 \
You sense a feeling of wonderous potential and power in your hands...\
Enough power to build and create these visions for yourself!\
\
You feel much more powerful, eager and inspired!\
", 
   Level = -1, 
   Keyword = "M_GODLVL2_", 
}

HelpEntry
{
   Text = "...You feel slightly faint as your head begins to spin.\
\
Your hands begin to tingle once more...\
A vortex of energy starts to swirl throughout your hands, going faster\
and faster... becoming almost painful! \
\
Beams of light break through your skin, one at a time, then more and\
more until the light is almost to bright to bear...\
\
As your squint your eyes, you perceive a vision of great beasts of wonder,\
dangerous and unnatural fiends, pixies, faeries, tribes and clans, peoples\
of all kinds, ancient forgotten artifacts, weapons of vast untapped powers,\
crystal balls, magick rings, staves, wands, rods, arcane tomes of untold\
secrets... your mind is bursting with inspiration...\
 \
You sense a new, reborn feeling of unlimited potential and power...\
In your hands the power to build and create these visions for yourself!\
\
The bright light from your hands fades away... but strange faint glow\
remains always.\
", 
   Level = -1, 
   Keyword = "M_GODLVL3_", 
}

HelpEntry
{
   Text = "You suddenly feel much more powerful!\
", 
   Level = -1, 
   Keyword = "M_GODLVL4_", 
}

HelpEntry
{
   Text = "You suddenly feel much more powerful!\
", 
   Level = -1, 
   Keyword = "M_GODLVL5_", 
}

HelpEntry
{
   Text = "You suddenly feel much more powerful!\
", 
   Level = -1, 
   Keyword = "M_GODLVL6_", 
}

HelpEntry
{
   Text = "You suddenly feel much more powerful!\
", 
   Level = -1, 
   Keyword = "M_GODLVL7_", 
}

HelpEntry
{
   Text = "You suddenly feel much more powerful!\
", 
   Level = -1, 
   Keyword = "M_GODLVL8_", 
}

HelpEntry
{
   Text = "You suddenly feel much more powerful!\
", 
   Level = -1, 
   Keyword = "M_GODLVL9_", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Y'Toub\
&CInhabitants &W:&W Evocii, t'landa Til, Hutt\
&c\
     A planet in the Corellian sector, it was colonized by the Hutts \
and is the birthplace of Jabba the Hutt. The name \"Nal Hutta\" means \
\"glorious jewel\" in Huttese, which described its setting near a \
radioactive nebula. The planet, located in the Y'Toub System, was at \
one time known as Evocar, and was inhabited by the Evocii race. The \
Hutts, fleeing the desolation of Varl, settled on Evocar as a suitable \
home. They began trading technology to the Evocci for land, and \
continued to do so until they owned most of the planet. The Evocii \
realized what was happening, but too late. The Hutts began construction \
on a multitude of palaces and pleasure sites before the Evocii could do \
anything about. Their appeals to the Old Republic were taken seriously, \
but the contracts they signed with the Hutts were ironclad in favor of \
the Hutts. Even the Jedi Knights were powerless. The Hutts forced them \
off the planet and onto Nar Shaddaa, where they were eventually mutated \
over the years by the various technologies in use on the moon. The \
planet is ruled by the oldest Hutt families, who control Nar Shaddaa \
from their homes. The planet is huge, but it has no natural heavy \
metals. Thus, its density is less than expected. Its day lasts 87 \
standard hours, and its year is 413 local days in duration. What \
remains of the planet's natural landscape is flat, marshy bogs. In the\
aftermath of the Battle of Fondor and the duplicitous actions of Borga\
the Hutt, the Yuuzhan Vong targetted Nal Hutta for destruction. The \
Vong bombarded the planet from a remote location, although many of the\
missiles exploded in the atmosphere.\
", 
   Level = 1, 
   Keyword = "'NAL HUTTA'", 
}

HelpEntry
{
   Text = "&c\
The name of your character is very important.  As we are trying \
to keep this a Role Play Mud please pick reasonable names. \
Names of well known start wars characters are frownd upon \
and names with profanity or just plain stupid will be denied. \
In addition, \"common names\" that are used by our unoriginal \
world of today will also be denied. \
&w\
i.e. Luke, Vader, Han are well known names.\
i.e. Fish Head, Supermanguy, are just plain stupid.\
i.e. Jake, Michael, Jessica are too common a\
name.\
", 
   Level = 0, 
   Keyword = "NAME NAMES", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Y'Toub (Nal Hutta's moon-planet)\
&CInhabitants &W:&W Evocii, Hutt, Human\
&c\
Nal Hutta's spaceport moon, known for its vertically-built cities, \
experienced spaceship mechanics and its lawlessness. It is a center for\
smuggling operations, and is supposedly where Han Solo learned the \
smuggler's trade as a youth. When the Hutts took over the moon, they \
began using it as a spaceport, and soon huge refueling spires and \
repair facilities reached up from the ground into orbit. There is no\
observable land mass left on Nar Shaddaa, since the spaceports have\
grown around the spires and now completely cover the planet. The moon\
was uninhabited during the time that the Evocii lived on Nal Hutta, \
although they called it Evocar. When the Hutts took over the planet,\
they relegated the Evocii to Nar Shaddaa. However, the Hutts used them\
as semi-free slaves on the moon, and the press of so many various \
species and technologies eventually mutated the Evocii. Nar Shaddaa is\
similar to its parent planet, having a day which lasts 87 standard \
hours, and a year which lasts 413 local days. It is tide-locked with \
Nal Hutta, and only shows one side to its planet. This results in a day \
which has two distinct periods of ligthness: one in which is is in full \
view of the sun, and one in which it obtains light reflected from Nal \
Hutta. This also results in two periods of night. \
", 
   Level = 1, 
   Keyword = "'NAR SHADDAA'", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YRadar \
&CSyntax &R&W: &YCalculate &R&W<&YCoordinates&R&W> \
&CSyntax &R&W: &YHyperjump\
 \
&R&cThis skill allows you to calculate hyperjumps,\
and make use of a ship's radar. \
 \
&R&WAlso see: &PHelp Coordinates&R&W,&P Help Hyperspace&R&W, &PHelp\
Course\
", 
   Level = 1, 
   Keyword = "NAVIGATION", 
}

HelpEntry
{
   Text = "&WPlease make sure you read everything in the academy before you \
graduate. It will prepare you to play the game. \
If you get stuck on anything, use the newbie channel and \
hopefully someone will be able to help you. \
 \
&YNewbie <msg>&R&W\
 \
If someone yells at you that the question is IC, Do not be put off. Read\
the help files IC and Roleplay. Rephrase the question so it is in\
character, and ask it over &YChat <msg>&R&W instead.\
 \
Here are a list of newbie friendly areas by planet: \
 &WCoruscant       - &RGamaak Fitness Center\
 &WCorellia         - &RCoronet Academy \
 &WSerin Pluogus(bus) - &RHolochambers \
 &WTatooine       - &RWomp Rat Caves \
&W \
To the east of Menari Spaceport on Coruscant is a building \
that contains several job opportunities, some of which \
might be good for newbies to earn money. \
\
Most rental ships can be found on Menari Spaceport on Coruscant, \
although there are some spread around the other planets. \
 \
&RAlso see:  Help Multi, Help Death, Help IC, Help Rules  \
", 
   Level = 1, 
   Keyword = "NEW NEWBIE START BEGIN", 
}

HelpEntry
{
   Text = "Syntax: newbieset <character>\
\
NEWBIESET puts the default (i.e. Darkhaven Academy) equipment into the\
character's inventory.  Recipient must be level 5 or lower.\
", 
   Level = 101, 
   Keyword = "NEWBIESET", 
}

HelpEntry
{
   Text = "Listing of recent news\
", 
   Level = -1, 
   Keyword = "NEWS", 
}

HelpEntry
{
   Text = "&WChanged help files: \
&cCourse\
Calculate\
Tractor\
Docking\
 \
&WNew help files:\
&cCalculatediff\
Courseactual\
Shiptrack\
Guard\
Sabotage\
Adjustractor\
 \
&WLanding:\
&c \
Landing exp will be given once you complete your  \
landing sequence, to prevent several bug abuses that \
were possible before. Also, halfway through your  \
landing sequence, other ships watching you will find \
out what pad you are landing on. \
 \
 \
&WManuever:\
&c \
It is now much harder to hit ships vastly better than \
you in speed and size. The calculate is complicated,  \
so I wont explain it here. \
 \
", 
   Level = 1, 
   Keyword = "NEWSPACE", 
}

HelpEntry
{
   Text = "Syntax: newzones [low] [high]\
Lists the vnum range for rooms/mobs/objects in prototype areas that have been\
loaded.\
", 
   Level = 101, 
   Keyword = "NEWZONES", 
}

HelpEntry
{
   Text = "Please read the motd.\
", 
   Level = -1, 
   Keyword = "NMOTD", 
}

HelpEntry
{
   Text = "A 'nokill' flag has been added for NAMED mobs. It doesn't make sense\
for some mobs to die and then suddenly be back alive again ( the ones\
with names as opposed to ones like anonymous stormtroopers etc ).\
This flag will cause the mob that has it to appear to flee before it\
dies... It will still give experience but won't leave a corpse lying\
around. \
 \
use: mset <mob#> flags nokill\
", 
   Level = 100, 
   Keyword = "NOKILL KILL NO", 
}

HelpEntry
{
   Text = "Syntax:  noresolve\
 \
Toggles resolution of incoming player ip's into names.\
 \
", 
   Level = 101, 
   Keyword = "NORESOLVE", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y north or n\
&CSyntax &W:&Y south or s\
&CSyntax &W:&Y east or e\
&CSyntax &W:&Y west or w\
&CSyntax &W:&Y up or u\
&CSyntax &W:&Y down or d\
&c\
Use these commands to walk in a particular direction.\
", 
   Level = 1, 
   Keyword = "NORTH SOUTH EAST WEST UP DOWN", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y northeast or ne\
&CSyntax &W:&Y northwest or nw\
&CSyntax &W:&Y southeast or se\
&CSyntax &W:&Y southwest or sw\
&c \
Use these commands to walk in a particular direction.\
", 
   Level = 1, 
   Keyword = "NORTHEAST NORTHWEST SOUTHEAST SOUTHWEST", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y note list    &W<number>    &COR &W:&Y message list <number>\
&CSyntax &W:&Y note read    &W<number>    &COR &W:&Y message read <number>\
&CSyntax &W:&Y note read all            &COR &W:&Y message read all \
&CSyntax &W:&Y note write               &COR &W:&Y message write all \
&CSyntax &W:&Y note subject &W<string>    &COR &W:&Y message subject string\
&CSyntax &W:&Y note to      &W<to-list>   &COR &W:&Y message to <to-list>\
&CSyntax &W:&Y note take    &W<number>    &COR &W:&Y message take <number>\
&CSyntax &W:&Y note show                &COR &W:&Y message show \
&CSyntax &W:&Y note post                &COR &W:&Y message post \
&CSyntax &W:&Y note remove  &W<number>    &COR &W:&Y message remove \
 \
NOTE LIST &clists notes which you can read.  &YNOTE READ&c reads one or all\
notes. By specifying a number after &YNOTE LIST&c, you will list all notes\
including and after that number. \
 \
&YNOTE SUBJECT&c sets the subject line of a new note.  &YNOTE TO&c sets the\
list of recipients.  The recipient &WALL&c means all players, and the\
recipient &WIMMORTAL&c means all immortals. \
 \
&YNOTE WRITE&c puts you into edit mode, where you can easily enter your\
note with use of some simple editor commands: \
       &Y/? - &Whelp    &Y/s - &Wsave    &Y/l - &Wlist    &Y/c - &Wclear\
 \
&YNOTE SHOW&c shows your note in progress; &YNOTE CLEAR&c starts over.\
 \
&YNOTE POST&c posts your note for reading.  Posting is not automatic. \
 \
&YNOTE REMOVE&c removes the entire note if you are the sender, or just\
removes you from the to-list if you are a recipient.\
 \
&YNOTE TAKE&c takes the note as in &YNOTE REMOVE&c, as well as physically\
taking it in your inventory. \
 \
Notes now require a blank message disk to record :) \
 \
&RSee also&W: &PVOTING\
", 
   Level = 0, 
   Keyword = "NOTE MESSAGE BOARD BOARDS TERMINALS TERMINAL BOARD", 
}

HelpEntry
{
   Text = "Syntax: notitle <character>\
Syntax: noemote <character>\
Syntax: notell  <character>\
Syntax: silence <character>\
Syntax: unsilence <character>\
 \
NOTITLE, NOEMOTE, NOTELL, and SILENCE are used to muffle other characters, by\
preventing them from setting their title, emoting, telling, and using\
channels, respectively.  Characters who are notelled will also not recieve\
those forms of communication.\
 \
Use UNSILENCE to remove a player's silence.  Simple use notell, noemote or\
notitle on the character again to remove each of those restrictions.\
 \
", 
   Level = 101, 
   Keyword = "NOTITLE NOEMOTE NOTELL SILENCE UNSILENCE", 
}

HelpEntry
{
   Text = "A mobile may be any of the following races:\
 \
human         elf         dwarf        halfling     pixie        vampire   \
half-ogre     half-orc    half-troll   half-elf     gith         ant       \
ape           baboon      bat          bear         bee          beetle       \
boar          bugbear     cat          dog          dragon       ferret    \
fly           gargoyle    gelatin      ghoul        gnoll        gnome       \
goblin        golem       gorgon       harpy        hobgoblin    kobold       \
lizardman     locust      lycanthrope  minotaur     mold         mule \
neanderthal   ooze        orc          rat          rustmonster  shadow \
shapeshifter  shrew       shrieker     skeleton     slime        snake \
spider        stirge      thoul        troglodyte   undead       wight \
wolf          worm        zombie       bovine       canine       feline\
porcine       mammal      rodent       avis         reptile      amphibian \
fish          crustacean  insect       spirit       magical      horse \
animal        humanoid    monster      god\
 \
See also: ACTFLAGS, SPECFUNCS, SAVINGTHROWS, RIS, \
          ATTACKS, LANGUAGES, DEFENSES, MSTAT, MCREATE, MMENU.\
 \
", 
   Level = 101, 
   Keyword = "NPCRACES NPC_RACES", 
}

HelpEntry
{
   Text = "Flags that objects can have:\
 \
Flag          Affect                Flag          Affect\
====          ======                ====          ======\
glow          n/a                   hum           n/a\
dark          n/a                   loyal         loyalty ('help loyal')\
evil          glow on det. evil     invis         invisible\
magic         prevents enchant      nodrop        cannot drop\
bless         +20% resist dam.      antigood      zap if align +350\
              dbl. duration poison\
              weapon\
antievil      zap if align -350     antineutal   zap if align -350 to +350\
noremove      cannot remove         inventory     purge upon char. death\
antimage      zap if mage           antithief     zap if thief\
antiwarrior   zap if warrior        anticleric    zap if cleric\
organic       +20% suscept. dam.    metal         +20% resist damage\
donation      prevents get all      clanobject    n/a\
clancorpse    n/a                   prototype     n/a\
 \
Additional flags:\
covering      items inside this are 'covered', use 'look under <object>' to\
              see 'inside'.  The object does not have to be a container to\
              be a covering object.  Use 'reset put' to indicate objects to\
              be covered by this object.\
", 
   Level = 101, 
   Keyword = "OBJECTFLAGS", 
}

HelpEntry
{
   Text = "&c To see the objects you currently posess, type &YINVENTORY&c and\
&YEQUIPMENT. You may &YGET&c or &YDROP&c an item in a room, if you can\
carry it. \
 \
You may &YWEAR, WIELD, &cor&Y HOLD&c equipment to use it.  To stop using a\
piece of equipment, you &YREMOVE&c it.  Before you may wield a new weapon,\
you must first &YREMOVE&c the old weapon. You pay also &YPUT&c objects in\
other objects. \
  \
You can gain information on your objects by using &YLOOK &cor\
&YEXAMINE&c.&Y  EXAMINE &ctells you the condition of your item, as a more\
detailed form of &YLOOK&c. \
 \
&RSee Also&W:&P JUNK DIG APPRAISE BUY SELL EAT DRINK PICK COMPARE\
", 
   Level = 1, 
   Keyword = "OBJECTS", 
}

HelpEntry
{
   Text = "Object types listed in bit order:\
 \
  None        Light     Scroll     Wand        Staff       Weapon\
  Fireweapon  Missile   Treasure   Armor       Potion      Worn\
  Furniture   Trash     Oldtrap    Container   Note        Drink_con\
  Key         Food      Money      Pen         Boat        Corpse_npc\
  Corpse_pc   Fountain  Pill       Blood       Bloodstain  Scraps\
  Pipe        Herb_con  Herb       Incense     Fire        Book\
  Switch      Lever     Pullchain  Button      Dial        Rune\
  Runepouch   Match     Trap       Map         Portal      Paper\
  Tinder      Lockpick  Spike      Disease     Oil         Fuel\
  Short_bow   Long_bow  Crossbow   Projectile  Quiver      Shovel\
  Salve\
 \
Not all are implemented.\
 \
See OSET ITEMVALUES ARMORCLASS.\
", 
   Level = 101, 
   Keyword = "OBJECTTYPES", 
}

HelpEntry
{
   Text = "Trigger Optnl Triggering Variable Explanation\
------- ----- ------------------- -----------\
Wear          <percentage>        [when a player wears the object]\
Remove        <percentage>        [when a player removes the object]\
Speech   {p}  <keyword / phrase>  [says or tells from same room as mob]\
Rand          <percentage>        [randomly triggered based on percentile]\
Sac           <percentage>        [when a player sacrifices the object]\
Zap           <percentage>        [when the player is zapped due to alignment]\
Get           <percentage>        [when a player gets the object]\
Drop          <percentage>        [when a player drops the object]\
Damage        <percentage>        [when the object is damaged]\
Repair        <percentage>        [when the object is repaired]\
Greet         <percentage>        [when a mob/player enters the room]\
Exa           <percentage>        [when the object is Examined or Looked upon]\
Look          ** THIS TRIGGER IS NOT CURRENTLY IN USE **\
Push          <percentage>        [when a player pushes an object]\
Pull          <percentage>        [when a player pulls an object]\
Use           <percentage>        [see 'help useprog' for details]\
 \
For objects see also: OPSTAT, OPEDIT, TRIGGER, OPCOMMANDS, IFCHECKS, VARIABLES.\
", 
   Level = 101, 
   Keyword = "OBJTRIGGERS OPTRIGGERS", 
}

HelpEntry
{
   Text = "Syntax: ogrub <num of lines> <sort order> [keywords] [operands] \
 \
ogrub 20 level<8 avg>12 \
Display weapons below level 8 that do more than 12 average damage. \
 \
ogrub 20 +wear type=armor hp>100 dr>20 \
Display armor with more than 100 added hp and 20 added dam roll. Sort\
by wear location. \
 \
ogrub 20 +type nm ng vnum>=900 vnum<=951 level>45 hp>0 \
Display all eq from Olympus that is above level 45 and affects hp. \
Sort by object type in ascending order. Display only that eq held \
by players - ignore any on mobs or on the ground. \
 \
ogrub 20 +name name<>gloves \
Display all eq with the substring \"gloves\" in the name field. Sort \
by object name. Note that often objects are named with two or three \
keywords like \"gauntlets steel gloves\". The substring operator <>  \
is used to search fields for substrings. \
 \
ogrub 20 +cname np ng type=light int>0 \
Display lights on mobs that raise intelligence. Sort by character name.\
Ignore any lights on players or on the ground. \
 \
ogrub 20 -dr np ng luck>0 level>=10 level<=20 \
Display eq that raises luck and is between levels 10 thru 20. Sort by \
object damroll in descending order. Only display eq on mobs. \
 \
ogrub 20 +level or hr>25 dr>25 hp>100 mp>100 ac<-100 \
Display eq that raises hit roll more than 25 or dam roll more than 25 \
or hit points more than 100 or mana points more than 100 or lowers \
armor class by more than 100 (remember the lower the AC the better) \
Sort by object level in ascending order. \
 \
ogrub 20 or d2 sav0>1 sav1>1 sav2>1 sav3>1 sav4>1 \
Display equipment that have affects resulting in any saving throws that are\
greater than one. Note that positive saving throws are bad for characters \
and negative ones are good. The more negative the better. The d2 keyword \
requests an alternate form of display which shows the saving throws. \
 \
ogrub 20 nm cname=joe type=weapon    Display Joe the player's weapons \
ogrub 20 np cname=joe type=armor     Display Joe the mob's armor  \
 \
See Also: HELP OGRUB DATA\
", 
   Level = 105, 
   Keyword = "OGRUB", 
}

HelpEntry
{
   Text = "Syntax: ogrub <num of lines> <sort order> [keywords] [operands] \
 \
Here is some reference data you will need in order to use OGRUB. \
 \
FIELDS                      TYPES      WEAR     MODIFIERS \
cname - chr name          1 light      1 take     or - select any \
count - obj count         2 scroll     2 finger  +field - sort up \
vnum  - obj vnum          3 wand       3 neck    -field - sort down \
type  - obj type          4 staff      4 body     np - no players  \
name  - obj name          5 weapon     5 head     nm - no mobs           \
level - obj level         9 armor      6 legs     ng - not on the ground\
wear  - obj wear locn    10 potion     7 feet     d2 - display saving\
avg   - obj avg dam      15 container  8 hands \
hr    - obj hit roll     16 note       9 arms     OPERATORS \
dr    - ojj dam roll     18 key       10 shield    = equals \
hp    - obj hit pts      19 food      11 about    != not equal \
mp    - obj mana pts     23 mcorpse   12 waist    >  greater than \
ac    - obj armor class  24 pcorpse   13 wrist    >= greater than or equal\
str   - obj str affect   26 pill      14 wield    <  less than \
dex   - obj dex affect   24 book      15 hold     <= less than or equal \
con   - obj con affect                16 dual     <> substring \
wis   - obj wis affect                17 ears \
int   - obj int affect                18 eyes \
luck  - obj luck affect               19 missile \
sav0  - save_poison \
sav1  - save_rod \
sav2  - save_para \
sav3  - save_breath \
sav4  - save_spell \
  \
Don't be scared by the fact that things like \"pill\" are referenced by \
a number like 26. If you want info about pills, you can request the \
info either by the name \"pill\" or the number \"26\".  ***SMILE*** \
 \
See also: HELP OGRUB \
 \
 \
", 
   Level = 105, 
   Keyword = "OGRUB DATA", 
}

HelpEntry
{
   Text = "You can use a number argument in info, target, etc. 2.barloz, for example.\
Ships will now drop debris after being blown to pieces. \
Actions will no longer be seen if a person can not see you <emotes, \
socials> \
Incoming tells will buzz to other players in the room with you. Outgoing\
tells will show what you are saying through the comlink.\
SEnding a tell from the same room as the receiver will send a whisper-like\
message. Others will not hear or see the message. \
Inventory flagged items will no longer work in player shops. \
Punch is back in, and fixed. \
Due to a large amount of accidental deaths, you can no longer accept a \
challenge from the same room as your challenger. \
Using a staff as well as durasteel when making a vibro-blade will create a\
forcepike instead. Using a sniper scope in a blaster will increase snipe\
by 30, but hitroll will always be 0.\
Clan rosters are in. All 3 leaders can access it, and its empowerable. \
roster is the command, of course. \
aliasfocus/unfocusalias is in, see help file. \
draw is in, an area mapper. see help file. \
Your last-bought pet will now save with you. \
Dismiss will un-dominate mobs with you as their master. \
", 
   Level = 1, 
   Keyword = "OLDCHANGES3", 
}

HelpEntry
{
   Text = "&W1)  &YComments &W- Make sure to write a comment when making an action\
               against a player. \
 \
2)  &YHangers &W- FAPS can't have one.\
 \
3)  &YMortal Council &W- Ask Mandy for the note. \
 \
4)  &YDiscussion on Mud Changes &W- Mandy has notes. \
 \
5)  &YShip Maxes &W- Change still pending. \
 \
6)  &YImm Alts &W- You can be in leadership positions again. \
 \
7)  &YHapes &W- Kane.are needs to be looked over. \
 \
8)  &YRule 14 &W- Does not apply if you throw the first stone. \
 \
9)  &YBuilders&W - You are not admin.  Go to admin if problem. \
 \
10) &YLaina&W - Has quit, Mandy promoted to Head. \
 \
11) &YPrograms &W- If you find a program giving away the name of \
               the person, change it so it does not. \
 \
", 
   Level = 101, 
   Keyword = "OLDNEWS", 
}

HelpEntry
{
   Text = "Syntax: oldscore\
\
Oldscore shows the score information in a different way than 'score'.\
", 
   Level = 0, 
   Keyword = "OLDSCORE", 
}

HelpEntry
{
   Text = "Syntax: olist\
      :\9olist <first object>\
      :\9olist <first object> <last object>\
\
This command will list all of the prototype objects in your area, when used \
with no arguments.  When used with a single argument it will list all \
objects including and after the argument, and when used with two arguments, \
it will list all objects including and between the two. \
", 
   Level = 101, 
   Keyword = "OLIST", 
}

HelpEntry
{
   Text = "Syntax: omenu <object name> [menu page] (defaults to 'a' if none given)\
\
Omenu will bring you into a menu system of editing objects.  To use omenu,\
you must be holding the object that you are editing in your inventory.  To\
choose an option in the menu, type the number of the section followed by the\
desired letter, and any variables that may follow.\
\
See MENU for generic menu commands.\
", 
   Level = 101, 
   Keyword = "OMENU", 
}

HelpEntry
{
   Text = "Syntax:  opedit <object> <command> [number]  [program] [arguments]\
Syntax:  opedit <object> add       <program> <arguments>\
Syntax:  opedit <object> insert    <number>  <program> <arguments>\
Syntax:  opedit <object> edit      <number>  [program] [arguments]\
Syntax:  opedit <object> delete    <number>\
Syntax:  opedit <object> list\
 \
Add, insert and edit will put you into the line editor to edit your program.\
The arguments consist of a trigger, plus any arguments associated with that\
trigger.  Object programs are like mobprograms, with trigger differences.\
 \
To edit an Objprogram, you must be holding the object in your inventory.\
 \
See OPSTAT, TRIGGER, OPTRIGGERS, OPCOMMANDS, IFCHECKS, IFCHECKS2, VARIABLES\
", 
   Level = 101, 
   Keyword = "OPEDIT", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y open   <object|direction>\
&CSyntax &W:&Y close  <object|direction>\
&CSyntax &W:&Y lock   <object|direction>\
&CSyntax &W:&Y unlock <object|direction>\
&CSyntax &W:&Y pick   <object|direction>\
&c\
&YOPEN &cand &YCLOSE &copen and close an object or a door. \
 \
&YLOCK &cand &YUNLOCK &clock and unlock a closed object or door.  You must\
have the requisite key to &YLOCK &cor &YUNLOCK&c.\
 \
&YPICK&c can open a lock without having the key.  In order to &YPICK&c\
successfully, you must practice the appropriate skill.\
", 
   Level = 0, 
   Keyword = "OPEN CLOSE LOCK UNLOCK PICK", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YOpenbay\
 \
&CSyntax &R&W: &YClosebay\
 \
&CSyntax &R&W: &YRequest &R&W<&YShip&R&W> \
 \
 \
&YOpenbay&c and &Yclosebay&c open and close the hanger bay doors of a ship.\
 This can only be done in the pilot seat, or the hanger of the ship.\
 \
&YRequest &callows the owner of a capital ship to open the bay doors of\
that ship remotely.  You must be close to the ship, and the ship must have\
autopilot on. \
", 
   Level = 1, 
   Keyword = "OPENBAY CLOSEBAY REQUEST", 
}

HelpEntry
{
   Text = "Not currently functional.\
", 
   Level = 101, 
   Keyword = "OPENTOURNEY", 
}

HelpEntry
{
   Text = "Syntax: opstat <object/object vnum>\
 \
Opstat will display all of the objprograms that have been written for the\
specified object.  If a copy of the object exists in the game, it can be\
accessed by its vnum.\
 \
See OPEDIT, TRIGGER, OPTRIGGERS, OPCOMMANDS, IFCHECKS, IFCHECKS2 VARIABLES\
", 
   Level = 101, 
   Keyword = "OPSTAT", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Bright Jewel\
&CInhabitants &W:&W Human, Savrip\
&c\
     The planet on which Han Solo was almost captured by bounty \
hunters, including Boba Fett, prior to the Battle of Hoth. Ord Mantell \
was known for its lenient banking laws and their flexibility. It was \
settled some 12,000 before the Battle of Endor by Corellian colonists \
as an advanced military outpost for the Old Republic. Over time, more\
wealthy planets and better hyperspace routes diminished Ord mantell's\
strategic importance, but became something of a free port for all \
manner of freighters and cargo ships. Despite the planet's dropping \
stature, it remained known as the Heart of the Bright Jewel, orbiting\
the blue star at the center of the Bright Jewel System. The planet is\
famous for its thick, outer cometary cloud, which has been the site of\
the Blockade Runners Derby for nearly 100 years. It is also one of \
Thrawn's feint attacks just prior to his attack on Coruscant. It has \
two moons, and has a temperate environment. It claimed to be free of \
Imperial interest, but Han Solo discovered an Imperial fleet on \
maneuvers when he arrived there. It was at a starship scrapyard on Ord \
Mantell that Dash Rendar, working to locate information on Han Solo's \
whereabouts for Lando Calrissian after the debacle at Cloud City, ran \
into IG-88 and other bounty hunters. The bounty hunters were trying to \
intercept Boba Fett, who was transporting Han Solos frozen body to \
Jabba the Hutt. \
", 
   Level = 1, 
   Keyword = "'ORD MANTELL'", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y order <character> command\
&CSyntax &W:&Y order all command\
 \
&YORDER&c orders one or all of your charmed followers (including pets) to\
perform any command.  The command may have arguments.  You are responsible\
for the actions of your followers, and others who attack your followers\
will incur the same penalty as if they attacked you directly. \
 \
Most charmed creatures lose their aggressive nature (while charmed). \
 \
If your charmed creature engages in combat, that will break the charm. \
", 
   Level = 0, 
   Keyword = "ORDER", 
}

HelpEntry
{
   Text = "Syntax:  oset <object>    <field> <value>\
         oset object on\
 \
If the copy of the object you are currently modifying has the PROTOTYPE flag,\
your modifications will also modify the index of that object, which all other\
instances of the object are based on.  In the future, every copy of that obj\
will reflect your modifications.\
 \
Also be aware that modifications to the object affect list (everything that\
is listed after 'object values') will affect _every_ copy of that object in\
the game, including old copies (even if they are not online).  Thus if you\
change a prototype-flagged copy of a sword to +4 damroll, every copy of that\
vnum ever made will reflect that change.  If you add a 'magic' flag to that\
sword, however, only copies made after the change will be affected.\
 \
If the copy of the object you are modifying does NOT have the PROTOTYPE flag,\
your modifications will affect only that copy.\
 \
OSET ON will lock you onto a particular object.  Once locked on, all commands\
commands will imply 'oset <object>'.  Hitting enter while in OSET ON gives\
you an ostat of the object you are working on.  To get out of OSET ON, simply\
type the word DONE. Example:\
 \
        oset staff on\
        long A long gnarled staff of burnished oak lies here.\
        type staff\
        done\
 \
See AFFECTTYPES, WEARFLAGS, OBJECTFLAGS, OBJECTTYPES, ARMORCLASS\
ITEMVALUES, WEAPONTYPES, VARIABLES, OMENU and LAYERING\
", 
   Level = 101, 
   Keyword = "OSET", 
}

HelpEntry
{
   Text = "help oset flags\
Usage: oset <object> flags <flag> [flag]...\
1. glow:  Object will glow.\
2. dark:  The object will be dark.  \
3. magic: The object will be capable of magic. \
4. bless:  The object will be blessed.  \
5. antievil:  Object cannot be wielded/worn by a player with negative\
alignment.\
6. noremove:  Once a player wields/wears this object, they cannot\
remove it.\
7. antisith:  Object cannot be wielded/worn by a Sith\
8. antisoldier:  Object cannot be wielded/worn by a Soldier.\
9. donation: ???\
10. covering: ???\
11. hum:  The object will emit a humming sound.\
12. invis:  The object will be invisible.\
See also, Help Oset_Flags2\
", 
   Level = 100, 
   Keyword = "OSET_FLAGS OSET_FLAGS OSETFLAGS OFLAGS OFLAG OBJ_FLAGS", 
}

HelpEntry
{
   Text = "1. nodrop:  Once in a players inventory, the player cannot drop\
it.\
2. antigood:  Object cannot be wielded/worn by a player with positive\
alignment\
3. antipilot: Object cannot be wielded/worn by a Pilot.\
4. anticitizen:  Object cannot be wielded/worn by a Citizen.\
5. antineutral:  Object cannot be wielded/worn by a player with\
neutral alignment.\
6. inventory:  ???\
7 antithief:  Object cannot be wielded/worn by a Thief.\
8. antijedi:  Object cannot be wielded/worn by a Jedi.\
9. clanobject:  Object designed for a specific clan or\
organization.\
10. antihunter:  Object cannot be wielded/worn by a\
Hunter.\
11. small_size: Can only be worn by; jawa, noghri,\
ewok\
12. human_size:  Can only be worn by; Human, Rodian, Twi'lek,\
Adarian\
13. large_size: Can only be worn by; Wookiee, Mon Calamarian,\
Gamorrean\
14. hutt_size: Can only be worn by; Hutt\
15. contraband: DO NOT SET IT ... This will be added and removed\
automatically \
by customs officers and crimelords etc.  Its purpose is to give\
experience for\
smuggling illegal goods from planet to planet.\
", 
   Level = 100, 
   Keyword = "OSET_FLAGS2 OSET_FLAG2 OSETFLAGS2 OSETFLAG2 OFLAGS2 OFLAG2", 
}

HelpEntry
{
   Text = "Syntax: override <ship> <command>\
 \
Override is similar to REQUEST, except it has more options.\
Commands include:\
shields - Toggles shields off/autorecharge on\
autopilot - Toggles autopilot\
openbay\
closebay\
stop - Stops ship\
", 
   Level = 1, 
   Keyword = "OVERRIDE", 
}

HelpEntry
{
   Text = "Syntax:  owhere <object keyword>\
Syntax:  mwhere <mob keyword>\
 \
Owhere displays the location of all instances of the specified object.\
 \
Mwhere displays the location of all instance of the specified mobile.\
 \
See VSEARCH\
", 
   Level = 101, 
   Keyword = "OWHERE MWHERE", 
}

HelpEntry
{
   Text = "Syntax: pardon <character> killer\
Syntax: pardon <character> thief\
\
PARDON pardons a player for their crimes.\
", 
   Level = 101, 
   Keyword = "PARDON", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y <automatic>\
&c\
This skill wards off incoming attacks, taking no damage from them.  Use of\
the skill is automatic once you have practice it.  You must be wielding a\
lightsaber to parry.\
", 
   Level = 0, 
   Keyword = "PARRY", 
}

HelpEntry
{
   Text = "Syntax: feel 'pass door'\
\
This power enables the caster to pass through closed doors.\
", 
   Level = 0, 
   Keyword = "'PASS DOOR'", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y password <old-password> <new-password>\
 \
PASSWORD &cchanges your character's password.  The first argument must be\
your old password.  The second argument is your new password.\
 \
The &YPASSWORD&c command is protected against being snooped or logged. \
 \
Passwords can not contain certain characters, or spaces.  As well, we\
advise that you use an alphanumeric password (containing both numbers and\
letters) as they are harder to guess.\
", 
   Level = 0, 
   Keyword = "PASSWORD", 
}

HelpEntry
{
   Text = "PC      =  player character\
NPC     =  non-player character\
", 
   Level = 1, 
   Keyword = "PC NPC", 
}

HelpEntry
{
   Text = "Syntax: peace\
\
PEACE causes all characters in a room to stop fighting.\
", 
   Level = 101, 
   Keyword = "PEACE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YAutomatic\
 \
&cThis skill shows you a player or mob's inventory when you look at them. \
Use of this skill is automatic once you have practice it.\
", 
   Level = 0, 
   Keyword = "PEEK", 
}

HelpEntry
{
   Text = "You can buy pets in the pet shop.  You may buy one more pet each time you\
advance in level.  Your pet-buying opportunities do not accumulate; use them or\
lost them.  This policy prevents wholesale abuse of pets.\
", 
   Level = 0, 
   Keyword = "PET PETS", 
}

HelpEntry
{
   Text = "Syntax : Pick (direction)\
\
This skill enables you to pick open locked doors.\
", 
   Level = 1, 
   Keyword = "'PICK LOCK'", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Pick <direction>\
&c\
This skill enables you to pick open locked doors.\
", 
   Level = 1, 
   Keyword = "'PICK LOCK' PICKLOCK PICK", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YPick &R&W<&YShip&R&W>\
 \
&cA useful skill if you wish to get into someone's ship. \
 \
&RNote:&r You need to have &YPick Lock&r practiced at least once, in order\
for &YPick Ship Lock&r to work.\
", 
   Level = 1, 
   Keyword = "'PICK SHIP LOCK' PICKSHIP PICKSHIPLOCK", 
}

HelpEntry
{
   Text = "&R&cPiloting is one of the more popular classes.  One of the more fun\
features of the Star Wars Reality codebase is its space system, and\
especially its space combat.  The piloting class gives you not only the\
best space combat abilities, but also the ability to fly the most powerful\
ships in the game, capital-class ships, from the SSD Executor to the MC80\
Cruiser to one of the faction clan's custom ships.\
 \
&RAlso see&W: &PHelp Navigation\
          Help 'Ship Systems'\
          Help Starfighters\
          Help 'Weapon Systems'\
          Help 'Space Combat 1'\
          Help Midships\
          Help 'Ship Docking'\
          Help Speeders\
          Help 'Tractor Beams'\
          Help 'Space Combat 2'\
          Help 'Space Combat 3'\
          Help 'Speeder Combat'\
          Help Jumpvector\
          Help 'Capital Ships'\
&R&W\
", 
   Level = 1, 
   Keyword = "PILOT PILOTING", 
}

HelpEntry
{
   Text = "&g Pirates are allowed to raid ships belonging to other players with intent\
of looting cargo and credits. They are allowed to disable the ship in\
order to gain  access, but not to kill the individual. Pirates can &RNOT&g\
pkill unless out of self defense. Failure to abide by these rules will\
result in punishment to be determined by the Admin.  \
", 
   Level = 0, 
   Keyword = "PIRATE PIRATING", 
}

HelpEntry
{
   Text = "&CSyntax: &Yplacevendor\
&c \
When standing in an empty player shop, you can type this to place your\
vendor.\
", 
   Level = 1, 
   Keyword = "PLACEVENDOR", 
}

HelpEntry
{
   Text = "Syntax:  cast 'plant pass' <victim>\
 \
This power allows the caster to merge with nearby foliage, and flow though\
it to emerge near the victim.\
 \
Obviously this power requires a good deal of natural foliage in both the\
caster's and the victim's location.\
", 
   Level = 0, 
   Keyword = "'PLANT PASS'", 
}

HelpEntry
{
   Text = "&c\
In certain rooms of the game, you can buy a shop.  Using 4 commands,\
you can price items and collect the credits they get for any items you\
give them.\
 \
&RSee Also&W:&P BUYVENDOR, PRICEVENDOR, PLACEVENDOR, GETCREDITS\
", 
   Level = 1, 
   Keyword = "PLAYERSHOPS", 
}

HelpEntry
{
   Text = "Syntax: feel poison <victim>\
\
This power reduces the strength of the victim by two, as well as reducing the\
victim's regeneration rate.\
", 
   Level = 0, 
   Keyword = "POISON", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YPoison &R&W<&YWeapon&R&W>\
\
&YPoison weapon&c is a skill that enables you to coat the tip of your\
weapon with a deadly poison.  In battle, this poison will cause ill\
effects on your opponent.  Be warned, it has been said that poison has a\
strong lessening effect on the lifetime of weapons.  To poison a weapon,\
you must have the weapon, poison, and a full canteen in your inventory.\
", 
   Level = 0, 
   Keyword = "'POISON WEAPON'", 
}

HelpEntry
{
   Text = "Syntax:  cast 'possess' <mob>\
 \
This power enables you to switch into a mob for a short amount of time.\
", 
   Level = 101, 
   Keyword = "'POSSESS'", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YPostGuard \
  \
&cThis posts a guard from your clan or organization at your location. \
These guards will attack other clanned members beside your own. \
", 
   Level = 1, 
   Keyword = "'POST GUARD' POSTGUARD", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YPRACTICE &R&W<&YSkill/Power/Weapon&R&W> \
 \
&YPRACTICE&c alone, without an argument, tells you your current ability in\
all the skills and powers available to you.  You can check this anywhere.\
 \
&YPRACTICE&c with an argument, practices that skill or power.  Your\
learning percentage starts off at 0% &r(Unlearned)&c, and can be practice\
to 20% by a guild master (mob).  Most players, who have maxed their\
intelligence and wisdom, can teach much higher, up to 99%.  Using the\
skill, one can get it at 100% &R(Adept)&c.\
&R&W\
", 
   Level = 1, 
   Keyword = "PRACTICE", 
}

HelpEntry
{
   Text = "&CSyntax: &Ypricevendor &w<&Yitem&w> <&Ycost&w>\
&c \
After giving your vendor an item, you need to price it. The item WILL NOT\
SAVE if you do not price the item, and depending on the type, it \
may not show up in the list.\
", 
   Level = 1, 
   Keyword = "PRICEVENDOR", 
}

HelpEntry
{
   Text = "Syntax: prompt <string>\
 \
Sets your prompt to a given string.\
 \
The game automatically sets your prompt when your character is created.\
You can use PROMPT to change your prompt to something else.\
 \
If you type 'default' as the string, your prompt will be set back to the\
game default.  Otherwise you may use any string you want.  A few special\
characters may be embedded into the string to customize it to your\
player, followed by a token indicating what action to take.\
 \
The first special character is:  $\
Tokens for $ are:\
  $h  - current hitpoints\
  $H  - maximum hitpoints\
  $m  - current forcepoints\
  $M  - maximum forcepoints\
  $v  - current movement\
  $V  - maximum movement\
  $g  - credits held\
  $a  - your alignment\
  $r  - vnum of current room (Immortal only)\
  $R  - vnum of current room (Immortal only, and only if config +vnum is\
        set.  Shows '<#vnum> ', including trailing space)\
  $x  - current experience\
  $X  - experience needed to gain a level\
  $i  - Wizinvis (Immortal only, shows '(Invis Lv) ', including trailing\
        space)\
  $I  - Raw wizinvis (Immortal only, only shows 'Lv', and only if wizinvis\
        is active)\
  $p  - Position (ie Resting, Sitting, Sleeping)\
 \
The other special characters are:\
  &&  - Foreground color\
  ^^  - Background color\
 \
Example: Prompt $h$m$v\
         Will give you a prompt of current hit points, force, and movement.\
 \
Please see HELP COLORS for a list of the color tokens.\
", 
   Level = 0, 
   Keyword = "PROMPT", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YPropaganda &R&W<&YCitizen&R&W> \
 \
&cThis increases your clan's popular support if they control the planet or\
decreases it if they don't. Actual number is +/-2.5 per successful\
conversation. \
", 
   Level = 1, 
   Keyword = "PROPAGANDA", 
}

HelpEntry
{
   Text = "Syntax : feel 'protection from darkness' <target>\
\
Protect users from the darkside for a limited period.\
", 
   Level = 1, 
   Keyword = "'PROTECTION FROM DARKNESS'", 
}

HelpEntry
{
   Text = "Syntax: feel protection\
Syntax: feel sanctuary  <character>\
\
The PROTECTION power reduces the damage taken from any attack by an evil\
creature by one quarter.\
\
The SANCTUARY power reduces the damage taken by the character from any attack\
by one half.\
\
These powers may be used simultaneously for cumulative effect.\
", 
   Level = 0, 
   Keyword = "PROTECTION SANCTUARY", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Various\
&c\
     A humanoid robot programmed in diplomacy, interpretation, and \
other skills necessary for interplanetary interactions. They are \
humanoid in shape so that they will fit in better among the races that \
are trying to interact. \
 \
&RAlso Type&W:&Y SHOWSTAT PROTOCOL DROID \
", 
   Level = 1, 
   Keyword = "PROTOCOL DROID 'PROTOCOL DROID'", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y pull <trigger>\
&CSyntax &W:&Y push <trigger> \
&c\
Levers, switches, pullchains and buttons can do all sorts of interesting\
things... open or unlock doors, change exits around, teleport you to\
another location, cast a power, summon a monster... you name it!\
", 
   Level = 0, 
   Keyword = "PULL PUSH LEVERS PULLCHAINS SWITCHES BUTTONS", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YPunch\
\
&R&cThis skill can only be used during combat.  It allows you to attempt to\
punch the victim.  The skill is like kick.\
 \
&RAlso see: &R&PHelp Kick\
&R&W\
", 
   Level = 0, 
   Keyword = "PUNCH", 
}

HelpEntry
{
   Text = "Syntax: purge\
Syntax: purge <character>\
\
PURGE is used to clean up the world.  PURGE with no arguments removes all the\
NPC's and objects in the current room.  PURGE with an argument purges one\
character from anywhere in the world.\
\
PURGE will not get rid of PC's.\
", 
   Level = 101, 
   Keyword = "PURGE", 
}

HelpEntry
{
   Text = "This command is used for giving/taking Glory from players.  The syntax \
is as follows:\
 \
      qpset <player>  <give|take>  <amount>\
 \
Where one of give or take is used, and the amount is always a positive\
integer.\
", 
   Level = 101, 
   Keyword = "QPSET", 
}

HelpEntry
{
   Text = "Syntax:  quaff  <potion>                (to quaff potions)\
         quaff  <potion> <container>    (quaff directly from container)\
\
QUAFF quaffs a potion (as opposed to DRINK, which drinks mundane liquids).\
 \
See EAT, DRINK\
", 
   Level = 0, 
   Keyword = "QUAFF", 
}

HelpEntry
{
   Text = "&COrigin: &cMon Calamari \
\
&c     Quarren is a species named for the aliens who are commonly called\
Squid Heads by the galaxy's general populace.  These amphibious beings \
share the world of Calamari with the Mon Calamari race, though the Quarren\
prefer the depths of the floating cities to the upper reaches the Mon Cals\
call home.  The Quarren are more practical and conservative than their \
idealistic world-mates.  Whereas the Mon Calamari have adopted Basic as \
their language of choice, the Quarren have kept their oceanic tongue.  \
They are sea dwellers, able to live out of the water, but preferring the \
security of the ocean dephts.  These pragmatic people are unwilling to \
trust new ideas.  They do not dream of a brighter tomorrow like the Mon \
Cals, but instead hold fast to the reality of yesterday.  While they \
profess that the two races should remain in the sea, they have followed \
the Mon Cals into their floating cities and out among the stars.  They \
have become dependant on the Calamarians, and this dependancy has led to \
resentment and outright hatred.  Rumors persist that it was a small number\
of Quarren who helped the Empire originally invade the planet.  In the \
face of invading forces, Quarren cooperated with the Mon Calamari to repel\
the Imperials, but since that day, many Quarren have fled the planet to \
seek a life elsewhere in the galaxy.  They seem to have purposely remained\
apart from both the Alliance and the Empire, preferring to find a place on\
the fringes of society.  Quarren can often be found working with pirates,\
slavers, crime lords, smugglers, and other unsavory sorts. \
 \
&RAlso see: &YSHOWSTAT QUARREN \
", 
   Level = 0, 
   Keyword = "QUARREN", 
}

HelpEntry
{
   Text = "&CSyntax: &YQUEST &Y<&Wmessage&Y> \
 \
&cThis is a channel, typically used when a quest is being held, to notify\
players who are involved as to new updates.\
 \
&CQuestmaster Sub-Help\
&Y-&C*&W Code edited by Darrik&C *&Y- \
&cIf you're lucky enough to find a questmaster, there are a few commands\
you can use.\
 \
&CAQUEST &Y<&WCommand&Y> \
 \
     &CINFO &W- &YGives you information about your current quest. \
     &CPOINTS &W- &YTells you your total number of quest points. \
     &CREQUEST &W-&Y Asks the questmaster to give you a quest. \
     &CCOMPLETE &W-&Y Completes a quest once you have finished. \
     &CLIST &W-&Y Gives a list of possible quest items. \
     &CBUY &Y<&WNumber&Y> &W-&Y Buys an item. \
 \
", 
   Level = 0, 
   Keyword = "QUEST", 
}

HelpEntry
{
   Text = "&YSee &PHelp Quest&R&W\
 \
", 
   Level = 1, 
   Keyword = "QUESTMASTER", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y QUIT \
 \
&YQUIT&c leaves the game. In an effort to provide realism in &WRise in\
Power&c you may only quit the game from certain safe resting places. There\
are several of these throughout the game - most are clearly marked.\
 \
If you can't find one try to &YHAIL&c a taxi ... this will work in some\
areas.\
 \
Here are a few places to get you started: \
 \
The sleeping compartment on the &CPLUOGUS&c.&W \
  The hotel on the commercial level of Coruscant Shipyard. \
  The hotel on the commercial level of Byss Shipyard. \
  The Akatamer Hotel \
  Homeless shelter on Adari. \
", 
   Level = 1, 
   Keyword = "QUIT", 
}

HelpEntry
{
   Text = "&W0.  &cHuman                &W19. &cDevaronian\
&W1.  &cWookiee              &W20. &cGotal\
&W2.  &cTwi'lek              &W21. &cDroid\
&W3.  &cRodian               &W22. &cFirrerreo\
&W4.  &cHutt                 &W23. &cBarabel\
&W5.  &cMon Calamarian       &W24. &cBothan\
&W6.  &cShistavanen          &W25. &cTogorian\
&W7.  &cGamorrean            &W26. &cDug\
&W8.  &cJawa                 &W27. &cKubaz\
&W9.  &cAdarian              &W28. &cSelonian\
&W10. &cEwok                 &W29. &cGran\
&W11. &cVerpine              &W30. &cYevethan\
&W12. &cDefel                &W31. &cGand\
&W13. &cTrandoshan           &W32. &cDuros\
&W14. &cChadra-Fan           &W33. &cCoynite\
&W15. &cQuarren              &W34. &cProtocol Droid\
&W16. &cSullustan            &W35. &cAssassin Droid\
&W17. &cFalleen              &W36. &cGladiator Droid\
&W18. &cIthorian             &W37. &cAstromech Droid\
                         &W38. &cInterrogation Droid\
", 
   Level = 1, 
   Keyword = "RACE RACES", 
}

HelpEntry
{
   Text = "Syntax:  rank <argument>\
 \
Allows the character to change the text of their 'rank' on the who listing.\
(ranks are such things as 'Avatar', 'Immortal', etc.)\
", 
   Level = 101, 
   Keyword = "RANK", 
}

HelpEntry
{
   Text = "Syntax: rat vnum1 vnum2 command [parameters]\
 \
Rat, or 'range at' is the at command with the added parameters of two\
room vnums.  Assuming the vnums are valid, your 'at' command will be\
executed in every room in the range you give.\
 \
Example: rat 100 110 redit flags 0\
This will clear the room flags in all rooms from 100 to 110 inclusive.\
", 
   Level = 101, 
   Keyword = "RAT", 
}

HelpEntry
{
   Text = "Syntax:  rdelete <vnum>\
Syntax:  mdelete <vnum>\
Syntax:  odelete <vnum>\
 \
These commands will allow you to delete a vnum's entry online.\
They are not currently functional.\
 \
", 
   Level = 101, 
   Keyword = "RDELETE MDELETE ODELETE", 
}

HelpEntry
{
   Text = "These are the typical Rebel military ranks. \
Yes, we stole these from Sote. \
 \
&GArmy/SpecForce   &WNavy            &CPilot Corps \
&gMajor General    &wFleet Admiral   &c----------- \
&gBrig. General    &wAdmiral         &cWing Cmdr. \
&gGeneral          &wVice Admiral    &cGeneral \
&gLt. General      &wRear Admiral    &c----------- \
&gSr. Colonel      &wCommodore       &c----------- \
&gColonel          &wCaptain         &cColonel \
&gLt. Colonel      &wCommander       &cCommander \
&gMajor            &wLt. Cmdr.       &cLt. Cmdr. \
&gCaptain          &wLieutenant      &cCaptain \
&g1st Lieutenant   &wEnsign          &cLieutenant \
&g2nd Lieutenant                   &cFlight Off. \
                                 &cFlight Cad. \
 \
&gMaster Sergeant  &wSr. Petty Off. \
&gSergeant         &wPetty Officer \
&gLance Corporal   &wMidshipman \
&gCorporal         &wJr. Midshipman \
&gPrivate 1st      &wSr. Deckman \
&gPrivate          &wDeckman \
&gRecruit          &wRecruit \
", 
   Level = 1, 
   Keyword = "REBELRANKS", 
}

HelpEntry
{
   Text = "Syntax: reboot <nosave>\
Syntax: shutdown <nosave>\
Syntax: wizlock\
\
REBOOT shuts down the server.  When the normal 'startup' script is used\
to control the server, a delay of sixty seconds will ensue (to allow\
old connections to die), followed by a reboot.\
\
SHUTDOWN shuts down the server and prevents the normal 'startup' script\
from restarting it.\
\
WIZLOCK is a toggle command.  When the server is WIZLOCKed, players\
below level 51 may not log in.  Players who lose their links, however,\
may reconnect.\
\
If nosave is specified for reboot or shutdown, it will not automatically \
save all of the players.\
", 
   Level = 101, 
   Keyword = "REBOOT SHUTDOWN WIZLOCK", 
}

HelpEntry
{
   Text = "Syntax: REDIT FIELD [parameter list]\
\
FIELD  | PARAMETERS             -- DESCRIPTION / NOTES\
---------------------------------------------------------------------\
name   | <room name>            -- sets the room name / short description\
exit   | <direction> [vnum] [exit-type] [key] [keywords]\
bexit  | same as above, but does the exit in both directions\
desc   | none                   -- you will be placed into the buffer editor\
exdesc | <direction> [text]     -- sets/clears an exit's description\
ed     | <keyword(s)>           -- adds/edits an extra description to the room\
rmed   | <keyword(s)>           -- removes an extra description from the room\
sector | <value>                -- sets the sector type\
flags  | <flag> [flag]          -- toggles room flags\
exflags| <direction> [flags]    -- displays/toggles exit flags\
exname | <direction> [keywords] -- sets an exit's keywords\
exkey  | <direction> <key vnum> -- sets an exit's key vnum/value\
\
Note: Put a '+' before the direction to force ADDing of that exit\
      and use a '#' to specify the exit by sequential order.\
\
See EXITTYPES, EXFLAGS, EXITMAKING, SECTORTYPES and ROOMFLAGS.\
", 
   Level = 101, 
   Keyword = "REDIT", 
}

HelpEntry
{
   Text = "Syntax: redraw\
\
This will redraw the whole screen, and update the menu that is being worked\
on if any.\
\
See REFRESH.\
", 
   Level = 101, 
   Keyword = "REDRAW", 
}

HelpEntry
{
   Text = "Syntax: feel refresh <character>\
\
This power refreshes the movement points of a character who is out of movement\
points.\
", 
   Level = 1, 
   Keyword = "REFRESH", 
}

HelpEntry
{
   Text = "Syntax:  regoto\
 \
Returns an immortal to the previous roomvnum from which that immortal\
used the 'goto' command.\
 \
See GOTO\
", 
   Level = 101, 
   Keyword = "REGOTO", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YReinforcements\
 \
&cThis skill allows you to call troops for you to command.\
 \
&RAlso see:&P Help Order\
", 
   Level = 1, 
   Keyword = "REINFORCEMENTS", 
}

HelpEntry
{
   Text = "Syntax : feel 'remove masking' <victim>\
\
Makes victim visible.\
", 
   Level = 1, 
   Keyword = "'REMOVE MASKING'", 
}

HelpEntry
{
   Text = "Syntax : feel 'remove trap' <target>\
\
Remove trap.\
", 
   Level = 1, 
   Keyword = "'REMOVE TRAP'", 
}

HelpEntry
{
   Text = ".\
&CSyntax : &YAddpilot (name)\
&CSyntax : &YRempilot (name)\
 \
&cUsed for adding and removing pilots from your ship.  This command can\
allow either players or an entire clan access to your ship (You must type\
the clan's whole name to give them access).\
 \
This must be done in the cockpit of the ship\
", 
   Level = 1, 
   Keyword = "REMPILOT ADDPILOT", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y   repair <object>\
          repair all\
&c \
&YREPAIR&c allows you to repair equipment a repair depot.  &YREPAIR ALL&c\
attempts to repair every item in your inventory.\
 \
There is a 10% surcharge for using &YREPAIR ALL&c. This surcharge is for\
the convenience of having all the equipment in your inventory repaired at\
once.\
", 
   Level = 1, 
   Keyword = "REPAIR", 
}

HelpEntry
{
   Text = "Syntax:  repairset <mobile vnum> <field> <value>\
 \
This command allows you to set the following fields for repair shops:\
 \
-----------------------------------------------\
| Fields | Meaning                            |\
-----------------------------------------------\
| fix#   | Types of items the keeper will fix |\
|        |  - armor, weapon, wand, staff      |\
| profit | Profit on fixing items             |\
| type   | Repair shop type                   |\
|        |   type 1 = standard                |\
|        |   type 2 = recharge                |\
| open   | Hour shop opens                    |\
| close  | Hour shop closes                   |\
| keeper | Vnum of repair shop keeper         |\
-----------------------------------------------\
 \
See MAKEREPAIR, REPAIRSTAT and REPAIRSHOPS\
", 
   Level = 101, 
   Keyword = "REPAIRSET", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YRepairship &R&W<&YShip Part&R&W> \
 \
&cTo use this skill, you must have &Yship maintenance&c and be in the\
engine room of a ship.  With it, you can repair 6 areas of a damaged ship:\
&R&Whull, drive, launcher, laser, turret 1, or turret 2\
", 
   Level = 1, 
   Keyword = "REPAIRSHIP", 
}

HelpEntry
{
   Text = "Syntax: repairshops\
\
Displays statistics on all the repair shops.\
\
See MAKEREPAIR, REPAIRSET and REPAIRSTAT.\
", 
   Level = 101, 
   Keyword = "REPAIRSHOPS", 
}

HelpEntry
{
   Text = "Syntax: repairstat <mobile vnum>\
\
Shows statistics on a mobile's repair shop.\
\
See MAKEREPAIR, REPAIRSET and REPAIRSHOPS.\
", 
   Level = 101, 
   Keyword = "REPAIRSTAT", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y report\
&CSyntax &W:&Y time\
&CSyntax &W:&Y weather\
 \
&YREPORT&c shows your current statistics to you and also announces them to\
other players in the room. \
 \
&YTIME&c shows the game time, as well as the time the mud was last started,\
and the current local time for the host computer.\
 \
&YWEATHER&c shows the current game weather.  You must be in an outside room\
to see the weather. \
", 
   Level = 1, 
   Keyword = "'REPORT' 'TIME' 'WEATHER'", 
}

HelpEntry
{
   Text = "Syntax: reset list   [start] [end]\
Syntax: reset delete [number]\
Syntax: reset add    <command> <parameters>\
Syntax: reset insert <number> <command> <parameters>\
Syntax: reset edit   <number> <command> <parameters>\
Syntax: reset area   (will \"reset\" your area based on the defined resets)\
 \
WARNING:\
  The order that resets are in is VERY important.  You cannot equip\
  a mobile with an object before putting the mobile into a room first.\
  Likewise, you cannot put an object into a container until the container is\
  put into a room first.\
 \
This command is used to display, edit, delete, add and insert resets for\
your area.\
\
See INSTAROOM, INSTAZONE and RESETCMDS\
 \
", 
   Level = 101, 
   Keyword = "RESET RESETS", 
}

HelpEntry
{
   Text = "Syntax: reset edit   <number> <commands>\
Syntax: reset insert <number> <commands>\
Syntax: reset add    <commands>\
\
Commands:\
MOB   <mobile vnum> <room vnum> [limit]  loads a mobile into a room\
OBJ   <object vnum> <room vnum> [limit]  loads an object into a room\
GIVE  <object vnum> [limit]              gives object to last loaded mobile\
EQUIP <object vnum> <position> [limit]   equips object on last loaded mobile\
PUT   <object vnum> <object vnum>        puts and object into another object\
DOOR  <room vnum> <door dir> <state>     resets a door to a certain state\
RAND  <room vnum> <last door dir>        randomizes a range of exits\
TRAP  <vnum> <type> <charges> <flags>    sets a trap\
HIDE  <object vnum>                      hides an object\
\
For EQUIP position, see WEARLOCS.\
For DOOR door dir, see DOORDIRS.\
For TRAP setting see TRAPSETTING.\
\
See RESETS, INSTAROOM and INSTAZONE\
", 
   Level = 101, 
   Keyword = "RESETCMDS RESETCOMMANDS", 
}

HelpEntry
{
   Text = "Syntax: rest\
Syntax: sleep\
Syntax: stand\
Syntax: wake\
\
These commands change your position.  When you REST or SLEEP, you \
regenerate hit points, force points, and movement points faster.\
However, you are more vulnerable to attack, and if you SLEEP,\
you won't hear many things happen.\
\
Use STAND or WAKE to come back to a standing position.  You can\
also WAKE other sleeping characters.\
", 
   Level = 0, 
   Keyword = "REST SLEEP STAND WAKE", 
}

HelpEntry
{
   Text = "Syntax : feel 'restoration'\
\
Requires two people to cast and heals one target.\
", 
   Level = 1, 
   Keyword = "RESTORATION", 
}

HelpEntry
{
   Text = "Syntax:  restore <victim>\
Syntax:  restore all\
 \
Restore returns the victim to full hitpoints, force and movement.\
 \
Restore all can be done once per day (real time) by any Saint and above,\
and will 'restore' every link-live player in the game.  Restore alls such\
as this are limited to once every 6 hours, so if one Savior does one,\
another cannot do one until 6 hours has passed, regardless of whether or\
not they have not done one that day.\
 \
A Greater God or higher can do a restore all whenever they wish, and are\
not constrained by the above limitations.\
 \
Use 'restoretime' to see when the last restore all was done.\
 \
See RESTORETIME\
", 
   Level = 101, 
   Keyword = "RESTORE", 
}

HelpEntry
{
   Text = "Syntax:  restoretime\
 \
Displays the last 'restore all' performed by you, as well as the last\
time a 'restore all' was done by anyone else.\
 \
See RESTORE\
", 
   Level = 101, 
   Keyword = "RESTORETIME", 
}

HelpEntry
{
   Text = "Syntax:  restrict <command> <level>\
Syntax:  restrict <command> show\
\
Used to restrict a command to a higher or lower level.  You cannot\
rstrict a command you yourself cannot access.  Changes to a command's\
level are not permanent unless they are saved using 'cedit save'.  A\
command's level may also be changed using 'cedit'.\
 \
Use 'restrict <command> show' to see the level a command is currently\
restricted to.\
 \
See CEDIT\
", 
   Level = 101, 
   Keyword = "RESTRICT", 
}

HelpEntry
{
   Text = "Syntax:  retire <immortal>\
 \
This command will 'retire' an active immortal and place them on the\
wizlist under 'retired immortals'.  They will retain their level in\
number only; they will be trusted to Savior level, and will have\
access only to Savior-level commands.  They will not be able to see\
logs of anyone higher than Savior, and their commands will be logged\
as if they were a Savior.\
 \
A retired immortal can, however, manually be given a higher trust\
level.\
 \
To bring an immortal out of retirement, simply 'retire immortal' again.\
 \
", 
   Level = 101, 
   Keyword = "RETIRE", 
}

HelpEntry
{
   Text = "Syntax: retran <player>\
 \
This command will return that player or mob to the room from which\
you last transferred it from.\
", 
   Level = 101, 
   Keyword = "RETRAN", 
}

HelpEntry
{
   Text = "Syntax: rip <on/off>\
\
The rip command will either enable or disable rip graphics.  Rip graphics \
will only work provided you are using a rip compatible terminal program.\
", 
   Level = 0, 
   Keyword = "RIP", 
}

HelpEntry
{
   Text = "Players and mobiles may have resistance, suceptibility or immunity to\
certain types of attack:\
\
FIRE      COLD      ELECTRICITY  ENERGY     BLUNT     PIERCE     SLASH\
ACID      POISON    DRAIN        SLEEP      CHARM     HOLD       NONMAGIC\
PLUS1     PLUS2     PLUS3        PLUS4      PLUS5     PLUS6      MAGIC\
PARALYSIS\
", 
   Level = 101, 
   Keyword = "RIS RESISTANT IMMUNE SUSCEPTIBLE", 
}

HelpEntry
{
   Text = "Syntax: rlist\
      :\9rlist <first room>\
      :\9rlist <first room> <last room>\
\
This command will list all of the prototype rooms in your area, when used \
with no arguments.  When used with a single argument it will list all \
rooms including and after the argument, and when used with two arguments, \
it will list all rooms including and between the two. \
", 
   Level = 101, 
   Keyword = "RLIST", 
}

HelpEntry
{
   Text = "Syntax: rmenu [menu letter] (defaults to 'a' if none given)\
\
Rmenu will bring you into a menu system of editing rooms.  To use rmenu, you\
must be in the room that you are editing.  To choose an option in the menu,\
type the number of the section followed by the desired letter, and any\
variables that may follow.\
\
See MENU for generic menu commands.\
", 
   Level = 101, 
   Keyword = "RMENU", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Roche\
&CInhabitants &W:&W Verpine, Barabels, Kubaz\
&c\
&w(the asteroid field)&c     A sector of the galaxy that contains the\
homeworlds of the Verpine, the Barabels, and the Kubaz. It also is a\
breeding site for mynocks and space slugs. It is a collection of \
asteroid belts orbiting a small yellow sun. \
[0m\
&w(the planet)&c     A planet near the Roche Asteroid Field. It was the\
base for Ackbar's Project Shantipole \
", 
   Level = 1, 
   Keyword = "ROCHE", 
}

HelpEntry
{
   Text = "&COrigin: &YRodia\
 \
&c     Rodians are a humanoid species with multifaceted eyes, a tapirlike\
snout and deep green skin.  They have a prominent ridge of spines running\
along the back of their skulls.  Their fingers are long, flexible and end\
in a suction cup.  The suction cups are not vestigal, they can pick up\
small objects in them and manipulate them quite well, although the suction\
is not very strong. \
     They are among the Galaxy's best bounty hunters.  The history of Rodia\
is peppered with wars and feuds, many of which were long and bloody.\
Trained to fight from birth, they are amazingly agile and intelligent.\
Though they almost never go into the scientific fields, their hand-to-hand\
combat tactics are some of the best.  Rodians spread across the galaxy, far\
and wide, seeking work as mercenaries, assassins, body guards, and\
 \
&RALSO TYPE&W:&Y SHOWSTAT RODIAN\
", 
   Level = 0, 
   Keyword = "RODIAN RODIANS RODIA", 
}

HelpEntry
{
   Text = "&c\
Now that we have a bigger player base, we are starting to enforce RP. We\
are nowhere near as strict as some muds; you can tell each other ooc and\
talk in the same room, as long as this does not interfere with another\
player who wishes to stay in character.  I have personally seen a few\
people conversing, with one trying hard to roleplay while the other keeps\
throwing in ooc comments, swearing, grinning stupidly, etc.  So have\
respect for your fellow players.  The game is fun because of the\
roleplaying, so keep in character as much as possible.  \
\
The chat line is in character. I do not want to see someone mention ooc,\
conventional words and items <modern slang, items like cars and\
refridgerators, etc>.  If someone talks ooc on the chat line, call\
him/her/it down on the ooc line, politely. I do\
not want to see someone screaming \"THAT SHOULD BE ON THE OOC LINE YOU DUMB\
SUNOFAB*TCH!\" like some people I know.\
 \
The OOC line is out of character.  I do not want people who are stunned\
saying over the ooc line that they need an aid.  I do not want people who\
need rides saying it over the ooc line.  I do not want people who do not\
have comlinks talking over the ooc line ic.  I do not want people talking\
over the ooc line because they cant understand each other's languages.\
 \
Read help ic.  It explains the difference between ooc and ic very\
clearly.\
 \
&RSee Also&W:&P ROLEPLAY2, IC, ID\
", 
   Level = 0, 
   Keyword = "ROLEPLAY RP", 
}

HelpEntry
{
   Text = "Ok, it has come to my attention that some people have chosen to become\
'experiements' lose from a particular clan. From now on, these backgrounds\
will not be excepted unless they rper has recieved permission from the\
head of the clan they are rping an escapee from. really, to rp any sort of\
reject from any sort of clan, you should talk it over with the leader or a\
high official of that clan. The roleplay is so much better that way, and\
it avoids information problems.  Consider this a rule.\
", 
   Level = 1, 
   Keyword = "ROLEPLAY2", 
}

HelpEntry
{
   Text = "FLAG NAME     |  BITVECTOR  |  DESCRIPTION\
----------------------------------------------------------------------\
DARK          |          1  |  Room is always dark \
DEATH         |          2  |  Room causes instant death\
NOMOB         |          4  |  Mobs cannot wander into this room\
INDOORS       |          8  |  Room is indoors - MUST also use sectortype 0\
LAWFUL        |         16  |  Room is oriented to those of lawful alignment\
NEUTRAL       |         32  |  Room is oriented to those of neutral alignment\
CHAOTIC       |         64  |  Room is oriented to those of chaotic alignment\
NOMAGIC       |        128  |  Magic cannot be used in this room\
TUNNEL        |        256  |  Room is a tunnel - x number of players allowed\
                               (use 'redit tunnel #' to  set the number)\
PRIVATE       |        512  |  Room is private (restricted to 2 people)\
SAFE          |       1024  |  Room is safe... no violence allowed\
SOLITARY      |       2048  |  Room is solitary (restricted to 1 person)\
PETSHOP       |       4096  |  Petshop (next vnum must be the storeroom)\
NORECALL      |       8192  |  Players cannot recall out of this room\
DONATION      |      16384  |  Donation room... cannot get all\
NODROPALL     |      32768  |  Cannot drop all in this room\
SILENCE       |      65536  |  Not a sound can be made or heard in this room\
LOGSPEECH     |     131072  |  All speech in this room is logged\
NODROP        |     262144  |  Nothing can be dropped in this room\
CLANSTOREROOM |     524288  |  Clan storage room\
NOSUMMON      |    1048576  |  Player cannot be summoned out of this room\
NOASTRAL      |    2097152  |  People cannot astral to this room\
TELEPORT      |    4194304  |  People in this room will be teleported out\
TELESHOWDESC  |    8388608  |  Players will see the room desc of the dest room\
NOFLOOR       |   16777216  |  Room has no floor: exit down + no fly = fall\
PROTOTYPE     | 1073741824  |  Room is a prototype, (under construction)\
", 
   Level = 101, 
   Keyword = "ROOMFLAGS", 
}

HelpEntry
{
   Text = "Trigger Optnl Triggering Variable Explanation\
------- ----- ------------------- -----------\
Act      {p}  <keyword / phrase>  [emotes, socials, actions, bamfs]\
Speech   {p}  <keyword / phrase>  [says or tells from same room as mob]\
Rand          <percentage>        [randomly triggered based on percentile]\
Fight         <percentage>        [random, within a fight, based on percentile]\
Hitprcnt      <percentage>        [percent is % of mob's max H.P.]\
Greet         <percentage>        [entry that mob can see, by mob/player]\
Allgreet      <percentage>        [entry by a mob/player, regardless if seen]\
Entry         <percentage>        [when the mob itself enters a room]\
Bribe         <amount of gold>    [when a player gives the mob money]\
Death         <percentage>        [when the mob dies]\
Script {hour}                     [loops a line at a time. Hour triggers start]\
Time          <hour>              [script prog, runs once on hour specified]\
Hour          <hour>              [loops as Script for an hour from start hour]\
 \
*NOTE* {hour}/<hour> is in military time. ie, 15 hours is 3p.m. mud time.\
*NOTE* The mpcommand MPDONOTHING currently only works in Script progs,\
       NOT in Time or Hour progs.\
 \
For mobs, see also: MPSTAT, MPEDIT, TRIGGER, MPCOMMANDS, IFCHECKS, VARIABLES.\
", 
   Level = 101, 
   Keyword = "ROOMTRIGGERS RPTRIGGERS", 
}

HelpEntry
{
   Text = "&YSyntax: Roster\
 \
&cThis is a clan command, you must already be bestowed with the roster\
command. Roster is OOC. ICly it should be used to double check things \
such as a trooper claiming he's yours.\
", 
   Level = 1, 
   Keyword = "ROSTER", 
}

HelpEntry
{
   Text = "What is roleplay?   Well its about time some of you asked. First, as\
mentioned in help rp, rp is NOT discussing ooc stuff with your friends. \
It is not talking in a room about races or stats or ships or any other\
code thing. Rp is NOT making a nice bio and desc and then doing socials\
until you have gone through the list alphabetically. Rp is not becoming\
the best code forcer/pilot/engineer etc. Now that we have covered some of\
what rp is not,  we can get into what rp *is*. Roleplay is acting, in the\
best sense.  It is creating a character, building it from the ground up in\
regards to its history and personality.  It is finding a motivation for\
that character, a reason for being, a purpose and goal. Roleplay is not\
giving up when something bad happens, but instead incorporating that event\
into the character and making it wiser and more interesting. Roleplay is\
being a Jedi who is turned to the dark side by the loss of a loved one, or\
greed, or hate. Roleplay is a BlackSun member conning a Rebel into giving\
him all his money.  Roleplay is a Sith turning back to the Light, after\
someone shows they care. Roleplay is a noghri who bows at the slightest\
mention of the Empire.  Roleplay is being killed and your clone being a\
bit nuts. Roleplay is falling in love, making mistakes, killing your\
enemies, saving them if you are Jedi, creating small empires, having fun,\
growing, building, dying. If perhaps all of this sounds a bit too lifelike\
for you, and you cant take the idea of your character losing or dying,\
then perhaps you need to reconsider mudding. We are not here to be the\
interactive Phantom Menace game when you have beaten the computer game. We\
are a mud.  A place of interacting with other people, acting and being\
something we arent. Hopefully this helps.\
", 
   Level = 0, 
   Keyword = "RP2", 
}

HelpEntry
{
   Text = "Syntax:  rpedit <command> [number]  [program] [arguments]\
Syntax:  rpedit add       <program> <arguments>\
Syntax:  rpedit insert    <number>  <program> <arguments>\
Syntax:  rpedit edit      <number>  [program] [arguments]\
Syntax:  rpedit delete    <number>\
Syntax:  rpedit list\
 \
Add, insert and edit will put you into the line editor to edit your\
program.  The arguments consist of a trigger, plus any arguments \
ssociated with that trigger.\
 \
To edit a toomprogram you must be in the room.\
 \
See RPSTAT, TRIGGER, RPTRIGGERS, RPCOMMANDS, IFCHECKS, IFCHECKS2, VARIABLES\
", 
   Level = 101, 
   Keyword = "RPEDIT", 
}

HelpEntry
{
   Text = "Syntax:  rpstat\
 \
Rpstat will display all of the roomprograms that have been written for a \
room.  You must be standing in the room that you are rpstatting (though\
you can also use 'rpstat' in conjunction with the 'at' command to rpstat\
a room remotely).\
 \
See RPEDIT, TRIGGER, RPTRIGGERS, RPCOMMANDS, IFCHECKS, IFCHECKS2, VARIABLES\
", 
   Level = 101, 
   Keyword = "RPSTAT", 
}

HelpEntry
{
   Text = "Syntax: rreset <list|edit|delete|add|insert|place>\
Syntax: rreset remove <#>\
Syntax: rreset mobile <mob#> [limit]\
Syntax: rreset object <obj#> [limit [room]]\
Syntax: rreset object <obj#> give <mob name> [limit]\
Syntax: rreset object <obj#> equip <mob name> <location> [limit]\
Syntax: rreset object <obj#> put <to_obj name> [limit]\
Syntax: rreset hide <obj name>\
Syntax: rreset trap <obj name> <type> <charges> <flags>\
Syntax: rreset trap room <type> <charges> <flags>\
Syntax: rreset bit <set|toggle|remove> door <dir> <exit flags>\
Syntax: rreset bit <set|toggle|remove> object <obj name> <extra flags>\
Syntax: rreset bit <set|toggle|remove> mobile <mob name> <affect flags>\
Syntax: rreset bit <set|toggle|remove> room <room flags>\
Syntax: rreset random <last dir>\
", 
   Level = 101, 
   Keyword = "RRESET", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Ryloth\
&CInhabitants &W:&W Twi'lek, Rycrit\
&c\
     This planet was the homeworld of the Twi'lek race, located in the \
Outer Rim Territories. It orbited its sun in such a way that one side \
was perpetually lit and the other was locked in the dark. The bright \
side generated huge heat storms which whipped around the planet and \
died on the night side, but not before warming the dark side up enough \
to support minimal life. It was a dry, rocky world with a thin, \
breathable atmosphere. The Twi'Leks there mine the mineral ryll for \
various legal and illegal uses throughout the galaxy. Ryloth was \
orbited by five, red-colored moons. \
", 
   Level = 1, 
   Keyword = "RYLOTH", 
}

HelpEntry
{
   Text = "&c\
A level 120 engineering skill, sabotage works exactly  \
like repairship. Except for the fact that it damages \
instead of repairs, of course. \
", 
   Level = 1, 
   Keyword = "SABOTAGE", 
}

HelpEntry
{
   Text = ". Salary is given once every real time day. It is taken directly out of\
clan funds, so dont be overgenerous!\
", 
   Level = 1, 
   Keyword = "SALARY", 
}

HelpEntry
{
   Text = "Syntax:  Save\
 \
SAVE saves your character and its inventory; you must be at least second\
level to save.  The system automatically saves one character approximately\
minute, but with the high number of players usually online it may take\
hours before your own is auto-saved.  For this reason, you should not\
rely on auto-save to keep your character updated -- save frequently.\
 \
Type SAVE immediately after recovering your corpse, gaining experience or\
a level in battle, getting new items, making purchases or repairs, etc.\
 \
Some objects (such as keys) may not be saved.\
", 
   Level = 1, 
   Keyword = "SAVE", 
}

HelpEntry
{
   Text = "Syntax: savearea\
        loadarea\
\
Savearea and loadarea will save or load your prototype area.\
 \
A God or higher may load or save any other prototype area by simply\
specifying the area name.  Example:  savearea/loadarea Joseph.are\
 \
See also BESTOWAREA, AASSIGN\
", 
   Level = 101, 
   Keyword = "SAVEAREA LOADAREA", 
}

HelpEntry
{
   Text = "Saving throws:\
  sav1 - Saving vs. poison or death\
  sav2 - Saving vs. wands\
  sav3 - Saving vs. paralysis or petrification\
  sav4 - Saving vs. breath\
  sav5 - Saving vs. powers or staves\
\
See MSET or type MSET by itself.\
", 
   Level = 101, 
   Keyword = "SAVINGTHROWS", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YScan &R&W<&R&YDirection&R&W> \
\
&R&cThis skill enables you to look for people in the rooms in the direction\
specified.  The higher the percentage of the skill, the more rooms you can\
see.  The type of area you are in is also taken into account. \
 \
", 
   Level = 1, 
   Keyword = "'SCAN'", 
}

HelpEntry
{
   Text = "Syntax : feel 'scorching surge' <victim>\
\
Cause great harm to victim.\
", 
   Level = 1, 
   Keyword = "'SCORCHING SURGE'", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y score\
 \
SCORE&c is a sheet filled with your characters statistics.  When you type\
score, only you can see what is listed there.  Should you want to let\
others see your characters health, you can type &YREPORT&c. \
", 
   Level = 1, 
   Keyword = "SCORE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YSearch\
         Search &R&W<&YContainer&R&W>\
 \
&cSometimes not all there is to find is in clear view.  Some things may be\
concealed or hidden, and will require some searching to find.\
", 
   Level = 0, 
   Keyword = "SEARCH", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YAutomatic\
\
&R&cThese skills let you attack more than once during a round of combat. \
You can practice &Ythird attack&R&c and the following attacks before you\
have mastered &Ysecond attack&R&c, although it isn't efficient to do so. \
&R&W\
", 
   Level = 0, 
   Keyword = "'SECOND ATTACK' 'THIRD ATTACK' 'FORTH ATTACK' 'FIFTH ATTACK'", 
}

HelpEntry
{
   Text = "INSIDE              0\
CITY                1\
FIELD               2\
FOREST              3\
HILLS               4\
MOUNTAIN            5\
WATER_SWIM          6\
WATER_NOSWIM        7\
UNDERWATER          8\
AIR                 9\
DESERT             10\
UNKNOWN            11\
OCEANFLOOR         12\
UNDERGROUND        13\
", 
   Level = 101, 
   Keyword = "SECTORTYPES", 
}

HelpEntry
{
   Text = "View, create, edit or delete socials online.\
Sytanx:  sedit <social>\
Syntax:  sedit <social> [field]\
Syntax:  sedit <social> create\
Syntax:  sedit <social> delete\
Syntax:  sedit <save>\
 \
Field being one of:\
  cnoarg onoarg cfound ofound vfound cauto oauto\
 \
Use sedit <social> to view the current settings of an existing social.\
Use sedit <social> [field] to set one of the fields:\
  CNoArg: response to character if no argument given\
  ONoArg: response to room if no argument given\
  CFound: Response to character if target is someone else\
  OFound: Response to room if target is someone else\
  VFound: Response to target if target is someone else\
  CAuto : Response to character if target is self\
  OAuto : Response to room if target is self\
Use sedit <social> create to create a new social, then edit with sedit field.\
Use sedit <social> delete to delete an existing social.\
Use sedit save to save the new social or changes to existing socials.\
 \
", 
   Level = 101, 
   Keyword = "SEDIT", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YSeduce &R&W<&YName&R&W>\
 \
&cForces a mob or a player to follow you.  Seduce will not work if the mob\
is charmed by another player.\
", 
   Level = 1, 
   Keyword = "SEDUCE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YSeeMasking\
\
&cThis skill allows you to see things that are masked (invisible), both\
objects and creatures.\
 \
See Masking simply means you have the ability IC to see characters \
that are masked. However, it doesn't mean you KNOW they are masked \
so be sure to RP the matter correctly.\
", 
   Level = 1, 
   Keyword = "'SEE MASKING' SEEMASKING", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y sellhome\
&c\
&YSELLHOME&c allows you to sell your apartment (should you be inside it),\
and recieve half the price you purchased it for.\
", 
   Level = 1, 
   Keyword = "SELLHOME", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Selonia\
&c\
     One of the three primary races in the Corellian System, the \
Selonians are tall, strong, and quick. Often referred to as refined,\
the Selonians are well-muscled and covered with short, sleek fur, \
giving them a seal-like appearance. They have bristly whiskers on their\
noses, sharp teeth, and long tails. They are excellent swimmers. Taller\
and more slender than humans, they have long bodies and short limbs. \
Selonians are equally comfortable walking upright or on all-fours. Each\
hand or foot is equipped with retractable claws for climbing or \
defense. The Selonian race is believed to be descended from a predatory\
aquatic mammal which lived in riverside burrows, but later dug deeper \
into the ground and farther from water. Each burrow is inhabited by all\
members of a Selonian family; collectively, they are called a sept. ach\
sept is distinguished by its lone ferile male breeder. This male, along\
with the one fertile female, give birth to the sept's members. All male\
Selonians are born fertile; one of every hundred Selonians born is a \
male. Of 500 female Selonians, only one will be fertile. These fertile\
members of the sept, while revered for their fertility, are forced to\
remain in the burrows. The sterile females run the day-to-day \
activities of the sept. Non-familial groupings of Selonians, such as\
the government, are called dens. Each den is made up of sterile \
females. The Selonians have learned that dealing with other aliens,\
especially humans, is dangerous. Thus, only specially-trained females\
ever leave their burrows and contact the outside world. These females\
learn Basic in addition to the normal conversational Selonian tongue.\
All Selonians can also speak a modified language of sounds that is used\
in their burrows. Its pure sounds are not affected by echoes or other \
auditory anomalies caused by the burrows. \
 \
&RAlso Type&W:&Y SHOWSTAT SELONIAN\
", 
   Level = 1, 
   Keyword = "SELONIAN SELONIANS", 
}

HelpEntry
{
   Text = "Syntax: setboot time <hour> <minute>\
 \9setboot manual <0|1>\
\
The setboot command is useful for planning a reboot, (to save you from \
the trouble of all those echos :) ) and for the daily boot.  The manual\
bit is used by the mud to determine whether the boot time was set by \
hand.  When the mud starts up, the boot time is set to 0600hrs (6am)\
and the manual bit to 0.  If 'setboot time' is used, the mud sets the\
manual bit to 1.  When it comes time to do the reboot, the mud checks\
how long it has been running.  If it has been running less than 18 \
hours and the reboot time has not been set manually, the reboot does\
not take place (nor do the automatic warning echoes).\
\
Echoes: when a scheduled reboot is coming up, the mud will send out\
echoes to that effect.  The echoes start 30 minutes before the reboot\
and are repeated at t minus 15, 10, 5, 4, 3, 2 and 1 minute(s). \
", 
   Level = 101, 
   Keyword = "SETBOOT", 
}

HelpEntry
{
   Text = "This command is used to define clan, Order and guild files.  The\
filename\
field must be defined before other fields can be entered.\
Syntax:  setclan <clan> <field> <deity|leader|number1|number2>\
<player>\
Field being one of:\
 filename- filename of the clan, guild or Order\
 type    - \"guild\" - in showclan it is type 0\
         - \"crime\" or \"crime family\" - in showclan type 1\
 class   - class # accepted by the clan (for use with Guilds, leave 0 if\
none)\
 name    - name of the clan\
 motto   - motto of the clan\
 desc    - description of the clan\
 favour  - favour bestowed by the gods (not currently supported)\
 strikes - displeasure of the gods toward the clan (not currently\
supported)\
 deity   - name of the clan's Deity\
 leader  - name of the clan's Leader\
 number1 - name of the clan's Number One\
 number2 - name of the clan's Number Two\
 members - manually set the number of members\
 board   - roomvnum of the clan's board\
 recall  - roomvnum to which members of the clan recall\
 storage - roomvnum of the storage room of the clan\
           (so that items in the room will save over reboot/crash; use\
the\
            clanstoreroom roomflag in this room as well)\
 align   - alignment to which members must adhere (commented out in\
code)\
 obj1, obj2, obj3 - vnums of the objects which the Leader can\
'make'\
 guard1, guard2   - mobvnums of the clan's primary guardians\
  enlistroom1, enlistroom2 - vnums for recruit offices\
    - This is to be used in conjuction with the RECRUIT room flag. \
\
See SHOWCLAN, MAKECLAN\
", 
   Level = 101, 
   Keyword = "SETCLAN", 
}

HelpEntry
{
   Text = "Syntax:  setcouncil <council> <field> <deity|leader|number1|number2> <player>\
Field being one of:\
 name     - name of the council\
 filename - filename in which to store the council data\
 desc     - description of the council\
 head     - leader of the council\
 members  - manually set the number of members\
 board    - roomvnum of the council's board\
 meeting  - roomvnum in which the council meets\
 powers   - commands all members will receive regardless of their level\
            (similiar to council-wide bestowments)\
 \
Used to define a council after it has been created with 'makecouncil'.  The\
filename must be specified before other fields can be set. \
 \
See SHOWCOUNCIL, MAKECOUNCIL\
", 
   Level = 101, 
   Keyword = "SETCOUNCIL", 
}

HelpEntry
{
   Text = "Syntax: feel shield\
\
These powers protect the caster by decreasing (improving) the caster's armor\
class.  SHIELD provides 20 points of armor.\
", 
   Level = 0, 
   Keyword = "SHIELD", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YDock &R&W<&YShip&R&W>\
&CSyntax &R&W: &YUndock \
 \
&cShip docking has been completely revamped. \
You can dock any ship to a larger ship.  \
A midship can dock 2 ships to it, a \
cap ship 3, a platform unlimited. \
HOWEVER, if you only have 1 ship docked to the midship, \
you can dock the midship to a cap ship... 2 ships \
can be docked to a cap ship, and you can still dock \
it to a platform. Ships can fire while docked, if they \
are pointed in that direction... autopilot will fire \
at your(the mothership) target as well! \
Ships docked to you will follow you into hyperspace, \
land with you, launch, etc. \
 \
Board by itself will board whatever ship you are docked to atm. If you are\
docked to more than one, board <ship>.\
 \
SEE ALSO: &WAUTOPILOT BOARD \
", 
   Level = 1, 
   Keyword = "'SHIP DOCKING' DOCK DOCKING UNDOCK UNDOCKING", 
}

HelpEntry
{
   Text = "&cThis provides you with the ability to &YRepairShip&c. \
  \
&RAlso see&W: &PHelp RepairShip, Help Ships \
", 
   Level = 1, 
   Keyword = "'SHIP MAINTENANCE'", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YStatus \
&CSyntax &W: &YStatus <ship> \
  \
&cThis skill allows you to check your ship's current status.  You can also\
see the status of other ships during spaceflight, provided they're in\
range. You must be in either the pilot, copilot, gunner, or navigator's\
seat.\
  \
&RAlso see&W: &PHelp Ships \
", 
   Level = 1, 
   Keyword = "'SHIP SYSTEMS' STATUS", 
}

HelpEntry
{
   Text = "&cPreviously, when a ship was unsuccessfully picked or successfully\
hijacked, all players currently connected to the game were notified.\
Furthermore, when a ship was unsucccessfully picked, the name of the\
person who attempted to pick the ship was given. With the implementation of\
the new ship alarm system, only the owner of a ship will be notified by\
comlink of both successful and unsuccessful pick attempts and successful\
hijack attempts on that ship, if an alarm is installed. (Hence, if the ship\
has no alarm installed or the owner of the ship is not online, no one will\
be notified of pick or hijack attempts.) A ship alarm costs 500k and can\
be installed at the Space Garage. In the case of a clan being the owner of\
a ship, all clan members online who can pilot clan ships, including the\
leader, first and second, are considered the owner and will be notified as\
described above. \
", 
   Level = 1, 
   Keyword = "SHIPALARM SHIPALARMS", 
}

HelpEntry
{
   Text = "&cThis is a command that allows you to use the coords \
 \
 \
&YShiptrack set &W<&Yx&W> <&Yy&W> <&Yz&W> \
&YShiptrack stop\
&c\
X, Y, and Z are what is returned by jumpvector. It is \
similar to the new trajectory command. \
 \
Activating shiptracking will initiate a program that  \
jumps a ship along a certain course. It drops your ship \
out of hyperspace periodically, allowing you to  \
check your radar. \
 \
&RSee Also&W:&P JUMPVECTOR COURSE HYPERSPACE\
", 
   Level = 1, 
   Keyword = "SHIPTRACK", 
}

HelpEntry
{
   Text = "&COrigin: &YUvena\
&c\
     A race of wolf-like bipeds whose eyes glow red, the Shistavenen\
were native to the Uvena system, and are veiled in mystery throughout\
the galaxy. They are hunters by nature, and are known for their \
abilities as bounty hunters and scouts. However, they were also \
isolationist as a species, and tended to discourage interaction with \
other species. The Empire enlisted the aid of the Shistavanen many \
times, in an effort to explore the farthest reaches of the galaxy.\
 \
&RALSO TYPE&W:&Y SHOWSTAT SHISTAVANEN\
", 
   Level = 1, 
   Keyword = "SHISTAVANEN SHISTA WOLFMEN", 
}

HelpEntry
{
   Text = "Syntax : feel 'shocking grasp' <victim>\
\
Send small lightning bolts through victim from your hands.\
", 
   Level = 1, 
   Keyword = "'SHOCKING GRASP'", 
}

HelpEntry
{
   Text = "Syntax: feel 'shockshield'\
\
This power will surround you with a shield of electric energy that will\
return your enemies attacks with bolts of lightning!\
", 
   Level = 0, 
   Keyword = "'SHOCKSHIELD'", 
}

HelpEntry
{
   Text = "Syntax: shops\
\
Displays statistics on all the shops.\
\
See MAKESHOP, SHOPSET, SHOPSTAT and SHOPVALUES\
", 
   Level = 101, 
   Keyword = "SHOPS", 
}

HelpEntry
{
   Text = "Syntax: shopset <mobile vnum> <field> <value>\
\
-----------------------------------------------\
| Fields | Meaning                            |\
-----------------------------------------------\
| buy#   | Types of items the keeper will buy |\
| buy    | Profit on buying items             |\
| sell   | Profit on selling items            |\
| open   | Hour shop opens                    |\
| close  | Hour shop closes                   |\
| keeper | Vnum of shop keeper                |\
-----------------------------------------------\
\
Lets you set certain stats on a shop.\
\
see MAKESHOP, SHOPSTAT, SHOPS and SHOPVALUES\
", 
   Level = 101, 
   Keyword = "SHOPSET", 
}

HelpEntry
{
   Text = "Syntax: shopstat <mobile vnum>\
\
Shows statistics on a mobile's shop.\
\
See MAKESHOP, SHOPSET, SHOPS and SHOPVALUES\
", 
   Level = 101, 
   Keyword = "SHOPSTAT", 
}

HelpEntry
{
   Text = "Syntax: shopset <mobile vnum> buy# <value>\
 \
1  - light               21 - pen                41 - rune\
2  - scroll              22 - boat               42 - runepouch\
3  - wand                23 - corpse             43 - match\
4  - staff               24 - corpse_pc          44 - trap\
5  - weapon              25 - fountain           45 - map\
6  - _fireweapon         26 - pill               46 - portal\
7  - _missile            27 - blood              47 - paper\
8  - treasure            28 - bloodstain         48 - tinder\
9  - armor               29 - scraps             49 - lockpick\
10 - potion              30 - pipe               50 - spike\
11 - _worn               31 - herbcon            51 - disease\
12 - furniture           32 - herb               52 - oil\
13 - trash               33 - incense            53 - fuel\
14 - _oldtrap            34 - fire               54 - shortbow\
15 - container           35 - book               55 - longbow\
16 - _note               36 - switch             56 - crossbow\
17 - drinkcon            37 - lever              57 - projectile\
18 - key                 38 - pullchain          58 - quiver\
19 - food                39 - button             59 - shovel\
20 - money               40 - dial               60 - salve\
61 - rawspice            62 - lens               63 - crystal\
64 - duraplast           64 - battery            65 - toolkit\
66 - durasteel           67 - oven               68 - mirror\
69 - circuit             70 - superconductor     71 - comlink\
72 - medpac              73 - fabric            74 - rare metal\
75 - magnet              76 - thread            77 - spice\
78 - smut              79 - device  \
THE LAST OF THESE ARE WRONG ... ADD 1 to FIX (I THINK ... YOU HAVE TO PLAY\
WITH IT))\
", 
   Level = 101, 
   Keyword = "SHOPVALUES", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y  drag <character> <direction>\
&CSyntax &W:&Y  shove <character> <direction>\
 \
DRAG&c will drag the victim in the specified direction if they are\
not standing up, while &YSHOVE&c will shove them in the specified\
direction only if they are standing. \
 \
Characters who have been in a safe room for longer than 30 seconds\
will be unable to be shoved or dragged out of that room until they\
either leave of their own choice or they shove/drag another player. \
", 
   Level = 0, 
   Keyword = "SHOVE DRAG", 
}

HelpEntry
{
   Text = "Syntax:  showclan <clan/order/guild name>\
Example: showclan guild of mages, showclan Retribution\
 \
Used to display statistics for any clan organization, which includes\
clans, Orders and guilds.\
 \
See SETCLAN, MAKECLAN and CLANS\
", 
   Level = 101, 
   Keyword = "SHOWCLAN", 
}

HelpEntry
{
   Text = "Syntax: showguild 'guild of <guild name>'\
 \
Displays the statistics on a guild.\
", 
   Level = 101, 
   Keyword = "SHOWGUILD", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y showstat <race>\
&CSyntax &W:&Y showstat <profession>\
 \
&Yshowstat <race>&c will display that races maximum attributes and also\
give a datatable of their maxlevels (based on those attributes).\
 \
&Yshowstat <profession>&c will show all racial maxlevels for that\
profession, so the player can compare what is best for them.\
 \
&RAlso see&W:&P help races, help classes\
", 
   Level = 1, 
   Keyword = "SHOWSTAT SHOWSTATISTIC", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y sit\
&c\
Sit makes your character sit down.\
", 
   Level = 0, 
   Keyword = "SIT", 
}

HelpEntry
{
   Text = "There are now four sizes of EQ: small_size, human_size, large_size and\
hutt_size. Please set one of these flags for all eq .. you'll have to\
do it online. Heres the race breakdown for who can use what: \
small_size: jawa, noghri, ewok\
human_size: Human, Rodian, Twi'lek, Adarian\
large_size: Wookiee, Mon Calamarian, Gamorrean\
hutt_size: Hutt\
See also help Oset and help Layers.\
", 
   Level = 100, 
   Keyword = "SIZE EQ_SIZE", 
}

HelpEntry
{
   Text = "&cType &YPRACTICE&c to get a list of skills currently available to you and\
to see to what extent you have them practiced.  Type &YSLIST&c to view a\
list of all skills available at each level to your class. \
", 
   Level = 1, 
   Keyword = "SKILLS", 
}

HelpEntry
{
   Text = ".\
&CSyntax &W:&Y skin (corpse)\
 \
&cThis gruesome skill allows someone to skin the corpse of a player as\
means of a trophy.  However, this only works when the user is wielding\
something to cut with.\
", 
   Level = 1, 
   Keyword = "SKIN", 
}

HelpEntry
{
   Text = "Syntax:  slay <victim> [immolate/shatter/demon]\
 \
SLAY kills a character in cold blood, no saving throw.\
 \
The optional parameters cause different messages to be sent to the actor,\
the victim and the room, just for a bit of variety.\
 \
Slay bypasses auto actions such as autoloot and autosac.  Slay should not\
be used to test death_programs on mobs, as it is not the same as an actual\
death to the mobile and may not return accurate results.\
 \
", 
   Level = 101, 
   Keyword = "SLAY SLA", 
}

HelpEntry
{
   Text = "Syntax: feel sleep <victim>\
\
This power puts its victim to sleep.\
", 
   Level = 0, 
   Keyword = "SLEEP", 
}

HelpEntry
{
   Text = "This power makes you more dexterous for its duration.\
", 
   Level = 0, 
   Keyword = "SLINK", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y SLIST\
&CSyntax &W:&Y SLIST &W<&Ylo&W> <&Yhi&W>&Y\
 \
SLIST &cwithout an argument gives you a complete list of powers and skills\
available to all classes, also indicating the minimum level of that class\
to which you can practice it. \
 \
&YSLIST &W<&Ylo&W> <&Yhi&W>&c gives you a list of powers and skills\
available to all classes from levels &Wlo &cto &Whi&c. \
 \
&CExample:\
&W    <544hp 156m 700mv> <#2> slist 2 2\
    SPELL & SKILL LIST\
    ------------------\
                              ** combat ** \
    (  2) snipe               (  2) blasters  \
", 
   Level = 0, 
   Keyword = "SLIST", 
}

HelpEntry
{
   Text = "Syntax: slookup <skill-or-power>\
Syntax: slookup all\
\
SLOOKUP shows you the internal 'sn' and external 'slot' for the given skill\
or power.  The 'sn' is used for OSET and OSTAT.  The 'slot' is used for area\
files.  Neither 'sn' nor 'slot' is used for player files; these operate with\
the actual skill and power names.\
\
SLOOKUP ALL shows this information for all skills and powers.\
", 
   Level = 101, 
   Keyword = "SLOOKUP", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YSmalltalk &R&W<&YCitizen&R&W>\
 \
&cIncreases support for your organization on planets they control.  Actual\
number is +/-.2 support per successful conversation.  Using it on planets\
that you do not control, lowers support.\
", 
   Level = 1, 
   Keyword = "SMALLTALK", 
}

HelpEntry
{
   Text = ".           [S]imulated [M]edieval multi-[U]ser [A]dventure game\
\
SMAUG is an ongoing project headed up by Derek Snider (Thoric), who has\
taken on several assistants in expanding and improving the code.\
\
 Thoric Altrag Blodkai Narn Haus Scryn Swordbearer Rennard Tricops Gorog\
", 
   Level = -1, 
   Keyword = "SMAUG THORIC", 
}

HelpEntry
{
   Text = "SMAUG has a specially coded power type \"power_smaug\", which is a generic\
power handler that uses the extra power fields to determine what the power\
is going to achieve.\
 \
damtype   the class of damage done (see DAMTYPES)\
acttype   the action of the power (see ACTTYPES)\
classtype the class of power (see CLASSTYPES)\
powertype the power ranking of the power (see POWERTYPES)\
flag      special extra flags this power has (see SPELLFLAGS)\
hit       Message displayed when power is successful\
miss      Message displayed when power misses or fails\
die       Message sent if power causes death\
imm       Message sent if victim is immune\
(Messages must specify char, vict or room, ie: hitchar, hitvict, hitroom)\
dice      a dice formula used for rolling things like damage (see DICEFORMULAS)\
saves     saving throw victim gets (see SPELLSAVES)\
bitvector see AFFECTED_BY, the bitvector applied by the power, if any\
affects   see AFFECTTYPES, the effect the power has, if any\
value     an extra field reserved for things like the vnum used in powers\
          that create objects, or summon monsters to the caster's aid.\
", 
   Level = 101, 
   Keyword = "SMAUGSPELLS", 
}

HelpEntry
{
   Text = "&c &cThose that choose the smuggling profession have many abilities that\
others do not have.  The ability to pick doors, and even ships.  These,\
coupled with the ability to hide and sneak by others, makes the smuggler a\
popular choice.  Smuggling is basically getting illegal items from one\
place to another without getting caught.  \
 \
&R&WAlso see:&P Help Beg\
          Help Dig\
          Help Search\
          Help Sneak\
          Help Climb\
          Help Peek\
          Help Steal\
          Help Detrap\
          Help Stealth\
          Help \"Pick Lock\"\
          Help Disguise\
          Help \"Pick Ship Lock\"\
          Help Hijack\
", 
   Level = 0, 
   Keyword = "SMUGGLING SMUGGLER SMUGGLE", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &R&YSnipe &R&W<&R&YDirection&R&W> <&R&YTarget&R&W> \
\
&R&cThis skill allows you to engage enemies at long distance, using a\
blaster. \
 \
", 
   Level = 1, 
   Keyword = "SNIPE", 
}

HelpEntry
{
   Text = "Syntax:  sober <victim>\
 \
Removes a character's inebriation and all affects of alcohol.\
", 
   Level = 101, 
   Keyword = "SOBER", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YAutomatic \
  \
&R&cThese skills increase the damage you do in ships. They act like\
enhanced damage, except for ships.\
", 
   Level = 1, 
   Keyword = "'SPACE COMBAT 1' 'SPACE COMBAT 2' 'SPACE COMBAT 3'", 
}

HelpEntry
{
   Text = "The following are commands you can use to control spacecraft: \
&z.\
&COn the Ground:\
&YShips &W-&c Shows a list of ships that are for sale or rent. \
&YClanbuyship (Ship) &W-&c Buys a ship for your organization. \
&YBuyship (Ship) &W-&c Purchase a ship. \
&YSellship (Ship) &W-&c Sell a ship. \
&YOpenhatch (Ship) &W-&c Opens a ship's hatch. \
&YClosehatch (Ship) &W-&c Closes a ship's hatch. \
&YBoard (Ship) &W-&c Enter a ship. \
&YLeaveship &W-&c Leave a ship.  \
&YAddpilot (Name) &W-&c Allows a character to pilot your ship. \
&YRempilot (Name) &W-&c Removes a character from your pilot list. \
&z\
&CPiloting the Spacecraft\
&YLaunch &W-&c Launch a ship. \
&YSpeed (Speed) &W-&c Accelerates/Decelerates. \
&YLand &W-&c Shows a list of possible landing sites. \
&YLand (Location) &W-&c Lands at specified location. \
&YCourse (X Y Z) &W-&c Steers a ship towars vector x y z. \
&YStatus &W-&c Shows a ship's status. \
&YInfo (Ship) &W-&c Gives info on a ship in space. \
&YRadar &W-&c Scans the surrounding system, showing ships, planets, etc.\
&YHyperspace &W-&c Preforms the hyperspace jump to system. \
&YCalculate (System X Y Z) &W-&c Calculates a hyperspace jump. \
&YShield (On/Off/Idle) &W-&c Turns the shields on, off, idle (no recharge).\
&YRecharge &W-&c Recharges a ship's shields. \
&YTarget (Ship) &W-&c Aims weapon systems or turrets at target. \
&YFire (Missile/Torpedo/Rocket) &W-&c Fires projectile. \
&YFire &W-&c Fires lasers. \
&YFire Ion &W-&c Fires Ion cannons. \
&YRepairship (Ship system) &W-&c Repairs a ship's specified system. \
&YAutotrack &W-&c Automatically adjusts your course to follow a target.\
 \
", 
   Level = 1, 
   Keyword = "SPACE SHIP SHIPS FLIGHT SPACECRAFT", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Spacetalk <message>\
&CSyntax &W:&Y Systemtalk <message>\
&CSyntax &W:&Y Shiptalk <message>\
&c\
&YSPACETALK&c allows a pilot (from his cockpit) to talk to anyone within\
space, despite galaxy or landing pad.\
 \
&YSYSTEMTALK&c allows a pilot to talk (and be heard) by any ship within the\
the mutual COMM ranges allow.\
 \
&YSHIPTALK&c allows a a crewmember to talk to broadcast a message\
throughout the ship he or she is in.  They must be inside a station to use\
this command. \
", 
   Level = 1, 
   Keyword = "SPACETALK SHIPTALK SYSTEMTALK", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y speak\
&CSyntax &W:&Y speak <language>\
&CSyntax &W:&Y speak all (immortals only)\
&c\
The speak command changes the current language in which you are speaking. \
To speak your native tongue, type &YSPEAK&c alone.  To speak a specific\
language (such as common, for example), type &YSPEAK COMMON&c.  Immortals\
have the unique ability to speak so that everyone can understand, by typing\
&YSPEAK ALL&c\
", 
   Level = 0, 
   Keyword = "SPEAK", 
}

HelpEntry
{
   Text = "The syntax for a spec proc is:\
mset <mob vnum> spec spec_<program desired>\
mset <mob vnum> spec_2 spec_<program desired>\
\
Here is a list of the spec programs:\
\
spec_jedi, spec_jedi_healer, spec_dark_jedi,\
spec_fido, spec_janitor, spec_poison, spec_thief,\
spec_auth *DO NOT USE* its for one mob only in the academy,\
spec_stormtrooper, spec_new_republic_trooper, spec_guardian,\
spec_customs_smut, spec_customs_alcohol,\
spec_customs_weapons, spec_customs_spice,\
spec_police_attack, spec_police_fine,\
spec_police_jail, spec_police\
", 
   Level = 101, 
   Keyword = "SPEC SPEC_PROC SPECIAL", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YSpecialForces\
 \
&cThis allows you to call elite troops to do your bidding. Special forces\
are like reinforcements, but much stronger and more expensive.\
", 
   Level = 1, 
   Keyword = "'SPECIAL FORCES' SPECIALFORCES", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YAutomatic \
\
&R&cThis skill is the equivalent of space combat, except for speeders.  It\
increases damage in speeder-to-speeder combat.\
 \
&R&WAlso see: &PHelp 'Space Combat 1' \
&R&W\
", 
   Level = 1, 
   Keyword = "'SPEEDER COMBAT'", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YAutomatic\
 \
&R&cThis skill allows you to drive a speeder and other land vehicles. \
", 
   Level = 1, 
   Keyword = "SPEEDERS", 
}

HelpEntry
{
   Text = "T###         check for item of type ###\
V#####       check for item of vnum #####\
Kword        check for item with keyword 'word'\
G#####       check if player has ##### amount of gold\
H####        check if player has #### amount of hitpoints\
\
Special operators:\
+ don't consume this component\
@ decrease component's value[0], and extract if it reaches 0\
# decrease component's value[1], and extract if it reaches 0\
$ decrease component's value[2], and extract if it reaches 0\
% decrease component's value[3], and extract if it reaches 0\
^^ decrease component's value[4], and extract if it reaches 0\
&& decrease component's value[5], and extract if it reaches 0\
and ! will make the power fail if the caster is carrying that component.\
 \
Example: V1100 V+1101\
The power will only succeed if the caster is carrying objects of vnums\
1100 and 1101.  The object of vnum 1100 will get consumed by the power,\
and the object of vnum 1101 will not.\
 \
With the decremental operators (@#$%^^&&), the object must have at least\
a value of 1 in the respective location for the power to succeed.\
", 
   Level = 101, 
   Keyword = "SPELLCOMPONENTS", 
}

HelpEntry
{
   Text = "water           water based (create water, ice powers)\
earth           interracts with nature (earthquake)\
air             involve the air or winds\
astral          involve the astral plane (astral walk)\
area            an \"area power\"... affects everyone in the room\
distant         affects something far away\
reverse         has a reverse affect\
save_half_dam   victim can save for half damage\
save_negates    victim can save for no effect\
accumulative    can be cast repeatedly to have an increased effect\
recastable      can be cast again to refresh the power\
nobrew          cannot be brewed into a potion\
noscribe        cannot be scribed onto a scroll\
group           affects everyone in the caster's group (same room only)\
object          specifically affects an object (for target 'ignore')\
character       specifically affect a character (for target 'ignore')\
", 
   Level = 101, 
   Keyword = "SPELLFLAGS", 
}

HelpEntry
{
   Text = "Here are the saving throws you can set for use in SMAUG powers:\
none            victim doesn't get a saving throw\
poison_death    save vs. poison or death\
wands           save vs. wands\
para_petri      save vs. paralysis or petrification\
breath          save vs. (dragon) breath\
power_staff     save vs. powers or staves\
", 
   Level = 101, 
   Keyword = "SPELLSAVES", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YMakespice &W<&YSpice&W> \
  \
&cThis skill allows you to make spice usable for consumption.  You need to\
be in a refinery to use this.  You also need some unrefined spice for this\
to work. \
  \
&RSee also&W: &PHelp Spice \
", 
   Level = 1, 
   Keyword = "'SPICE REFINING' MAKESPICE", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y SPLIT &W<&Yamount&W>\
&Y\
SPLIT&c splits some credits between you and all the members of your group\
who are in the same room as you.  It's customary to &YSPLIT&c the bounty\
after a kill.\
", 
   Level = 0, 
   Keyword = "SPLIT", 
}

HelpEntry
{
   Text = "Syntax: sset <victim> <skill> <value>\
or:     sset <victim> all     <value>\
or:     sset <sn>     <field> <value>\
 \
name          the name of the skill or power\
code          for powers, the code executed when the power is cast\
target        for powers, the target of the power (see TARGETTYPES)\
minpos        the minimum position required to use this skill/power\
slot          for powers, the slot number used in area files\
mana          for powers, the amount of mana consumed by the power\
beats         how long this skill takes to be used (in 1/4 seconds)\
dammsg        a word to describe the damage done by this skill or power\
wearoff       for powers, the message given when the power wears off\
type          the type of skill (Spell, Skill, Weapon, Tongue)\
difficulty    how difficult the power/skill is to learn and/or use\
damtype       for powers, the class of damage it does\
components    the components required for this power (see SPELLCOMPONENTS)\
teachers      will restrict the teaching of this skill to these mob vnums\
participants  the minimum number of required participants (for powers)\
 \
For the special fields used by SMAUG powers (power_smaug) see SMAUGSPELLS\
 \
", 
   Level = 101, 
   Keyword = "SSET", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Starsystems\
&c\
This command allows you to see all the KNOWN stars and planets within the\
game.  All the stars are on the top list, and are in &Rred&c.  All the\
known planets are in the lower list, in &GGreen&c.  You can use the names\
of either a star or a planet from this list for automatic hyperspace\
calculation. \
", 
   Level = 1, 
   Keyword = "STARSYSTEMS", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YSneak\
 \
&CSyntax &R&W: &YStealth\
\
&CSyntax &R&W: &YVisible\
 \
&YSneak &cenables you to move from room to room without being noticed by\
other players. \
 \
&YStealth&c allows you to remain unseen to players and mobs, unless they\
have goggles, or are affected by skills that let them see hidden. \
 \
In order to use &YSneak &cor &YStealth&c, you must practice them.\
 \
&YVisible&c cancels your stealth or sneaking, as well as any masking\
(invisbility), effectively making you visible to all again.\
", 
   Level = 1, 
   Keyword = "STEALTH SNEAK VISIBLE", 
}

HelpEntry
{
   Text = "&CStrength &Y(str)&C represents your character's physical power. The most\
common concern with strength deals with how much your character can carry.\
For each additional point of strength, you gain an additional amount of\
maximum carryable weight.  A character with 20 strength can carry 500 kgs,\
while a character with 25 &Y(max)&C can carry up to 999 kgs.\
 \
&cStrength also affects:\
 \
 * Increases hitroll/damroll. *\
 \
 * Chances of success for bash/stun. *\
 \
 * Ability to wield heavier weapons. *\
 \
 * Increases max combat level.  *\
", 
   Level = 1, 
   Keyword = "STRENGTH STR", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y suicide &W<&Ypassword&W>\
&c\
When it becomes necessary to \"get rid of the old, and start with the new\",\
you may choose to suicide your character.  Do this by typing &YSUICIDE\
<your password>&c.  Do take note that you need a blade to slit your own\
throat. \
", 
   Level = 1, 
   Keyword = "SUICIDE", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Sullust\
&CInhabitants &W: Sullustan\
&c\
     Primary planet in the Sullust system, known for its mineral mines \
and technologies. It is a volcanically-active world with a hot, noxious \
atmosphere wracked by violent storms. Thus, the native Sullustans \
prefer to live underground, in the cool, humid caves that riddle the \
planet's mantle. There are also a number of underground lakes and \
caverns that support a surprising amount of life forms. The huge, \
diversified SoroSuub Corporation grew out of the caves, and when the \
Sullustan Council faltered, SoroSuub announced that it was aligned the \
planet with the Empire. Many of the working class Sullustans could not \
believe this, and a wave of Rebellion swept through the planet's \
inhabitants just before the Battle of Endor. It was then allowed to be \
the stop-over site for the massing Rebel fleet prior to the destruction\
of the second Death Star. \
", 
   Level = 1, 
   Keyword = "SULLUST", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Sullust\
&c\
Small, mouse-like aliens with huge black eyes, loose jowls, and pointed\
ears. They salivate quite often, and live underground to avoid Sullust's\
inhospitable atmosphere. Their ingenuity and adaptability has allowed them\
to created huge underground cities and their technology has grown at an\
incredibly fast rate. They have an intense sense of direction, having\
lived in caves all their lives, and have the uncanny ability to remember a\
path or map exactly, even after the first time they see it. Thus, many of\
the Sullustans have become pilots and navigators. Many Sullustans, after\
the age of 30 standard years, begin to experience corneal defects, and\
must be fitted with special visors.\
 \
&RAlso Type&W:&Y SHOWSTAT SULLUSTAN\
", 
   Level = 1, 
   Keyword = "SULLUSTAN SULLUSTANS", 
}

HelpEntry
{
   Text = "Syntax: switch <character>\
Syntax: return\
\
SWITCH switches you into the body of another character (who must not\
already have a descriptor, e.g. you can't switch into a PC).\
\
RETURN returns you to your original body.\
", 
   Level = 101, 
   Keyword = "SWITCH RETURN", 
}

HelpEntry
{
   Text = "SW: Rise in Power MUD Codebase v1.0 (c) 2001 was created by Mark Miller\
(Darrik Vequir) with the advice and input of his staff. \
 \
This helpfile, along with the help file 'Credits' listing the derivatives,\
and all other help files required by each license supplied with this code,\
must be included with each distribution.  Except for the 'credits' help\
file, which can be added to, but not deleted, each of these files must be\
kept intact as shipped. \
 \
Any one who uses the SWRiP code should send an email to Darrik@swrip.net\
informing him of this.  Once that has been done, he will assist you with\
any problems you may have as his time allows. \
", 
   Level = 1, 
   Keyword = "SWRIP", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Takedrug (drug)\
&c\
This allows all the junkies to get their fix. \
", 
   Level = 1, 
   Keyword = "TAKEDRUG DRUG DRUGS SPICE RHYLL", 
}

HelpEntry
{
   Text = ".\
Syntax : Target <ship name>\
 \
Used in ship to ship combat to target enemy ships.\
 \
See also help Space Combat 1, help Weapon Systems.\
", 
   Level = 1, 
   Keyword = "TARGET", 
}

HelpEntry
{
   Text = ".\
Target                Function\
--------------------------------------------------------------------\
ignore                Spell affect relies on the casting argument\
offensive             Spell will initiate combat\
defensive             Can be cast on anyone safely\
self                  Spell only affects the caster\
objinv                Casted onto an object in the caster's inventory\
", 
   Level = 101, 
   Keyword = "TARGETTYPES", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Tatoo\
&CInhabitants &W:&W Jawa, Sandpeople, Human\
&c\
     The primary planet in the Tatoo system, this desert world is \
located in the Arkanis Sector of the Outer Rim Territories near Piroket \
and Ryloth, some 43,000 light-years from the galactic core. It is close \
enough to a major hyperspace nexus to make it easy to get to such \
worlds as Coruscant and Corellia, but its environment makes it one of \
the most inhosptiable places in the galaxy. The planet's twin suns \
mercilessly heat the planet, keeping the sodium-rich deserts alive. The \
planet has a single, natural satellite. Several decades before the \
Battle of Yavin, settlers arrived to colonize this first world in what \
was then called the J11.9 system. They coined the name Tatooine from \
the Jawa name for the planet, Tah doo Een e. The settlers established \
strongholds on the planet, and many smugglers and criminals have set up \
operational bases in its wastelands. The settlers there are primarily \
moisture farmers, extracting what little water they can from the \
atmosphere for survival. Its location on the galactic fringes makes it \
a perfect base for smugglers, mercenaries, and bounty hunters. The \
planet, despite its hostile ecology, supports human life was well as \
the native races of Jawas, krayt dragons, and Tusken Raiders. The \
planet's remote location appealed to Owen Lars and his wife Beru, and \
they lived there with Luke Skywalker for many years. Tatooine's average \
day lasts 23 standard hours, and its year consumes 304 local days. \
", 
   Level = 1, 
   Keyword = "TATOOINE", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Syntax &W<&Yperson&W> <&Yskill&W>\
&c\
This command allows a player to teach another player their skill.  Of\
course, the teacher must be adept in the skill he is teaching, and the\
level of the teacher's wisdom will determine how adept the student becomes\
when he learns this skill.\
", 
   Level = 1, 
   Keyword = "TEACH", 
}

HelpEntry
{
   Text = "Syntax:  think <message>\
 \
Allows you to use the 'think' channel, which functions the same as all\
other channels and can only be seen by those of high enough level.\
The level for access to think can be controlled with 'cset'.\
 \
See CSET\
", 
   Level = 101, 
   Keyword = "THINK", 
}

HelpEntry
{
   Text = "&R&CSyntax &R&W: &YThrow &R&W<&YDirection&R&W> \
\
&R&cA useful skill that allows you to throw an object into another room. \
Useful if you want to throw a grenade.\
 \
&R&WAlso see: &PHelp Grenades\
&R&W\
", 
   Level = 1, 
   Keyword = "THROW", 
}

HelpEntry
{
   Text = "Many of the actions in the game are based upon interval timers, including\
combat, most autonomous monster actions, hp/force/move regeneration, power\
duration, weather, and area resetting.\
 \
Of these timers, the hp/force/move regeneration timer is popularly called the\
'tick'.  Ticks in the game average 30 seconds of real time, but the actual\
amount varies randomly from 15 seconds to 45 seconds.\
 \
Area resetting happens roughly every 3 minutes if there are no characters in\
in the area; less often (15 minutes) if any characters are present.  Also\
note that objects lying on the ground will not be regenerated if anyone\
is in the area when it resets.\
 \
Area resets are indicated by 'squeaking noises' just prior to the reset.\
", 
   Level = 0, 
   Keyword = "TICK", 
}

HelpEntry
{
   Text = "Syntax:  timecmd <command>\
Example: timecmd mpstat <mob>\
 \
Returns the time required to execute the specified command for that\
instance of its execution.\
", 
   Level = 101, 
   Keyword = "TIMECMD", 
}

HelpEntry
{
   Text = "Syntax: title <string>\
\
Sets your title to a given string.\
\
The game supplies a title when your character is created and when you\
advance a level.  You can use TITLE to set your title to something else.\
", 
   Level = 0, 
   Keyword = "TITLE", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Togoria\
&c\
     A race of bipedal feline aliens from Togoria, the Togorians have \
long, sinewy limbs and well-muscled bodies that are equally useful \
moving through a forest or running across an open plain. Their hands \
and feet are studded with heavy claws, which are retractable on the \
hands. They regularly feed on bist and etelo herds, but are the favored\
prey of the reptilian liphons. The Togorians soon realized that they \
shared this trait with the mosgoths, and they formed a relationship \
which provided mutual protection as well as friendship. The Togorians \
have a society in which the males and females only see each other for a\
few days each year. The males spend their days wandering the plains and\
hunting for food, while the females stay in the cities and tend to \
their business there. The Togorians have a limited technology, \
including a solar technology maintained by the females, although they \
are fond of high-tech devices. The Togorian society is presided over by\
the Margrave, a position held by a male of a certain family line.\
 \
&RAlso Type&W:&Y SHOWSTAT TOGORIAN\
", 
   Level = 1, 
   Keyword = "TOGORIAN TOGORIANS", 
}

HelpEntry
{
   Text = "&cThe different PC languages include Common, Wookiee, Twilek, Rodian, Hutt,\
Mon Calamari, Shistavanen, Ewok, Ithorian, Gotal, Devaronian, Barabel,\
Firrerreo, Bothan, Gamorrean, Togorian, Kubaz, Jawa, Adarian, Verpine,\
Defel, Trandoshan, Chadra-Fan, Quarren, Sullustan, Falleen, Binary,\
Yeventhan, Gand, Duros, Coynite. \
 \
Most races can speak the majority of these languages, though common is\
recommended, however, some races, such as the Wookiee, can only speak\
their native language. \
 \
&YLANGUAGES&c allows you to see how fluent you are in a particular language\
(percentage wise), the more fluent you are, the less likely an alien's\
words will appear garble to you. \
 \
&RSee also&W:&P SPEAK LANGUAGES\
", 
   Level = 1, 
   Keyword = "TONGUE TONGUES", 
}

HelpEntry
{
   Text = "Additional topics you may want to look over:\
*TICK\
*WIZLIST\
*EXPERIENCE\
*EQDAMAGE\
*CLANS\
*CHANGES\
*DAMAGE\
*NEWS\
*STORY\
 \
To view a topic type: HELP <topic>\
", 
   Level = 1, 
   Keyword = "TOPICS", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YTorture &R&W<&YMob&R&W/&YPlayer&R&W> \
 \
&cThis skill allows you to permanently remove hit points from a mob or a\
player. \
 \
&RNote: &rUsing torture lowers your alignment considerably.\
", 
   Level = 1, 
   Keyword = "TORTURE", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YTrack &R&W<&YName&R&W>\
 \
&cTrack will assist you in hunting down a player or mob that is within the\
area, giving you their general direction.\
", 
   Level = 0, 
   Keyword = "TRACK", 
}

HelpEntry
{
   Text = "&CSyntax &R&W: &YTractor &R&W<&YShip&R&W> \
\
&R&cThis skill allows you to use a ship's tractor beam.  You must be in the\
pilot's seat, and your hanger must be open. \
 \
This locks a tractor beam on the target you specify.\
It automatically begins to pull the target towards you.\
However, if you tractor a ship bigger than you are, \
you will move towards it, rather than vice versa.\
It will NOT land a ship in your bay automatically.\
There is a new command for that.\
 \
SEE ALSO: &WOPENBAY ADJUSTTRACTOR \
", 
   Level = 1, 
   Keyword = "'TRACTOR BEAMS' TRACTOR", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YTrain &R&W<&Ystat&R&W> \
\
&cTraining is the only way to permanently improve a character's starting\
stats.  Training can only be done with certain mobs around the mud, and it\
is only about 20% effective.  It does not cost anything to train, only\
takes time and patience.  There is a training facility, the Fitness\
Center, 5 west of the Cheap Hotel on Coruscant. \
&R&W\
", 
   Level = 1, 
   Keyword = "TRAIN", 
}

HelpEntry
{
   Text = "These are ships designed to help you raise space combat.  You can only\
target other trainer ships while in one, and if you get blown up, you end\
back at the training pad.  So no death by another trainer ship.\
", 
   Level = 1, 
   Keyword = "TRAINER 'TRAINER SHIPS'", 
}

HelpEntry
{
   Text = "Syntax:  trance\
 \
A character in possession of this skill may use it to briefly focus its\
energies toward restoring a small burst of force.\
", 
   Level = 1, 
   Keyword = "TRANCE", 
}

HelpEntry
{
   Text = "&COrigin: &YTrandosha\
\
&c     These humanoid reptiles are natives to the planet Trandosha.  They\
have long arms, which end in wide, splayed fingers.  Their heads are\
blunt, with beady red eyes and a mouth full of razor sharp teeth.  Their\
scales range in color from orange to ochre to brown.  Much of their body\
can be regenerated if lost, so a Trandoshan can fight much harder without\
risk of permanent injury.  Being a vicious, warlike race, the Trandoshans\
evolved into hunters, and were especially proficient at hunting Wookiees,\
which inhabited the nearby planet of Kashyyyk.  It was a Trandoshan\
official who sold the idea of enslaving Wookiees rather than simply\
leveling Kashyyyk to the Empire. \
 \
&CAlso see: &PHelp Trandoshan_stats\
&R&W\
", 
   Level = 0, 
   Keyword = "TRANDOSHAN TRANDOSHA DOSHA", 
}

HelpEntry
{
   Text = "&CRace: &YTrandoshan\
&CSpecial Abilities: &YInfrared\
&CRestrictions: &YNone\
 \
&CStr:&Y 22 &CInt:&Y 20&C Wis:&Y 20&C Dex:&Y 20&C Con: &Y25 &CCha:&Y 19\
 \
&CProfession:\
 \
          Combat  Pilot  Engineer  B.Hunter  Smug.  Diplo.  Leader.\
Combat&Y     150     87       87        112     87      87      87&C \
Pilot&Y      40      140      65        65      90      40      40&C \
Engine.&Y    30      50       130       30      30      30      30&C \
B.Hunt&Y     30      30       30        130     30      30      30&C \
Smugg.&Y     6+      26+      31+       6+      106+    6+      6+&C\
Diplo.&Y     27      37       27        27      27      127     77&C \
Lead.&Y      99      49       49        49      49      99      149&C \
&R&W\
", 
   Level = 0, 
   Keyword = "TRANDOSHAN_STATS", 
}

HelpEntry
{
   Text = "Syntax: transfer <character>\
Syntax: transfer all\
Syntax: transfer <character> <location>\
Syntax: transfer all         <location>\
\
TRANSFER transfers the target character, or ALL player characters,\
to your current location (default) or to a specified location.\
", 
   Level = 101, 
   Keyword = "TRANSFER", 
}

HelpEntry
{
   Text = "Flags to describe a trap and what triggers it:\
\
ROOM    - Trap is in a room\
OBJ     - Trap is on an object\
ENTER   - Trap is triggered by entering the room\
LEAVE   - Trap is triggered by leaving the room\
OPEN    - Trap is triggered by opening\
CLOSE   - Trap is triggered by closing\
GET     - Trap is triggered by getting the object\
PUT     - Trap is triggered by putting the object\
EXAMINE - Trap is triggered by examining the object\
PICK    - Trap is triggered by picking the object\
UNLOCK  - Trap is triggered by unlocking the object\
NORTH   - Trap is triggered by moving north\
SOUTH   - Trap is triggered by moving south\
EAST    - Trap is triggered by moving east\
WEST    - Trap is triggered by moving west\
UP      - Trap is triggered by moving up\
DOWN    - Trap is triggered by moving down\
\
See RESET, TRAPSETTING and TRAPTYPES.\
", 
   Level = 101, 
   Keyword = "TRAPFLAGS", 
}

HelpEntry
{
   Text = "Setting a trap is a little tricky.\
\
Parameters: <vnum> <type> <charges> <flags>\
VNUM    - The vnum of either the room or object to be trapped.\
TYPE    - The type of trap.  (See TRAPTYPES)\
CHARGES - The number of charges this trap should contain.\
FLAGS   - Flags specifying the characteristics of the trap.\
          (ie: room trap or object trap, what triggers the trap, etc.)\
\
See RESETS, TRAPTYPES and TRAPFLAGS.\
", 
   Level = 101, 
   Keyword = "TRAPSETTING", 
}

HelpEntry
{
   Text = "Types of traps:\
\
 --------------------------------------------------------------------\
 | Number | Description             | Number | Description          |\
 --------------------------------------------------------------------\
 |    1   | Poison gas              |    8   | Flame                |\
 |    2   | Poison dart             |    9   | Explosion            |\
 |    3   | Poison needle           |   10   | Acid Spray           |\
 |    4   | Poison dagger           |   11   | Electric Shock       |\
 |    5   | Poison arrow            |   12   | Blade                |\
 |    6   | Blindness gas           |   13   | Sex change power     |\
 |    7   | Sleeping gas            |        |                      |\
 --------------------------------------------------------------------\
\
See RESET, TRAPSETTING and TRAPFLAGS.\
", 
   Level = 101, 
   Keyword = "TRAPTYPES", 
}

HelpEntry
{
   Text = "&c\
A trigger is an action, phrase, or game event that causes a program\
held within a room, mob or object, to begin playing out its commands.\
 \
Triggers can be anything from a player or mob entering a room, to a\
player stating a particular phrase within a room, or to a mob or an\
object.\
 \
For detailed information on triggers, see:\
\
&RNote: &WIf we catch you idling to collect interest, there will be dire\
consequences. \
&w\
RPTRIGGERS, MPTRIGGERS, OPTRIGGERS\
", 
   Level = 101, 
   Keyword = "TRIGGER", 
}

HelpEntry
{
   Text = "Triggers are Illegal. This means nobody can idle collecting packages, and\
hog them.\
 \
Anyone caught using Triggers will be dealt with however the Imms see fit.\
\
A classic misunderstanding:\
You may use triggers to train your stats such as wisdom, dexterity, etc.\
That is perfectly legal.\
", 
   Level = 1, 
   Keyword = "TRIGGERS", 
}

HelpEntry
{
   Text = "Syntax:  feel 'true sight'\
 \
This power can only be cast upon yourself.  It is a combination of\
infravision (enabling you to see in the dark), detect invisible,\
and detect hidden.  This power also allows you to see through\
blinding attacks.\
", 
   Level = 101, 
   Keyword = "'TRUE SIGHT'", 
}

HelpEntry
{
   Text = "Syntax: trust <character> <level>\
\
TRUST sets a character's trust to the specified level.  This is similar to\
advancing the character for accessing immortal commands, but has no effect\
on combat strength, et cetera.  You can give more trust to mortal (or\
immortal) characters to give them access to more power without messing up\
the character.  You can also restrict a player's trust to less than their\
natural level.\
\
A trust of 0 means to use the character's natural level again.\
", 
   Level = 101, 
   Keyword = "TRUST", 
}

HelpEntry
{
   Text = ".               Dungeons && Dragons (tm) and TSR Hobbies Inc.\
\
  Here we'd like to duplicate the original credits from the Basic Rules,\
Dungeons && Dragons (tm), (c) 1974, 1977, 1978, 1981, 1983 TSR Hobbies Inc.\
\
Acknowledgements:\
The following individuals have made this work possible through its years of\
evolution: Dave Arneson, Brian Blume, Dave Cook, Anne C. Gray, Ernie Gygax,\
E. Gary Gygax, Allen Hammack, Kevin Hendryx, John Eric Holmes, Harrold\
Johnston, Tim Kask, Jeff Key, Rob Kuntz, Alan Lucien, Steve Marsh, Tom\
Moldvay, Mike Mornard, Jon Pickens, Brian Pitzer, Michael Price, Patrick L.\
Price, Paul Reiche, Evan Robinson, Gordon Schick, Lawrence Schick, Don Snow,\
Edward G. Sollers, Garry Spiegle, Stephen D. Sullivan, Ralph Wagner, Jim\
Ward, Jean Wells, Bill Wilkerson, Donald Paterson, and Frank Mentzer.\
\
      DIKUMud's concepts were directly based on TSR's D&&D concepts.\
", 
   Level = -1, 
   Keyword = "TSR D&&D AD&&D", 
}

HelpEntry
{
   Text = "&pOrigin:&Y Ryloth\
\
&P     A humanoid race with twin head tentacles.  The dual tail-like\
appendages, called \"lekku\", grown out the backs of their heads are used\
for communication with other Twi'leks.  Their language combines both a\
spoken tongue along with the use of the lekku.  Native to the planet\
Ryloth in the Outer Rim, they cultivate edible molds and fungi, and raise\
cow-like rycrits for their meats and hides.  The species is not known for\
violence, instead they prefer to use cunning aside from force.  Their\
homeworld is known for the substance ryll, which has legitimate medical\
use, but is vastly known for more dangerous addictive and recreational\
reasons.  One hazard that the Twi'leks face on a regular basis is slavers,\
who come to their world to fill their ships with Twi'lek slaves.\
 \
&pAlso see: &CHelp Twi'lek_stats\
&R&W\
", 
   Level = 0, 
   Keyword = "TWI'LEK TWI'LEKS TWILEK", 
}

HelpEntry
{
   Text = "&pRace: &YTwi'lek\
&pSpecial Abilities:&Y None\
&pRestrictions: &YNone\
 \
&pStr: &Y20 &pInt: &Y22 &pWis: &Y22 &pDex: &Y22 &pCon: &Y19 &pCha: &Y19\
 \
&pProfession:\
 \
          Combat  Pilot  Engineer  B.Hunter  Smug.  Diplo.  Leader. \
Combat&Y     150     61       61        86      61      61      61&p \
Pilot&Y      44      144      69        69      94      44      44&p \
Engine.&Y    44      64       144       44      44      44      44&p \
B.Hunt&Y     10      10       10        110     10      10      10&p \
Smugg.&Y     46+     66+      71+       46+     146+    46+     46+&p \
Diplo.&Y     32      42       32        32      32      132     82&p\
Lead.&Y      88      38       38        38      38      88      138&p\
&R&W\
", 
   Level = 0, 
   Keyword = "TWI'LEK_STATS TWILEK_STATS", 
}

HelpEntry
{
   Text = "Syntax : feel 'unravel defense' <victim>\
\
Makes victim more susceptable.\
", 
   Level = 1, 
   Keyword = "'UNRAVEL DEFENSE'", 
}

HelpEntry
{
   Text = "&cA new system of upgrades is being implemented, due to the power\
differences between the two most powerful clans and the rest of the\
galaxy.\
&CTwo new help files have been added. \
&P\
military upgrades \
civilian upgrades \
&c\
The two main clans will use civilian prices, but military maxes.\
Due to the significant price increases, and the fact that the GTC doesnt do\
anything, they will now get 5% of what they sell.  \
\
&RSee Also&W: &PChangesUPG, UPGRADESHIP\
", 
   Level = 1, 
   Keyword = "UPGRADES", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y upgradeship <ship name> <part to upgrade> <amount>\
 \
&RAlso see&W:&P UPGRADES, MILITARY UPGRADES, MILITARYUPG2, CIVILIAN\
UPGRADES, CIVILIANUPG2 \
", 
   Level = 1, 
   Keyword = "UPGRADESHIP", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Use (item)\
 \
Obviously lets you use the item.\
", 
   Level = 1, 
   Keyword = "USE ACTIVATE", 
}

HelpEntry
{
   Text = "Syntax: opedit <object> <command> [number] [use_prog] [percentage]\
 \
The use_prog is an objtrigger that can be used in object programs.  The\
use_prog will be executed when the item is used.  To define what will\
trigger the use_prog, here is a list:\
\
* Wands - when you zap\
* Staves - when you brandish\
* Food/pills - when you eat\
* Blood/fountains/drink containers - when you drink\
* Lights/armour/weapons - when you wear/wield/hold\
* Potions - when you quaff\
* Pipes - when you smoke\
 \
When the use_prog is executed you will not see the standard 'use message'\
(ie You quaff a violet potion). What you will will be any mpechoes placed\
in the program.  Also, any mobprog commands can be used in use_prog (see \
MPCOMMANDS).\
\
**NOTE** The use_progs on lights, armour, and weapons are executed BEFORE\
the player wears/holds/wields any item. Therefore, a mpforce to remove the\
item will not work in the use_prog.  You will have to use a wear trigger\
to accomplish this.\
", 
   Level = 101, 
   Keyword = "USEPROG", 
}

HelpEntry
{
   Text = "Syntax: users <host ip>\
Syntax: users <playername>\
\
USERS reports all of the visible users connected to the server, including users\
in the process of logging in.\
If used with an argument, it will show all users from that host ip.\
Shortforms of host will work -- e.x. 205, or 205.113, etc.\
Shortened names will also work.  e.x., users fre would show\
Fredrick and Fred if they were on at the time.\
The first number, (desc), is the descriptor number that this user is on.\
The second number is the user's connected state.  (See CONSTATES)\
The third number is the number of seconds the user has been idle.\
The fourth number is the remote TCP port on the user's host machine.\
Next is the user's character name, then the user's host address.\
(Usually the IP number as name resolving is normally disabled.)\
\
The FORCECLOSE command can be used to force a connect to close by its\
descriptor number.\
", 
   Level = 101, 
   Keyword = "USERS", 
}

HelpEntry
{
   Text = "This is the list of variables to be used in actiondescs for objects and in\
mob/room/object programs.\
 \
VARIABLE         MOBILE  ACTOR  VICTIM  RANDOM  OBJECT  2ND_OBJECT\
---------------  ------  -----  ------  ------  ------  ----------\
Name               $i     $n      $t      $r      $o        $p\
shrt_desc/title    $I     $N      $T      $R      $O        $P\
he/she/it          $j     $e      $E      $J      --        --\
him/her/it         $k     $m      $M      $K      --        --\
his/hers/its       $l     $s      $S      $L      --        --\
a/an               --     --      --      --      $a        $A\
 \
See also: MPSTAT, RPSTAT, OPSTAT, MPEDIT, RPEDIT, OPEDIT, TRIGGER, MPTRIGGERS,\
          RPTRIGGERS, OPTRIGGERS, MPCOMMANDS, RPCOMMANDS, OPCOMMANDS, IFCHECKS.\
", 
   Level = 101, 
   Keyword = "VARIABLES", 
}

HelpEntry
{
   Text = "Syntax:  vassign <character> <begin vnum range> <end vnum range>\
 \
This command allow you to assign a range of vnums to an immortal for\
so that they may build inside that range. Use the 'checkvnums' command\
before assigning a range to ensure that there will be no vnum conflicts.\
You can also use the 'vnums' command for a complete list of currently\
allocated ranges, and the 'newzones' command for a complete list of\
prototype vnum ranges.\
 \
Warning:  *Never* assign any vnums to a character who has another vnum\
range assigned to them via 'aassign'.  Simply be sure to have the\
character type 'aassign none' before assigning vnums to them.\
 \
Example:  vassign Joseph 9000 9099\
 \
This will assign the vnum range from 9000 to 9099 to Joseph.\
 \
Be sure to always use 'checkvnums' to ensure the vnums you are going to\
assign are clear.\
 \
See CHECKVNUMS, ZONES, NEWZONES, VNUMS\
", 
   Level = 101, 
   Keyword = "VASSIGN", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Course (x) (y) (z)\
&c\
This is used to adjust your course once inside a planatary\
system so you may attack other craft or land.\
 \
This command takes an x, y and z as arguments. \
However, unlike before, these arguments are the  \
difference between your current location and  \
where you want to go.  The difference is seen in \
radar. Ships on radar show these coordinates, and \
the second set of coordinates for planets and other \
space objects show these. \
", 
   Level = 1, 
   Keyword = "VECTOR COURSE TRAJECTORY", 
}

HelpEntry
{
   Text = "Syntax: feel ventriloquate <speaker> <message>\
\
This power throws your voice, making it appear that some other object or\
character in the room is saying your message.  Victims who make their saving\
throw will know that someone is using ventriloquism, but not who.  Victims who\
fail their saving throw will think that the object or character really did say\
your message.\
", 
   Level = 0, 
   Keyword = "VENTRILOQUATE", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y Roche Asteroid Field \
 \
&c     Verpine are an advanced species of bipedal insectoids.  Their thin,\
sticklike bodies have awkwardly articulated joints and chitnous shells. \
Two antennae jut from the sides of their heads, which have two large eyes\
and short snouts.  The Verpine live in the Roche Asteroid Field, using\
great repulsor shells to keep occupied asteroids from crashing into each\
other and to deflect other bits of space debris.  They are innate experts\
in most fields of technology, and their childlike fascination with all\
types of machinary have served them well.  They hollow out the asteroids\
for use as colonies, sealing them against space and filling them will all\
kinds of technological wonders.  Verpine have developed into expert\
starship builders.  The Slayn and Korpil Corporation, named for two\
neighboring Verpine colonies, have been well known and respected since the\
days of the Old Republic. \
\
&RAlso type&W:&Y SHOWSTAT VERPINE \
", 
   Level = 0, 
   Keyword = "VERPINE VERPINES", 
}

HelpEntry
{
   Text = "Syntax: vnums [low] [high]\
\
Lists the vnum range for rooms/mobs/objects in all prototype areas.\
", 
   Level = 101, 
   Keyword = "VNUMS", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y note vote <number> open/close/yes/no/abstain \
&c\
Once a note has been posted on a bulletin board, the author may open voting\
with &YNOTE VOTE <number. OPEN&c.  All those who can read the board may\
then vote on the issue in the note with &YNOTE VOTE <number>\
YES/NO/ABSTAIN.&c The author may close the voting; the syntax for that\
should be clear enough.\
 \
&YNOTE LIST&c will show whether a note is not a voting note, open to\
voting, or closed to voting.  The character that seperates the author and\
the recipient in &YNOTE LIST&c will be a colon, a capital V or a capital C\
accordingly.\
", 
   Level = 1, 
   Keyword = "VOTING VOTE VOTES", 
}

HelpEntry
{
   Text = "Syntax:  vsearch <vnum of target object>\
 \
Returns all instances of the target object presently in the game, as\
well as their level.  Allows location of objects via vnum instead of\
by keyword, useful for locating rekeyed and renamed objects.\
 \
See OWHERE\
", 
   Level = 101, 
   Keyword = "VSEARCH", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y war <message>\
&c\
Wartalk is a channel created as a haven for those players who like to openly\
discuss their exploits in combat - and brag against their opponents.  It is\
most often used for those who declare war on other deadlies and is desirable\
for those who like to invite others to battles in player versus player\
whether it be in the arena or around the Realms.\
 \
Wartalk can be seen by all players in the game, and has the same\
rules as other channels.  No harassment, profanity, spamming, or\
inappropriate subject matter.\
 \
", 
   Level = 2, 
   Keyword = "WAR WARTALK", 
}

HelpEntry
{
   Text = "Syntax: feel weaken <victim>\
\
This power reduces the strength of the victim by two points.\
", 
   Level = 0, 
   Keyword = "WEAKEN", 
}

HelpEntry
{
   Text = "&CSyntax &W: &YTarget &W<&YShip&W> \
  \
&cThis skill allows you to make use of a ship's weapon systems, ie firing\
and targeting with them. \
  \
&RAlso see&W: &PHelp Ships \
", 
   Level = 1, 
   Keyword = "'WEAPON SYSTEMS'", 
}

HelpEntry
{
   Text = "For items of type \"weapon\", the value3 field specifies the weapon type:\
\
Value3 | Type     | Weapons\
------------------------------\
   0   | hit      | general\
   1   | slice    | VIBRO-AXE\
   2   | stab     | VIBRO-BLADE\
   3   | slash    | LIGHTSABER\
   4   | whip     | \
   5   | claw     | \
   6   | blast    | BLASTER\
   7   | pound    | \
   8   | crush    | \
   9   | shot     | BOWCASTER\
  10   | bite     | \
  11   | pierce   | FORCE PIKE\
  12   | suction  |\
\
See OSET.\
", 
   Level = 101, 
   Keyword = "WEAPONTYPES", 
}

HelpEntry
{
   Text = "These flags should be self explanitory:\
 take   finger   neck    body    head   legs\
 feet   hands    arms    shield  about  waist\
 wrist  wield    hold    ears    eyes\
\
See OSET and RESETCMDS.\
", 
   Level = 101, 
   Keyword = "WEARFLAGS", 
}

HelpEntry
{
   Text = "Here are the various locations where items may be equipped:\
\
 ---------------------------------------------------------\
 |  0 | light       |  1 | finger1     |  2 | finger2    |\
 |  3 | neck1       |  4 | neck2       |  5 | body       |\
 |  6 | head        |  7 | legs        |  8 | feet       |\
 |  9 | hands       | 10 | arms        | 11 | shield     |\
 | 12 | about       | 13 | waist       | 14 | wrist1     |\
 | 15 | wrist2      | 16 | wield       | 17 | hold       |\
 | 18 | dual_wield  | 19 | ears        | 20 | eyes       |\
 ---------------------------------------------------------\
\
See RESETS and RESETCMDS.\
", 
   Level = 1, 
   Keyword = "WEARLOCS", 
}

HelpEntry
{
   Text = "Syntax: where\
Syntax: where <character>\
\
WHERE without an argument tells you the location of visible players in the same\
area as you are.\
\
WHERE with an argument tells you the location of one character with that name\
within your area, including monsters.\
", 
   Level = 101, 
   Keyword = "WHERE", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y Who\
&CSyntax &W:&Y Who Clan\
   &w(for immortals only)\
&CSyntax &W:&Y Who (clan)\
&CSyntax &W:&Y Who (race)\
 \
&YWHO&c will show a list of people who are currently in the game that are\
visable to you.  This list mainly shows their name, title, and their level\
class.\
 \
&YWHO CLAN &cis a command to show you all visible members of your clan who\
are online.\
 \
Immortals can see all players online.  They can also see those of one\
particular clan by typing &YWHO (clan)&c.  Also, Immortals can see all\
members of one particular race by typing &YWHO (race)&c.\
", 
   Level = 0, 
   Keyword = "WHO", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y whois <player>\
\
The &YWHOIS&c command will tell you a bit of information about a player is\
online (and not who-cloaked).\
 \
&RAlso see&W: &PBIO\
", 
   Level = 0, 
   Keyword = "WHOIS", 
}

HelpEntry
{
   Text = "&CSyntax &W:&Y wimpy\
&CSyntax &W:&Y wimpy <number>\
 \
WIMPY &csets your wimpy value.  When your character takes damage that\
reduces your hitpoints below your wimpy value, you will automatically\
attempt to flee. \
 \
&YWIMPY &cwith no arguement sets your wimpy value to 20% of your maximum\
hitpoints.\
 \
Some monsters are wimpy.\
", 
   Level = 0, 
   Keyword = "WIMPY", 
}

HelpEntry
{
   Text = "&CWisdom &Y(WIS)&C represents your character's wisdom and ability to\
incorporate learning. \
 \
&cWisdom also affects:\
 \
 * Percentage a character learns a new language *\
 * but intelligence affects this slightly more. * \
 \
 * The ability to remove a trap or poison a weapon. * \
 \
 * The rate at which one gains force points. *\
 \
 * Increases max leadership level. *\
&R&W\
", 
   Level = 1, 
   Keyword = "WISDOM WIS", 
}

HelpEntry
{
   Text = "Syntax: wizhelp\
\
WIZHELP provides a list of all the immortal commands.\
", 
   Level = 101, 
   Keyword = "WIZHELP", 
}

HelpEntry
{
   Text = "Syntax: wizlist\
\
Displays a hierarchical list of immortals.\
", 
   Level = 0, 
   Keyword = "WIZLIST", 
}

HelpEntry
{
   Text = "&COrigin: &YKashyyyk\
&C\
&c     Wookiees are tall, fur-covered creatures widely known for being\
ferocious opponents and extremely loyal, once friendship has been earned. \
They grow on average to over 2 meters in height, and their life expectancy\
is several times that of a human.  They have retractable claws which they\
use to climb the giant worshyr trees in which they build their cities.\
     Highly honorable beings, a wookiee would gladly sacrifice his or\
her life to save someone who had helped him.  This \"life debt\" lasts\
until the wookiee decides it has been repaid, or sometimes even beyond\
that.\
 \
&RAlso Type&W: &YSHOWSTAT WOOKIEE\
&R&W\
", 
   Level = 0, 
   Keyword = "WOOKIEE WOOKIEES", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Wroona\
&CInhabitants &W:&W Wroonian\
&c\
     This planet is the homeworld of the Wroonian race. It is a small, \
blue world located in the edge of the Inner Rim, and is the primary \
planet in the Wroona System. Much of the planet is covered in water, at \
it has a rich history of seagoing commerce. It is located near Boeus \
Sector. \
", 
   Level = 1, 
   Keyword = "WROONA", 
}

HelpEntry
{
   Text = ".\
For more information on the mud check out its homepage at :\
        \
http://swrip.betterbox.net\
 \
Or use http://swrip.net \
", 
   Level = 1, 
   Keyword = "WWW", 
}

HelpEntry
{
   Text = "&CSystem &W:&Y Yavin\
&CInhabitants &W:&W None\
&c\
     The primary planet in the Yavin system, Yavin was a marginally \
habitable gas planet with dozens of moons. Three of its moons were \
inhabitable. The planet measured some 192,478 kilometers in diameter, \
and the atmosphere which surrounds it had an average depth of 65,000 \
kilometers. The density of its core gave Yavin a gravity which is 2.74 \
times the standard of Coruscant, and helped the gas giant to attract so \
many moons. Despite the intense pressures within the clouds, Yavin \
supported lifeforms which were thinner than paper but nonetheless \
alive. \
", 
   Level = 1, 
   Keyword = "YAVIN", 
}

HelpEntry
{
   Text = "&COrigin&W:&Y N'zoth\
&c\
a humanoid alien race which resemble skeletons. Their facial structure\
is highly colored, with a white nasal ridge and scarlet cheek and chin \
ridges surrounding dark black eyes. The Yevetha have six clawed fingers \
on each hand, and a wicked dewclaw could be extended from their wrists. \
They are a very self-important race, and consider all other races to be \
vermin. The Yevetha have a hierarchical society, with the males being \
dominant. There are castes of males and females, and the higher classes \
alway dominate the lower. Lower-ranking Yevethan males must bear their \
necks in deferrence to their superiors. Yevetha are also extrememly \
quick to learn about new things, and are particularly adept at \
assimilating technology. They never eat in mixed company, and detest \
the smell and feel of other races. They have installed specialized \
bathing stations on their embassy ships, to wash away the scent \
of other races. The Yevetha originally came from the planet N'zoth, and \
had populated the nearest worlds when the Empire subjugated them and \
used the Koornacht Cluster as a base of operations for the Black Sword \
Command. Under the guidance of Nil Spaar, the Yevetha overthrew the \
Imperials following the Galactic Civil War, and created plans to purge \
the Koornacht - and eventually the galaxy - of non-Yevethans. This plan \
became known as the Great Purge, and was initiated about twelve years \
after their defeat of the Empire. \
 \
&RAlso Type&W:&Y SHOWSTAT YEVETHAN\
", 
   Level = 1, 
   Keyword = "YEVETHAN", 
}

HelpEntry
{
   Text = "Kiv Truun \
Nil Spaar\
Kei <female> \
Kol Attan\
Eri Palle \
Vol Noorr \
Vor Duull \
", 
   Level = 1, 
   Keyword = "YEVETHAN_NAMES", 
}

HelpEntry
{
   Text = "Syntax: zones [low] [high]\
\
Lists the name of the file, and room/mob/object vnum range for each\
non-prototype zone in the mud.\
", 
   Level = 101, 
   Keyword = "ZONES", 
}

HelpEntry
{
   Text = "...Everything begins to fade to black\
\
...and then\
\
...nothing.\
", 
   Level = -1, 
   Keyword = "_DIEMSG_", 
}
