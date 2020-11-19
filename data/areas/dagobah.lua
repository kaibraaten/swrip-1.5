-- dagobah
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 8200, 
         Last = 8213, 
      }, 
      Object = 
      {
         First = 8200, 
         Last = 8200, 
      }, 
      Room = 
      {
         First = 8200, 
         Last = 8290, 
      }, 
   }, 
   Objects = 
   {
      [8200] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 8200, 
         Cost = 1, 
         ShortDescr = "A wooden cup", 
         Weight = 1, 
         Layers = 0, 
         Name = "A wooden cup", 
         Description = "A wooden cup seems to have been dropped here.", 
         ActionDescription = "", 
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
   }, 
   HighEconomy = 0, 
   Rooms = 
   {
      [8200] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8200, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The planet Dagobah -- who named it and why, is told in no existing\
record. Dagobah itself seems to avoid mention, as if some invisible power\
deflects all inquiries. As a result, the swampy planet is cloaked in\
mystery.\
   For non-Jedi Knight classes, players will be able to travel in Dagobah\
and explore its peculiar swampy terrain, fight slug beasts, and the like,\
but for Jedi Knights, this is where they must go in order to find the\
lightsaber they need to be true Jedi.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "This is where all players begin. For Jedi Knights, I hope to make it\
so they can raise the craft from the muck, but for others I will make it\
so they can swim underwater and fix the spacecraft.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8201, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Dagobah Area", 
      }, 
      [8201] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Vnum = 8201, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Landing Zone", 
         Exits = 
         {
            [1] = 
            {
               Description = "The area to the north looks just as foul as here.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8202, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand up to your knees in fowl-smelling muck, comprised of rotten\
leaves and other smells you don't want to know the source of.\
It seems impassable all around you except the far end of the swamp to the\
north, where a path seems to wind its way into the\
trees.\
", 
      }, 
      [8202] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 8202, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Up to your Waist in Muck", 
         Exits = 
         {
            [1] = 
            {
               Description = "The swamp looks deeper in that direction.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8205, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "You see more swamp, but it looks as though there is something large\
right underneath the surface.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8201, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
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
      }, 
      [8203] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8203, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
               MudProgType = "rand_prog", 
               Code = "mpecho You feel a strong sensation of the force, and your ship\
mpecho suddenly breaks the surface of the muck. It then slowly\
mpecho continues to rise, making a sucking, slurping sound.\
mpecho You sense that a great master of the force sensed your panic and\
mpecho came to your rescue.\
mptransfer all 8201\
", 
               Arguments = "50", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "You can make out the far end of the swamp, shrouded in mist.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8202, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Landing Zone", 
      }, 
      [8204] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8204, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You are swimming beneath the surface of the Dagobah swamp. To the\
east of you is your ship, looking bright green through the partially\
opaque water. Above you some light shines down and dances across your\
face.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You can make out the surface.\
", 
               Direction = "up", 
               Key = 0, 
               DestinationVnum = 8203, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Murky Swampwater", 
      }, 
      [8205] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8205, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You are now up to your neck in muck. The swampwater seeps through your\
clothes, and the current around you seems unnatural, as though created by\
a large animal. You resist the urge to panic, but your pulse starts to \
quicken at the thought of how vulnerable you are in this place.\
   To the right you catch the sight of something diving beneath the surface\
of the swamp. It seems that this would be the best time to make your way\
elsewhere?\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You see more swamp, and beyond that, yet more swamp.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8206, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8228, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8202, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Up to Your Neck in Muck", 
      }, 
      [8206] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8206, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You stand up to your hips in muck here, your feet making sick sucking\
sounds as you pull your boots out of the mud. The humidity in the air clings\
to your skin and clothes, and you feel as though you are swimming above the\
surface as much as you are below. The bank of the swamp is to the north of\
here, and to the south the swamp becomes deeper.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You can make out semi-dry land to the north.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8207, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "The foul-smelling water looks deeper there.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8205, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Up to Your Hips in Muck", 
      }, 
      [8207] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8207, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The bank of the swamp seems just as wet as standing in the water, with\
