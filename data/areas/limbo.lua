-- Limbo
-- Last saved Wednesday 25-Nov-2020 23:27:13

AreaEntry
{
   ResetFrequency = 0, 
   FileFormatVersion = 1, 
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
   Name = "Limbo", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg3 = 2, 
         Arg1 = 1, 
         Arg2 = 1, 
         MiscData = 0, 
      }, 
      [2] = 
      {
         Command = "O", 
         Arg3 = 10, 
         Arg1 = 90, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Command = "M", 
         Arg3 = 6, 
         Arg1 = 6, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Command = "M", 
         Arg3 = 6, 
         Arg1 = 2, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Command = "M", 
         Arg3 = 6, 
         Arg1 = 7, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Command = "O", 
         Arg3 = 6, 
         Arg1 = 7, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
   }, 
   LowEconomy = 41915975, 
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
   Mobiles = 
   {
      [1] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
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
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
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
            }, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 30550, 
            HitNoDice = 5, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         ArmorClass = -30, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "", 
         Level = 50, 
         Vnum = 1, 
         Race = "Gand", 
         Credits = 10000, 
         Name = "Puff", 
         Languages = 
         {
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
         }, 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "Puff", 
         Sex = "female", 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 10, 
            DamPlus = 200, 
         }, 
         Alignment = 1000, 
         Height = 0, 
      }, 
      [2] = 
      {
         ArmorClass = -300, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "p bashes against", 
               Code = "cast heal $n\
cast heal $n\
", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "p shivers and", 
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "p wears", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "p wields", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
            [5] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "p is DEAD!!", 
               Code = "mptrans $n 6\
", 
            }, 
            [6] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "25", 
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
            }, 
            [7] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "p is dying", 
               Code = "mpforce $n drink\
c heal $n\
", 
            }, 
            [8] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "p is starved", 
               Code = "mpoload 20\
give roll $n\
mpforce $n eat roll\
cast heal $n\
emote cackles happily\
say Oh, the ponies!\
", 
            }, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 31550, 
            HitNoDice = 5, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         Level = 50, 
         Vnum = 2, 
         Race = "Human", 
         Credits = 10000, 
         Name = "Richard Simmons", 
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
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "Richard Simmons", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 2, 
            DamPlus = 2, 
         }, 
         Alignment = -1000, 
         Height = 0, 
      }, 
      [3] = 
      {
         ArmorClass = -162, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "25", 
               Code = "mpinvis 101\
", 
            }, 
            [2] = 
            {
               MudProgType = "entry_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpinvis 101\
", 
            }, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1050, 
            HitNoDice = 21, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 21, 
         NumberOfAttacks = 0, 
         HitRoll = 21, 
         Tag = "", 
         Weight = 0, 
         Description = "How clever he looks!\
", 
         Level = 105, 
         Vnum = 3, 
         Race = "Human", 
         Credits = 10000, 
         Name = "supermob", 
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
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "the supermob", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Alignment = -1000, 
         Height = 0, 
      }, 
      [4] = 
      {
         DefaultPosition = "standing", 
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
            KeeperShortDescr = "a vendor", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
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
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 103, 
         Vnum = 4, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "a vendor", 
         Languages = 
         {
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
         }, 
         LongDescr = "A Vendor owned by %s\
", 
         ArmorClass = 0, 
         ShortDescr = "a vendor", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [5] = 
      {
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 5, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "undead animated corpse", 
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
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         ArmorClass = 0, 
         ShortDescr = "an animated corpse", 
         Position = "standing", 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [6] = 
      {
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 6, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "Rosie O'Donnel", 
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
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         ArmorClass = 0, 
         ShortDescr = "Rosie O'Donnel...", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = -1000, 
         Height = 0, 
      }, 
      [7] = 
      {
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "p is thirsty", 
               Code = "mpforce $n drink\
emote grins quietly\
say After no dose stopped giving me\
cash...\
say The wife HAD to go.\
", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 7, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "Al Gore", 
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
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         ArmorClass = 0, 
         ShortDescr = "a newly created Al Gore", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [10] = 
      {
         DefaultPosition = "standing", 
         Race = "_69", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 16, 
         HitRoll = 16, 
         Tag = "", 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Level = 80, 
         Vnum = 10, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 800, 
            HitNoDice = 16, 
         }, 
         Credits = 0, 
         Name = "mauzumi die wolf", 
         Languages = 
         {
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
         }, 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         ArmorClass = -100, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         Position = "standing", 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 8, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [11] = 
      {
         ArmorClass = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 2, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         Level = 1, 
         Vnum = 11, 
         Race = "_85", 
         Credits = 0, 
         Name = "mist", 
         Languages = 
         {
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
         }, 
         LongDescr = "A thick mist plays with your senses.\
", 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "mist", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [12] = 
      {
         ArmorClass = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 2, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         Level = 1, 
         Vnum = 12, 
         Race = "Barabel", 
         Credits = 0, 
         Name = "bat", 
         Languages = 
         {
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
         }, 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "bat", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [13] = 
      {
         ArmorClass = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 2, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         Level = 1, 
         Vnum = 13, 
         Race = "_78", 
         Credits = 0, 
         Name = "hawk", 
         Languages = 
         {
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
         }, 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "hawk", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [14] = 
      {
         ArmorClass = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 2, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         Level = 1, 
         Vnum = 14, 
         Race = "Gran", 
         Credits = 0, 
         Name = "black cat", 
         Languages = 
         {
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
         }, 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "black cat", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [15] = 
      {
         ArmorClass = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 1, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         Level = 1, 
         Vnum = 15, 
         Race = "_78", 
         Credits = 0, 
         Name = "dove", 
         Languages = 
         {
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
         }, 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "dove", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [16] = 
      {
         ArmorClass = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 1, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         Level = 1, 
         Vnum = 16, 
         Race = "_81", 
         Credits = 0, 
         Name = "fish", 
         Languages = 
         {
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
         }, 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "fish", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [20] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 75, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 2, 
         HitRoll = 2, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 10, 
         Vnum = 20, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         Credits = 0, 
         Name = "imperial trooper stormtrooper", 
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
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         ShortDescr = "a stormtrooper", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [21] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 21, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "imperial guard stormtrooper", 
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
         LongDescr = "An imperial guard stands at attention.\
", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "an imperial guard", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [22] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 22, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "Rebel Alliance guard", 
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
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "a Rebel Alliance guard", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [23] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 23, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "Rebel Alliance Trooper soldier", 
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
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         ShortDescr = "a rebel alliance trooper", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [24] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 1, 
         Weight = 0, 
         Level = 1, 
         Vnum = 24, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "A mercenary", 
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
         LongDescr = "A mercenary stands here ready for battle.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         ShortDescr = "a mercenary", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [25] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 25, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "bouncer guard thug", 
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
         LongDescr = "An alert guard stands at attention.\
", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "a guard", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [26] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 3, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "", 
         Level = 1, 
         Vnum = 26, 
         Race = "Human", 
         Credits = 0, 
         Name = "Imperial Elite Guard", 
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
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "an imperial guard", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [27] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 27, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "The Empire", 
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
         LongDescr = "An imperial guard stands at attention.\
", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "an imperial guard", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [28] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 75, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 10, 
         Vnum = 28, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         Credits = 0, 
         Name = "an imperial specfor trooper", 
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
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         ShortDescr = "a stormtrooper", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [29] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 3, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "", 
         Level = 1, 
         Vnum = 29, 
         Race = "Human", 
         Credits = 0, 
         Name = "rebel elite guard", 
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
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "a Rebel Alliance guard", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [30] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 30, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "The Rebel Alliance", 
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
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "a Rebel Alliance guard", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [31] = 
      {
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 3, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "", 
         Level = 1, 
         Vnum = 31, 
         Race = "Human", 
         Credits = 0, 
         Name = "a rebel specfor trooper", 
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
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "a rebel alliance trooper", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [32] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         NumberOfAttacks = 3, 
         HitRoll = 0, 
         Tag = "", 
         Weight = 0, 
         Description = "", 
         Level = 1, 
         Vnum = 32, 
         Race = "Human", 
         Credits = 0, 
         Name = "a merc elite guard", 
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
         LongDescr = "An elite guard stands at rigid attention.\
", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "a guard", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [40] = 
      {
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "autopilot", 
               Code = "mpat 5991 autopilot\
", 
            }, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         DamRoll = 21, 
         HitRoll = 21, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 105, 
         Vnum = 40, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1050, 
            HitNoDice = 21, 
         }, 
         Credits = 0, 
         Name = "Ship Upgrades Technician", 
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
         LongDescr = "The ship upgrades technician is here.\
", 
         ArmorClass = -162, 
         ShortDescr = "the ship upgrades technician", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [33] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 33, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "bouncer guard thug", 
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
         LongDescr = "An alert guard stands at attention.\
", 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "a guard", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [50] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "give", 
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "shop", 
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
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
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "corusca", 
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
            }, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 5000, 
            HitNoDice = 21, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         ArmorClass = -162, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         Immune = 
         {
            [20] = "magic", 
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
         DamRoll = 21, 
         NumberOfAttacks = 0, 
         HitRoll = 21, 
         Tag = "", 
         Weight = 0, 
         Description = "", 
         Level = 105, 
         Vnum = 50, 
         Race = "Human", 
         Credits = 0, 
         Name = "Master Yoda", 
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
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         ShortDescr = "Jedi Master Yoda", 
         Sex = "male", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Alignment = 1000, 
         Height = 0, 
      }, 
      [98] = 
      {
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpat 32179 drop all\
", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 98, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "janitor", 
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
         LongDescr = "A janitor cleans up the ship here.\
", 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         ShortDescr = "a janitor", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
      [34] = 
      {
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Intelligence = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Tag = "", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Level = 1, 
         Vnum = 34, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         Name = "A mercenary", 
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
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         ArmorClass = 0, 
         ShortDescr = "a mercenary", 
         Position = "standing", 
         Description = "", 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Alignment = 0, 
         Height = 0, 
      }, 
   }, 
   Filename = "limbo.lua", 
   Objects = 
   {
      [2] = 
      {
         Cost = 0, 
         ShortDescr = "a credit", 
         Description = "One miserable credit.", 
         Name = "credit credits", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "money", 
         Tag = "", 
         Vnum = 2, 
      }, 
      [3] = 
      {
         Cost = 0, 
         ShortDescr = "%d credits", 
         Description = "Some credits.", 
         Name = "credits credit", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "money", 
         Tag = "", 
         Vnum = 3, 
      }, 
      [4] = 
      {
         Cost = 0, 
         ShortDescr = "A deed", 
         Description = "A deed for a shop", 
         Name = "deed", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "paper", 
         Tag = "", 
         Vnum = 4, 
      }, 
      [5] = 
      {
         Cost = 100000, 
         ShortDescr = "a metal amulet", 
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
         Name = "an amulet", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [8] = "Bless", 
            [5] = "Invis", 
            [6] = "Magic", 
            [21] = "ClanObject", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "armor", 
         Tag = "", 
         Vnum = 5, 
      }, 
      [6] = 
      {
         Cost = 0, 
         ShortDescr = "A small charm", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2097152, 
               Location = 27, 
            }, 
         }, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         Name = "charm", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "armor", 
         Tag = "", 
         Vnum = 6, 
      }, 
      [7] = 
      {
         Cost = 0, 
         ShortDescr = "Tipper Gore!", 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         Name = "Tipper Gore", 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "fountain", 
         Tag = "", 
         Vnum = 7, 
      }, 
      [9] = 
      {
         Cost = 0, 
         ShortDescr = "the broken parts of %s", 
         Description = "The shattered remains of %s are here.", 
         Name = "corpse remains pieces parts", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "droid_corpse", 
         Tag = "", 
         Vnum = 9, 
      }, 
      [10] = 
      {
         Cost = 0, 
         ShortDescr = "the corpse of %s", 
         Description = "The corpse of %s lies here.", 
         Name = "corpse", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 100, 
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
         ItemType = "corpse", 
         Tag = "", 
         Vnum = 10, 
      }, 
      [11] = 
      {
         Cost = 0, 
         ShortDescr = "the corpse of %s", 
         Description = "The corpse of %s is lying here.", 
         Name = "corpse", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 100, 
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
         ItemType = "corpse_pc", 
         Tag = "", 
         Vnum = 11, 
      }, 
      [12] = 
      {
         Cost = 0, 
         ShortDescr = "the head of %s", 
         Description = "The severed head of %s is lying here.", 
         Name = "head", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         Layers = 0, 
         Weight = 5, 
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
         ItemType = "food", 
         Tag = "", 
         Vnum = 12, 
      }, 
      [13] = 
      {
         Cost = 0, 
         ShortDescr = "the heart of %s", 
         Description = "The torn-out heart of %s is lying here.", 
         Name = "heart", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s savagely devour$q $p!", 
         Layers = 0, 
         Weight = 2, 
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
         ItemType = "food", 
         Tag = "", 
         Vnum = 13, 
      }, 
      [14] = 
      {
         Cost = 0, 
         ShortDescr = "the arm of %s", 
         Description = "The sliced-off arm of %s is lying here.", 
         Name = "arm", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s chomp$q on $p.", 
         Layers = 0, 
         Weight = 5, 
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
         ItemType = "food", 
         Tag = "", 
         Vnum = 14, 
      }, 
      [15] = 
      {
         Cost = 0, 
         ShortDescr = "the leg of %s", 
         Description = "The sliced-off leg of %s is lying here.", 
         Name = "leg", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s chomp$q on $p.", 
         Layers = 0, 
         Weight = 5, 
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
         ItemType = "food", 
         Tag = "", 
         Vnum = 15, 
      }, 
      [16] = 
      {
         Cost = 0, 
         ShortDescr = "the spilled guts of %s", 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         Name = "guts", 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "trash", 
         Tag = "", 
         Vnum = 16, 
      }, 
      [17] = 
      {
         Cost = 0, 
         ShortDescr = "the spilled blood", 
         Description = "A pool of spilled blood lies here.", 
         Name = "blood", 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "_blood", 
         Tag = "", 
         Vnum = 17, 
      }, 
      [18] = 
      {
         Cost = 0, 
         ShortDescr = "the bloodstain", 
         Description = "Blood stains the ground.", 
         Name = "bloodstain", 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "_bloodstain", 
         Tag = "", 
         Vnum = 18, 
      }, 
      [19] = 
      {
         Cost = 0, 
         ShortDescr = "the scraps of %s", 
         Description = "The scraps of %s lie here.", 
         Name = "scraps", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "scraps", 
         Tag = "", 
         Vnum = 19, 
      }, 
      [20] = 
      {
         Cost = 10, 
         ShortDescr = "a fruit roll-up", 
         Description = "A fruit roll-up lies here", 
         Name = "fruit roll-up", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s enjoy$q $p.", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "food", 
         Tag = "", 
         Vnum = 20, 
      }, 
      [21] = 
      {
         Cost = 0, 
         ShortDescr = "a bright ball of light", 
         Description = "A bright ball of light shimmers in the air.", 
         Name = "ball light", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "light", 
         Tag = "", 
         Vnum = 21, 
      }, 
      [22] = 
      {
         Cost = 10, 
         ShortDescr = "a magical spring", 
         Description = "A magical spring flows here.", 
         Name = "spring", 
         ActionDescription = "", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "fountain", 
         Tag = "", 
         Vnum = 22, 
      }, 
      [23] = 
      {
         Cost = 0, 
         ShortDescr = "the skin of %s", 
         Description = "The skin of %s", 
         Name = "the skin of %s", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 25, 
            }, 
         }, 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "fabric", 
         Tag = "", 
         Vnum = 23, 
      }, 
      [24] = 
      {
         Cost = 0, 
         ShortDescr = "a slice of raw meat from %s", 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         Name = "meat fresh slice", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Layers = 0, 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "food", 
         Tag = "", 
         Vnum = 24, 
      }, 
      [25] = 
      {
         Cost = 20, 
         ShortDescr = "a bag", 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         Name = "shopping bag", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 2, 
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
         ItemType = "container", 
         Tag = "", 
         Vnum = 25, 
      }, 
      [26] = 
      {
         Cost = 0, 
         ShortDescr = "A ship part for %s", 
         Description = "What looks like a part of a ship lies here.", 
         Name = "fighter module", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "fightercomp", 
         Tag = "", 
         Vnum = 26, 
      }, 
      [27] = 
      {
         Cost = 0, 
         ShortDescr = "A midsize ship part for %s", 
         Description = "What looks like a decent size part for a ship lies here.", 
         Name = "midsize midship module", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 150, 
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
         ItemType = "midcomp", 
         Tag = "", 
         Vnum = 27, 
      }, 
      [28] = 
      {
         Cost = 0, 
         ShortDescr = "A capital-class ship part for %s", 
         Description = "What looks like a huge ship part lies here.", 
         Name = "capship capital module", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 350, 
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
         ItemType = "capitalcomp", 
         Tag = "", 
         Vnum = 28, 
      }, 
      [30] = 
      {
         Cost = 10, 
         ShortDescr = "a magical fire", 
         Description = "A magical fire burns brightly.", 
         Name = "fire", 
         ActionDescription = "", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "fire", 
         Tag = "", 
         Vnum = 30, 
      }, 
      [31] = 
      {
         Cost = 10, 
         ShortDescr = "a trap", 
         Description = "You detect a trap.", 
         Name = "trap", 
         ActionDescription = "", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trap", 
         Tag = "", 
         Vnum = 31, 
      }, 
      [32] = 
      {
         Cost = 10, 
         ShortDescr = "a portal", 
         Description = "A misty portal beckons you to the unknown.", 
         Name = "portal", 
         ActionDescription = "", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "_portal", 
         Tag = "", 
         Vnum = 32, 
      }, 
      [33] = 
      {
         Cost = 48000, 
         ShortDescr = "black poisoning powder", 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         Name = "black poison powder", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Tag = "", 
         Vnum = 33, 
      }, 
      [34] = 
      {
         Cost = 10000, 
         ShortDescr = "a blank scroll", 
         Description = "A blank scroll lays here gathering dust.", 
         Name = "scroll scribing blank", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 2, 
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
         ItemType = "scroll", 
         Tag = "", 
         Vnum = 34, 
      }, 
      [35] = 
      {
         Cost = 15000, 
         ShortDescr = "an empty flask", 
         Description = "An empty flask lays here gathering dust.", 
         Name = "flask empty", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "potion", 
         Tag = "", 
         Vnum = 35, 
      }, 
      [36] = 
      {
         Cost = 1500, 
         ShortDescr = "a message disk", 
         Description = "A message disk has been discarded here.", 
         Name = "parchment paper note data disk message info", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "paper", 
         Tag = "", 
         Vnum = 36, 
      }, 
      [37] = 
      {
         Cost = 2000, 
         ShortDescr = "a datapad", 
         Description = "A datapad used for recording message disks is here.", 
         Name = "quill pen datapad recorder message disk", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 2, 
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
         ItemType = "pen", 
         Tag = "", 
         Vnum = 37, 
      }, 
      [38] = 
      {
         Cost = 0, 
         ShortDescr = "a mail terminal", 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         Name = "mail terminal", 
         ActionDescription = "", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
         Tag = "mail_terminal", 
         Vnum = 38, 
      }, 
      [43] = 
      {
         Cost = 0, 
         ShortDescr = "a symbol of faith", 
         Description = "A holy symbol lies here, shining.", 
         Name = "holy symbol faith", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 4, 
            }, 
         }, 
         Layers = 0, 
         Weight = 5, 
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
         ItemType = "armor", 
         Tag = "", 
         Vnum = 43, 
      }, 
      [45] = 
      {
         Cost = 1200, 
         ShortDescr = "a grenade", 
         Description = "A grenade .... run!!!!", 
         Name = "grenade", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "grenade", 
         Tag = "", 
         Vnum = 45, 
      }, 
      [46] = 
      {
         Cost = 1000, 
         ShortDescr = "a landmine", 
         Description = "Don't step on the landmine.", 
         Name = "landmine mine", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 1, 
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
         ItemType = "landmine", 
         Tag = "", 
         Vnum = 46, 
      }, 
      [50] = 
      {
         Cost = 3250, 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         Description = "A Blastech E-11 blaster rifle was left here.", 
         Name = "blaster Blastech E11 rifle E-11", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Layers = 0, 
         Weight = 10, 
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
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 50, 
      }, 
      [51] = 
      {
         Cost = 3000, 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         Description = "A Blastech DL-18 lies here on the floor.", 
         Name = "blaster blastech dl-18 blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Layers = 0, 
         Weight = 6, 
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
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 51, 
      }, 
      [52] = 
      {
         Cost = 3600, 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         Description = "A heavy blaster pistol was dropped here.", 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         Layers = 0, 
         Weight = 8, 
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
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 52, 
      }, 
      [53] = 
      {
         Cost = 3750, 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         Description = "An assault rifle was left here.", 
         Name = "blaster blastech dlt-19 assault rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Layers = 0, 
         Weight = 12, 
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
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 53, 
      }, 
      [54] = 
      {
         Cost = 3900, 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         Description = "A repeating blaster is collecting dust.", 
         Name = "blastech t-21 repeating blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         Layers = 0, 
         Weight = 10, 
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
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
            }, 
            [3] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
\13", 
            }, 
            [4] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled blaster.\
\13", 
            }, 
            [5] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "", 
            }, 
            [6] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long barreled blaster\
