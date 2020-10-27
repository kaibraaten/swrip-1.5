-- Limbo
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
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
   VnumRanges = 
   {
      Mob = 
      {
         Last = 99, 
         First = 1, 
      }, 
      Object = 
      {
         Last = 99, 
         First = 1, 
      }, 
      Room = 
      {
         Last = 99, 
         First = 1, 
      }, 
   }, 
   Name = "Limbo", 
   LowEconomy = 41995975, 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   Mobiles = 
   {
      [1] = 
      {
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         Description = "", 
         Level = 50, 
         Credits = 10000, 
         Position = "standing", 
         Race = "Gand", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
               MudProgType = "speech_prog", 
               Arguments = "test", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
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
               MudProgType = "speech_prog", 
               Arguments = "test2", 
            }, 
         }, 
         Weight = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Sex = "female", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ShortDescr = "Puff", 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 30550, 
            HitNoDice = 5, 
         }, 
         ArmorClass = -30, 
         NumberOfAttacks = 0, 
         Vnum = 1, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 4, 
            DamPlus = 200, 
         }, 
         Alignment = 1000, 
         Height = 0, 
         Name = "Puff", 
      }, 
      [2] = 
      {
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         Level = 50, 
         Credits = 10000, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "Richard Simmons", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mptrans $n 6\
", 
               MudProgType = "act_prog", 
               Arguments = "p is DEAD!!", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "25", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "mpforce $n drink\
c heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p is dying", 
            }, 
            [4] = 
            {
               ScriptType = "MProg", 
               Code = "mpoload 20\
give roll $n\
mpforce $n eat roll\
cast heal $n\
emote cackles happily\
say Oh, the ponies!\
", 
               MudProgType = "act_prog", 
               Arguments = "p is starved", 
            }, 
            [5] = 
            {
               ScriptType = "MProg", 
               Code = "cast heal $n\
cast heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p bashes against", 
            }, 
            [6] = 
            {
               ScriptType = "MProg", 
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p shivers and", 
            }, 
            [7] = 
            {
               ScriptType = "MProg", 
               Code = "c heal $n\
c heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p wears", 
            }, 
            [8] = 
            {
               ScriptType = "MProg", 
               Code = "c heal $n\
c heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p wields", 
            }, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 31550, 
            HitNoDice = 5, 
         }, 
         ArmorClass = -300, 
         NumberOfAttacks = 0, 
         Vnum = 2, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamSizeDice = 2, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         Alignment = -1000, 
         Height = 0, 
         Name = "Richard Simmons", 
      }, 
      [3] = 
      {
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         Description = "How clever he looks!\
", 
         Level = 105, 
         Credits = 10000, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "the supermob", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpinvis 101\
", 
               MudProgType = "rand_prog", 
               Arguments = "25", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "mpinvis 101\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1050, 
            HitNoDice = 21, 
         }, 
         ArmorClass = -162, 
         NumberOfAttacks = 0, 
         Vnum = 3, 
         HitRoll = 21, 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
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
         DefaultPosition = "standing", 
         DamRoll = 21, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         Alignment = -1000, 
         Height = 0, 
         Name = "supermob", 
      }, 
      [4] = 
      {
         LongDescr = "A Vendor owned by %s\
", 
         Description = "", 
         Level = 103, 
         Credits = 0, 
         Shop = 
         {
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
            KeeperShortDescr = "a vendor", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
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
         Sex = "undistinguished", 
         ShortDescr = "a vendor", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 4, 
         HitRoll = 0, 
         DamRoll = 0, 
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
         DefaultPosition = "standing", 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "a vendor", 
      }, 
      [5] = 
      {
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "an animated corpse", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 5, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "undead animated corpse", 
      }, 
      [6] = 
      {
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "Rosie O'Donnel...", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 6, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = -1000, 
         Height = 0, 
         Name = "Rosie O'Donnel", 
      }, 
      [7] = 
      {
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a newly created Al Gore", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 7, 
         HitRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpforce $n drink\
emote grins quietly\
say After no dose stopped giving me\
cash...\
say The wife HAD to go.\
", 
               MudProgType = "act_prog", 
               Arguments = "p is thirsty", 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "Al Gore", 
      }, 
      [10] = 
      {
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         Level = 80, 
         Credits = 0, 
         Position = "standing", 
         Race = "_69", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 800, 
            HitNoDice = 16, 
         }, 
         ArmorClass = -100, 
         NumberOfAttacks = 2, 
         Vnum = 10, 
         HitRoll = 16, 
         DamRoll = 16, 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 8, 
            DamPlus = 2, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "mauzumi die wolf", 
      }, 
      [11] = 
      {
         LongDescr = "A thick mist plays with your senses.\
", 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "_85", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "mist", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 2, 
         Vnum = 11, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "mist", 
      }, 
      [12] = 
      {
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Barabel", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "bat", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 2, 
         Vnum = 12, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "bat", 
      }, 
      [13] = 
      {
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "_78", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "hawk", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 2, 
         Vnum = 13, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "hawk", 
      }, 
      [14] = 
      {
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Gran", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "black cat", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 2, 
         Vnum = 14, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "black cat", 
      }, 
      [15] = 
      {
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "_78", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "dove", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 1, 
         Vnum = 15, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "dove", 
      }, 
      [16] = 
      {
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "_81", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "fish", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 1, 
         Vnum = 16, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "fish", 
      }, 
      [20] = 
      {
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         Description = "", 
         Level = 10, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a stormtrooper", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         ArmorClass = 75, 
         NumberOfAttacks = 0, 
         Vnum = 20, 
         HitRoll = 2, 
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
         DefaultPosition = "standing", 
         DamRoll = 2, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "imperial trooper stormtrooper", 
      }, 
      [21] = 
      {
         LongDescr = "An imperial guard stands at attention.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "an imperial guard", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 21, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "imperial guard stormtrooper", 
      }, 
      [22] = 
      {
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a Rebel Alliance guard", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 22, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "Rebel Alliance guard", 
      }, 
      [23] = 
      {
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a rebel alliance trooper", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 23, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "Rebel Alliance Trooper soldier", 
      }, 
      [24] = 
      {
         LongDescr = "A mercenary stands here ready for battle.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a mercenary", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 1, 
         Vnum = 24, 
         HitRoll = 0, 
         DamRoll = 0, 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "A mercenary", 
      }, 
      [25] = 
      {
         LongDescr = "An alert guard stands at attention.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a guard", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 25, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "bouncer guard thug", 
      }, 
      [26] = 
      {
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 3, 
         Vnum = 26, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "Imperial Elite Guard", 
      }, 
      [27] = 
      {
         LongDescr = "An imperial guard stands at attention.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "an imperial guard", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 27, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "The Empire", 
      }, 
      [28] = 
      {
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         Description = "", 
         Level = 10, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a stormtrooper", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         ArmorClass = 75, 
         NumberOfAttacks = 0, 
         Vnum = 28, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "an imperial specfor trooper", 
      }, 
      [29] = 
      {
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 3, 
         Vnum = 29, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "rebel elite guard", 
      }, 
      [30] = 
      {
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a Rebel Alliance guard", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 30, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "The Rebel Alliance", 
      }, 
      [31] = 
      {
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         ShortDescr = "a rebel alliance trooper", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 3, 
         Vnum = 31, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "a rebel specfor trooper", 
      }, 
      [32] = 
      {
         LongDescr = "An elite guard stands at rigid attention.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 3, 
         Vnum = 32, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
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
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "a merc elite guard", 
      }, 
      [40] = 
      {
         LongDescr = "The ship upgrades technician is here.\
", 
         Description = "", 
         Level = 105, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "the ship upgrades technician", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpat 5991 autopilot\
", 
               MudProgType = "speech_prog", 
               Arguments = "autopilot", 
            }, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1050, 
            HitNoDice = 21, 
         }, 
         ArmorClass = -162, 
         NumberOfAttacks = 0, 
         Vnum = 40, 
         HitRoll = 21, 
         DamRoll = 21, 
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
         DefaultPosition = "standing", 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "Ship Upgrades Technician", 
      }, 
      [33] = 
      {
         LongDescr = "An alert guard stands at attention.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a guard", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 33, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "bouncer guard thug", 
      }, 
      [50] = 
      {
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         Description = "", 
         Level = 105, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
               MudProgType = "speech_prog", 
               Arguments = "give", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
               MudProgType = "speech_prog", 
               Arguments = "shop", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
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
               MudProgType = "act_prog", 
               Arguments = "package.", 
            }, 
            [4] = 
            {
               ScriptType = "MProg", 
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
               MudProgType = "speech_prog", 
               Arguments = "corusca", 
            }, 
         }, 
         Weight = 0, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Sex = "male", 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         DamRoll = 21, 
         ShortDescr = "Jedi Master Yoda", 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 5000, 
            HitNoDice = 21, 
         }, 
         ArmorClass = -162, 
         NumberOfAttacks = 0, 
         Vnum = 50, 
         HitRoll = 21, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
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
         DefaultPosition = "standing", 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         Alignment = 1000, 
         Height = 0, 
         Name = "Master Yoda", 
      }, 
      [98] = 
      {
         LongDescr = "A janitor cleans up the ship here.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a janitor", 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 98, 
         HitRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpat 32179 drop all\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "janitor", 
      }, 
      [34] = 
      {
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Race = "Human", 
         Weight = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         ShortDescr = "a mercenary", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Vnum = 34, 
         HitRoll = 0, 
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
         DefaultPosition = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Name = "A mercenary", 
      }, 
   }, 
   Filename = "limbo.lua", 
   ResetMessage = "&rYour soul burns...", 
   ResetFrequency = 0, 
   Flags = 
   {
      [1] = "_01", 
   }, 
   Objects = 
   {
      [2] = 
      {
         Layers = 0, 
         Description = "One miserable credit.", 
         ItemType = "money", 
         Vnum = 2, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "credit credits", 
         ShortDescr = "a credit", 
      }, 
      [3] = 
      {
         Layers = 0, 
         Description = "Some credits.", 
         ItemType = "money", 
         Vnum = 3, 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "credits credit", 
         ShortDescr = "%d credits", 
      }, 
      [4] = 
      {
         Layers = 0, 
         Description = "A deed for a shop", 
         ItemType = "paper", 
         Vnum = 4, 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "deed", 
         ShortDescr = "A deed", 
      }, 
      [5] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 4, 
               Location = 48, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 2, 
            }, 
            [3] = 
            {
               Modifier = 11, 
               Location = 48, 
            }, 
         }, 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
         ItemType = "armor", 
         Vnum = 5, 
         ActionDescription = "", 
         Cost = 100000, 
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
         Flags = 
         {
            [8] = "Bless", 
            [5] = "Invis", 
            [6] = "Magic", 
            [21] = "ClanObject", 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Name = "an amulet", 
         ShortDescr = "a metal amulet", 
      }, 
      [6] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2097152, 
               Location = 27, 
            }, 
         }, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         ItemType = "armor", 
         Vnum = 6, 
         ActionDescription = "", 
         Cost = 0, 
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
         Flags = 
         {
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         Name = "charm", 
         ShortDescr = "A small charm", 
      }, 
      [7] = 
      {
         Layers = 0, 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         ItemType = "fountain", 
         Vnum = 7, 
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
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Name = "Tipper Gore", 
         ShortDescr = "Tipper Gore!", 
      }, 
      [9] = 
      {
         Layers = 0, 
         Description = "The shattered remains of %s are here.", 
         ItemType = "droid_corpse", 
         Vnum = 9, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "corpse remains pieces parts", 
         ShortDescr = "the broken parts of %s", 
      }, 
      [10] = 
      {
         Layers = 0, 
         Description = "The corpse of %s lies here.", 
         ItemType = "corpse", 
         Vnum = 10, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 100, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "corpse", 
         ShortDescr = "the corpse of %s", 
      }, 
      [11] = 
      {
         Layers = 0, 
         Description = "The corpse of %s is lying here.", 
         ItemType = "corpse_pc", 
         Vnum = 11, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 100, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "corpse", 
         ShortDescr = "the corpse of %s", 
      }, 
      [12] = 
      {
         Layers = 0, 
         Description = "The severed head of %s is lying here.", 
         ItemType = "food", 
         Vnum = 12, 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "head", 
         ShortDescr = "the head of %s", 
      }, 
      [13] = 
      {
         Layers = 0, 
         Description = "The torn-out heart of %s is lying here.", 
         ItemType = "food", 
         Vnum = 13, 
         ActionDescription = "%s savagely devour$q $p!", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 16, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "heart", 
         ShortDescr = "the heart of %s", 
      }, 
      [14] = 
      {
         Layers = 0, 
         Description = "The sliced-off arm of %s is lying here.", 
         ItemType = "food", 
         Vnum = 14, 
         ActionDescription = "%s chomp$q on $p.", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "arm", 
         ShortDescr = "the arm of %s", 
      }, 
      [15] = 
      {
         Layers = 0, 
         Description = "The sliced-off leg of %s is lying here.", 
         ItemType = "food", 
         Vnum = 15, 
         ActionDescription = "%s chomp$q on $p.", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "leg", 
         ShortDescr = "the leg of %s", 
      }, 
      [16] = 
      {
         Layers = 0, 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         ItemType = "trash", 
         Vnum = 16, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Name = "guts", 
         ShortDescr = "the spilled guts of %s", 
      }, 
      [17] = 
      {
         Layers = 0, 
         Description = "A pool of spilled blood lies here.", 
         ItemType = "_blood", 
         Vnum = 17, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Name = "blood", 
         ShortDescr = "the spilled blood", 
      }, 
      [18] = 
      {
         Layers = 0, 
         Description = "Blood stains the ground.", 
         ItemType = "_bloodstain", 
         Vnum = 18, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Name = "bloodstain", 
         ShortDescr = "the bloodstain", 
      }, 
      [19] = 
      {
         Layers = 0, 
         Description = "The scraps of %s lie here.", 
         ItemType = "scraps", 
         Vnum = 19, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "scraps", 
         ShortDescr = "the scraps of %s", 
      }, 
      [20] = 
      {
         Layers = 0, 
         Description = "A fruit roll-up lies here", 
         ItemType = "food", 
         Vnum = 20, 
         ActionDescription = "%s enjoy$q $p.", 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "fruit roll-up", 
         ShortDescr = "a fruit roll-up", 
      }, 
      [21] = 
      {
         Layers = 0, 
         Description = "A bright ball of light shimmers in the air.", 
         ItemType = "light", 
         Vnum = 21, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "ball light", 
         ShortDescr = "a bright ball of light", 
      }, 
      [22] = 
      {
         Layers = 0, 
         Description = "A magical spring flows here.", 
         ItemType = "fountain", 
         Vnum = 22, 
         ActionDescription = "", 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Name = "spring", 
         ShortDescr = "a magical spring", 
      }, 
      [23] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 25, 
            }, 
         }, 
         Description = "The skin of %s", 
         ItemType = "fabric", 
         Vnum = 23, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Name = "the skin of %s", 
         ShortDescr = "the skin of %s", 
      }, 
      [24] = 
      {
         Layers = 0, 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         ItemType = "food", 
         Vnum = 24, 
         ActionDescription = "", 
         Cost = 0, 
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
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "meat fresh slice", 
         ShortDescr = "a slice of raw meat from %s", 
      }, 
      [25] = 
      {
         Layers = 0, 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         ItemType = "container", 
         Vnum = 25, 
         ActionDescription = "", 
         Cost = 20, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "shopping bag", 
         ShortDescr = "a bag", 
      }, 
      [26] = 
      {
         Layers = 0, 
         Description = "What looks like a part of a ship lies here.", 
         ItemType = "fightercomp", 
         Vnum = 26, 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 100, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "fighter module", 
         ShortDescr = "A ship part for %s", 
      }, 
      [27] = 
      {
         Layers = 0, 
         Description = "What looks like a decent size part for a ship lies here.", 
         ItemType = "midcomp", 
         Vnum = 27, 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 150, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "midsize midship module", 
         ShortDescr = "A midsize ship part for %s", 
      }, 
      [28] = 
      {
         Layers = 0, 
         Description = "What looks like a huge ship part lies here.", 
         ItemType = "capitalcomp", 
         Vnum = 28, 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 350, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "capship capital module", 
         ShortDescr = "A capital-class ship part for %s", 
      }, 
      [30] = 
      {
         Layers = 0, 
         Description = "A magical fire burns brightly.", 
         ItemType = "fire", 
         Vnum = 30, 
         ActionDescription = "", 
         Cost = 10, 
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
            [6] = "Magic", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Name = "fire", 
         ShortDescr = "a magical fire", 
      }, 
      [31] = 
      {
         Layers = 0, 
         Description = "You detect a trap.", 
         ItemType = "trap", 
         Vnum = 31, 
         ActionDescription = "", 
         Cost = 10, 
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
         Weight = 100, 
         Name = "trap", 
         ShortDescr = "a trap", 
      }, 
      [32] = 
      {
         Layers = 0, 
         Description = "A misty portal beckons you to the unknown.", 
         ItemType = "_portal", 
         Vnum = 32, 
         ActionDescription = "", 
         Cost = 10, 
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
            [6] = "Magic", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 100, 
         Name = "portal", 
         ShortDescr = "a portal", 
      }, 
      [33] = 
      {
         Layers = 0, 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         ItemType = "trash", 
         Vnum = 33, 
         ActionDescription = "", 
         Cost = 48000, 
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
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "black poison powder", 
         ShortDescr = "black poisoning powder", 
      }, 
      [34] = 
      {
         Layers = 0, 
         Description = "A blank scroll lays here gathering dust.", 
         ItemType = "scroll", 
         Vnum = 34, 
         ActionDescription = "", 
         Cost = 10000, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "scroll scribing blank", 
         ShortDescr = "a blank scroll", 
      }, 
      [35] = 
      {
         Layers = 0, 
         Description = "An empty flask lays here gathering dust.", 
         ItemType = "potion", 
         Vnum = 35, 
         ActionDescription = "", 
         Cost = 15000, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "flask empty", 
         ShortDescr = "an empty flask", 
      }, 
      [36] = 
      {
         Layers = 0, 
         Description = "A message disk has been discarded here.", 
         ItemType = "paper", 
         Vnum = 36, 
         ActionDescription = "", 
         Cost = 1500, 
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
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "parchment paper note data disk message info", 
         ShortDescr = "a message disk", 
      }, 
      [37] = 
      {
         Layers = 0, 
         Description = "A datapad used for recording message disks is here.", 
         ItemType = "pen", 
         Vnum = 37, 
         ActionDescription = "", 
         Cost = 2000, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "quill pen datapad recorder message disk", 
         ShortDescr = "a datapad", 
      }, 
      [38] = 
      {
         Layers = 0, 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         ItemType = "furniture", 
         Vnum = 38, 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Name = "mail terminal", 
         ShortDescr = "a mail terminal", 
      }, 
      [43] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 4, 
            }, 
         }, 
         Description = "A holy symbol lies here, shining.", 
         ItemType = "armor", 
         Vnum = 43, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "holy symbol faith", 
         ShortDescr = "a symbol of faith", 
      }, 
      [45] = 
      {
         Layers = 0, 
         Description = "A grenade .... run!!!!", 
         ItemType = "grenade", 
         Vnum = 45, 
         ActionDescription = "", 
         Cost = 1200, 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "grenade", 
               Description = "A Teklos low yield grenade.  Perfect for blowing your neighbor into tiny\
\13bits with. \
\13", 
            }, 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "grenade", 
         ShortDescr = "a grenade", 
      }, 
      [46] = 
      {
         Layers = 0, 
         Description = "Don't step on the landmine.", 
         ItemType = "landmine", 
         Vnum = 46, 
         ActionDescription = "", 
         Cost = 1000, 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "landmine mine", 
               Description = "A Blastech plasma mine.  Developed after the Imperial defeat at Yavin, this\
\13mine was used to saturate possible rebel bases.\
\13", 
            }, 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Name = "landmine mine", 
         ShortDescr = "a landmine", 
      }, 
      [50] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Description = "A Blastech E-11 blaster rifle was left here.", 
         ItemType = "weapon", 
         Vnum = 50, 
         ActionDescription = "", 
         Cost = 3250, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster Blastech E11 rifle E-11", 
               Description = "The most common weapon in use by either the Rebel Alliance, New Order, or\
\13planetary militias. This highpowered weapon was so mass produced when\
\13first seeing service with the New Order's stormtrooper corps, that between\
\13stolen shipments and weapons scavenged from battlefields, the Alliance had\
\13almost as many of these rifles as the Empire. Later, the weapon was\
\13'cloned' by SoroSuub as the Stormtrooper One, or SoroSuub One rifle.\
\13", 
            }, 
         }, 
         Weight = 10, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster Blastech E11 rifle E-11", 
         ShortDescr = "a Blastech E-11 blaster rifle", 
      }, 
      [51] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Description = "A Blastech DL-18 lies here on the floor.", 
         ItemType = "weapon", 
         Vnum = 51, 
         ActionDescription = "", 
         Cost = 3000, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster blastech dl-18 blaster pistol", 
               Description = "The DL-18 is a sleek, hand-held blaster built by Blas-Tech, often referred\
\13to as the \"Mos Eisley special\". \
\13", 
            }, 
         }, 
         Weight = 6, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster blastech dl-18 blaster pistol", 
         ShortDescr = "a blastech DL-18 blaster pistol", 
      }, 
      [52] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         Description = "A heavy blaster pistol was dropped here.", 
         ItemType = "weapon", 
         Vnum = 52, 
         ActionDescription = "", 
         Cost = 3600, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster blastech dl-44 heavy blaster pistol", 
               Description = "The DL-44 is a high powered hand blaster, often banned from civilian use in\
\13certain planetary systems.  Han Solo himself uses a modified version of\
\13the DL-44.\
\13", 
            }, 
         }, 
         Weight = 8, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
      }, 
      [53] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Description = "An assault rifle was left here.", 
         ItemType = "weapon", 
         Vnum = 53, 
         ActionDescription = "", 
         Cost = 3750, 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster blastech dlt-19 assault rifle", 
               Description = "The DLT-19 is a long, sleek blaster rifle was manufactured by BlasTech.\
\13Although it mainly sees use only in the stormtrooper corps, it saw heavy\
\13combat on the side of the Alliance during the Battle of Hoth.\
\13", 
            }, 
         }, 
         Weight = 12, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster blastech dlt-19 assault rifle", 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
      }, 
      [54] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         Description = "A repeating blaster is collecting dust.", 
         ItemType = "weapon", 
         Vnum = 54, 
         ActionDescription = "", 
         Cost = 3900, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long barreled blaster\
