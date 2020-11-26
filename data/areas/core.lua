-- Core minimal content
-- Last saved Thursday 26-Nov-2020 14:15:39

AreaEntry
{
   Filename = "core.lua", 
   Mobiles = 
   {
      [1] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say firstname of obj:\9 \9$i\
say short_desc/title of obj: \9$I\
say he/she/it of obj:\9 \9$j\
say him/her/it of obj:\9 \9$k\
say his/hers/its of obj:\9$l\
say firstname of victim: \9$t\
say short_desc/title of victim:\9$T\
say he/she/it of victim: \9$E\
say him/her/it of victim: \9$M\
say his/hers/its of victim:\9$S\
", 
               Arguments = "test2", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "say triggered by (name):\9$n\
say triggered by (name&title): \9$N\
say triggerer is (he,she,it):\9$e\
say triggerer is (him,her,it):\9$m\
say triggerer is (his,hers,its):$s\
say random char (name):\9\9$r\
say random char (name&title or short): \9$R\
say random char  (he,she,it):\9$J\
say random char (him,her,it):\9$L\
say random char (his,hers,its):\9$K\
", 
               Arguments = "test", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [18] = "_clan", 
               [20] = "verpine", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [21] = "defel", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [18] = "_clan", 
               [20] = "verpine", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [21] = "defel", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         HitChance = 
         {
            HitNoDice = 5, 
            HitPlus = 30550, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 200, 
            DamNoDice = 4, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         AffectedBy = 
         {
            [9] = "Infrared", 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         Weight = 0, 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         DamRoll = 0, 
         Race = "Gand", 
         Sex = "female", 
         Position = "standing", 
         Credits = 10000, 
         ShortDescr = "Puff", 
         Tag = "", 
         Level = 50, 
         Vnum = 1, 
         Name = "Puff", 
         ArmorClass = -30, 
      }, 
      [2] = 
      {
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 20\
give roll $n\
mpforce $n eat roll\
cast heal $n\
emote cackles happily\
say Oh, the ponies!\
", 
               Arguments = "p is starved", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "cast heal $n\
cast heal $n\
", 
               Arguments = "p bashes against", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
               Arguments = "p shivers and", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               Code = "c heal $n\
c heal $n\
", 
               Arguments = "p wears", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
            }, 
            [5] = 
            {
               Code = "c heal $n\
c heal $n\
", 
               Arguments = "p wields", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
            }, 
            [6] = 
            {
               Code = "mptrans $n 6\
", 
               Arguments = "p is DEAD!!", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
            }, 
            [7] = 
            {
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
               Arguments = "25", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
            [8] = 
            {
               Code = "mpforce $n drink\
c heal $n\
", 
               Arguments = "p is dying", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 5, 
            HitPlus = 31550, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 2, 
            DamPlus = 2, 
            DamNoDice = 1, 
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
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Alignment = -1000, 
         Weight = 0, 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 10000, 
         ShortDescr = "Richard Simmons", 
         Tag = "", 
         Level = 50, 
         Vnum = 2, 
         Name = "Richard Simmons", 
         ArmorClass = -300, 
      }, 
      [3] = 
      {
         Description = "How clever he looks!\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpinvis 101\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mpinvis 101\
", 
               Arguments = "25", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitPlus = 1050, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
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
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 21, 
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         Alignment = -1000, 
         Weight = 0, 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         DamRoll = 21, 
         Race = "Human", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 10000, 
         ShortDescr = "the supermob", 
         Tag = "", 
         Level = 105, 
         Vnum = 3, 
         Name = "supermob", 
         ArmorClass = -162, 
      }, 
      [4] = 
      {
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
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "a vendor", 
            ProfitSell = 90, 
         }, 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
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
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [26] = "falleen", 
               [27] = "binary", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
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
            [22] = "steal", 
            [0] = "fire", 
         }, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A Vendor owned by %s\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         Credits = 0, 
         ShortDescr = "a vendor", 
         Position = "standing", 
         Name = "a vendor", 
         Vnum = 4, 
         Level = 103, 
         ArmorClass = 0, 
      }, 
      [5] = 
      {
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "an animated corpse", 
         Position = "standing", 
         Name = "undead animated corpse", 
         Vnum = 5, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [6] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = -1000, 
         Weight = 0, 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ShortDescr = "Rosie O'Donnel...", 
         Position = "standing", 
         Name = "Rosie O'Donnel", 
         Vnum = 6, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [7] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n drink\
emote grins quietly\
say After no dose stopped giving me\
cash...\
say The wife HAD to go.\
", 
               Arguments = "p is thirsty", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ShortDescr = "a newly created Al Gore", 
         Position = "standing", 
         Name = "Al Gore", 
         Vnum = 7, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [10] = 
      {
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 16, 
            HitPlus = 800, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 8, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [27] = "binary", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [27] = "binary", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 16, 
         NumberOfAttacks = 2, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         DamRoll = 16, 
         Race = "_69", 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
         Credits = 0, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         Position = "standing", 
         Name = "mauzumi die wolf", 
         Vnum = 10, 
         Level = 80, 
         ArmorClass = -100, 
      }, 
      [11] = 
      {
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
               [3] = "rodese", 
               [20] = "verpine", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [27] = "binary", 
               [14] = "gamorrese", 
               [15] = "togorian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
               [3] = "rodese", 
               [20] = "verpine", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [27] = "binary", 
               [14] = "gamorrese", 
               [15] = "togorian", 
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
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 2, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A thick mist plays with your senses.\
", 
         DamRoll = 0, 
         Race = "_85", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "mist", 
         Tag = "", 
         Level = 1, 
         Vnum = 11, 
         Name = "mist", 
         ArmorClass = 0, 
      }, 
      [12] = 
      {
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
               [3] = "rodese", 
               [30] = "durese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [29] = "gand", 
               [24] = "quarrenese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [26] = "falleen", 
               [28] = "yevethan", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [25] = "sullustese", 
            }, 
            Speaking = 
            {
               [2] = "twileki", 
               [3] = "rodese", 
               [30] = "durese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [29] = "gand", 
               [24] = "quarrenese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [26] = "falleen", 
               [28] = "yevethan", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [25] = "sullustese", 
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
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 2, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         DamRoll = 0, 
         Race = "Barabel", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "bat", 
         Tag = "", 
         Level = 1, 
         Vnum = 12, 
         Name = "bat", 
         ArmorClass = 0, 
      }, 
      [13] = 
      {
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
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
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 2, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         DamRoll = 0, 
         Race = "_78", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "hawk", 
         Tag = "", 
         Level = 1, 
         Vnum = 13, 
         Name = "hawk", 
         ArmorClass = 0, 
      }, 
      [14] = 
      {
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [18] = "_clan", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [22] = "dosh", 
               [21] = "defel", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [16] = "kubazian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [16] = "kubazian", 
               [18] = "_clan", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [22] = "dosh", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [21] = "defel", 
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
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 2, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         DamRoll = 0, 
         Race = "Gran", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "black cat", 
         Tag = "", 
         Level = 1, 
         Vnum = 14, 
         Name = "black cat", 
         ArmorClass = 0, 
      }, 
      [15] = 
      {
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
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
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         DamRoll = 0, 
         Race = "_78", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "dove", 
         Tag = "", 
         Level = 1, 
         Vnum = 15, 
         Name = "dove", 
         ArmorClass = 0, 
      }, 
      [16] = 
      {
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [27] = "binary", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [20] = "verpine", 
               [17] = "jawaese", 
               [27] = "binary", 
            }, 
         }, 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         DamRoll = 0, 
         Race = "_81", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "fish", 
         Tag = "", 
         Level = 1, 
         Vnum = 16, 
         Name = "fish", 
         ArmorClass = 0, 
      }, 
      [20] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 100, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 2, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         DamRoll = 2, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ShortDescr = "a stormtrooper", 
         Position = "standing", 
         Name = "imperial trooper stormtrooper", 
         Vnum = 20, 
         Level = 10, 
         ArmorClass = 75, 
      }, 
      [21] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An imperial guard stands at attention.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "an imperial guard", 
         Position = "standing", 
         Name = "imperial guard stormtrooper", 
         Vnum = 21, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [22] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Position = "standing", 
         Name = "Rebel Alliance guard", 
         Vnum = 22, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [23] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "a rebel alliance trooper", 
         Position = "standing", 
         Name = "Rebel Alliance Trooper soldier", 
         Vnum = 23, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [24] = 
      {
         Description = "", 
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
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 1, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A mercenary stands here ready for battle.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "a mercenary", 
         Position = "standing", 
         Name = "A mercenary", 
         Vnum = 24, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [25] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An alert guard stands at attention.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "a guard", 
         Position = "standing", 
         Name = "bouncer guard thug", 
         Vnum = 25, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [26] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Height = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 3, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "an imperial guard", 
         Tag = "", 
         Level = 1, 
         Vnum = 26, 
         Name = "Imperial Elite Guard", 
         ArmorClass = 0, 
      }, 
      [27] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An imperial guard stands at attention.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "an imperial guard", 
         Position = "standing", 
         Name = "The Empire", 
         Vnum = 27, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [28] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 100, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "a stormtrooper", 
         Position = "standing", 
         Name = "an imperial specfor trooper", 
         Vnum = 28, 
         Level = 10, 
         ArmorClass = 75, 
      }, 
      [29] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Height = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 3, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Tag = "", 
         Level = 1, 
         Vnum = 29, 
         Name = "rebel elite guard", 
         ArmorClass = 0, 
      }, 
      [30] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Position = "standing", 
         Name = "The Rebel Alliance", 
         Vnum = 30, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [31] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Height = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 3, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "a rebel alliance trooper", 
         Tag = "", 
         Level = 1, 
         Vnum = 31, 
         Name = "a rebel specfor trooper", 
         ArmorClass = 0, 
      }, 
      [32] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Height = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 3, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An elite guard stands at rigid attention.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "a guard", 
         Tag = "", 
         Level = 1, 
         Vnum = 32, 
         Name = "a merc elite guard", 
         ArmorClass = 0, 
      }, 
      [40] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 5991 autopilot\
