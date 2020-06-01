-- dagobah
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Name = "dagobah", 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   ResetFrequency = 10, 
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
      [8200] = 
      {
         Name = "Master Yoda", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 20, 
            HitSizeDice = 10, 
            HitPlus = 1000, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 20, 
         Race = "Human", 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 8200, 
         Immune = 
         {
            [10] = "sleep", 
            [20] = "magic", 
         }, 
         LongDescr = "A short green alien moves above his home.\
", 
         NumberOfAttacks = 0, 
         Level = 100, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "Jedi Master Yoda", 
         DamRoll = 20, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "50", 
               Code = "feel 'force bubble' self\
feel 'armor' self\
feel 'shield' self\
feel 'santuary' self\
feel 'sanctuary' self\
 \
", 
               MudProgType = "fight_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = -150, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
            [11] = "Immortal", 
         }, 
      }, 
      [8213] = 
      {
         Name = "A dragonsnake", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [25] = "sullustese", 
            }, 
            Speaking = 
            {
               [25] = "sullustese", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 15, 
            HitSizeDice = 10, 
            HitPlus = 750, 
         }, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         HitRoll = 15, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 8213, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         LongDescr = "A large predator swims in the water here.\
", 
         NumberOfAttacks = 0, 
         Level = 75, 
         Description = "The dragonsnake is a native underwater predator, which lurks in the swamps\
of Dagobah. They are very active creatures and hunt other predators that\
wander too close to the water's edge. It has razor-sharp fins, powerful\
constrictor coils, and large fangs. This dangerous predator can feed on\
almost anything.\
", 
         Damage = 
         {
            DamNoDice = 7, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "A large dragonsnake.", 
         DamRoll = 15, 
         Height = 0, 
         Race = "Sullustan", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Credits = 0, 
         ArmorClass = -87, 
      }, 
      [8210] = 
      {
         Name = "A sleen", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = -300, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [3] = "rodese", 
            }, 
            Speaking = 
            {
               [3] = "rodese", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 500, 
         }, 
         AffectedBy = 
         {
            [16] = "Hide", 
            [15] = "Sneak", 
         }, 
         Race = "Rodian", 
         HitRoll = 15, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         NumberOfAttacks = 2, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 8210, 
         Resistant = 
         {
            [20] = "magic", 
         }, 
         LongDescr = "A slow moving reptilian creature is here.\
", 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Level = 50, 
         Description = "The sleen is a slow, omnivorous swamp forager. It feeds on insects and\
seeks damp, dark environments. \
", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "A slow moving sleen", 
         DamRoll = 10, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "90", 
               Code = "feel 'harm' $n\
", 
               MudProgType = "fight_prog", 
            }, 
         }, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [24] = "NoAssist", 
         }, 
         Credits = 0, 
         ArmorClass = -100, 
      }, 
   }, 
   ResetMessage = "", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 8222, 
         Arg1 = 8210, 
         Arg2 = 6, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 8222, 
         Arg1 = 8210, 
         Arg2 = 6, 
      }, 
      [3] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 8238, 
         Arg1 = 8210, 
         Arg2 = 6, 
      }, 
      [4] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 8259, 
         Arg1 = 8210, 
         Arg2 = 6, 
      }, 
      [5] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 8262, 
         Arg1 = 8210, 
         Arg2 = 6, 
      }, 
      [6] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 8267, 
         Arg1 = 8210, 
         Arg2 = 6, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 8202, 
         Arg1 = 8213, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 8232, 
         Arg1 = 50, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 8232, 
         Arg1 = 5099, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Merth", 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 8213, 
         First = 8200, 
      }, 
      Room = 
      {
         Last = 8290, 
         First = 8200, 
      }, 
      Object = 
      {
         Last = 8200, 
         First = 8200, 
      }, 
   }, 
   Objects = 
   {
      [8200] = 
      {
         Name = "A wooden cup", 
         Vnum = 8200, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         Description = "A wooden cup seems to have been dropped here.", 
         ShortDescr = "A wooden cup", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1, 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
      }, 
   }, 
   Filename = "dagobah.lua", 
   Rooms = 
   {
      [8200] = 
      {
         Name = "Dagobah Area", 
         Vnum = 8200, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The planet Dagobah -- who named it and why, is told in no existing\
record. Dagobah itself seems to avoid mention, as if some invisible power\
deflects all inquiries. As a result, the swampy planet is cloaked in\
mystery.\
   For non-Jedi Knight classes, players will be able to travel in Dagobah\
and explore its peculiar swampy terrain, fight slug beasts, and the like,\
but for Jedi Knights, this is where they must go in order to find the\
lightsaber they need to be true Jedi.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8201, 
               Keyword = "", 
               Description = "This is where all players begin. For Jedi Knights, I hope to make it\
so they can raise the craft from the muck, but for others I will make it\
so they can swim underwater and fix the spacecraft.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8201] = 
      {
         Name = "Landing Zone", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You stand up to your knees in fowl-smelling muck, comprised of rotten\
leaves and other smells you don't want to know the source of.\
It seems impassable all around you except the far end of the swamp to the\
north, where a path seems to wind its way into the\
trees.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8202, 
               Keyword = "", 
               Description = "The area to the north looks just as foul as here.\
", 
            }, 
         }, 
         Vnum = 8201, 
         TeleDelay = 0, 
      }, 
      [8202] = 
      {
         Name = "Up to your Waist in Muck", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You now stand up to your waist in rotting debris and foul-smelling\
liquid. A sudden sound from the right of you catches your attention and\
you see what is either a tentacle or tree branch slip under the water.\
Through the mist of the place its too hard to tell, but you hope it was\
the branch.\
  Through the mist to the north you can make out a possible path at the\
far end of the swamp. To the south is the location of your (now) submerged\
spacecraft.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8205, 
               Keyword = "", 
               Description = "The swamp looks deeper in that direction.\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8201, 
               Keyword = "", 
               Description = "You see more swamp, but it looks as though there is something large\
right underneath the surface.\
", 
            }, 
         }, 
         Vnum = 8202, 
         TeleDelay = 0, 
      }, 
      [8203] = 
      {
         Name = "Landing Zone", 
         Vnum = 8203, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You stand up to your knees in fowl-smelling muck, comprised of rotten\
leaves and other smells you don't want to know the source of.\
It seems impassable all around you except the far end of the swamp to the\
north, where a path seems to wind its way into the\
trees.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "50", 
               Code = "mpecho You feel a strong sensation of the force, and your ship\
mpecho suddenly breaks the surface of the muck. It then slowly\
mpecho continues to rise, making a sucking, slurping sound.\
mpecho You sense that a great master of the force sensed your panic and\
mpecho came to your rescue.\
mptransfer all 8201\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8202, 
               Keyword = "", 
               Description = "You can make out the far end of the swamp, shrouded in mist.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8204] = 
      {
         Name = "Murky Swampwater", 
         Vnum = 8204, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You are swimming beneath the surface of the Dagobah swamp. To the\
east of you is your ship, looking bright green through the partially\
opaque water. Above you some light shines down and dances across your\
face.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8203, 
               Keyword = "", 
               Description = "You can make out the surface.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8205] = 
      {
         Name = "Up to Your Neck in Muck", 
         Vnum = 8205, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You are now up to your neck in muck. The swampwater seeps through your\
clothes, and the current around you seems unnatural, as though created by\
a large animal. You resist the urge to panic, but your pulse starts to \
quicken at the thought of how vulnerable you are in this place.\
   To the right you catch the sight of something diving beneath the surface\
of the swamp. It seems that this would be the best time to make your way\
elsewhere?\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8206, 
               Keyword = "", 
               Description = "You see more swamp, and beyond that, yet more swamp.\
", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8228, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8202, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8206] = 
      {
         Name = "Up to Your Hips in Muck", 
         Vnum = 8206, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You stand up to your hips in muck here, your feet making sick sucking\
sounds as you pull your boots out of the mud. The humidity in the air clings\
to your skin and clothes, and you feel as though you are swimming above the\
surface as much as you are below. The bank of the swamp is to the north of\
here, and to the south the swamp becomes deeper.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8207, 
               Keyword = "", 
               Description = "You can make out semi-dry land to the north.\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8205, 
               Keyword = "", 
               Description = "The foul-smelling water looks deeper there.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8207] = 
      {
         Name = "On the Bank", 
         Vnum = 8207, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The bank of the swamp seems just as wet as standing in the water, with\
all the humidity swirling around you. A small natural path has been made\
out of rotting trees and plants here, leading deeper into the swamp to the\
west of here. To the south you see the spot where your spacecraft landed\
(and sank) in the Dagobah Swamp.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8206, 
               Keyword = "", 
               Description = "You see swamp, and yet, more swamp.\
", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8208, 
               Keyword = "", 
               Description = "The rotten path continues westward, then disappears into the mist.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8208] = 
      {
         Name = "Rotten Path", 
         Vnum = 8208, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You are walking along a narrow path running along the water's edge of the\
swamp. A group of lizard-like bat things screech as they pass by above\
your head, narrowly missing you with their claws.\
  The path continues east, and to the west the path makes a turn to the\
north.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8207, 
               Keyword = "", 
               Description = "You see more of the path.\
", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8209, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8209] = 
      {
         Name = "Bend in the Path", 
         Vnum = 8209, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Underneath the canopy of tree limbs here the swamp seems unearthly\
still. You stand at a bend in the path, where a great tree has fallen \
accross the swamp, providing a path that continues north of here. The\
rotten stump where the tree once proudly stood still remains here along \
the path.\
   You can also travel east of here, where the rotten path continues.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8210, 
               Keyword = "", 
               Description = "The massive tree continues off to the north.\
", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8208, 
               Keyword = "", 
               Description = "Its hard to tell through the swirling mists.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8210] = 
      {
         Name = "Along the Northern Path", 
         Vnum = 8210, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The trunk of this massive Dagobah tree is wide enough here that you\
feel comfortable enough walking without having to stare down at your feet.\
The tree rises several feet above the water of the swamp, giving you an\
excellent, safe view of the swampland. Many of the animals around you seem\
to generate some kind of power, and you can sense their presence all around\
you.\
   The path continues along the trunk of the tree to the north and south.\
The tree here seems as though it may be climbable as well.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8212, 
               Keyword = "", 
               Description = "The path becomes narrower to the north of here, where the massive tree\
reaches its zenith.\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8209, 
               Keyword = "", 
               Description = "The massive tree continues south.\
", 
            }, 
            [3] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8211, 
               Keyword = "", 
               Description = "You can see some relatively sturdy tree limbs.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8211] = 
      {
         Name = "On a Tree Branch", 
         Vnum = 8211, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You stand pirched on a tree branch, your feet slipping slightly on the\
glistening wet limbs. The view is a bit better here than from the ground,\
but through the dense foilage it isn't by much.\
   From this view you can make out your craft's shadow submerged in the\
swamp to the southeast, and to the northeast you can barely make out wisps\
of smoke rising through the canopy which looks darker than the mist around\
it. Could there be someone living in this desolate swamp?\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8210, 
               Keyword = "", 
               Description = "You see a massive fallen tree pointing off to the north.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8212] = 
      {
         Name = "Along the Northern Path", 
         Vnum = 8212, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Walking along the massive tree that forms this path through the swamp\
the path becomes narrower to the north, where the tree reaches its zenith.\
The path here is still wide enough to walk normally, but you look closely\
at the ground just in case.\
   To the south the path becomes thicker as you make your way to the base\
of the fallen tree.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8213, 
               Keyword = "", 
               Description = "You can see the tip of the rotten tree from here.\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8210, 
               Keyword = "", 
               Description = "The path continues south, then disappears into the mist.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8213] = 
      {
         Name = "Rotten Path End", 
         Vnum = 8213, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You stand at the end of the fallen tree, balancing yourself at\
the tip of the tree that once stood high above the swamp floor.\
The tree ends here, but the path continues along a deadwood path to\
the east. There are some bristly brambles there, so watch your step!\
", 
         Sector = "forest", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8214, 
               Keyword = "", 
               Description = "The branches there look stable enough to stand on.\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8212, 
               Keyword = "", 
               Description = "The trunk of the tree path becomes thicker to the south.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8214] = 
      {
         Name = "On the Deadwood", 
         Vnum = 8214, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Its difficult to remain standing on the glistening wet branches \
covering the path here. Shifting from one foot to the other, you \
maintain your balance, but it would probably be best to move on \
as soon as possible. You can see a path to your west, and to the\
east are more of these dead branches.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8215, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8213, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8215] = 
      {
         Name = "Deadwood Path", 
         Vnum = 8215, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The deadwood seems thicker here, entwining around one another to\
form a very solid path. However, to the west the path seems to slippery\
to pass through. However, the thicker branches form a sturdy path to the\
east of here.\
   Turning your head northward, you can also see something shiny, but\
you can't quite make out what it is at this distance. The water of the\
swamp seems safe enough to investigate.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8216, 
               Keyword = "", 
               Description = "You see murky brown water, and beyond, something shiny in the distance.\
", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8222, 
               Keyword = "", 
               Description = "The path continues across some entwined branches there.\
", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8214, 
               Keyword = "", 
               Description = "The path looks extremely slippery.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8216] = 
      {
         Name = "Wading in Muck", 
         Vnum = 8216, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You are wading up to your waist in muck, your feet sinking about a foot\
into the mud bottom. To the south of here is a path made out of deadwood,\
and to the north you can see another shore, where a building of some kind\
has been erected.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8217, 
               Keyword = "", 
               Description = "You see yet another shore in this swamp.\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8215, 
               Keyword = "", 
               Description = "You see a pile of deadwood, forming a path.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8217] = 
      {
         Name = "Camp Shore", 
         Vnum = 8217, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "structure building", 
               Description = "Taking a closer look at the structure, you can make out a faint symbol\
\13that has faded over time.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "symbol", 
               Description = "The symbol is of a 6 sided star, and within you can make out several\
\13words:\
\13\
\13The I*p ria Scien*i ic Survey T- m\
\13", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You stand on one of a thousand shores that litter planet Dagobah. Unlike\
others, however, this part of the swamp once had intelligent creatures\
living here. A partially collapsed structure is here, now covered in\
plants and creatures who now make it their home. With the rapidly growing\
flora on this planet its difficult to tell how long these structures have\
been here, but its not really that important since there is practically\
nothing left.\
  The swamp to the south looks passable here, and to the north you can\
see what was most likely the center of this forgotton camp.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8218, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8216, 
               Keyword = "", 
               Description = "You see the swamp of Dagobah. What did you expect?\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8218] = 
      {
         Name = "Center of Camp", 
         Vnum = 8218, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You stand in the center of what was once a camp of some kind. Rotting\
and broken crates litter the area, and a few pieces of equipment has\
been left on the ground here and have corroded to the point of being\
unrecognizable.\
  To the north is a partially collapsed building, but it looks as though\
you might be able to enter it. Another building has collapsed to the \
west of here, and to the south is another collapsed structure.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8220, 
               Keyword = "", 
               Description = "The entrance to a building is north of here.\
", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8221, 
               Keyword = "", 
               Description = "The structure looks as though it has been stomped flat.\
", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8217, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8219, 
               Keyword = "", 
               Description = "A partially collapsed structure silently rots there.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8219] = 
      {
         Name = "Collapsed Living Quarters", 
         Vnum = 8219, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Three plastisteel cots are scattered around the collapsed building,\
nothing left of the mattress but a few rusted springs. The walls of the\
structure have almost entirely been eaten away by the plants and \
humidity, but one wall seems almost untouched. Facing to the east you\
can see the center of camp.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8218, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8220] = 
      {
         Name = "Camp Living Quarters", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Miraculously, these living quarters have been practically untouched\
by the plants and humidity. Although the mattress has been eaten away\
by rot in spots, it looks as though you can still sleep on it. Even the\
glowrod in the ceiling emits a faint glow, illuminating the room.\
   You can exit the room to the south.\
 \
It is safe to exit the game from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8218, 
               Keyword = "", 
               Description = "You can see the center of camp through the entrance.\
", 
            }, 
         }, 
         Vnum = 8220, 
         TeleDelay = 0, 
      }, 
      [8221] = 
      {
         Name = "Collapsed Structure", 
         Vnum = 8221, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This structure has not only collapsed, it looks as though a beast\
had stomped on it as well. the plastisteel walls have been splintered\
in some places from the weight of whatever struck it, and the center\
of the structure has been stomped flat. Whatever it was that caused this\
destruction you hope has packed up and moved elsewhere.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8218, 
               Keyword = "", 
               Description = "You can see the center of camp from here.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8222] = 
      {
         Name = "Entwined Path", 
         Vnum = 8222, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The path here is formed out of a mass of small, dead twigs, entwined\
together to form a rather strong path.  Bouncing slightly on the path, the\
tension on the twigs create a pleasant trampoline effect.  You refrain from\
jumping too high, however, since losing your step would result in a rather\
messy dunk in the swamp.    \
    A slippery path is to the west of here, and to the east the entwined \
path continues. It also looks as though you could go south, although \
another trip through the muck makes you think twice about it.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8224, 
               Keyword = "", 
               Description = "You hear buzzing coming from the east of here.\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8223, 
               Keyword = "", 
               Description = "You see the wet swamp.\
", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8215, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8223] = 
      {
         Name = "Hardened Muck", 
         Vnum = 8223, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You step down into the marsh, but are pleasantly surprised to find the black\
fluid supports your weight.  In fact, when you place your hand on the surface\
it feels smooth to the touch.  Some of the grass here seems torched as well.  \
Perhaps a fire dried up the muck here, but from what source?    \
   A sturdy path rises out of the swamp to the north, and to the south you\
see a dry patch of land.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8222, 
               Keyword = "", 
               Description = "Some entwined branches form a path there.\
", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8227, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8224] = 
      {
         Name = "Entwined Path", 
         Vnum = 8224, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The path made of twigs continues on to the east of here, but you hardly\
notice, due to an incredible buzzing noise coming from a tree to the north,\
which deadens your senses.  Its getting incredibly hard to think here.    \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8225, 
               Keyword = "", 
               Description = "The buzzing originates from that direction. Make it stop!\
", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8226, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8222, 
               Keyword = "", 
               Description = "The entwined path continues west from here.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8225] = 
      {
         Name = "Dagobah Swamp Tree", 
         Vnum = 8225, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You stand in front of one of the larger Dagobah trees that rise above the\
dense foilage.  In the center of the tree is a large knothole, where the source\
of the intense buzzing noise is originating.  The calcified trunk of the tree\
hides the actual home of the creature, however, and you are smart enough not to\
probe it with a stick.    \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8224, 
               Keyword = "", 
               Description = "A path is too the south, but the buzzing makes you feel faint.\
", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8226] = 
      {
         Name = "Entwined Path End", 
         Vnum = 8226, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The entwined path ends abruptly here, sinking into the wetness of the swamp.\
To the east you can continue, though it will be a wet trip.  The entwined path\
continues to the west for the less adventurous.    \
   Some buzzing can be heard to the west, mixing in with the rest of the\
swamp's creatures.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8224, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8227] = 
      {
         Name = "Dry Land", 
         Vnum = 8227, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The land here is dry - well, Dagobah dry at least, your feet only sink up to\
the ankle here.  There is a narrow path that has yet to cover up with foilage.\
Given what you have seen so far, this is promising.  You can either go north\
towards a path made of thick branches, or travel south along this newly beaten\
path.    \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8223, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8278, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8228] = 
      {
         Name = "In the Muck", 
         Vnum = 8228, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The muck here is much stickier than the rest around it, as though mixing\
with some unknown source.  Dipping your hand in the muck, you pull out a bone\
the length of your body.  It still has some meat attached from it, giving you\
the feeling it would be best to escape the immediate area NOW.    \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8229, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8205, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8229] = 
      {
         Name = "Deep In Muck", 
         Vnum = 8229, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Now you've done it.  The swamp here is piled high with unknown victims of\
some past meal.  You better move on quickly before you become another\
collection to the pile!    \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 0, 
               DestinationVnum = 8228, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8230] = 
      {
         Name = "empty", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "empty room\
", 
         Exits = 
         {
         }, 
         Vnum = 8230, 
         TeleDelay = 0, 
      }, 
      [8231] = 
      {
         Name = "empty", 
         Vnum = 8231, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "empty room\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8230, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8232] = 
      {
         Name = "Living Quarters", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The cave is tiny.  The ceiling is barely one meter above the\
floor.  It is appearently lived in though judging by the conditions\
of the room.  Only a small creature could live here.  A cushion\
with a dark green blanket seems to serve as a bed for this small\
individual.  A hole in the cave wall serves as a small window, \
through which you can see outdoors.  Outside the window you can\
see various parts of planet Dagobah.  For the most part all you\
can see is swampy marsh lands.  Tall trees with long vines are\
everywhere within view.  The floor is made up almost entirely of\
some powdery brown substance.  After further investigation the\
substance appears to be dirt.  In the center of the room hangs a\
small blackened wood pot.  the pot contains an odd smelling soup\
like substance.  Small chunks of something float around in the \
soup.  The pot is warm, it has been used recently.  Snakes slither\
about with soft motions, they seema t ease in this environment.\
The room has a powerful aura to it.  The force is quite strong in\
here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8233, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 8232, 
         TeleDelay = 0, 
      }, 
      [8233] = 
      {
         Name = "Master Yoda's Cave", 
         Vnum = 8233, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small cave.  The ceiling cannot be more than a meter\
off the ground.  Even most jawas would find it difficult to walk\
around in here without ducking their heads slightly.  A small hole\
in the wall serves as a window.  Several small plants sit on the\
window sill.  The plant pots are made of wood that seems to be hand\
crafted.  The cave itself seems to have been dug out by some means.\
The floor is comprised wholely of a powedery brown substance.  After\
further examination the substance is dirt.  A strong aura fills the\
room and everything in it.  The force is quite strong here.  The \
hair on the back of your neck rises for some uncertain reason.  You\
do not feel completely at ease in here.  As you look north you can\
see that this little shanty of a cave continues.  To the west is\
the outdoors.  Outside the cave, for as far as you can see, swampy\
marsh.  Some small wooden pots lie around something that could be\
described as a kitchen.  Wooden, hand crafted utinsils lie around\
also.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8232, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8234, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8234] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8234, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The ground beneath you is quite soggy.  However, a thin dirt \
path has been beaten into the soil here.  This path must be \
regularly travelled.  Sounds of wildlife creatures and such echo\
through the boggy marsh.  A soft haze lifts itself up off the\
ground and filters into the trees.  This fog makes it very difficult\
to see any great distance.  Vegetation is quite lush despite\
the lack of any visible sun.  As you face east you see a small,\
small cave.  There is an opening to the cave, quite small also.\
Who or whatever lives within must be a small creature.  You\
can make your way on the swampy path to the west, north, or south.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8235, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8233, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8243, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8246, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8235] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8235, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The ground beneath you is quite soft and soggy from the large\
amounts of moisture commonly deposited here.  Walking is\
treacherous and difficult at best.  Vines all thicknesses grow\
in just about every direction.  All around you sounds of strange\
creatures can be heard as they call out to one another.  A dense\
fog reaches high up into the tree tops.  Visibilty is quite low.\
The lush vegetation has spawned the existance of some unusual creatures\
in this place.  To the east of here is a dull brown rock.  The rock\
starts at the ground and continues up about three or four meters.\
The rock invokes an odd feeling in you.  Maybe it was something you\
ate.  To the west, south, and north the swampy marsh continues.  Be\
careful and watch your footing.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8236, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8234, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8245, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8236] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8236, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good\
descriptions of your surroundings.  Sounds of strange creatures\
beakoning to you to venture into the wild fill your ears.  The ground\
below you begs to differ.  It seems quite difficult to make your way \
through this rough terrain.  It is almost as though you can feel a \
hundred pairs of eyes watching your every movement.  Despite this,\
you feel an odd sense of calm and serenity.  Almost as though you are\
at one with yourself.  There is an odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8237, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8235, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8244, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8237] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8237, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.  To the east of here is a dull brown\
rock.  The rock starts at the ground and continues up about three or four\
meters. The rock invokes an odd feeling in you.  Maybe it was something\
you ate. \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8238, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8236, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8238] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8238, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8239, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8237, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8239] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8239, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet. To the east of here is a dull brown\
rock.  The rock starts at the ground and continues up about three or four\
meters. The rock invokes an odd feeling in you.  Maybe it was something\
you ate. \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8238, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8240, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8240] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8240, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8239, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8241, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8241] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8241, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8240, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8242, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8242] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8242, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8241, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8243, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8243] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8243, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8234, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8242, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8247, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8244] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8244, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8248, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8236, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8245, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8245] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8245, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8244, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8235, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8246, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8257, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8246] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8246, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8245, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8234, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8247, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8247] = 
      {
         Name = "Swampy Marsh", 
         Vnum = 8247, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8246, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8243, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8287, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8248] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8248, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The swampy surroundings seem to enclose around you in an ominous\
manner.  Large trees with vines hanging from them surround you.\
Vines from the trees lay at your feet, entangled in the brush all\
about.  No sunlight seems to penetrate through the thick vegetation.\
All the moisture around you combining with the tremendous heat rising\
through the ground has created some rather thick fog.  You can feel\
a surplus of eyes studying your every move and watching for flaws or\
mistakes.  The force is strong here but, that does not mean it is a\
safe place for all living creatures.  Quite the contrary, this swamp\
is a vile and unsafe place for anyone not perfectly aligned with the\
force.  Only the brave or fool-hardy dare walk these paths alone.\
To the east and west the path is much too thick and dense.  It is\
impossible to continue in either direction.  You would need some \
kind of device to chop down trees and cut through weeds.  To the north\
and south a thin narrow path exists.  You will be able to make your\
way through the brush with sime effort.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8249, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8244, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8249] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8249, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The swampy surroundings seem to enclose around you in an ominous manner. \
Large trees with vines hanging from them surround you. Vines from the\
trees lay at your feet, entangled in the brush all about.  No sunlight\
seems to penetrate through the thick vegetation. All the moisture around\
you combining with the tremendous heat rising through the ground has\
created some rather thick fog.  You can feel a surplus of eyes studying\
your every move and watching for flaws or mistakes.  The force is strong\
here but, that does not mean it is a safe place for all living creatures. \
Quite the contrary, this swamp is a vile and unsafe place for anyone not\
perfectly aligned with the force.  Only the brave or fool-hardy dare walk\
these paths alone. To the east and west the path is much too thick and\
dense.  It is impossible to continue in either direction.  You would need\
some kind of device to chop down trees and cut through weeds.  To the\
north and south a thin narrow path exists.  You will be able to make your\
way through the brush with sime effort.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8250, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8248, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8250] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8250, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The swampy surroundings seem to enclose around you in an ominous manner. \
Large trees with vines hanging from them surround you. Vines from the\
trees lay at your feet, entangled in the brush all about.  No sunlight\
seems to penetrate through the thick vegetation. All the moisture around\
you combining with the tremendous heat rising through the ground has\
created some rather thick fog.  You can feel a surplus of eyes studying\
your every move and watching for flaws or mistakes.  The force is strong\
here but, that does not mean it is a safe place for all living creatures. \
Quite the contrary, this swamp is a vile and unsafe place for anyone not\
perfectly aligned with the force.  Only the brave or fool-hardy dare walk\
these paths alone. To the east and west the path is much too thick and\
dense.  It is impossible to continue in either direction.  You would need\
some kind of device to chop down trees and cut through weeds.  To the\
north and south a thin narrow path exists.  You will be able to make your\
way through the brush with sime effort.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8251, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8249, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8251] = 
      {
         Name = "Darkened Cave", 
         Vnum = 8251, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You are just inside a dark cave.  Moisture surrounds you, water\
drips all around you.  Sounds of the dripping water echo through\
out the cavernous halls.  It is very dark in here, virtually no\
light manages to break through and illuminate your surroundings.\
To the south is a small secluded exit that leads to the a portion\
of boggy marsh.  To the west the cave continues.  Watch your step\
if you can.  One false step in here could cost you your life in a\
rather permenent manner.  The sloppy and reckless shall perish where\
as the cautious, calm and passive shall succeed.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8252, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8250, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8254, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8252] = 
      {
         Name = "Secluded Cave", 
         Vnum = 8252, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You are in a secluded portion of cave.  The ceiling is high\
above you.  The soft sound of dripping water can be heard in the\
distance.  High above you many pairs of glowing red eyes stare at\
you.  The eyes do not seem menacing but, rather judgemental.  Your\
every action, movement, and reaction is closely watched.  The floor\
beneath you is suprisiningly dry.  The floor is dry powdery dirt.\
You feel an odd ominous presence.  The force is strong in here.  \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8253, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8251, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8253] = 
      {
         Name = "Secluded Cavern", 
         Vnum = 8253, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "An odd presence fills the room.  The force is strong here.\
It is quite dark here.  The dirt floor below you seems soft and \
forgiving.  The walls offer a sharp contrast to this.  The walls\
are solid rock and very jagged.  A penetrating fog nearly blinds you.\
A soft light comes from an unlocatable source.  Your vision is\
impaired, reality is questionable at this point.  Do you trust your\
senses?  Is everything whay it seems?  Proceed with caution.  Your\
every action carries mountianous weight and mistakes can be costly\
if not fatal.  To the south the cavern continues.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8252, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8254] = 
      {
         Name = "Cavern", 
         Vnum = 8254, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The cavern has a high ceiling.  Water drips down all around you.\
The water softly pelts the powdery dirt floor causing small poofs\
to arise.  Careful, passive and calm are the ways of the jedimaster.\
Anger, fear and aggression lead to evil.  That is not the way to\
become a jedimaster.  The force is strong here, you have a strange\
feeling that you are not alone. \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8251, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8255, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8255] = 
      {
         Name = "Cavern", 
         Vnum = 8255, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The cavern has a high ceiling.  Water drips down all around you. The water\
softly pelts the powdery dirt floor causing small poofs to arise. \
Careful, passive and calm are the ways of the jedimaster. Anger, fear and\
aggression lead to evil.  That is not the way to become a jedimaster.  The\
force is strong here, you have a strange feeling that you are not alone.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8256, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8254, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8256] = 
      {
         Name = "Cavern", 
         Vnum = 8256, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The cavern has a high ceiling.  Water drips down all around you. The water\
softly pelts the powdery dirt floor causing small poofs to arise. \
Careful, passive and calm are the ways of the jedimaster. Anger, fear and\
aggression lead to evil.  That is not the way to become a jedimaster.  The\
force is strong here, you have a strange feeling that you are not alone.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8255, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8257] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8257, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense brush covers the otherwise soggy ground.  Tall trees go\
as high as you can see.  Which is not all that far.  A thick\
cover of fog blankets the tree tops and sinks down on you.  Many\
vines hang from the trees.  The path is difficult to follow.\
You can not even be sure that this actually is a path.  It just\
happens to be wide enough for you to squeak through.  Be careful\
and watch your step, danger surrounds you.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8245, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8258, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8258] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8258, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense brush covers the otherwise soggy ground.  Tall trees go as high as\
you can see.  Which is not all that far.  A thick cover of fog blankets\
the tree tops and sinks down on you.  Many vines hang from the trees.  The\
path is difficult to follow. You can not even be sure that this actually\
is a path.  It just happens to be wide enough for you to squeak through. \
Be careful and watch your step, danger surrounds you.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8259, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8257, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8259] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8259, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense brush covers the otherwise soggy ground.  Tall trees go as high as\
you can see.  Which is not all that far.  A thick cover of fog blankets\
the tree tops and sinks down on you.  Many vines hang from the trees.  The\
path is difficult to follow. You can not even be sure that this actually\
is a path.  It just happens to be wide enough for you to squeak through. \
Be careful and watch your step, danger surrounds you.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8258, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8260, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8260] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8260, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dense brush covers the otherwise soggy ground.  Tall trees go as high as\
you can see.  Which is not all that far.  A thick cover of fog blankets\
the tree tops and sinks down on you.  Many vines hang from the trees.  The\
path is difficult to follow. You can not even be sure that this actually\
is a path.  It just happens to be wide enough for you to squeak through. \
Be careful and watch your step, danger surrounds you.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8259, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8261, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8261] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8261, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Each step is quite difficult under these circustances.  You nearly\
fall over into trees and other sources of brush with each step.\
A thick fog drops moisture down on you.  The chilled air feels \
refreshing in what is an otherwise hot swampland.  Dagobah may be\
completely devoid of technology and even civilization for that matter\
but, the planet certainly does not lack in living creatures.\
Creatures long since believed to be extinct thrive in these swampy\
surroundings.  Creatures undiscovered by most of the galaxy have\
made a nice little niche for themselves here.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8262, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8260, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8277, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8268, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8262] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8262, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8263, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8261, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8263] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8263, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8264, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8262, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8264] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8264, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8265, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8263, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8265] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8265, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8266, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8264, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8266] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8266, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8265, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8267, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8267] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8267, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8266, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8268] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8268, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Thick brush grows up all around you.  The weeds, vines, and moisture\
all contribute to difficult travel.  Dagobah is quite strong with the\
force.  You can feel the force all about you, it seems to be what holds\
this place together.  It binds it all together.  The ground beneath you\
is soggy from an eminence surplus of moisture.  Adding to the \
frustration of the difficult terrian is the fact that one section of\
swamp looks almost identical to any other section of swamp.  The fog\
hangs low overhead, no sun is visible.  There do not seem to be any\
natural landmarkers to go by.  It would be rather easy to get lost in\
here and never find your way out.  Being Forced to sleep out here does\
not sound all that fun either.  Creatures of every manner and species\
lurk about in the shadows and hidden deep within the fog.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8261, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8269, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8269] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8269, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Thick brush grows up all around you.  The weeds, vines, and moisture all\
contribute to difficult travel.  Dagobah is quite strong with the force. \
You can feel the force all about you, it seems to be what holds this place\
together.  It binds it all together.  The ground beneath you is soggy from\
an eminence surplus of moisture.  Adding to the frustration of the\
difficult terrian is the fact that one section of swamp looks almost\
identical to any other section of swamp.  The fog hangs low overhead, no\
sun is visible.  There do not seem to be any natural landmarkers to go by.\
 It would be rather easy to get lost in here and never find your way out. \