all the humidity swirling around you. A small natural path has been made\
out of rotting trees and plants here, leading deeper into the swamp to the\
west of here. To the south you see the spot where your spacecraft landed\
(and sank) in the Dagobah Swamp.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You see swamp, and yet, more swamp.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8206, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "The rotten path continues westward, then disappears into the mist.\
", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8208, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "On the Bank", 
      }, 
      [8208] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8208, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You are walking along a narrow path running along the water's edge of the\
swamp. A group of lizard-like bat things screech as they pass by above\
your head, narrowly missing you with their claws.\
  The path continues east, and to the west the path makes a turn to the\
north.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You see more of the path.\
", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8207, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8209, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Rotten Path", 
      }, 
      [8209] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8209, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Underneath the canopy of tree limbs here the swamp seems unearthly\
still. You stand at a bend in the path, where a great tree has fallen \
accross the swamp, providing a path that continues north of here. The\
rotten stump where the tree once proudly stood still remains here along \
the path.\
   You can also travel east of here, where the rotten path continues.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "The massive tree continues off to the north.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8210, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "Its hard to tell through the swirling mists.\
", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8208, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Bend in the Path", 
      }, 
      [8210] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8210, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The trunk of this massive Dagobah tree is wide enough here that you\
feel comfortable enough walking without having to stare down at your feet.\
The tree rises several feet above the water of the swamp, giving you an\
excellent, safe view of the swampland. Many of the animals around you seem\
to generate some kind of power, and you can sense their presence all around\
you.\
   The path continues along the trunk of the tree to the north and south.\
The tree here seems as though it may be climbable as well.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "The path becomes narrower to the north of here, where the massive tree\
reaches its zenith.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8212, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "The massive tree continues south.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8209, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "You can see some relatively sturdy tree limbs.\
", 
               Direction = "up", 
               Key = 0, 
               DestinationVnum = 8211, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Along the Northern Path", 
      }, 
      [8211] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8211, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You stand pirched on a tree branch, your feet slipping slightly on the\
glistening wet limbs. The view is a bit better here than from the ground,\
but through the dense foilage it isn't by much.\
   From this view you can make out your craft's shadow submerged in the\
swamp to the southeast, and to the northeast you can barely make out wisps\
of smoke rising through the canopy which looks darker than the mist around\
it. Could there be someone living in this desolate swamp?\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You see a massive fallen tree pointing off to the north.\
", 
               Direction = "down", 
               Key = 0, 
               DestinationVnum = 8210, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "On a Tree Branch", 
      }, 
      [8212] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8212, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Walking along the massive tree that forms this path through the swamp\
the path becomes narrower to the north, where the tree reaches its zenith.\
The path here is still wide enough to walk normally, but you look closely\
at the ground just in case.\
   To the south the path becomes thicker as you make your way to the base\
of the fallen tree.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You can see the tip of the rotten tree from here.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8213, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "The path continues south, then disappears into the mist.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8210, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Along the Northern Path", 
      }, 
      [8213] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8213, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "forest", 
         Description = "You stand at the end of the fallen tree, balancing yourself at\
the tip of the tree that once stood high above the swamp floor.\
The tree ends here, but the path continues along a deadwood path to\
the east. There are some bristly brambles there, so watch your step!\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "The branches there look stable enough to stand on.\
", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8214, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "The trunk of the tree path becomes thicker to the south.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8212, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Rotten Path End", 
      }, 
      [8214] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8214, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Its difficult to remain standing on the glistening wet branches \
covering the path here. Shifting from one foot to the other, you \
maintain your balance, but it would probably be best to move on \
as soon as possible. You can see a path to your west, and to the\
east are more of these dead branches.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8215, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8213, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "On the Deadwood", 
      }, 
      [8215] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8215, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The deadwood seems thicker here, entwining around one another to\
form a very solid path. However, to the west the path seems to slippery\
to pass through. However, the thicker branches form a sturdy path to the\
east of here.\
   Turning your head northward, you can also see something shiny, but\
you can't quite make out what it is at this distance. The water of the\
swamp seems safe enough to investigate.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You see murky brown water, and beyond, something shiny in the distance.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8216, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "The path continues across some entwined branches there.\
", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8222, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "The path looks extremely slippery.\
", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8214, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Deadwood Path", 
      }, 
      [8216] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8216, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You are wading up to your waist in muck, your feet sinking about a foot\