", 
               Arguments = "autopilot", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitPlus = 1050, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 21, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "The ship upgrades technician is here.\
", 
         DamRoll = 21, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ShortDescr = "the ship upgrades technician", 
         Position = "standing", 
         Name = "Ship Upgrades Technician", 
         Vnum = 40, 
         Level = 105, 
         ArmorClass = -162, 
      }, 
      [33] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An alert guard stands at attention.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ShortDescr = "a guard", 
         Position = "standing", 
         Name = "bouncer guard thug", 
         Vnum = 33, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [50] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
               Arguments = "corusca", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
               Arguments = "give", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
               Arguments = "shop", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               Code = "if ovnuminv(10208) >= 1\
say Thank you.\
mpwithdraw 2500\
give 2500 credits $n\
mpgain $n 5 100000\
else\
say hmm... Thanks, but this isn't adressed to me.\
drop all\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               Arguments = "package.", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitPlus = 5000, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [2] = "_02", 
            [0] = "parry", 
            [11] = "_11", 
            [13] = "_13", 
            [19] = "disarm", 
            [8] = "_08", 
         }, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 21, 
         NumberOfAttacks = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         Alignment = 1000, 
         Weight = 0, 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         DamRoll = 21, 
         Race = "Human", 
         Sex = "male", 
         Position = "standing", 
         Credits = 0, 
         ShortDescr = "Jedi Master Yoda", 
         Tag = "", 
         Level = 105, 
         Vnum = 50, 
         Name = "Master Yoda", 
         ArmorClass = -162, 
      }, 
      [98] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 32179 drop all\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A janitor cleans up the ship here.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ShortDescr = "a janitor", 
         Position = "standing", 
         Name = "janitor", 
         Vnum = 98, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
      [34] = 
      {
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            Breath = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Tag = "", 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         DamRoll = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ShortDescr = "a mercenary", 
         Position = "standing", 
         Name = "A mercenary", 
         Vnum = 34, 
         Level = 1, 
         ArmorClass = 0, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Arg1 = 1, 
         Arg3 = 2, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 90, 
         Arg3 = 10, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 6, 
         Arg3 = 6, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 2, 
         Arg3 = 6, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 7, 
         Arg3 = 6, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg1 = 7, 
         Arg3 = 6, 
         Arg2 = 1, 
         Command = "O", 
      }, 
   }, 
   Author = "RoD/Durga", 
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
   Objects = 
   {
      [2] = 
      {
         Tag = "", 
         Description = "One miserable credit.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a credit", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Name = "credit credits", 
         Vnum = 2, 
         ActionDescription = "", 
         ItemType = "money", 
      }, 
      [3] = 
      {
         Tag = "", 
         Description = "Some credits.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "%d credits", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "credits credit", 
         Vnum = 3, 
         ActionDescription = "", 
         ItemType = "money", 
      }, 
      [4] = 
      {
         Tag = "", 
         Description = "A deed for a shop", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "A deed", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "deed", 
         Vnum = 4, 
         ActionDescription = "", 
         ItemType = "paper", 
      }, 
      [5] = 
      {
         Tag = "", 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100000, 
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
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "a metal amulet", 
         Flags = 
         {
            [8] = "Bless", 
            [5] = "Invis", 
            [6] = "Magic", 
            [21] = "ClanObject", 
         }, 
         Name = "an amulet", 
         Vnum = 5, 
         Affects = 
         {
            [1] = 
            {
               Location = 48, 
               Modifier = 4, 
            }, 
            [2] = 
            {
               Location = 2, 
               Modifier = 3, 
            }, 
            [3] = 
            {
               Location = 48, 
               Modifier = 11, 
            }, 
         }, 
         ItemType = "armor", 
      }, 
      [6] = 
      {
         Tag = "", 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         ShortDescr = "A small charm", 
         Flags = 
         {
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         Name = "charm", 
         Vnum = 6, 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 2097152, 
            }, 
         }, 
         ItemType = "armor", 
      }, 
      [7] = 
      {
         Tag = "", 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
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
         Cost = 0, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "Tipper Gore!", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Tipper Gore", 
         Vnum = 7, 
         ActionDescription = "", 
         ItemType = "fountain", 
      }, 
      [9] = 
      {
         Tag = "", 
         Description = "The shattered remains of %s are here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "the broken parts of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "corpse remains pieces parts", 
         Vnum = 9, 
         ActionDescription = "", 
         ItemType = "droid_corpse", 
      }, 
      [10] = 
      {
         Tag = "", 
         Description = "The corpse of %s lies here.", 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "the corpse of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "corpse", 
         Vnum = 10, 
         ActionDescription = "", 
         ItemType = "corpse", 
      }, 
      [11] = 
      {
         Tag = "", 
         Description = "The corpse of %s is lying here.", 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "the corpse of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "corpse", 
         Vnum = 11, 
         ActionDescription = "", 
         ItemType = "corpse_pc", 
      }, 
      [12] = 
      {
         Tag = "", 
         Description = "The severed head of %s is lying here.", 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "the head of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "head", 
         Vnum = 12, 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         ItemType = "food", 
      }, 
      [13] = 
      {
         Tag = "", 
         Description = "The torn-out heart of %s is lying here.", 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "the heart of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 16, 
         }, 
         Name = "heart", 
         Vnum = 13, 
         ActionDescription = "%s savagely devour$q $p!", 
         ItemType = "food", 
      }, 
      [14] = 
      {
         Tag = "", 
         Description = "The sliced-off arm of %s is lying here.", 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "the arm of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Name = "arm", 
         Vnum = 14, 
         ActionDescription = "%s chomp$q on $p.", 
         ItemType = "food", 
      }, 
      [15] = 
      {
         Tag = "", 
         Description = "The sliced-off leg of %s is lying here.", 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "the leg of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Name = "leg", 
         Vnum = 15, 
         ActionDescription = "%s chomp$q on $p.", 
         ItemType = "food", 
      }, 
      [16] = 
      {
         Tag = "", 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         Weight = 1, 
         Cost = 0, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the spilled guts of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "guts", 
         Vnum = 16, 
         ActionDescription = "", 
         ItemType = "trash", 
      }, 
      [17] = 
      {
         Tag = "", 
         Description = "A pool of spilled blood lies here.", 
         Weight = 1, 
         Cost = 0, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the spilled blood", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "blood", 
         Vnum = 17, 
         ActionDescription = "", 
         ItemType = "_blood", 
      }, 
      [18] = 
      {
         Tag = "", 
         Description = "Blood stains the ground.", 
         Weight = 1, 
         Cost = 0, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the bloodstain", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "bloodstain", 
         Vnum = 18, 
         ActionDescription = "", 
         ItemType = "_bloodstain", 
      }, 
      [19] = 
      {
         Tag = "", 
         Description = "The scraps of %s lie here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "the scraps of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "scraps", 
         Vnum = 19, 
         ActionDescription = "", 
         ItemType = "scraps", 
      }, 
      [20] = 
      {
         Tag = "", 
         Description = "A fruit roll-up lies here", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a fruit roll-up", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "fruit roll-up", 
         Vnum = 20, 
         ActionDescription = "%s enjoy$q $p.", 
         ItemType = "food", 
      }, 
      [21] = 
      {
         Tag = "", 
         Description = "A bright ball of light shimmers in the air.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a bright ball of light", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "ball light", 
         Vnum = 21, 
         ActionDescription = "", 
         ItemType = "light", 
      }, 
      [22] = 
      {
         Tag = "", 
         Description = "A magical spring flows here.", 
         Weight = 10, 
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Cost = 10, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a magical spring", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Name = "spring", 
         Vnum = 22, 
         ActionDescription = "", 
         ItemType = "fountain", 
      }, 
      [23] = 
      {
         Tag = "", 
         Description = "The skin of %s", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ShortDescr = "the skin of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "the skin of %s", 
         Vnum = 23, 
         Affects = 
         {
            [1] = 
            {
               Location = 25, 
               Modifier = 2, 
            }, 
         }, 
         ItemType = "fabric", 
      }, 
      [24] = 
      {
         Tag = "", 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a slice of raw meat from %s", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Name = "meat fresh slice", 
         Vnum = 24, 
         ActionDescription = "", 
         ItemType = "food", 
      }, 
      [25] = 
      {
         Tag = "", 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 20, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "a bag", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Name = "shopping bag", 
         Vnum = 25, 
         ActionDescription = "", 
         ItemType = "container", 
      }, 
      [26] = 
      {
         Tag = "", 
         Description = "What looks like a part of a ship lies here.", 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "A ship part for %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "fighter module", 
         Vnum = 26, 
         ActionDescription = "", 
         ItemType = "fightercomp", 
      }, 
      [27] = 
      {
         Tag = "", 
         Description = "What looks like a decent size part for a ship lies here.", 
         Weight = 150, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "A midsize ship part for %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "midsize midship module", 
         Vnum = 27, 
         ActionDescription = "", 
         ItemType = "midcomp", 
      }, 
      [28] = 
      {
         Tag = "", 
         Description = "What looks like a huge ship part lies here.", 
         Weight = 350, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "A capital-class ship part for %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "capship capital module", 
         Vnum = 28, 
         ActionDescription = "", 
         ItemType = "capitalcomp", 
      }, 
      [30] = 
      {
         Tag = "", 
         Description = "A magical fire burns brightly.", 
         Weight = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 10, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a magical fire", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Name = "fire", 
         Vnum = 30, 
         ActionDescription = "", 
         ItemType = "fire", 
      }, 
      [31] = 
      {
         Tag = "", 
         Description = "You detect a trap.", 
         Weight = 100, 
         Cost = 10, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a trap", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "trap", 
         Vnum = 31, 
         ActionDescription = "", 
         ItemType = "trap", 
      }, 
      [32] = 
      {
         Tag = "", 
         Description = "A misty portal beckons you to the unknown.", 
         Weight = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 10, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a portal", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Name = "portal", 
         Vnum = 32, 
         ActionDescription = "", 
         ItemType = "_portal", 
      }, 
      [33] = 
      {
         Tag = "", 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 48000, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "black poisoning powder", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "black poison powder", 
         Vnum = 33, 
         ActionDescription = "", 
         ItemType = "trash", 
      }, 
      [34] = 
      {
         Tag = "", 
         Description = "A blank scroll lays here gathering dust.", 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10000, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "a blank scroll", 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "scroll scribing blank", 
         Vnum = 34, 
         ActionDescription = "", 
         ItemType = "scroll", 
      }, 
      [35] = 
      {
         Tag = "", 
         Description = "An empty flask lays here gathering dust.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 15000, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "an empty flask", 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Name = "flask empty", 
         Vnum = 35, 
         ActionDescription = "", 
         ItemType = "potion", 
      }, 
      [36] = 
      {
         Tag = "", 
         Description = "A message disk has been discarded here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1500, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "a message disk", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "parchment paper note data disk message info", 
         Vnum = 36, 
         ActionDescription = "", 
         ItemType = "paper", 
      }, 
      [37] = 
      {
         Tag = "", 
         Description = "A datapad used for recording message disks is here.", 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2000, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a datapad", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Name = "quill pen datapad recorder message disk", 
         Vnum = 37, 
         ActionDescription = "", 
         ItemType = "pen", 
      }, 
      [38] = 
      {
         Tag = "mail_terminal", 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         Weight = 1, 
         Cost = 0, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a mail terminal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "mail terminal", 
         Vnum = 38, 
         ActionDescription = "", 
         ItemType = "furniture", 
      }, 
      [43] = 
      {
         Tag = "", 
         Description = "A holy symbol lies here, shining.", 
         Weight = 5, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "a symbol of faith", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "holy symbol faith", 
         Vnum = 43, 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 2, 
            }, 
         }, 
         ItemType = "armor", 
      }, 
      [45] = 
      {
         Tag = "", 
         Description = "A grenade .... run!!!!", 
         Weight = 1, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Teklos low yield grenade.  Perfect for blowing your neighbor into tiny\
\13bits with. \
\13", 
               Keyword = "grenade", 
            }, 
         }, 
         Cost = 1200, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "a grenade", 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Name = "grenade", 
         Vnum = 45, 
         ActionDescription = "", 
         ItemType = "grenade", 
      }, 
      [46] = 
      {
         Tag = "", 
         Description = "Don't step on the landmine.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Blastech plasma mine.  Developed after the Imperial defeat at Yavin, this\
\13mine was used to saturate possible rebel bases.\
\13", 
               Keyword = "landmine mine", 
            }, 
         }, 
         Cost = 1000, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "a landmine", 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Name = "landmine mine", 
         Vnum = 46, 
         ActionDescription = "", 
         ItemType = "landmine", 
      }, 
      [50] = 
      {
         Tag = "", 
         Description = "A Blastech E-11 blaster rifle was left here.", 
         Weight = 10, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The most common weapon in use by either the Rebel Alliance, New Order, or\
\13planetary militias. This highpowered weapon was so mass produced when\
\13first seeing service with the New Order's stormtrooper corps, that between\
\13stolen shipments and weapons scavenged from battlefields, the Alliance had\
\13almost as many of these rifles as the Empire. Later, the weapon was\
\13'cloned' by SoroSuub as the Stormtrooper One, or SoroSuub One rifle.\
\13", 
               Keyword = "blaster Blastech E11 rifle E-11", 
            }, 
         }, 
         Cost = 3250, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Name = "blaster Blastech E11 rifle E-11", 
         Vnum = 50, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         ItemType = "weapon", 
      }, 
      [51] = 
      {
         Tag = "", 
         Description = "A Blastech DL-18 lies here on the floor.", 
         Weight = 6, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The DL-18 is a sleek, hand-held blaster built by Blas-Tech, often referred\
\13to as the \"Mos Eisley special\". \
\13", 
               Keyword = "blaster blastech dl-18 blaster pistol", 
            }, 
         }, 
         Cost = 3000, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Name = "blaster blastech dl-18 blaster pistol", 
         Vnum = 51, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "weapon", 
      }, 
      [52] = 
      {
         Tag = "", 
         Description = "A heavy blaster pistol was dropped here.", 
         Weight = 8, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The DL-44 is a high powered hand blaster, often banned from civilian use in\
\13certain planetary systems.  Han Solo himself uses a modified version of\
\13the DL-44.\
\13", 
               Keyword = "blaster blastech dl-44 heavy blaster pistol", 
            }, 
         }, 
         Cost = 3600, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         Vnum = 52, 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "weapon", 
      }, 
      [53] = 
      {
         Tag = "", 
         Description = "An assault rifle was left here.", 
         Weight = 12, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The DLT-19 is a long, sleek blaster rifle was manufactured by BlasTech.\
\13Although it mainly sees use only in the stormtrooper corps, it saw heavy\
\13combat on the side of the Alliance during the Battle of Hoth.\
\13", 
               Keyword = "blaster blastech dlt-19 assault rifle", 
            }, 
         }, 
         Cost = 3750, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Name = "blaster blastech dlt-19 assault rifle", 
         Vnum = 53, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         ItemType = "weapon", 
      }, 
      [54] = 
      {
         Tag = "", 
         Description = "A repeating blaster is collecting dust.", 
         Weight = 10, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [2] = 
            {
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [3] = 
            {
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [4] = 
            {
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [5] = 
            {
               Description = "A long, thick barreled blaster.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [6] = 
            {
               Description = "", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [7] = 
            {
               Description = "A long barreled blaster\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [8] = 
            {
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
         }, 
         Cost = 3900, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Name = "blastech t-21 repeating blaster", 
         Vnum = 54, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 3, 
            }, 
         }, 
         ItemType = "weapon", 
      }, 
      [55] = 
      {
         Tag = "", 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
         Weight = 8, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The Bryar heavy blaster pistol. Although considered antique in comparisson\
\13with the new and more powerful BlasTech models, this old blaster still\
\13packs a punch.\
\13", 
               Keyword = "bryar pistol blaster", 
            }, 
         }, 
         Cost = 3700, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Bryar heavy blaster pistol", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "bryar pistol blaster", 
         Vnum = 55, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [56] = 
      {
         Tag = "", 
         Description = "A cheap holdout blaster is here.", 
         Weight = 4, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A small, easily concealable blaster, the budgetline is used by undercover\
\13agents galaxy wide. It's lack of accuracy is made up for by it's stealth.\
\13", 
               Keyword = "blaster Budgetline 3.0/12 holdout", 
            }, 
         }, 
         Cost = 900, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Budgetline 3.0/12", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 300, 
            [5] = 300, 
            [0] = 0, 
         }, 
         Name = "blaster Budgetline 3.0/12 holdout", 
         Vnum = 56, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -3, 
            }, 
         }, 
         ItemType = "weapon", 
      }, 
      [57] = 
      {
         Tag = "", 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         Weight = 4, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2800, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 0, 
         }, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Name = "sorosuub q2 holdout blaster", 
         Vnum = 57, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [58] = 
      {
         Tag = "", 
         Description = "A very small blaster was dropped here.", 
         Weight = 3, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2000, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Name = "blastech last resort mini-blaster blaster", 
         Vnum = 58, 
         ActionDescription = "", 
         ItemType = "weapon", 
      }, 
      [59] = 
      {
         Tag = "", 
         Description = "A sharp looking blade is here.", 
         Weight = 4, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 350, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 2, 
            [4] = 100, 
            [5] = 110, 
            [0] = 12, 
         }, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a long sharp vibro-blade", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Name = "long vibro-blade", 
         Vnum = 59, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -1, 
            }, 
         }, 
         ItemType = "weapon", 
      }, 
      [60] = 
      {
         Tag = "", 
         Description = "A blaster rifle was dropped here.", 
         Weight = 10, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 3000, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Sorosuub One blaster rifle", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "Sorosuub One Blaster Rifle", 
         Vnum = 60, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "weapon", 
      }, 
      [99] = 
      {
         Tag = "", 
         Description = "Some god dropped a newly created final object here.", 
         Weight = 1, 
         Cost = 0, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created final object", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "final object", 
         Vnum = 99, 
         ActionDescription = "", 
         ItemType = "trash", 
      }, 
      [90] = 
      {
         Tag = "", 
         Description = "The suggestions board is here.", 
         Weight = 1, 
         Cost = 0, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the suggestions board", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "Suggestions Board", 
         Vnum = 90, 
         ActionDescription = "", 
         ItemType = "furniture", 
      }, 
      [70] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
               Arguments = "100", 
               MudProgType = "remove_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
               Arguments = "100", 
               MudProgType = "wear_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
         Description = "The hilt of a lightsaber lies on the ground.", 
         Weight = 8, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 53, 
            [2] = 3, 
            [3] = 1, 
            [4] = 5000, 
            [5] = 5000, 
            [0] = 1000, 
         }, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         Name = "quest weapon double bladed lightsaber saber", 
         Vnum = 70, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 5, 
            }, 
            [2] = 
            {
               Location = 19, 
               Modifier = 5, 
            }, 
         }, 
         ItemType = "weapon", 
      }, 
      [71] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
               Arguments = "100", 
               MudProgType = "remove_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
               Arguments = "100", 
               MudProgType = "wear_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
         Description = "An evil looking battle helmet.", 
         Weight = 10, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
               Keyword = "quest armor mandalorian battle helmet", 
            }, 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 25, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         Name = "quest armor mandalorian battle helmet", 
         Vnum = 71, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 8, 
            }, 
            [2] = 
            {
               Location = 26, 
               Modifier = 16777216, 
            }, 
         }, 
         ItemType = "armor", 
      }, 
      [72] = 
      {
         Tag = "", 
         Description = "A dud is here.", 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10313\
put ration item\
", 
               Arguments = "100", 
               MudProgType = "use_prog", 
               ScriptType = "MProg", 
            }, 
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
         Cost = 0, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "Mystery Box 1", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "quest item", 
         Vnum = 72, 
         ActionDescription = "", 
         ItemType = "container", 
      }, 
      [73] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
               Arguments = "100", 
               MudProgType = "remove_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
               Arguments = "100", 
               MudProgType = "wear_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
         Description = "A small energy device lies on the floor.", 
         Weight = 3, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A glowing energy shield that seems to pulse with power.  It looks strong\