Being Forced to sleep out here does not sound all that fun either. \
Creatures of every manner and species lurk about in the shadows and hidden\
deep within the fog.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8270, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8268, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8270] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8270, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Thick brush grows up all around you.  The weeds, vines, and moisture all\
contribute to difficult travel.  Dagobah is quite strong with the force. \
You can feel the force all about you, it seems to be what holds this place\
together.  It binds it all together.  The ground beneath you is soggy from\
an eminence surplus of moisture.  Adding to the frustration of the\
difficult terrian is the fact that one section of swamp looks almost\
identical to any other section of swamp.  The fog hangs low overhead, no\
sun is visible.  There do not seem to be any natural landmarkers to go by.\
 It would be rather easy to get lost in here and never find your way out. \
Being Forced to sleep out here does not sound all that fun either. \
Creatures of every manner and species lurk about in the shadows and hidden\
deep within the fog. \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8269, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8271, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8271] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8271, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Thick brush grows up all around you.  The weeds, vines, and moisture all\
contribute to difficult travel.  Dagobah is quite strong with the force. \
You can feel the force all about you, it seems to be what holds this place\
together.  It binds it all together.  The ground beneath you is soggy from\
an eminence surplus of moisture.  Adding to the frustration of the\
difficult terrian is the fact that one section of swamp looks almost\
identical to any other section of swamp.  The fog hangs low overhead, no\
sun is visible.  There do not seem to be any natural landmarkers to go by.\
 It would be rather easy to get lost in here and never find your way out. \