into the mud bottom. To the south of here is a path made out of deadwood,\
and to the north you can see another shore, where a building of some kind\
has been erected.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You see yet another shore in this swamp.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8217, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "You see a pile of deadwood, forming a path.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8215, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Wading in Muck", 
      }, 
      [8217] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Taking a closer look at the structure, you can make out a faint symbol\
\13that has faded over time.\
\13", 
               Keyword = "structure building", 
            }, 
            [2] = 
            {
               Description = "The symbol is of a 6 sided star, and within you can make out several\
\13words:\
\13\
\13The I*p ria Scien*i ic Survey T- m\
\13", 
               Keyword = "symbol", 
            }, 
         }, 
         Vnum = 8217, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8218, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "You see the swamp of Dagobah. What did you expect?\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8216, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Camp Shore", 
      }, 
      [8218] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8218, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You stand in the center of what was once a camp of some kind. Rotting\
and broken crates litter the area, and a few pieces of equipment has\
been left on the ground here and have corroded to the point of being\
unrecognizable.\
  To the north is a partially collapsed building, but it looks as though\
you might be able to enter it. Another building has collapsed to the \
west of here, and to the south is another collapsed structure.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "The entrance to a building is north of here.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8220, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "The structure looks as though it has been stomped flat.\
", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8221, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8217, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "A partially collapsed structure silently rots there.\
", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8219, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Center of Camp", 
      }, 
      [8219] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8219, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Three plastisteel cots are scattered around the collapsed building,\
nothing left of the mattress but a few rusted springs. The walls of the\
structure have almost entirely been eaten away by the plants and \
humidity, but one wall seems almost untouched. Facing to the east you\
can see the center of camp.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8218, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Collapsed Living Quarters", 
      }, 
      [8220] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         Vnum = 8220, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Camp Living Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "You can see the center of camp through the entrance.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8218, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Miraculously, these living quarters have been practically untouched\
by the plants and humidity. Although the mattress has been eaten away\
by rot in spots, it looks as though you can still sleep on it. Even the\
glowrod in the ceiling emits a faint glow, illuminating the room.\
   You can exit the room to the south.\
 \
It is safe to exit the game from here.\
", 
      }, 
      [8221] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8221, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "This structure has not only collapsed, it looks as though a beast\
had stomped on it as well. the plastisteel walls have been splintered\
in some places from the weight of whatever struck it, and the center\
of the structure has been stomped flat. Whatever it was that caused this\
destruction you hope has packed up and moved elsewhere.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You can see the center of camp from here.\
", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8218, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Collapsed Structure", 
      }, 
      [8222] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8222, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The path here is formed out of a mass of small, dead twigs, entwined\
together to form a rather strong path.  Bouncing slightly on the path, the\
tension on the twigs create a pleasant trampoline effect.  You refrain from\
jumping too high, however, since losing your step would result in a rather\
messy dunk in the swamp.    \
    A slippery path is to the west of here, and to the east the entwined \
path continues. It also looks as though you could go south, although \
another trip through the muck makes you think twice about it.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "You hear buzzing coming from the east of here.\
", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8224, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "You see the wet swamp.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8223, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8215, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Entwined Path", 
      }, 
      [8223] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8223, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You step down into the marsh, but are pleasantly surprised to find the black\
fluid supports your weight.  In fact, when you place your hand on the surface\
it feels smooth to the touch.  Some of the grass here seems torched as well.  \
Perhaps a fire dried up the muck here, but from what source?    \
   A sturdy path rises out of the swamp to the north, and to the south you\
see a dry patch of land.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "Some entwined branches form a path there.\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8222, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8227, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hardened Muck", 
      }, 
      [8224] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8224, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The path made of twigs continues on to the east of here, but you hardly\
notice, due to an incredible buzzing noise coming from a tree to the north,\
which deadens your senses.  Its getting incredibly hard to think here.    \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "The buzzing originates from that direction. Make it stop!\
", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8225, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8226, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "The entwined path continues west from here.\
", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8222, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Entwined Path", 
      }, 
      [8225] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8225, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You stand in front of one of the larger Dagobah trees that rise above the\