\13enough to repel some blaster fire.\
\13", 
               Keyword = "quest shield", 
            }, 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 30, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Name = "quest shield generator", 
         Vnum = 73, 
         Affects = 
         {
            [1] = 
            {
               Location = 28, 
               Modifier = 8192, 
            }, 
            [2] = 
            {
               Location = 26, 
               Modifier = 67108864, 
            }, 
         }, 
         ItemType = "armor", 
      }, 
      [74] = 
      {
         Tag = "", 
         Description = "A dud is here.", 
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
         Cost = 0, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "quest item dinner", 
         Vnum = 74, 
         ActionDescription = "", 
         ItemType = "trash", 
      }, 
      [75] = 
      {
         Tag = "", 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         Weight = 2, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if questobj($n) == 75\
mpechoat $n &YYou have found the sapphire!  Return to your employer!\
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop sapphire\
endif\
", 
               Arguments = "100", 
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "quest token sapphire", 
         Vnum = 75, 
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
      [76] = 
      {
         Tag = "", 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if questobj($n) == 76\
mpechoat $n &YYou have found the diamond!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop diamond\
endif\
", 
               Arguments = "100", 
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "quest token diamond", 
         Vnum = 76, 
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
      [77] = 
      {
         Tag = "", 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if questobj($n) == 77\
mpechoat $n &YYou have found the emerald!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop emerald\
endif\
", 
               Arguments = "100", 
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "quest token emerald", 
         Vnum = 77, 
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
      [78] = 
      {
         Tag = "", 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if questobj($n) == 78\
mpechoat $n &YYou have found the amythest!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpfroce $n drop amythest\
endif\
", 
               Arguments = "100", 
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "quest token amythest", 
         Vnum = 78, 
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
      [79] = 
      {
         Tag = "", 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if questobj($n) == 79\
mpecohat $n &YYou have found the ruby!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this! \
mpforce $n drop ruby\
endif\
", 
               Arguments = "100", 
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "quest token ruby", 
         Vnum = 79, 
         ActionDescription = "", 
         ItemType = "treasure", 
      }, 
   }, 
   VnumRanges = 
   {
      Mob = 
      {
         First = 1, 
         Last = 99, 
      }, 
      Object = 
      {
         First = 1, 
         Last = 99, 
      }, 
      Room = 
      {
         First = 1, 
         Last = 99, 
      }, 
   }, 
   Rooms = 
   {
      [1] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 100, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 107, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "&CCorrans Insane Apartment&g", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say triggered by (name):\9$n\
say triggered by (name&title): \9$N\
say triggerer is (he,she,it):\9$e\
say triggerer is (him,her,it):\9$m\
say triggerer is (his,hers,its):$s\
say random char (name):\9\9$r\
say random char (name&title or short): \9$R\
say random char  (he,she,it):\9$J\
say random char (him,her,it):\9$K\
say random char (his,hers,its):\9$L\
", 
               Arguments = "test", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "say firstname of room:\9 \9$i\
say short_desc/title of room: \9$I\
say he/she/it of room:\9 \9$j\
say him/her/it of room:\9 \9$k\
say his/hers/its of room:\9$l\
say firstname of victim: \9$t\
say short_desc/title of victim:\9$T\
say he/she/it of victim: \9$E\
say him/her/it of victim: \9$M\
say his/hers/its of victim:\9$S\
", 
               Arguments = "test2", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               Code = "mpdamage $n 234234\
", 
               Arguments = "die", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [2] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 32145, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Limbo", 
         Tunnel = 0, 
         Sector = "inside", 
         Vnum = 2, 
         Tag = "", 
      }, 
      [3] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Supermob Office", 
         Tunnel = 0, 
         Sector = "inside", 
         Vnum = 3, 
         Tag = "", 
      }, 
      [4] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The Imp functions spawnobj() and spawnmob() will dump their result here.\
Needless to say you should use tocontainer() to put it where it's supposed\
to go.\
\
IF THERE IS ANYTHING IN THIS ROOM, IT MEANS SOME SCRIPT IS MISBEHAVING.\
", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Spawn Location for Scripts", 
         Tunnel = 0, 
         Sector = "inside", 
         Vnum = 4, 
         Tag = "", 
      }, 
      [5] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Vendor Storage", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 5, 
         Tag = "", 
      }, 
      [6] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [10] = "Safe", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 6, 
         Tag = "", 
      }, 
      [7] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mobprog Purge Room", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 7, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mppurge\
", 
               Arguments = "purge", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [8] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Immhood ClanStoreRoom", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 8, 
         Tag = "", 
      }, 
      [10] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 100, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "An Empty Home", 
         Tunnel = 0, 
         Sector = "inside", 
         Vnum = 10, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
               Arguments = "100", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [11] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 11, 
         Tag = "", 
      }, 
      [12] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 12, 
         Tag = "", 
      }, 
      [19] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [4] = "CanLand", 
            [5] = "CanFly", 
            [30] = "Prototype", 
            [2] = "NoMob", 
         }, 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Incognito Platform", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 19, 
         Tag = "", 
      }, 
      [20] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 20, 
         Tag = "", 
      }, 
      [29] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 32, 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "southeast", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 29, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [30] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 40, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 30, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [31] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 34, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "southwest", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 31, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [32] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 32, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [33] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 34, 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 32, 
            }, 
            [5] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "northeast", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [6] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "northwest", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
            [7] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "southeast", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [8] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "southwest", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 33, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [34] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 34, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [35] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 32, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "northeast", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 35, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [36] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 38, 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 36, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [37] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 34, 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "northwest", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 37, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [38] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This large room is the main entrance to the Southern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising the southern portion of the arena. The\