Being Forced to sleep out here does not sound all that fun either. \
Creatures of every manner and species lurk about in the shadows and hidden\
deep within the fog.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8272, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8270, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8272] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8272, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Thick brush grows up all around you.  The weeds, vines, and moisture all\
contribute to difficult travel.  Dagobah is quite strong with the force. \
You can feel the force all about you, it seems to be what holds this place\
together.  It binds it all together.  The ground beneath you is soggy from\
an eminence surplus of moisture.  Adding to the frustration of the\
difficult terrian is the fact that one section of swamp looks almost\
identical to any other section of swamp.  The fog hangs low overhead, no\
sun is visible.  There do not seem to be any natural landmarkers to go by.\
 It would be rather easy to get lost in here and never find your way out. \
Being Forced to sleep out here does not sound all that fun either. \
Creatures of every manner and species lurk about in the shadows and hidden\
deep within the fog.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8273, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8271, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8273] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8273, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Thick brush grows up all around you.  The weeds, vines, and moisture all\
contribute to difficult travel.  Dagobah is quite strong with the force. \
You can feel the force all about you, it seems to be what holds this place\
together.  It binds it all together.  The ground beneath you is soggy from\
an eminence surplus of moisture.  Adding to the frustration of the\
difficult terrian is the fact that one section of swamp looks almost\
identical to any other section of swamp.  The fog hangs low overhead, no\
sun is visible.  There do not seem to be any natural landmarkers to go by.\
 It would be rather easy to get lost in here and never find your way out. \
