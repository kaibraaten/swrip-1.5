-- Core minimal content
-- Last saved Sunday 29-Nov-2020 17:29:40

AreaEntry
{
   Name = "Core minimal content", 
   LevelRanges = 
   {
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
   Filename = "core.lua", 
   Mobiles = 
   {
      [1] = 
      {
         Name = "Puff", 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test", 
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
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test2", 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 30550, 
         }, 
         Tag = "", 
         Position = "standing", 
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
         Alignment = 1000, 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 200, 
            DamSizeDice = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         HitRoll = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Height = 0, 
         Race = "Gand", 
         ShortDescr = "Puff", 
         ArmorClass = -30, 
         Vnum = 1, 
         Sex = "female", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 10000, 
         Level = 50, 
      }, 
      [2] = 
      {
         Name = "Richard Simmons", 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         NumberOfAttacks = 0, 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 31550, 
         }, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is DEAD!!", 
               Code = "mptrans $n 6\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is dying", 
               Code = "mpforce $n drink\
c heal $n\
", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is starved", 
               Code = "mpoload 20\
give roll $n\
mpforce $n eat roll\
cast heal $n\
emote cackles happily\
say Oh, the ponies!\
", 
               ScriptType = "MProg", 
            }, 
            [5] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p bashes against", 
               Code = "cast heal $n\
cast heal $n\
", 
               ScriptType = "MProg", 
            }, 
            [6] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p shivers and", 
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
               ScriptType = "MProg", 
            }, 
            [7] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p wears", 
               Code = "c heal $n\
c heal $n\
", 
               ScriptType = "MProg", 
            }, 
            [8] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p wields", 
               Code = "c heal $n\
c heal $n\
", 
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
         Alignment = -1000, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 2, 
            DamSizeDice = 2, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         ShortDescr = "Richard Simmons", 
         ArmorClass = -300, 
         Vnum = 2, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 10000, 
         Level = 50, 
      }, 
      [3] = 
      {
         Name = "supermob", 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         NumberOfAttacks = 0, 
         Description = "How clever he looks!\
", 
         Flags = 
         {
            [0] = "Npc", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               Code = "mpinvis 101\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "mpinvis 101\
", 
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
         Alignment = -1000, 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Weight = 0, 
         DamRoll = 21, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 21, 
         Height = 0, 
         Race = "Human", 
         ShortDescr = "the supermob", 
         ArmorClass = -162, 
         Vnum = 3, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 10000, 
         Level = 105, 
      }, 
      [4] = 
      {
         Name = "a vendor", 
         LongDescr = "A Vendor owned by %s\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
         Vnum = 4, 
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
         Alignment = 0, 
         Position = "standing", 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
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
         Height = 0, 
         Race = "Human", 
         Level = 103, 
         Shop = 
         {
            ProfitSell = 90, 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "a vendor", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a vendor", 
      }, 
      [5] = 
      {
         Name = "undead animated corpse", 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         NumberOfAttacks = 0, 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 5, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "an animated corpse", 
      }, 
      [6] = 
      {
         Name = "Rosie O'Donnel", 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = -1000, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 6, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "Rosie O'Donnel...", 
      }, 
      [7] = 
      {
         Name = "Al Gore", 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is thirsty", 
               Code = "mpforce $n drink\
emote grins quietly\
say After no dose stopped giving me\
cash...\
say The wife HAD to go.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 7, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a newly created Al Gore", 
      }, 
      [10] = 
      {
         Name = "mauzumi die wolf", 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         NumberOfAttacks = 2, 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 16, 
            HitSizeDice = 10, 
            HitPlus = 800, 
         }, 
         Tag = "", 
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
         Alignment = 0, 
         Weight = 0, 
         DamRoll = 16, 
         Damage = 
         {
            DamNoDice = 8, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 16, 
         Height = 0, 
         Race = "_69", 
         Level = 80, 
         Vnum = 10, 
         ArmorClass = -100, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
      }, 
      [11] = 
      {
         Name = "mist", 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         LongDescr = "A thick mist plays with your senses.\
", 
         NumberOfAttacks = 2, 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         Alignment = 0, 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "_85", 
         ShortDescr = "mist", 
         ArmorClass = 0, 
         Vnum = 11, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [12] = 
      {
         Name = "bat", 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         NumberOfAttacks = 2, 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         Alignment = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Barabel", 
         ShortDescr = "bat", 
         ArmorClass = 0, 
         Vnum = 12, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [13] = 
      {
         Name = "hawk", 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         NumberOfAttacks = 2, 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         Alignment = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "_78", 
         ShortDescr = "hawk", 
         ArmorClass = 0, 
         Vnum = 13, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [14] = 
      {
         Name = "black cat", 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         NumberOfAttacks = 2, 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         Alignment = 0, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Gran", 
         ShortDescr = "black cat", 
         ArmorClass = 0, 
         Vnum = 14, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [15] = 
      {
         Name = "dove", 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         NumberOfAttacks = 1, 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         Alignment = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "_78", 
         ShortDescr = "dove", 
         ArmorClass = 0, 
         Vnum = 15, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [16] = 
      {
         Name = "fish", 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         NumberOfAttacks = 1, 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         Alignment = 0, 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "_81", 
         ShortDescr = "fish", 
         ArmorClass = 0, 
         Vnum = 16, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [20] = 
      {
         Name = "imperial trooper stormtrooper", 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
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
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Weight = 0, 
         DamRoll = 2, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 2, 
         Height = 0, 
         Race = "Human", 
         Level = 10, 
         Vnum = 20, 
         ArmorClass = 75, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a stormtrooper", 
      }, 
      [21] = 
      {
         Name = "imperial guard stormtrooper", 
         LongDescr = "An imperial guard stands at attention.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 21, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "an imperial guard", 
      }, 
      [22] = 
      {
         Name = "Rebel Alliance guard", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 22, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a Rebel Alliance guard", 
      }, 
      [23] = 
      {
         Name = "Rebel Alliance Trooper soldier", 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 23, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a rebel alliance trooper", 
      }, 
      [24] = 
      {
         Name = "A mercenary", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "A mercenary stands here ready for battle.\
", 
         NumberOfAttacks = 1, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         Position = "standing", 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 24, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a mercenary", 
      }, 
      [25] = 
      {
         Name = "bouncer guard thug", 
         LongDescr = "An alert guard stands at attention.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 25, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a guard", 
      }, 
      [26] = 
      {
         Name = "Imperial Elite Guard", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         NumberOfAttacks = 3, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         ShortDescr = "an imperial guard", 
         ArmorClass = 0, 
         Vnum = 26, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [27] = 
      {
         Name = "The Empire", 
         LongDescr = "An imperial guard stands at attention.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 27, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "an imperial guard", 
      }, 
      [28] = 
      {
         Name = "an imperial specfor trooper", 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
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
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 10, 
         Vnum = 28, 
         ArmorClass = 75, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a stormtrooper", 
      }, 
      [29] = 
      {
         Name = "rebel elite guard", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         NumberOfAttacks = 3, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         ShortDescr = "a Rebel Alliance guard", 
         ArmorClass = 0, 
         Vnum = 29, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [30] = 
      {
         Name = "The Rebel Alliance", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 30, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a Rebel Alliance guard", 
      }, 
      [31] = 
      {
         Name = "a rebel specfor trooper", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         NumberOfAttacks = 3, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         ShortDescr = "a rebel alliance trooper", 
         ArmorClass = 0, 
         Vnum = 31, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [32] = 
      {
         Name = "a merc elite guard", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         LongDescr = "An elite guard stands at rigid attention.\
", 
         NumberOfAttacks = 3, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
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
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         ShortDescr = "a guard", 
         ArmorClass = 0, 
         Vnum = 32, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 1, 
      }, 
      [40] = 
      {
         Name = "Ship Upgrades Technician", 
         LongDescr = "The ship upgrades technician is here.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "autopilot", 
               Code = "mpat 5991 autopilot\
", 
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
         Alignment = 0, 
         Position = "standing", 
         Weight = 0, 
         DamRoll = 21, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 21, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Height = 0, 
         Race = "Human", 
         Level = 105, 
         Vnum = 40, 
         ArmorClass = -162, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "the ship upgrades technician", 
      }, 
      [33] = 
      {
         Name = "bouncer guard thug", 
         LongDescr = "An alert guard stands at attention.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 33, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a guard", 
      }, 
      [50] = 
      {
         Name = "Master Yoda", 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "give", 
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "shop", 
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               Arguments = "package.", 
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
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "corusca", 
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         HitRoll = 21, 
         Position = "standing", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 5000, 
         }, 
         Tag = "", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
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
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Weight = 0, 
         DamRoll = 21, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
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
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Height = 0, 
         Race = "Human", 
         ShortDescr = "Jedi Master Yoda", 
         ArmorClass = -162, 
         Vnum = 50, 
         Sex = "male", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         Level = 105, 
      }, 
      [98] = 
      {
         Name = "janitor", 
         LongDescr = "A janitor cleans up the ship here.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Tag = "", 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
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
         Alignment = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "mpat 32179 drop all\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 98, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a janitor", 
      }, 
      [34] = 
      {
         Name = "A mercenary", 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
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
         Alignment = 0, 
         Weight = 0, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 0, 
            DamSizeDice = 10, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Level = 1, 
         Vnum = 34, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a mercenary", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Arg1 = 1, 
         Arg3 = 2, 
         MiscData = 0, 
         Command = "M", 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Arg1 = 90, 
         Arg3 = 10, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Arg1 = 6, 
         Arg3 = 6, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Arg1 = 2, 
         Arg3 = 6, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Arg1 = 7, 
         Arg3 = 6, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Arg1 = 7, 
         Arg3 = 6, 
         MiscData = 1, 
         Command = "O", 
      }, 
   }, 
   Rooms = 
   {
      [1] = 
      {
         Sector = "city", 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
         Flags = 
         {
            [26] = "Factory", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test", 
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
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test2", 
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
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "die", 
               Code = "mpdamage $n 234234\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 100, 
               Direction = "east", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 107, 
               Direction = "up", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "&CCorrans Insane Apartment&g", 
         Vnum = 1, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [2] = 
      {
         Sector = "inside", 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32145, 
               Direction = "up", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Limbo", 
         Vnum = 2, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [3] = 
      {
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Supermob Office", 
         Vnum = 3, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [4] = 
      {
         Sector = "inside", 
         Description = "The Imp functions spawnobj() and spawnmob() will dump their result here.\
Needless to say you should use tocontainer() to put it where it's supposed\
to go.\
\
IF THERE IS ANYTHING IN THIS ROOM, IT MEANS SOME SCRIPT IS MISBEHAVING.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Spawn Location for Scripts", 
         Vnum = 4, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [5] = 
      {
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Vendor Storage", 
         Vnum = 5, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [6] = 
      {
         Sector = "city", 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [10] = "Safe", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         Vnum = 6, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [7] = 
      {
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "purge", 
               Code = "mppurge\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Mobprog Purge Room", 
         Vnum = 7, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [8] = 
      {
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Immhood ClanStoreRoom", 
         Vnum = 8, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [10] = 
      {
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "100", 
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 100, 
               Direction = "down", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "An Empty Home", 
         Vnum = 10, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [11] = 
      {
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 11, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [12] = 
      {
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 12, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [19] = 
      {
         Sector = "city", 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [4] = "CanLand", 
            [5] = "CanFly", 
            [30] = "Prototype", 
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Incognito Platform", 
         Vnum = 19, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [20] = 
      {
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 20, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [29] = 
      {
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Direction = "east", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 32, 
               Direction = "south", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Direction = "southeast", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Arena", 
         Vnum = 29, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [30] = 
      {
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 40, 
               Direction = "north", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 31, 
               Direction = "east", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Direction = "south", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 29, 
               Direction = "west", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Arena", 
         Vnum = 30, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [31] = 
      {
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 34, 
               Direction = "south", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 30, 
               Direction = "west", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Direction = "southwest", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Arena", 
         Vnum = 31, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [32] = 
      {
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29, 
               Direction = "north", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 33, 
               Direction = "east", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 35, 
               Direction = "south", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Arena", 
         Vnum = 32, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [33] = 
      {
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Direction = "north", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 34, 
               Direction = "east", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 36, 
               Direction = "south", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 32, 
               Direction = "west", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 31, 
               Direction = "northeast", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [6] = 
            {
               DestinationVnum = 29, 
               Direction = "northwest", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [7] = 
            {
               DestinationVnum = 37, 
               Direction = "southeast", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [8] = 
            {
               DestinationVnum = 35, 
               Direction = "southwest", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Arena", 
         Vnum = 33, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [34] = 
      {
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 31, 
               Direction = "north", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 37, 
               Direction = "south", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Direction = "west", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Arena", 
         Vnum = 34, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [35] = 
      {
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32, 
               Direction = "north", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 36, 
               Direction = "east", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Direction = "northeast", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Arena", 
         Vnum = 35, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [36] = 
      {
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 33, 
               Direction = "north", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 37, 
               Direction = "east", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 38, 
               Direction = "south", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 35, 
               Direction = "west", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Arena", 
         Vnum = 36, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [37] = 
      {
         Sector = "city", 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 34, 
               Direction = "north", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 36, 
               Direction = "west", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Direction = "northwest", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "The Arena", 
         Vnum = 37, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [38] = 
      {
         Sector = "inside", 
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
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 36, 
               Direction = "north", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 39, 
               Direction = "up", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Southern Sniper Tower Entrance", 
         Vnum = 38, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [39] = 
      {
         Sector = "inside", 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 36, 
               Direction = "north", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 38, 
               Direction = "down", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 37, 
               Direction = "northeast", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 35, 
               Direction = "northwest", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Southern Sniper Tower", 
         Vnum = 39, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [40] = 
      {
         Sector = "inside", 
         Description = "This large room is the main entrance to the Northern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising a portion of the arena. The lighting is\
quite dim, and the bellowing echoes of the crowd would be quite\
distracting to the untrained fighter. The walls are of thick duratanium,\
and many charred blaster/explosive marks are strewn about the entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Direction = "south", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 41, 
               Direction = "up", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Northern Sniper Tower Entrance", 
         Vnum = 40, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [41] = 
      {
         Sector = "inside", 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 30, 
               Direction = "south", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 40, 
               Direction = "down", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 31, 
               Direction = "southeast", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 29, 
               Direction = "southwest", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Name = "Northern Sniper Tower", 
         Vnum = 41, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [42] = 
      {
         Sector = "city", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "First Combatant's Chamber", 
         Vnum = 42, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [43] = 
      {
         Sector = "city", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Second Combatant's Chamber", 
         Vnum = 43, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [44] = 
      {
         Sector = "city", 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Lost in Space", 
         Vnum = 44, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
      [45] = 
      {
         Sector = "city", 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Limbo Shipyard", 
         Vnum = 45, 
         Tag = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         TeleVnum = 0, 
      }, 
   }, 
   ResetMessage = "&rYour soul burns...", 
   Author = "RoD/Durga", 
   Objects = 
   {
      [1] = 
      {
         Name = "glass of water", 
         Weight = 1, 
         Cost = 2, 
         Description = "A glass of water is a good cheap drink.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a glass of water", 
         ItemType = "drink_container", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [2] = 
      {
         Name = "credit credits", 
         Weight = 1, 
         Cost = 0, 
         Description = "One miserable credit.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a credit", 
         ItemType = "money", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [3] = 
      {
         Name = "credits credit", 
         Weight = 1, 
         Cost = 0, 
         Description = "Some credits.", 
         ExtraDescriptions = 
         {
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
         ShortDescr = "%d credits", 
         ItemType = "money", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 3, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [4] = 
      {
         Name = "deed", 
         Weight = 1, 
         Cost = 0, 
         Description = "A deed for a shop", 
         ExtraDescriptions = 
         {
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
         ShortDescr = "A deed", 
         ItemType = "paper", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 4, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [5] = 
      {
         Name = "an amulet", 
         Weight = 1, 
         Cost = 100000, 
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
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
         Flags = 
         {
            [8] = "Bless", 
            [5] = "Invis", 
            [6] = "Magic", 
            [21] = "ClanObject", 
         }, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a metal amulet", 
         ItemType = "armor", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
      }, 
      [6] = 
      {
         Name = "charm", 
         Weight = 1, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 2097152, 
            }, 
         }, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         Flags = 
         {
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "A small charm", 
         ItemType = "armor", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 6, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
      }, 
      [7] = 
      {
         Name = "Tipper Gore", 
         Weight = 1, 
         Cost = 0, 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "Tipper Gore!", 
         ItemType = "fountain", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 7, 
         Layers = 0, 
      }, 
      [8] = 
      {
         Name = "fruit salad", 
         Weight = 1, 
         Cost = 7, 
         Description = "Some fruit salad is delicious.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "some fruit salad", 
         ItemType = "food", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 8, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [9] = 
      {
         Name = "corpse remains pieces parts", 
         Weight = 1, 
         Cost = 0, 
         Description = "The shattered remains of %s are here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the broken parts of %s", 
         ItemType = "droid_corpse", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 9, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [10] = 
      {
         Name = "corpse", 
         Weight = 100, 
         Cost = 0, 
         Description = "The corpse of %s lies here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the corpse of %s", 
         ItemType = "corpse", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 10, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [11] = 
      {
         Name = "corpse", 
         Weight = 100, 
         Cost = 0, 
         Description = "The corpse of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the corpse of %s", 
         ItemType = "corpse_pc", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 11, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [12] = 
      {
         Name = "head", 
         Weight = 5, 
         Cost = 0, 
         Description = "The severed head of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "the head of %s", 
         ItemType = "food", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         Vnum = 12, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [13] = 
      {
         Name = "heart", 
         Weight = 2, 
         Cost = 0, 
         Description = "The torn-out heart of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 16, 
         }, 
         ShortDescr = "the heart of %s", 
         ItemType = "food", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "%s savagely devour$q $p!", 
         Vnum = 13, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [14] = 
      {
         Name = "arm", 
         Weight = 5, 
         Cost = 0, 
         Description = "The sliced-off arm of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ShortDescr = "the arm of %s", 
         ItemType = "food", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "%s chomp$q on $p.", 
         Vnum = 14, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [15] = 
      {
         Name = "leg", 
         Weight = 5, 
         Cost = 0, 
         Description = "The sliced-off leg of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ShortDescr = "the leg of %s", 
         ItemType = "food", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "%s chomp$q on $p.", 
         Vnum = 15, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [16] = 
      {
         Name = "guts", 
         Weight = 1, 
         Cost = 0, 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the spilled guts of %s", 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 16, 
         Layers = 0, 
      }, 
      [17] = 
      {
         Name = "blood", 
         Weight = 1, 
         Cost = 0, 
         Description = "A pool of spilled blood lies here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the spilled blood", 
         ItemType = "_blood", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 17, 
         Layers = 0, 
      }, 
      [18] = 
      {
         Name = "bloodstain", 
         Weight = 1, 
         Cost = 0, 
         Description = "Blood stains the ground.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the bloodstain", 
         ItemType = "_bloodstain", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 18, 
         Layers = 0, 
      }, 
      [19] = 
      {
         Name = "scraps", 
         Weight = 1, 
         Cost = 0, 
         Description = "The scraps of %s lie here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "the scraps of %s", 
         ItemType = "scraps", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 19, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [20] = 
      {
         Name = "fruit roll-up", 
         Weight = 1, 
         Cost = 10, 
         Description = "A fruit roll-up lies here", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a fruit roll-up", 
         ItemType = "food", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "%s enjoy$q $p.", 
         Vnum = 20, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [21] = 
      {
         Name = "ball light", 
         Weight = 1, 
         Cost = 0, 
         Description = "A bright ball of light shimmers in the air.", 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a bright ball of light", 
         ItemType = "light", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 21, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [22] = 
      {
         Name = "spring", 
         Weight = 10, 
         Cost = 10, 
         Description = "A magical spring flows here.", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a magical spring", 
         ItemType = "fountain", 
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 22, 
         Layers = 0, 
      }, 
      [23] = 
      {
         Name = "the skin of %s", 
         Weight = 1, 
         Cost = 0, 
         Description = "The skin of %s", 
         Affects = 
         {
            [1] = 
            {
               Location = 25, 
               Modifier = 2, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "the skin of %s", 
         ItemType = "fabric", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 23, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
      }, 
      [24] = 
      {
         Name = "meat fresh slice", 
         Weight = 2, 
         Cost = 0, 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ShortDescr = "a slice of raw meat from %s", 
         ItemType = "food", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 24, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [25] = 
      {
         Name = "shopping bag", 
         Weight = 2, 
         Cost = 20, 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         ShortDescr = "a bag", 
         ItemType = "container", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 25, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [26] = 
      {
         Name = "fighter module", 
         Weight = 100, 
         Cost = 0, 
         Description = "What looks like a part of a ship lies here.", 
         ExtraDescriptions = 
         {
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
         ShortDescr = "A ship part for %s", 
         ItemType = "fightercomp", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 26, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [27] = 
      {
         Name = "midsize midship module", 
         Weight = 150, 
         Cost = 0, 
         Description = "What looks like a decent size part for a ship lies here.", 
         ExtraDescriptions = 
         {
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
         ShortDescr = "A midsize ship part for %s", 
         ItemType = "midcomp", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 27, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [28] = 
      {
         Name = "capship capital module", 
         Weight = 350, 
         Cost = 0, 
         Description = "What looks like a huge ship part lies here.", 
         ExtraDescriptions = 
         {
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
         ShortDescr = "A capital-class ship part for %s", 
         ItemType = "capitalcomp", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 28, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [29] = 
      {
         Name = "eyepiece lens", 
         Weight = 1, 
         Cost = 100, 
         Description = "An eyepiece lens from a baster scope could be possibly be useful.", 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a lens", 
         ItemType = "lens", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 29, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [30] = 
      {
         Name = "fire", 
         Weight = 10, 
         Cost = 10, 
         Description = "A magical fire burns brightly.", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a magical fire", 
         ItemType = "fire", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 30, 
         Layers = 0, 
      }, 
      [31] = 
      {
         Name = "trap", 
         Weight = 100, 
         Cost = 10, 
         Description = "You detect a trap.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a trap", 
         ItemType = "trap", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 31, 
         Layers = 0, 
      }, 
      [32] = 
      {
         Name = "portal", 
         Weight = 100, 
         Cost = 10, 
         Description = "A misty portal beckons you to the unknown.", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a portal", 
         ItemType = "_portal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 32, 
         Layers = 0, 
      }, 
      [33] = 
      {
         Name = "black poison powder", 
         Weight = 1, 
         Cost = 48000, 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         ExtraDescriptions = 
         {
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
         ShortDescr = "black poisoning powder", 
         ItemType = "trash", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 33, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [34] = 
      {
         Name = "scroll scribing blank", 
         Weight = 2, 
         Cost = 10000, 
         Description = "A blank scroll lays here gathering dust.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a blank scroll", 
         ItemType = "scroll", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 34, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [35] = 
      {
         Name = "flask empty", 
         Weight = 1, 
         Cost = 15000, 
         Description = "An empty flask lays here gathering dust.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "an empty flask", 
         ItemType = "potion", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 35, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [36] = 
      {
         Name = "parchment paper note data disk message info", 
         Weight = 1, 
         Cost = 1500, 
         Description = "A message disk has been discarded here.", 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a message disk", 
         ItemType = "paper", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 36, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [37] = 
      {
         Name = "quill pen datapad recorder message disk", 
         Weight = 2, 
         Cost = 2000, 
         Description = "A datapad used for recording message disks is here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ShortDescr = "a datapad", 
         ItemType = "pen", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 37, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [38] = 
      {
         Name = "mail terminal", 
         Weight = 1, 
         Cost = 0, 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a mail terminal", 
         ItemType = "furniture", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Tag = "mail_terminal", 
         ActionDescription = "", 
         Vnum = 38, 
         Layers = 0, 
      }, 
      [39] = 
      {
         Name = "staff", 
         Weight = 1, 
         Cost = 50, 
         Description = "One could make something out of this staff.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a staff", 
         ItemType = "staff", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 39, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [40] = 
      {
         Name = "macrobinoculars", 
         Weight = 1, 
         Cost = 400, 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = 16777216, 
            }, 
         }, 
         Description = "Where would the galaxy be without macrobinoculars.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "some macrobinoculars", 
         ItemType = "armor", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 40, 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
      }, 
      [41] = 
      {
         Name = "coruscant police moisture suit top", 
         Weight = 1, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 1, 
            }, 
         }, 
         Description = "Part of a police uniform is here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a police uniform top", 
         ItemType = "armor", 
         Layers = 48, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 41, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
      }, 
      [42] = 
      {
         Name = "coruscant police moisture suit pants", 
         Weight = 1, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 1, 
            }, 
         }, 
         Description = "Part of a police uniform is here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a police uniform bottom", 
         ItemType = "armor", 
         Layers = 48, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 42, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
      }, 
      [43] = 
      {
         Name = "holy symbol faith", 
         Weight = 5, 
         Cost = 0, 
         Description = "A holy symbol lies here, shining.", 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 2, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a symbol of faith", 
         ItemType = "armor", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 43, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [44] = 
      {
         Name = "a spiked helmet", 
         Weight = 1, 
         Cost = 50, 
         Description = "A spiked helmet was dropped here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a spiked helmet", 
         ItemType = "armor", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 44, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
      }, 
      [45] = 
      {
         Name = "grenade", 
         Weight = 1, 
         Cost = 1200, 
         Description = "A grenade .... run!!!!", 
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
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ShortDescr = "a grenade", 
         ItemType = "grenade", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 45, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [46] = 
      {
         Name = "landmine mine", 
         Weight = 1, 
         Cost = 1000, 
         Description = "Don't step on the landmine.", 
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
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ShortDescr = "a landmine", 
         ItemType = "landmine", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 46, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [47] = 
      {
         Name = "leather arm brace", 
         Weight = 1, 
         Cost = 40, 
         Description = "A leather arm brace was dropped here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a leather arm brace", 
         ItemType = "armor", 
         Layers = 8, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 47, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
      }, 
      [48] = 
      {
         Name = "medium grade unrefined ryll spice", 
         Weight = 1, 
         Cost = 0, 
         Description = "Some mid-grade unrefined ryll is here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 50, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "some unrefined ryll", 
         ItemType = "rawspice", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 48, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [49] = 
      {
         Name = "large studded belt", 
         Weight = 1, 
         Cost = 20, 
         Description = "A large studded belt was dropped here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a large studded belt", 
         ItemType = "armor", 
         Layers = 16, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 49, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
      }, 
      [50] = 
      {
         Name = "blaster Blastech E11 rifle E-11", 
         Weight = 10, 
         Cost = 3250, 
         Description = "A Blastech E-11 blaster rifle was left here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
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
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 50, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [51] = 
      {
         Name = "blaster blastech dl-18 blaster pistol", 
         Weight = 6, 
         Cost = 3000, 
         Description = "A Blastech DL-18 lies here on the floor.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
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
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 51, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [52] = 
      {
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         Weight = 8, 
         Cost = 3600, 
         Description = "A heavy blaster pistol was dropped here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
         }, 
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
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 52, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [53] = 
      {
         Name = "blaster blastech dlt-19 assault rifle", 
         Weight = 12, 
         Cost = 3750, 
         Description = "An assault rifle was left here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
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
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 53, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [54] = 
      {
         Name = "blastech t-21 repeating blaster", 
         Weight = 10, 
         Cost = 3900, 
         Description = "A repeating blaster is collecting dust.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 3, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [2] = 
            {
               Description = "A long barreled blaster\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [3] = 
            {
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [4] = 
            {
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [5] = 
            {
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [6] = 
            {
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [7] = 
            {
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [8] = 
            {
               Description = "A long, thick barreled blaster.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 54, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [55] = 
      {
         Name = "bryar pistol blaster", 
         Weight = 8, 
         Cost = 3700, 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
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
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a Bryar heavy blaster pistol", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 55, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [56] = 
      {
         Name = "blaster Budgetline 3.0/12 holdout", 
         Weight = 4, 
         Cost = 900, 
         Description = "A cheap holdout blaster is here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -3, 
            }, 
         }, 
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
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 300, 
            [5] = 300, 
            [0] = 0, 
         }, 
         ShortDescr = "a Budgetline 3.0/12", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 56, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [57] = 
      {
         Name = "sorosuub q2 holdout blaster", 
         Weight = 4, 
         Cost = 2800, 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 0, 
         }, 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 57, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [58] = 
      {
         Name = "blastech last resort mini-blaster blaster", 
         Weight = 3, 
         Cost = 2000, 
         Description = "A very small blaster was dropped here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 58, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [59] = 
      {
         Name = "long vibro-blade", 
         Weight = 4, 
         Cost = 350, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -1, 
            }, 
         }, 
         Description = "A sharp looking blade is here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 2, 
            [4] = 100, 
            [5] = 110, 
            [0] = 12, 
         }, 
         ShortDescr = "a long sharp vibro-blade", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 59, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [60] = 
      {
         Name = "Sorosuub One Blaster Rifle", 
         Weight = 10, 
         Cost = 3000, 
         Description = "A blaster rifle was dropped here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a Sorosuub One blaster rifle", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 60, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [61] = 
      {
         Name = "large studded belt", 
         Weight = 1, 
         Cost = 20, 
         Description = "A large studded belt was dropped here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a large studded belt", 
         ItemType = "armor", 
         Layers = 16, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 61, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
      }, 
      [62] = 
      {
         Name = "some big boots", 
         Weight = 1, 
         Cost = 100, 
         Description = "Some big boots were dropped here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "some big boots", 
         ItemType = "armor", 
         Layers = 64, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 62, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
      }, 
      [63] = 
      {
         Name = "a big leather skirt", 
         Weight = 1, 
         Cost = 50, 
         Description = "A big leather skirt was dropped here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a big leather skirt", 
         ItemType = "armor", 
         Layers = 32, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 63, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
      }, 
      [64] = 
      {
         Name = "rags", 
         Weight = 1, 
         Cost = 0, 
         Description = "Some rags offer scant protection.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "Some rags", 
         ItemType = "armor", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 64, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
      }, 
      [65] = 
      {
         Name = "spiced ryll coffee", 
         Weight = 1, 
         Cost = 3, 
         Description = "This coffee has a strong ryll aroma.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 12, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "a cup of spiced ryll coffee", 
         ItemType = "drink_container", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 65, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [66] = 
      {
         Name = "blastech persuader holdout blaster", 
         Weight = 4, 
         Cost = 2500, 
         Description = "A holdout blaster might come in handy.", 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = -1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a Blastech Persuader Holdout Blaster", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 66, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [67] = 
      {
         Name = "short pants", 
         Weight = 5, 
         Cost = 300, 
         Description = "Some short pants were left here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "some short pants", 
         ItemType = "armor", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 67, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
      }, 
      [70] = 
      {
         Name = "quest weapon double bladed lightsaber saber", 
         Weight = 8, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 5, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 5, 
            }, 
         }, 
         Description = "The hilt of a lightsaber lies on the ground.", 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 53, 
            [2] = 3, 
            [3] = 1, 
            [4] = 5000, 
            [5] = 5000, 
            [0] = 1000, 
         }, 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
         ItemType = "weapon", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 70, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [71] = 
      {
         Name = "quest armor mandalorian battle helmet", 
         Weight = 10, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = 16777216, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 8, 
            }, 
         }, 
         Description = "An evil looking battle helmet.", 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
               Keyword = "quest armor mandalorian battle helmet", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 25, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
         ItemType = "armor", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 71, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
      }, 
      [72] = 
      {
         Name = "quest item", 
         Weight = 1, 
         Cost = 0, 
         Description = "A dud is here.", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "Mystery Box 1", 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 72, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Arguments = "100", 
               Code = "mpoload 10313\
put ration item\
", 
               ScriptType = "MProg", 
            }, 
         }, 
      }, 
      [73] = 
      {
         Name = "quest shield generator", 
         Weight = 3, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = 67108864, 
            }, 
            [2] = 
            {
               Location = 28, 
               Modifier = 8192, 
            }, 
         }, 
         Description = "A small energy device lies on the floor.", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
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
         ObjectValues = 
         {
            [1] = 30, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
         ItemType = "armor", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 73, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
      }, 
      [74] = 
      {
         Name = "quest item dinner", 
         Weight = 1, 
         Cost = 0, 
         Description = "A dud is here.", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
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
         Tag = "", 
         ActionDescription = "", 
         Vnum = 74, 
         Layers = 0, 
      }, 
      [75] = 
      {
         Name = "quest token sapphire", 
         Weight = 2, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 75\
mpechoat $n &YYou have found the sapphire!  Return to your employer!\
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop sapphire\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         ItemType = "treasure", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 75, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [76] = 
      {
         Name = "quest token diamond", 
         Weight = 1, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 76\
mpechoat $n &YYou have found the diamond!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop diamond\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         ItemType = "treasure", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 76, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [77] = 
      {
         Name = "quest token emerald", 
         Weight = 1, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 77\
mpechoat $n &YYou have found the emerald!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop emerald\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         ItemType = "treasure", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 77, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [78] = 
      {
         Name = "quest token amythest", 
         Weight = 1, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 78\
mpechoat $n &YYou have found the amythest!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpfroce $n drop amythest\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         ItemType = "treasure", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 78, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [79] = 
      {
         Name = "quest token ruby", 
         Weight = 1, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "if questobj($n) == 79\
mpecohat $n &YYou have found the ruby!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this! \
mpforce $n drop ruby\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         ItemType = "treasure", 
         Layers = 0, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 79, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [90] = 
      {
         Name = "Suggestions Board", 
         Weight = 1, 
         Cost = 0, 
         Description = "The suggestions board is here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "the suggestions board", 
         ItemType = "furniture", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Tag = "", 
         ActionDescription = "", 
         Vnum = 90, 
         Layers = 0, 
      }, 
      [99] = 
      {
         Name = "final object", 
         Weight = 1, 
         Cost = 0, 
         Description = "Some god dropped a newly created final object here.", 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created final object", 
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
         Tag = "", 
         ActionDescription = "", 
         Vnum = 99, 
         Layers = 0, 
      }, 
   }, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 99, 
         First = 1, 
      }, 
      Room = 
      {
         Last = 99, 
         First = 1, 
      }, 
      Object = 
      {
         Last = 99, 
         First = 1, 
      }, 
   }, 
   HighEconomy = 0, 
   LowEconomy = 41515975, 
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
}