\13", 
            }, 
            [3] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
\13", 
            }, 
            [4] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
            }, 
            [5] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
            }, 
            [6] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
            }, 
            [7] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
\13", 
            }, 
            [8] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled blaster.\
\13", 
            }, 
         }, 
         Weight = 10, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blastech t-21 repeating blaster", 
         ShortDescr = "a Blastech T-21 repeating blaster", 
      }, 
      [55] = 
      {
         Layers = 0, 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
         ItemType = "weapon", 
         Vnum = 55, 
         ActionDescription = "", 
         Cost = 3700, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bryar pistol blaster", 
               Description = "The Bryar heavy blaster pistol. Although considered antique in comparisson\
\13with the new and more powerful BlasTech models, this old blaster still\
\13packs a punch.\
\13", 
            }, 
         }, 
         Weight = 8, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "bryar pistol blaster", 
         ShortDescr = "a Bryar heavy blaster pistol", 
      }, 
      [56] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -3, 
               Location = 18, 
            }, 
         }, 
         Description = "A cheap holdout blaster is here.", 
         ItemType = "weapon", 
         Vnum = 56, 
         ActionDescription = "", 
         Cost = 900, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 300, 
            [5] = 300, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster Budgetline 3.0/12 holdout", 
               Description = "A small, easily concealable blaster, the budgetline is used by undercover\
\13agents galaxy wide. It's lack of accuracy is made up for by it's stealth.\
\13", 
            }, 
         }, 
         Weight = 4, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blaster Budgetline 3.0/12 holdout", 
         ShortDescr = "a Budgetline 3.0/12", 
      }, 
      [57] = 
      {
         Layers = 0, 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         ItemType = "weapon", 
         Vnum = 57, 
         ActionDescription = "", 
         Cost = 2800, 
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
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Weight = 4, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "sorosuub q2 holdout blaster", 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
      }, 
      [58] = 
      {
         Layers = 0, 
         Description = "A very small blaster was dropped here.", 
         ItemType = "weapon", 
         Vnum = 58, 
         ActionDescription = "", 
         Cost = 2000, 
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
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "blastech last resort mini-blaster blaster", 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
      }, 
      [59] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 18, 
            }, 
         }, 
         Description = "A sharp looking blade is here.", 
         ItemType = "weapon", 
         Vnum = 59, 
         ActionDescription = "", 
         Cost = 350, 
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
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Weight = 4, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "long vibro-blade", 
         ShortDescr = "a long sharp vibro-blade", 
      }, 
      [60] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Description = "A blaster rifle was dropped here.", 
         ItemType = "weapon", 
         Vnum = 60, 
         ActionDescription = "", 
         Cost = 3000, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "Sorosuub One Blaster Rifle", 
         ShortDescr = "a Sorosuub One blaster rifle", 
      }, 
      [99] = 
      {
         Layers = 0, 
         Description = "Some god dropped a newly created final object here.", 
         ItemType = "trash", 
         Vnum = 99, 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Name = "final object", 
         ShortDescr = "a newly created final object", 
      }, 
      [90] = 
      {
         Layers = 0, 
         Description = "The suggestions board is here.", 
         ItemType = "furniture", 
         Vnum = 90, 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Name = "Suggestions Board", 
         ShortDescr = "the suggestions board", 
      }, 
      [70] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 5, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 5, 
               Location = 18, 
            }, 
         }, 
         Description = "The hilt of a lightsaber lies on the ground.", 
         ItemType = "weapon", 
         Vnum = 70, 
         ActionDescription = "", 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
               MudProgType = "remove_prog", 
               Arguments = "100", 
            }, 
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
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         Weight = 8, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "quest weapon double bladed lightsaber saber", 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
      }, 
      [71] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 16777216, 
               Location = 26, 
            }, 
            [2] = 
            {
               Modifier = 8, 
               Location = 18, 
            }, 
         }, 
         Description = "An evil looking battle helmet.", 
         ItemType = "armor", 
         Vnum = 71, 
         ActionDescription = "", 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
               MudProgType = "remove_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "quest armor mandalorian battle helmet", 
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
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
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         Weight = 10, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Name = "quest armor mandalorian battle helmet", 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
      }, 
      [72] = 
      {
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpoload 10313\
put ration item\
", 
               MudProgType = "use_prog", 
               Arguments = "100", 
            }, 
         }, 
         Description = "A dud is here.", 
         ItemType = "container", 
         Vnum = 72, 
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
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Name = "quest item", 
         ShortDescr = "Mystery Box 1", 
      }, 
      [73] = 
      {
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 67108864, 
               Location = 26, 
            }, 
            [2] = 
            {
               Modifier = 8192, 
               Location = 28, 
            }, 
         }, 
         Description = "A small energy device lies on the floor.", 
         ItemType = "armor", 
         Vnum = 73, 
         ActionDescription = "", 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
               MudProgType = "remove_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "quest shield", 
               Description = "A glowing energy shield that seems to pulse with power.  It looks strong\
\13enough to repel some blaster fire.\
\13", 
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
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Name = "quest shield generator", 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
      }, 
      [74] = 
      {
         Layers = 0, 
         Description = "A dud is here.", 
         ItemType = "trash", 
         Vnum = 74, 
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
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Name = "quest item dinner", 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
      }, 
      [75] = 
      {
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "if questobj($n) == 75\
mpechoat $n &YYou have found the sapphire!  Return to your employer!\
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop sapphire\
endif\
", 
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         ItemType = "treasure", 
         Vnum = 75, 
         ActionDescription = "", 
         Cost = 0, 
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
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "quest token sapphire", 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
      }, 
      [76] = 
      {
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "if questobj($n) == 76\
mpechoat $n &YYou have found the diamond!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop diamond\
endif\
", 
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         ItemType = "treasure", 
         Vnum = 76, 
         ActionDescription = "", 
         Cost = 0, 
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
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "quest token diamond", 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
      }, 
      [77] = 
      {
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "if questobj($n) == 77\
mpechoat $n &YYou have found the emerald!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop emerald\
endif\
", 
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         ItemType = "treasure", 
         Vnum = 77, 
         ActionDescription = "", 
         Cost = 0, 
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
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "quest token emerald", 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
      }, 
      [78] = 
      {
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "if questobj($n) == 78\
mpechoat $n &YYou have found the amythest!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpfroce $n drop amythest\
endif\
", 
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         ItemType = "treasure", 
         Vnum = 78, 
         ActionDescription = "", 
         Cost = 0, 
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
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "quest token amythest", 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
      }, 
      [79] = 
      {
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "if questobj($n) == 79\
mpecohat $n &YYou have found the ruby!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this! \
mpforce $n drop ruby\
endif\
", 
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         ItemType = "treasure", 
         Vnum = 79, 
         ActionDescription = "", 
         Cost = 0, 
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
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "quest token ruby", 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
      }, 
   }, 
   Rooms = 
   {
      [1] = 
      {
         TeleVnum = 0, 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
         Name = "&CCorrans Insane Apartment&g", 
         Vnum = 1, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
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
               MudProgType = "speech_prog", 
               Arguments = "test", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
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
               MudProgType = "speech_prog", 
               Arguments = "test2", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "mpdamage $n 234234\
", 
               MudProgType = "speech_prog", 
               Arguments = "die", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 100, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 107, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [2] = 
      {
         TeleVnum = 0, 
         Description = "", 
         Name = "Limbo", 
         Vnum = 2, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 32145, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "inside", 
      }, 
      [3] = 
      {
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Name = "An Empty Home", 
         Vnum = 3, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "inside", 
      }, 
      [4] = 
      {
         TeleVnum = 0, 
         Description = "This room is reserved for future use.\
", 
         Name = "Storage", 
         Vnum = 4, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "inside", 
      }, 
      [5] = 
      {
         TeleVnum = 0, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 5, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [6] = 
      {
         TeleVnum = 0, 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         Vnum = 6, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [10] = "Safe", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [7] = 
      {
         TeleVnum = 0, 
         Description = "", 
         Name = "Mobprog Purge Room", 
         Vnum = 7, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mppurge\
", 
               MudProgType = "speech_prog", 
               Arguments = "purge", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [8] = 
      {
         TeleVnum = 0, 
         Description = "", 
         Name = "Immhood ClanStoreRoom", 
         Vnum = 8, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [10] = 
      {
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Name = "An Empty Home", 
         Vnum = 10, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
               MudProgType = "speech_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 100, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "inside", 
      }, 
      [11] = 
      {
         TeleVnum = 0, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 11, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [12] = 
      {
         TeleVnum = 0, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 12, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [19] = 
      {
         TeleVnum = 0, 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
         Name = "Incognito Platform", 
         Vnum = 19, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [4] = "CanLand", 
            [5] = "CanFly", 
            [30] = "Prototype", 
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [20] = 
      {
         TeleVnum = 0, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 20, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [29] = 
      {
         TeleVnum = 0, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         Vnum = 29, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 32, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 33, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [30] = 
      {
         TeleVnum = 0, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         Vnum = 30, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 40, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 31, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 33, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 29, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [31] = 
      {
         TeleVnum = 0, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         Vnum = 31, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 34, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 30, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 33, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [32] = 
      {
         TeleVnum = 0, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         Vnum = 32, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 29, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 33, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 35, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [33] = 
      {
         TeleVnum = 0, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         Vnum = 33, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 34, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 36, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 32, 
            }, 
            [5] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 31, 
            }, 
            [6] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 29, 
            }, 
            [7] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 37, 
            }, 
            [8] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 35, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [34] = 
      {
         TeleVnum = 0, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         Vnum = 34, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 31, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 37, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 33, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [35] = 
      {
         TeleVnum = 0, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         Vnum = 35, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 32, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 36, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 33, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [36] = 
      {
         TeleVnum = 0, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         Vnum = 36, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 33, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 37, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 38, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 35, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [37] = 
      {
         TeleVnum = 0, 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         Name = "The Arena", 
         Vnum = 37, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 34, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 36, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 33, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [38] = 
      {
         TeleVnum = 0, 
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
         Name = "Southern Sniper Tower Entrance", 
         Vnum = 38, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 36, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "up", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 39, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "inside", 
      }, 
      [39] = 
      {
         TeleVnum = 0, 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Name = "Southern Sniper Tower", 
         Vnum = 39, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 36, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "down", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 38, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "northeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 37, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "northwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 35, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "inside", 
      }, 
      [40] = 
      {
         TeleVnum = 0, 
         Description = "This large room is the main entrance to the Northern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising a portion of the arena. The lighting is\
quite dim, and the bellowing echoes of the crowd would be quite\
distracting to the untrained fighter. The walls are of thick duratanium,\
and many charred blaster/explosive marks are strewn about the entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
         Name = "Northern Sniper Tower Entrance", 
         Vnum = 40, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "up", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 41, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "inside", 
      }, 
      [41] = 
      {
         TeleVnum = 0, 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Name = "Northern Sniper Tower", 
         Vnum = 41, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "down", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 40, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "southeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 31, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Direction = "southwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 29, 
            }, 
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "inside", 
      }, 
      [42] = 
      {
         TeleVnum = 0, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Name = "First Combatant's Chamber", 
         Vnum = 42, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [43] = 
      {
         TeleVnum = 0, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Name = "Second Combatant's Chamber", 
         Vnum = 43, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [44] = 
      {
         TeleVnum = 0, 
         Description = "", 
         Name = "Lost in Space", 
         Vnum = 44, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
      [45] = 
      {
         TeleVnum = 0, 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         Name = "Limbo Shipyard", 
         Vnum = 45, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Tag = "", 
         Sector = "city", 
      }, 
   }, 
   Author = "RoD/Durga", 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Arg3 = 2, 
         Arg1 = 1, 
         MiscData = 0, 
         Command = "M", 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Arg1 = 90, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 6, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 2, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 7, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 7, 
         MiscData = 1, 
         Command = "O", 
      }, 
   }, 
}