lighting is quite dim, and the bellowing echoes of the crowd would be\
quite distracting to the untrained combatant. The walls are of thick\
duratanium, and many charred blaster/explosive marks are strewn about the\
entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 39, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Southern Sniper Tower Entrance", 
         Tunnel = 0, 
         Sector = "inside", 
         Vnum = 38, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [39] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 38, 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Direction = "northeast", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [4] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Direction = "northwest", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Southern Sniper Tower", 
         Tunnel = 0, 
         Sector = "inside", 
         Vnum = 39, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [40] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This large room is the main entrance to the Northern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising a portion of the arena. The lighting is\
quite dim, and the bellowing echoes of the crowd would be quite\
distracting to the untrained fighter. The walls are of thick duratanium,\
and many charred blaster/explosive marks are strewn about the entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 41, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Northern Sniper Tower Entrance", 
         Tunnel = 0, 
         Sector = "inside", 
         Vnum = 40, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tag = "", 
      }, 
      [41] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 40, 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Direction = "southeast", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [4] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Direction = "southwest", 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Northern Sniper Tower", 
         Tunnel = 0, 
         Sector = "inside", 
         Vnum = 41, 
         Tag = "", 
      }, 
      [42] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "First Combatant's Chamber", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 42, 
         Tag = "", 
      }, 
      [43] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Second Combatant's Chamber", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 43, 
         Tag = "", 
      }, 
      [44] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Lost in Space", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 44, 
         Tag = "", 
      }, 
      [45] = 
      {
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Limbo Shipyard", 
         Tunnel = 0, 
         Sector = "city", 
         Vnum = 45, 
         Tag = "", 
      }, 
   }, 
   Name = "Core minimal content", 
   LowEconomy = 41895975, 
   HighEconomy = 0, 
   ResetFrequency = 0, 
   FileFormatVersion = 1, 
   ResetMessage = "&rYour soul burns...", 
}