dense foilage.  In the center of the tree is a large knothole, where the source\
of the intense buzzing noise is originating.  The calcified trunk of the tree\
hides the actual home of the creature, however, and you are smart enough not to\
probe it with a stick.    \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "A path is too the south, but the buzzing makes you feel faint.\
", 
               Direction = "south", 
               Key = 0, 
               DestinationVnum = 8224, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Dagobah Swamp Tree", 
      }, 
      [8226] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8226, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The entwined path ends abruptly here, sinking into the wetness of the swamp.\
To the east you can continue, though it will be a wet trip.  The entwined path\
continues to the west for the less adventurous.    \
   Some buzzing can be heard to the west, mixing in with the rest of the\
swamp's creatures.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8224, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Entwined Path End", 
      }, 
      [8227] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8227, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The land here is dry - well, Dagobah dry at least, your feet only sink up to\
the ankle here.  There is a narrow path that has yet to cover up with foilage.\
Given what you have seen so far, this is promising.  You can either go north\
towards a path made of thick branches, or travel south along this newly beaten\
path.    \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = 0, 
               DestinationVnum = 8223, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8278, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Dry Land", 
      }, 
      [8228] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8228, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The muck here is much stickier than the rest around it, as though mixing\
with some unknown source.  Dipping your hand in the muck, you pull out a bone\
the length of your body.  It still has some meat attached from it, giving you\
the feeling it would be best to escape the immediate area NOW.    \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = 0, 
               DestinationVnum = 8229, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8205, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "In the Muck", 
      }, 
      [8229] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8229, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Now you've done it.  The swamp here is piled high with unknown victims of\
some past meal.  You better move on quickly before you become another\
collection to the pile!    \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = 0, 
               DestinationVnum = 8228, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Deep In Muck", 
      }, 
      [8230] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 8230, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "empty", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "empty room\
", 
      }, 
      [8231] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8231, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "empty room\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8230, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "empty", 
      }, 
      [8232] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 8232, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Living Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8233, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
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
      }, 
      [8233] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8233, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8232, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8234, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Master Yoda's Cave", 
      }, 
      [8234] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8234, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8235, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8233, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8243, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8246, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8235] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8235, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8236, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8234, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8245, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8236] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8236, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good\
descriptions of your surroundings.  Sounds of strange creatures\
beakoning to you to venture into the wild fill your ears.  The ground\
below you begs to differ.  It seems quite difficult to make your way \
through this rough terrain.  It is almost as though you can feel a \
hundred pairs of eyes watching your every movement.  Despite this,\
you feel an odd sense of calm and serenity.  Almost as though you are\
at one with yourself.  There is an odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8237, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8235, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8244, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8237] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8237, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8238, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8236, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8238] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8238, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8239, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8237, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8239] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8239, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8238, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8240, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8240] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8240, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8239, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8241, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8241] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8241, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8240, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8242, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8242] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8242, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8241, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8243, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8243] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8243, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8234, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8242, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8247, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8244] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8244, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8248, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8236, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8245, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8245] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8245, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8244, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8235, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8246, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8257, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8246] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8246, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8245, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8234, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8247, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8247] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8247, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense vegetation, heavy moisture, and thick fog are all good descriptions\
of your surroundings.  Sounds of strange creatures beakoning to you to\
venture into the wild fill your ears.  The ground below you begs to\
differ.  It seems quite difficult to make your way through this rough\
terrain.  It is almost as though you can feel a hundred pairs of eyes\
watching your every movement.  Despite this, you feel an odd sense of calm\
and serenity.  Almost as though you are at one with yourself.  There is an\
odd feeling to this whole planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8246, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8243, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8287, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh", 
      }, 
      [8248] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8248, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8249, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8244, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8249] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8249, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8250, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8248, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8250] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8250, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8251, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8249, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8251] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8251, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8252, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8250, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8254, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Darkened Cave", 
      }, 
      [8252] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8252, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "You are in a secluded portion of cave.  The ceiling is high\
above you.  The soft sound of dripping water can be heard in the\
distance.  High above you many pairs of glowing red eyes stare at\
you.  The eyes do not seem menacing but, rather judgemental.  Your\
every action, movement, and reaction is closely watched.  The floor\
beneath you is suprisiningly dry.  The floor is dry powdery dirt.\
You feel an odd ominous presence.  The force is strong in here.  \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8253, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8251, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Secluded Cave", 
      }, 
      [8253] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8253, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8252, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Secluded Cavern", 
      }, 
      [8254] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8254, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The cavern has a high ceiling.  Water drips down all around you.\