Being Forced to sleep out here does not sound all that fun either. \
Creatures of every manner and species lurk about in the shadows and hidden\
deep within the fog.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8274, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8272, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8274] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8274, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Thick brush grows up all around you.  The weeds, vines, and moisture all\
contribute to difficult travel.  Dagobah is quite strong with the force. \
You can feel the force all about you, it seems to be what holds this place\
together.  It binds it all together.  The ground beneath you is soggy from\
an eminence surplus of moisture.  Adding to the frustration of the\
difficult terrian is the fact that one section of swamp looks almost\
identical to any other section of swamp.  The fog hangs low overhead, no\
sun is visible.  There do not seem to be any natural landmarkers to go by.\
 It would be rather easy to get lost in here and never find your way out. \
Being Forced to sleep out here does not sound all that fun either. \
Creatures of every manner and species lurk about in the shadows and hidden\
deep within the fog. \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8275, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8273, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8275] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8275, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Thick brush grows up all around you.  The weeds, vines, and moisture all\
contribute to difficult travel.  Dagobah is quite strong with the force. \
You can feel the force all about you, it seems to be what holds this place\
together.  It binds it all together.  The ground beneath you is soggy from\
an eminence surplus of moisture.  Adding to the frustration of the\
difficult terrian is the fact that one section of swamp looks almost\
identical to any other section of swamp.  The fog hangs low overhead, no\
sun is visible.  There do not seem to be any natural landmarkers to go by.\
 It would be rather easy to get lost in here and never find your way out. \