\13", 
            }, 
            [7] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
\13", 
            }, 
            [8] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
            }, 
         }, 
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 54, 
      }, 
      [55] = 
      {
         Cost = 3700, 
         ShortDescr = "a Bryar heavy blaster pistol", 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
         Name = "bryar pistol blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Weight = 8, 
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
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 55, 
      }, 
      [56] = 
      {
         Cost = 900, 
         ShortDescr = "a Budgetline 3.0/12", 
         Description = "A cheap holdout blaster is here.", 
         Name = "blaster Budgetline 3.0/12 holdout", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -3, 
               Location = 18, 
            }, 
         }, 
         Layers = 0, 
         Weight = 4, 
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
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 56, 
      }, 
      [57] = 
      {
         Cost = 2800, 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         Name = "sorosuub q2 holdout blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         Weight = 4, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 57, 
      }, 
      [58] = 
      {
         Cost = 2000, 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         Description = "A very small blaster was dropped here.", 
         Name = "blastech last resort mini-blaster blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         Weight = 3, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 58, 
      }, 
      [59] = 
      {
         Cost = 350, 
         ShortDescr = "a long sharp vibro-blade", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 18, 
            }, 
         }, 
         Description = "A sharp looking blade is here.", 
         Name = "long vibro-blade", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         Weight = 4, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 2, 
            [4] = 100, 
            [5] = 110, 
            [0] = 12, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 59, 
      }, 
      [60] = 
      {
         Cost = 3000, 
         ShortDescr = "a Sorosuub One blaster rifle", 
         Description = "A blaster rifle was dropped here.", 
         Name = "Sorosuub One Blaster Rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Layers = 0, 
         Weight = 10, 
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
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 60, 
      }, 
      [99] = 
      {
         Cost = 0, 
         ShortDescr = "a newly created final object", 
         Description = "Some god dropped a newly created final object here.", 
         Name = "final object", 
         ActionDescription = "", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Tag = "", 
         Vnum = 99, 
      }, 
      [90] = 
      {
         Cost = 0, 
         ShortDescr = "the suggestions board", 
         Description = "The suggestions board is here.", 
         Name = "Suggestions Board", 
         ActionDescription = "", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
         Tag = "", 
         Vnum = 90, 
      }, 
      [70] = 
      {
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
            }, 
         }, 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
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
         Name = "quest weapon double bladed lightsaber saber", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         Layers = 0, 
         Weight = 8, 
         ObjectValues = 
         {
            [1] = 53, 
            [2] = 3, 
            [3] = 1, 
            [4] = 5000, 
            [5] = 5000, 
            [0] = 1000, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "weapon", 
         Tag = "", 
         Vnum = 70, 
      }, 
      [71] = 
      {
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
            }, 
         }, 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
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
         Name = "quest armor mandalorian battle helmet", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         Layers = 0, 
         Weight = 10, 
         ObjectValues = 
         {
            [1] = 25, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
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
         ItemType = "armor", 
         Tag = "", 
         Vnum = 71, 
      }, 
      [72] = 
      {
         Cost = 0, 
         ShortDescr = "Mystery Box 1", 
         Description = "A dud is here.", 
         Name = "quest item", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpoload 10313\
put ration item\
", 
            }, 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Layers = 0, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "container", 
         Tag = "", 
         Vnum = 72, 
      }, 
      [73] = 
      {
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
            }, 
         }, 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
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
         Name = "quest shield generator", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Layers = 0, 
         Weight = 3, 
         ObjectValues = 
         {
            [1] = 30, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
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
         ItemType = "armor", 
         Tag = "", 
         Vnum = 73, 
      }, 
      [74] = 
      {
         Cost = 0, 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
         Description = "A dud is here.", 
         Name = "quest item dinner", 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Tag = "", 
         Vnum = 74, 
      }, 
      [75] = 
      {
         Cost = 0, 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if questobj($n) == 75\
mpechoat $n &YYou have found the sapphire!  Return to your employer!\
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop sapphire\
endif\
", 
            }, 
         }, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         Name = "quest token sapphire", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Layers = 0, 
         Weight = 2, 
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
         ItemType = "treasure", 
         Tag = "", 
         Vnum = 75, 
      }, 
      [76] = 
      {
         Cost = 0, 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if questobj($n) == 76\
mpechoat $n &YYou have found the diamond!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop diamond\
endif\
", 
            }, 
         }, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         Name = "quest token diamond", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "treasure", 
         Tag = "", 
         Vnum = 76, 
      }, 
      [77] = 
      {
         Cost = 0, 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if questobj($n) == 77\
mpechoat $n &YYou have found the emerald!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop emerald\
endif\
", 
            }, 
         }, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         Name = "quest token emerald", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "treasure", 
         Tag = "", 
         Vnum = 77, 
      }, 
      [78] = 
      {
         Cost = 0, 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if questobj($n) == 78\
mpechoat $n &YYou have found the amythest!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpfroce $n drop amythest\
endif\
", 
            }, 
         }, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         Name = "quest token amythest", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "treasure", 
         Tag = "", 
         Vnum = 78, 
      }, 
      [79] = 
      {
         Cost = 0, 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if questobj($n) == 79\
mpecohat $n &YYou have found the ruby!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this! \
mpforce $n drop ruby\
endif\
", 
            }, 
         }, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         Name = "quest token ruby", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         ItemType = "treasure", 
         Tag = "", 
         Vnum = 79, 
      }, 
   }, 
   HighEconomy = 0, 
   Rooms = 
   {
      [1] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 100, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 107, 
            }, 
         }, 
         Vnum = 1, 
         Sector = "city", 
         Name = "&CCorrans Insane Apartment&g", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
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
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
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
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "die", 
               Code = "mpdamage $n 234234\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
      }, 
      [2] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 32145, 
            }, 
         }, 
         Vnum = 2, 
         Sector = "inside", 
         Name = "Limbo", 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "", 
      }, 
      [3] = 
      {
         Exits = 
         {
         }, 
         Vnum = 3, 
         Sector = "inside", 
         Name = "Supermob Office", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [4] = 
      {
         Exits = 
         {
         }, 
         Vnum = 4, 
         Sector = "inside", 
         Name = "Spawn Location for Scripts", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "The Imp functions spawnobj() and spawnmob() will dump their result here.\
Needless to say you should use tocontainer() to put it where it's supposed\
to go.\
\
IF THERE IS ANYTHING IN THIS ROOM, IT MEANS SOME SCRIPT IS MISBEHAVING.\
", 
      }, 
      [5] = 
      {
         Exits = 
         {
         }, 
         Vnum = 5, 
         Sector = "city", 
         Name = "Vendor Storage", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "", 
      }, 
      [6] = 
      {
         Exits = 
         {
         }, 
         Vnum = 6, 
         Sector = "city", 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         Tunnel = 0, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [10] = "Safe", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
      }, 
      [7] = 
      {
         Exits = 
         {
         }, 
         Vnum = 7, 
         Sector = "city", 
         Name = "Mobprog Purge Room", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "purge", 
               Code = "mppurge\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "", 
      }, 
      [8] = 
      {
         Exits = 
         {
         }, 
         Vnum = 8, 
         Sector = "city", 
         Name = "Immhood ClanStoreRoom", 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "", 
      }, 
      [10] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 100, 
            }, 
         }, 
         Vnum = 10, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11] = 
      {
         Exits = 
         {
         }, 
         Vnum = 11, 
         Sector = "city", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "", 
      }, 
      [12] = 
      {
         Exits = 
         {
         }, 
         Vnum = 12, 
         Sector = "city", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "", 
      }, 
      [19] = 
      {
         Exits = 
         {
         }, 
         Vnum = 19, 
         Sector = "city", 
         Name = "Incognito Platform", 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [4] = "CanLand", 
            [5] = "CanFly", 
            [30] = "Prototype", 
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
      }, 
      [20] = 
      {
         Exits = 
         {
         }, 
         Vnum = 20, 
         Sector = "city", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "", 
      }, 
      [29] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 32, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         Vnum = 29, 
         Sector = "city", 
         Name = "The Arena", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [30] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 40, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
         }, 
         Vnum = 30, 
         Sector = "city", 
         Name = "The Arena", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [31] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 34, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         Vnum = 31, 
         Sector = "city", 
         Name = "The Arena", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [32] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
         Vnum = 32, 
         Sector = "city", 
         Name = "The Arena", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [33] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 34, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 32, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
         Vnum = 33, 
         Sector = "city", 
         Name = "The Arena", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [34] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         Vnum = 34, 
         Sector = "city", 
         Name = "The Arena", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [35] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 32, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         Vnum = 35, 
         Sector = "city", 
         Name = "The Arena", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [36] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 38, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
         Vnum = 36, 
         Sector = "city", 
         Name = "The Arena", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [37] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 34, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
         Vnum = 37, 
         Sector = "city", 
         Name = "The Arena", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
      }, 
      [38] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 39, 
            }, 
         }, 
         Vnum = 38, 
         Sector = "inside", 
         Name = "Southern Sniper Tower Entrance", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
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
      }, 
      [39] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 38, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "northeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Direction = "northwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
         Vnum = 39, 
         Sector = "inside", 
         Name = "Southern Sniper Tower", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
      }, 
      [40] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 41, 
            }, 
         }, 
         Vnum = 40, 
         Sector = "inside", 
         Name = "Northern Sniper Tower Entrance", 
         Tunnel = 0, 
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
               ScriptType = "MProg", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "This large room is the main entrance to the Northern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising a portion of the arena. The lighting is\
quite dim, and the bellowing echoes of the crowd would be quite\
distracting to the untrained fighter. The walls are of thick duratanium,\
and many charred blaster/explosive marks are strewn about the entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
      }, 
      [41] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 40, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Direction = "southeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Direction = "southwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Description = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
         }, 
         Vnum = 41, 
         Sector = "inside", 
         Name = "Northern Sniper Tower", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
      }, 
      [42] = 
      {
         Exits = 
         {
         }, 
         Vnum = 42, 
         Sector = "city", 
         Name = "First Combatant's Chamber", 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
      }, 
      [43] = 
      {
         Exits = 
         {
         }, 
         Vnum = 43, 
         Sector = "city", 
         Name = "Second Combatant's Chamber", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
      }, 
      [44] = 
      {
         Exits = 
         {
         }, 
         Vnum = 44, 
         Sector = "city", 
         Name = "Lost in Space", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "", 
      }, 
      [45] = 
      {
         Exits = 
         {
         }, 
         Vnum = 45, 
         Sector = "city", 
         Name = "Limbo Shipyard", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Tag = "", 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
      }, 
   }, 
   Author = "RoD/Durga", 
   ResetMessage = "&rYour soul burns...", 
}