The water softly pelts the powdery dirt floor causing small poofs\
to arise.  Careful, passive and calm are the ways of the jedimaster.\
Anger, fear and aggression lead to evil.  That is not the way to\
become a jedimaster.  The force is strong here, you have a strange\
feeling that you are not alone. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8251, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8255, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cavern", 
      }, 
      [8255] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8255, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The cavern has a high ceiling.  Water drips down all around you. The water\
softly pelts the powdery dirt floor causing small poofs to arise. \
Careful, passive and calm are the ways of the jedimaster. Anger, fear and\
aggression lead to evil.  That is not the way to become a jedimaster.  The\
force is strong here, you have a strange feeling that you are not alone.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8256, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8254, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cavern", 
      }, 
      [8256] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8256, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The cavern has a high ceiling.  Water drips down all around you. The water\
softly pelts the powdery dirt floor causing small poofs to arise. \
Careful, passive and calm are the ways of the jedimaster. Anger, fear and\
aggression lead to evil.  That is not the way to become a jedimaster.  The\
force is strong here, you have a strange feeling that you are not alone.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8255, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cavern", 
      }, 
      [8257] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8257, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense brush covers the otherwise soggy ground.  Tall trees go\
as high as you can see.  Which is not all that far.  A thick\
cover of fog blankets the tree tops and sinks down on you.  Many\
vines hang from the trees.  The path is difficult to follow.\
You can not even be sure that this actually is a path.  It just\
happens to be wide enough for you to squeak through.  Be careful\
and watch your step, danger surrounds you.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8245, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8258, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8258] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8258, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense brush covers the otherwise soggy ground.  Tall trees go as high as\
you can see.  Which is not all that far.  A thick cover of fog blankets\
the tree tops and sinks down on you.  Many vines hang from the trees.  The\
path is difficult to follow. You can not even be sure that this actually\
is a path.  It just happens to be wide enough for you to squeak through. \
Be careful and watch your step, danger surrounds you.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8259, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8257, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8259] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8259, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense brush covers the otherwise soggy ground.  Tall trees go as high as\
you can see.  Which is not all that far.  A thick cover of fog blankets\
the tree tops and sinks down on you.  Many vines hang from the trees.  The\
path is difficult to follow. You can not even be sure that this actually\
is a path.  It just happens to be wide enough for you to squeak through. \
Be careful and watch your step, danger surrounds you.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8258, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8260, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8260] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8260, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Dense brush covers the otherwise soggy ground.  Tall trees go as high as\
you can see.  Which is not all that far.  A thick cover of fog blankets\
the tree tops and sinks down on you.  Many vines hang from the trees.  The\
path is difficult to follow. You can not even be sure that this actually\
is a path.  It just happens to be wide enough for you to squeak through. \
Be careful and watch your step, danger surrounds you.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8259, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8261, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8261] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8261, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8262, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8260, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8277, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8268, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8262] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8262, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8263, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8261, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8263] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8263, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8264, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8262, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8264] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8264, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8265, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8263, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8265] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8265, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8266, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8264, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8266] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8266, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8265, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8267, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8267] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8267, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Each step is quite difficult under these circustances.  You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in what is\
an otherwise hot swampland.  Dagobah may be completely devoid of\
technology and even civilization for that matter but, the planet certainly\
does not lack in living creatures. Creatures long since believed to be\
extinct thrive in these swampy surroundings.  Creatures undiscovered by\
most of the galaxy have made a nice little niche for themselves here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8266, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8268] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8268, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8261, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8269, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8269] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8269, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8270, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8268, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8270] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8270, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8269, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8271, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8271] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8271, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8272, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8270, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8272] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8272, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8273, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8271, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8273] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8273, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8274, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8272, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8274] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8274, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8275, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8273, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8275] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8275, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8276, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8274, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8276] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8276, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8275, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8277] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8277, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8261, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8278, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8278] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8278, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8277, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8227, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8279] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8279, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Copyto from 57.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8278, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8280, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8280] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8280, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Copyto from 65.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8279, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8281, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8281] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8281, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Copyto from 68.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8280, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8282, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8282] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8282, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Copyto from 77.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8283, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8281, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8283] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8283, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Copyto from 77.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8282, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8284, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8284] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8284, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Copyto from 57.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8283, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8285, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8285] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8285, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Copyto from 48.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8284, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8286, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8286] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8286, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Copyto from 68.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8285, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8287] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8287, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8247, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 8288, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8288] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8288, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 8287, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8289, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8289] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8289, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8288, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 8290, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
      [8290] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8290, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Each step is quite difficult under these circumstances. You nearly fall\