Being Forced to sleep out here does not sound all that fun either. \
Creatures of every manner and species lurk about in the shadows and hidden\
deep within the fog. \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8276, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8274, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8276] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8276, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Thick brush grows up all around you.  The weeds, vines, and moisture all\
contribute to difficult travel.  Dagobah is quite strong with the force. \
You can feel the force all about you, it seems to be what holds this place\
together.  It binds it all together.  The ground beneath you is soggy from\
an eminence surplus of moisture.  Adding to the frustration of the\
difficult terrian is the fact that one section of swamp looks almost\
identical to any other section of swamp.  The fog hangs low overhead, no\
sun is visible.  There do not seem to be any natural landmarkers to go by.\
 It would be rather easy to get lost in here and never find your way out. \
Being Forced to sleep out here does not sound all that fun either. \
Creatures of every manner and species lurk about in the shadows and hidden\
deep within the fog.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8275, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8277] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8277, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dreams and nightmares feed off places like this.  It is definitely\
an eerie locale.  Dagobah is not known for its supercilious technology.\
This place is as civilized as attending an organized cherfer fight.\
The only difference is you are at risk here rather than some poor, dumb\
cherfer.  It is not such a good feeling.  You can feel hundreds of\
peering, beedy little eyes staring at you.  The sounds and calls of\
creatures all about you echo through the tree tops.  The force is\
strong here.  The entire planet reaks of the stuff.  Even the\
small little animals eminate a powerful aura.  Dagobah is held\
together by the force, it pulls, strengthens, and binds an otherwise\
uncivilized and mostly unintelligent planet.  The sun is completely\
blocked out by the incredibly tall and thick trees.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8261, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8278, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8278] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8278, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "It was nice while it lasted, but quickly went downhill.   Dense vegetation,\
heavy moisture, and thick fog are all good descriptions of your\
surroundings.  Sounds of strange creatures beakoning to you to venture\
into the wild fill your ears.  The ground below you begs to differ.  It\
seems quite difficult to make your way through this rough terrain.  It is\
almost as though you can feel a hundred pairs of eyes watching your every\
movement.  Despite this, you feel an odd sense of calm and serenity. \
Almost as though you are at one with yourself.  There is an odd feeling to\
this whole planet.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8277, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8227, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8279] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8279, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Copyto from 57.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8278, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8280, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8280] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8280, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Copyto from 65.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8279, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8281, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8281] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8281, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Copyto from 68.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8280, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8282, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8282] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8282, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Copyto from 77.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8283, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8281, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8283] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8283, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Copyto from 77.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8282, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8284, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8284] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8284, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Copyto from 57.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8283, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8285, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8285] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8285, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Copyto from 48.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8284, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8286, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8286] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8286, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Copyto from 68.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8285, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8287] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8287, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Dreams and nightmares feed off places like this.  It is definitely an eerie\
locale.  Dagobah is not known for its supercilious technology. This place\
is as civilized as attending an organized cherfer fight. The only\
difference is you are at risk here rather than some poor, dumb cherfer. \
It is not such a good feeling.  You can feel hundreds of peering, beedy\
little eyes staring at you.  The sounds and calls of creatures all about\
you echo through the tree tops.  The force is strong here.  The entire\
planet reaks of the stuff.  Even the small little animals eminate a\
powerful aura.  Dagobah is held together by the force, it pulls,\
strengthens, and binds an otherwise uncivilized and mostly unintelligent\
planet.  The sun is completely blocked out by the incredibly tall and\
thick trees.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8247, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8288, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8288] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8288, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The swampy surroundings seem to enclose around you in an ominous manner. \
Large trees with vines hanging from them surround you. Vines from the\
trees lay at your feet, entangled in the brush all about.  No sunlight\
seems to penetrate through the thick vegetation. All the moisture around\
you combining with the tremendous heat rising through the ground has\
created some rather thick fog.  You can feel a surplus of eyes studying\
your every move and watching for flaws or mistakes.  The force is strong\
here but, that does not mean it is a safe place for all living creatures. \
Quite the contrary, this swamp is a vile and unsafe place for anyone not\
perfectly aligned with the force.  Only the brave or fool-hardy dare walk\
these paths alone. To the east and west the path is much too thick and\
dense.  It is impossible to continue in either direction.  You would need\
some kind of device to chop down trees and cut through weeds.  To the\
north and south a thin narrow path exists.  You will be able to make your\
way through the brush with sime effort. \
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8287, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8289, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8289] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8289, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Copyto from 68. Thick brush grows up all around you.  The weeds, vines, and\
moisture all contribute to difficult travel.  Dagobah is quite strong with\
the force.  You can feel the force all about you, it seems to be what\
holds this place together.  It binds it all together.  The ground beneath\
you is soggy from an eminence surplus of moisture.  Adding to the\
frustration of the difficult terrian is the fact that one section of swamp\
looks almost identical to any other section of swamp.  The fog hangs low\
overhead, no sun is visible.  There do not seem to be any natural\
landmarkers to go by.  It would be rather easy to get lost in here and\
never find your way out.  Being Forced to sleep out here does not sound\
all that fun either.  Creatures of every manner and species lurk about in\
the shadows and hidden deep within the fog.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8288, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8290, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [8290] = 
      {
         Name = "Swampy Marsh Trail", 
         Vnum = 8290, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Each step is quite difficult under these circumstances. You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in waht is\
an otherwise hot swamp. Dagobah may be completely devoid of technology,\
and even civilization for that matter, but the planet certainly does not\
lack in living creatures. Some, considered long to be extinct thrive here,\
while others are yet undiscovered.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 8289, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
   }, 
   LowEconomy = 31248721, 
}