over into trees and other sources of brush with each step. A thick fog\
drops moisture down on you.  The chilled air feels refreshing in waht is\
an otherwise hot swamp. Dagobah may be completely devoid of technology,\
and even civilization for that matter, but the planet certainly does not\
lack in living creatures. Some, considered long to be extinct thrive here,\
while others are yet undiscovered.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 8289, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Swampy Marsh Trail", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 31248721, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 8210, 
         Command = "M", 
         Arg3 = 8222, 
         Arg2 = 6, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 8210, 
         Command = "M", 
         Arg3 = 8222, 
         Arg2 = 6, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 8210, 
         Command = "M", 
         Arg3 = 8238, 
         Arg2 = 6, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 8210, 
         Command = "M", 
         Arg3 = 8259, 
         Arg2 = 6, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 8210, 
         Command = "M", 
         Arg3 = 8262, 
         Arg2 = 6, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg1 = 8210, 
         Command = "M", 
         Arg3 = 8267, 
         Arg2 = 6, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 8213, 
         Command = "M", 
         Arg3 = 8202, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 50, 
         Command = "M", 
         Arg3 = 8232, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 5099, 
         Command = "O", 
         Arg3 = 8232, 
         Arg2 = 1, 
      }, 
   }, 
   ResetMessage = "", 
   Author = "Merth", 
   Name = "dagobah", 
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
   Filename = "dagobah.lua", 
   Mobiles = 
   {
      [8200] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
         }, 
         ShortDescr = "Jedi Master Yoda", 
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
         DamRoll = 20, 
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
         HitRoll = 20, 
         Vnum = 8200, 
         Height = 0, 
         Sex = "undistinguished", 
         Immune = 
         {
            [10] = "sleep", 
            [20] = "magic", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "fight_prog", 
               Code = "feel 'force bubble' self\
feel 'armor' self\
feel 'shield' self\
feel 'santuary' self\
feel 'sanctuary' self\
 \
", 
               Arguments = "50", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 100, 
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
            [25] = "NoKill", 
            [30] = "Prototype", 
            [11] = "Immortal", 
         }, 
         Name = "Master Yoda", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A short green alien moves above his home.\
", 
         ArmorClass = -150, 
      }, 
      [8213] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 7, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 750, 
            HitSizeDice = 10, 
            HitNoDice = 15, 
         }, 
         ShortDescr = "A large dragonsnake.", 
         Race = "Sullustan", 
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
         Description = "The dragonsnake is a native underwater predator, which lurks in the swamps\
of Dagobah. They are very active creatures and hunt other predators that\
wander too close to the water's edge. It has razor-sharp fins, powerful\
constrictor coils, and large fangs. This dangerous predator can feed on\
almost anything.\
", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
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
         HitRoll = 15, 
         Vnum = 8213, 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 15, 
         Credits = 0, 
         Sex = "undistinguished", 
         Level = 75, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "A dragonsnake", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A large predator swims in the water here.\
", 
         ArmorClass = -87, 
      }, 
      [8210] = 
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
         ShortDescr = "A slow moving sleen", 
         Race = "Rodian", 
         Sex = "undistinguished", 
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
         Description = "The sleen is a slow, omnivorous swamp forager. It feeds on insects and\
seeks damp, dark environments. \
", 
         Alignment = -300, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         NumberOfAttacks = 2, 
         Resistant = 
         {
            [20] = "magic", 
         }, 
         HitRoll = 15, 
         Vnum = 8210, 
         Height = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 10, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "fight_prog", 
               Code = "feel 'harm' $n\
", 
               Arguments = "90", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 50, 
         AffectedBy = 
         {
            [16] = "Hide", 
            [15] = "Sneak", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [24] = "NoAssist", 
         }, 
         Name = "A sleen", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A slow moving reptilian creature is here.\
", 
         ArmorClass = -100, 
      }, 
   }, 
}
