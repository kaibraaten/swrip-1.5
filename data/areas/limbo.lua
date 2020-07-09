-- Limbo
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   LowEconomy = 42035975, 
   Author = "RoD/Durga", 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Arg3 = 2, 
         Arg1 = 1, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg3 = 10, 
         Arg1 = 90, 
         Command = "O", 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 6, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 2, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 7, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 7, 
         Command = "O", 
         Arg2 = 1, 
      }, 
   }, 
   Mobiles = 
   {
      [1] = 
      {
         HitChance = 
         {
            HitPlus = 30550, 
            HitNoDice = 5, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 200, 
            DamNoDice = 4, 
         }, 
         Name = "Puff", 
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
say random char (him,her,it):\9$L\
say random char (his,hers,its):\9$K\
", 
               Arguments = "test", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
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
            }, 
         }, 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         Height = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Sex = "female", 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Credits = 10000, 
         DamRoll = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "Puff", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 1, 
         Position = "standing", 
         Level = 50, 
         Weight = 0, 
         Race = "Gand", 
         Description = "", 
         ArmorClass = -30, 
         Alignment = 1000, 
      }, 
      [2] = 
      {
         HitChance = 
         {
            HitPlus = 31550, 
            HitNoDice = 5, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 2, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         Name = "Richard Simmons", 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n drink\
c heal $n\
", 
               Arguments = "p is dying", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
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
            }, 
            [3] = 
            {
               Code = "cast heal $n\
cast heal $n\
", 
               Arguments = "p bashes against", 
               MudProgType = "act_prog", 
            }, 
            [4] = 
            {
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
               Arguments = "p shivers and", 
               MudProgType = "act_prog", 
            }, 
            [5] = 
            {
               Code = "c heal $n\
c heal $n\
", 
               Arguments = "p wears", 
               MudProgType = "act_prog", 
            }, 
            [6] = 
            {
               Code = "c heal $n\
c heal $n\
", 
               Arguments = "p wields", 
               MudProgType = "act_prog", 
            }, 
            [7] = 
            {
               Code = "mptrans $n 6\
", 
               Arguments = "p is DEAD!!", 
               MudProgType = "act_prog", 
            }, 
            [8] = 
            {
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
               Arguments = "25", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Credits = 10000, 
         DamRoll = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "Richard Simmons", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 2, 
         Position = "standing", 
         Level = 50, 
         Weight = 0, 
         Race = "Human", 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         ArmorClass = -300, 
         Alignment = -1000, 
      }, 
      [3] = 
      {
         HitChance = 
         {
            HitPlus = 1050, 
            HitNoDice = 21, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Name = "supermob", 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Sex = "undistinguished", 
         HitRoll = 21, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpinvis 101\
", 
               Arguments = "25", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Code = "mpinvis 101\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Credits = 10000, 
         DamRoll = 21, 
         NumberOfAttacks = 0, 
         ShortDescr = "the supermob", 
         Flags = 
         {
            [0] = "Npc", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 3, 
         Position = "standing", 
         Level = 105, 
         Weight = 0, 
         Race = "Human", 
         Description = "How clever he looks!\
", 
         ArmorClass = -162, 
         Alignment = -1000, 
      }, 
      [4] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "a vendor", 
         LongDescr = "A Vendor owned by %s\
", 
         Height = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
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
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a vendor", 
         Level = 103, 
         DefaultPosition = "standing", 
         Vnum = 4, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [5] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "undead animated corpse", 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "an animated corpse", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 5, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [6] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Rosie O'Donnel", 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "Rosie O'Donnel...", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 6, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = -1000, 
      }, 
      [7] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Al Gore", 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
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
            }, 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a newly created Al Gore", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 7, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [10] = 
      {
         HitChance = 
         {
            HitPlus = 800, 
            HitNoDice = 16, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 8, 
         }, 
         Name = "mauzumi die wolf", 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         Height = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 16, 
         Sex = "undistinguished", 
         HitRoll = 16, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Credits = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         NumberOfAttacks = 2, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         Level = 80, 
         DefaultPosition = "standing", 
         Vnum = 10, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
         Weight = 0, 
         Race = "_69", 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         ArmorClass = -100, 
         Alignment = 0, 
      }, 
      [11] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "mist", 
         LongDescr = "A thick mist plays with your senses.\
", 
         Height = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 2, 
         ShortDescr = "mist", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 11, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "_85", 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [12] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "bat", 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         Height = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 2, 
         ShortDescr = "bat", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 12, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "Barabel", 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [13] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "hawk", 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         Height = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 2, 
         ShortDescr = "hawk", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 13, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "_78", 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [14] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "black cat", 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         Height = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 2, 
         ShortDescr = "black cat", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 14, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "Gran", 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [15] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "dove", 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         Height = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 1, 
         ShortDescr = "dove", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 15, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "_78", 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [16] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "fish", 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         Height = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 1, 
         ShortDescr = "fish", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 16, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "_81", 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [20] = 
      {
         HitChance = 
         {
            HitPlus = 100, 
            HitNoDice = 2, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         Name = "imperial trooper stormtrooper", 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 2, 
         Sex = "undistinguished", 
         HitRoll = 2, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a stormtrooper", 
         Level = 10, 
         DefaultPosition = "standing", 
         Vnum = 20, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 75, 
         Alignment = 0, 
      }, 
      [21] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "imperial guard stormtrooper", 
         LongDescr = "An imperial guard stands at attention.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "an imperial guard", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 21, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [22] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "Rebel Alliance guard", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 22, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [23] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "Rebel Alliance Trooper soldier", 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a rebel alliance trooper", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 23, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [24] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "A mercenary", 
         LongDescr = "A mercenary stands here ready for battle.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Credits = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         NumberOfAttacks = 1, 
         ShortDescr = "a mercenary", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 24, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [25] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "bouncer guard thug", 
         LongDescr = "An alert guard stands at attention.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a guard", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 25, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [26] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "Imperial Elite Guard", 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         Height = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Sex = "undistinguished", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 3, 
         ShortDescr = "an imperial guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 26, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [27] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "The Empire", 
         LongDescr = "An imperial guard stands at attention.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "an imperial guard", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 27, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [28] = 
      {
         HitChance = 
         {
            HitPlus = 100, 
            HitNoDice = 2, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         Name = "an imperial specfor trooper", 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a stormtrooper", 
         Level = 10, 
         DefaultPosition = "standing", 
         Vnum = 28, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 75, 
         Alignment = 0, 
      }, 
      [29] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "rebel elite guard", 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         Height = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Sex = "undistinguished", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 3, 
         ShortDescr = "a Rebel Alliance guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [30] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "The Rebel Alliance", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 30, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [31] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "a rebel specfor trooper", 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         Height = 0, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Sex = "undistinguished", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 3, 
         ShortDescr = "a rebel alliance trooper", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 31, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [32] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "a merc elite guard", 
         LongDescr = "An elite guard stands at rigid attention.\
", 
         Height = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Sex = "undistinguished", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 3, 
         ShortDescr = "a guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 32, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [40] = 
      {
         HitChance = 
         {
            HitPlus = 1050, 
            HitNoDice = 21, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Name = "Ship Upgrades Technician", 
         LongDescr = "The ship upgrades technician is here.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 21, 
         Sex = "undistinguished", 
         HitRoll = 21, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 5991 autopilot\
", 
               Arguments = "autopilot", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "the ship upgrades technician", 
         Level = 105, 
         DefaultPosition = "standing", 
         Vnum = 40, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = -162, 
         Alignment = 0, 
      }, 
      [33] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "bouncer guard thug", 
         LongDescr = "An alert guard stands at attention.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a guard", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 33, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [50] = 
      {
         HitChance = 
         {
            HitPlus = 5000, 
            HitNoDice = 21, 
            HitSizeDice = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Name = "Master Yoda", 
         MudProgs = 
         {
            [1] = 
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
            }, 
            [2] = 
            {
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
               Arguments = "corusca", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
               Arguments = "give", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
               Arguments = "shop", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         Height = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Sex = "male", 
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
         HitRoll = 21, 
         ShortDescr = "Jedi Master Yoda", 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Credits = 0, 
         DamRoll = 21, 
         NumberOfAttacks = 0, 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
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
         DefaultPosition = "standing", 
         Vnum = 50, 
         Position = "standing", 
         Level = 105, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = -162, 
         Alignment = 1000, 
      }, 
      [98] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Name = "janitor", 
         LongDescr = "A janitor cleans up the ship here.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 32179 drop all\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a janitor", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 98, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
      [34] = 
      {
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Name = "A mercenary", 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         Height = 0, 
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
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         ShortDescr = "a mercenary", 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 34, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Weight = 0, 
         Race = "Human", 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
      }, 
   }, 
   Name = "Limbo", 
   VnumRanges = 
   {
      Room = 
      {
         Last = 99, 
         First = 1, 
      }, 
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
   }, 
   Rooms = 
   {
      [1] = 
      {
         Vnum = 1, 
         Name = "&CCorrans Insane Apartment&g", 
         TeleVnum = 0, 
         Sector = "city", 
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
            }, 
            [3] = 
            {
               Code = "mpdamage $n 234234\
", 
               Arguments = "die", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 100, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 107, 
            }, 
         }, 
      }, 
      [2] = 
      {
         Vnum = 2, 
         Name = "Limbo", 
         TeleVnum = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 32145, 
            }, 
         }, 
      }, 
      [3] = 
      {
         Vnum = 3, 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [4] = 
      {
         Vnum = 4, 
         Name = "Storage", 
         TeleVnum = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This room is reserved for future use.\
", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [5] = 
      {
         Vnum = 5, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [6] = 
      {
         Vnum = 6, 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         TeleVnum = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [7] = 
      {
         Vnum = 7, 
         Name = "Mobprog Purge Room", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mppurge\
", 
               Arguments = "purge", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [8] = 
      {
         Vnum = 8, 
         Name = "Immhood ClanStoreRoom", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [10] = 
      {
         Vnum = 10, 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Sector = "inside", 
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
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
            }, 
            [2] = 
            {
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
               Arguments = "100", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 100, 
            }, 
         }, 
      }, 
      [11] = 
      {
         Vnum = 11, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [12] = 
      {
         Vnum = 12, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [19] = 
      {
         Vnum = 19, 
         Name = "Incognito Platform", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
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
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [20] = 
      {
         Vnum = 20, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [29] = 
      {
         Vnum = 29, 
         Name = "The Arena", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 32, 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
      }, 
      [30] = 
      {
         Vnum = 30, 
         Name = "The Arena", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 40, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
         }, 
      }, 
      [31] = 
      {
         Vnum = 31, 
         Name = "The Arena", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 34, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
      }, 
      [32] = 
      {
         Vnum = 32, 
         Name = "The Arena", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
      }, 
      [33] = 
      {
         Vnum = 33, 
         Name = "The Arena", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 34, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 32, 
            }, 
            [5] = 
            {
               Direction = "northeast", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [6] = 
            {
               Direction = "northwest", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
            [7] = 
            {
               Direction = "southeast", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [8] = 
            {
               Direction = "southwest", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
      }, 
      [34] = 
      {
         Vnum = 34, 
         Name = "The Arena", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
      }, 
      [35] = 
      {
         Vnum = 35, 
         Name = "The Arena", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 32, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
      }, 
      [36] = 
      {
         Vnum = 36, 
         Name = "The Arena", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 38, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
      }, 
      [37] = 
      {
         Vnum = 37, 
         Name = "The Arena", 
         TeleVnum = 0, 
         Sector = "city", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 34, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 33, 
            }, 
         }, 
      }, 
      [38] = 
      {
         Vnum = 38, 
         Name = "Southern Sniper Tower Entrance", 
         TeleVnum = 0, 
         Sector = "inside", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 39, 
            }, 
         }, 
      }, 
      [39] = 
      {
         Vnum = 39, 
         Name = "Southern Sniper Tower", 
         TeleVnum = 0, 
         Sector = "inside", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 36, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 38, 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 37, 
            }, 
            [4] = 
            {
               Direction = "northwest", 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 35, 
            }, 
         }, 
      }, 
      [40] = 
      {
         Vnum = 40, 
         Name = "Northern Sniper Tower Entrance", 
         TeleVnum = 0, 
         Sector = "inside", 
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
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 41, 
            }, 
         }, 
      }, 
      [41] = 
      {
         Vnum = 41, 
         Name = "Northern Sniper Tower", 
         TeleVnum = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 30, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 40, 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 31, 
            }, 
            [4] = 
            {
               Direction = "southwest", 
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 29, 
            }, 
         }, 
      }, 
      [42] = 
      {
         Vnum = 42, 
         Name = "First Combatant's Chamber", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
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
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [43] = 
      {
         Vnum = 43, 
         Name = "Second Combatant's Chamber", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [44] = 
      {
         Vnum = 44, 
         Name = "Lost in Space", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
      [45] = 
      {
         Vnum = 45, 
         Name = "Limbo Shipyard", 
         TeleVnum = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
      }, 
   }, 
   Objects = 
   {
      [2] = 
      {
         Vnum = 2, 
         ActionDescription = "", 
         Name = "credit credits", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "money", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "One miserable credit.", 
         Layers = 0, 
         ShortDescr = "a credit", 
      }, 
      [3] = 
      {
         Vnum = 3, 
         ActionDescription = "", 
         Name = "credits credit", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "money", 
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
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some credits.", 
         Layers = 0, 
         ShortDescr = "%d credits", 
      }, 
      [4] = 
      {
         Vnum = 4, 
         ActionDescription = "", 
         Name = "deed", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
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
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A deed for a shop", 
         Layers = 0, 
         ShortDescr = "A deed", 
      }, 
      [5] = 
      {
         Vnum = 5, 
         Cost = 100000, 
         ActionDescription = "", 
         Name = "an amulet", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
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
         Flags = 
         {
            [8] = "Bless", 
            [5] = "Invis", 
            [6] = "Magic", 
            [21] = "ClanObject", 
         }, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
         Layers = 0, 
         ShortDescr = "a metal amulet", 
      }, 
      [6] = 
      {
         Vnum = 6, 
         Cost = 0, 
         ActionDescription = "", 
         Name = "charm", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2097152, 
               Location = 27, 
            }, 
         }, 
         ItemType = "armor", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         Layers = 0, 
         ShortDescr = "A small charm", 
      }, 
      [7] = 
      {
         Vnum = 7, 
         ActionDescription = "", 
         Name = "Tipper Gore", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "fountain", 
         Cost = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         Layers = 0, 
         ShortDescr = "Tipper Gore!", 
      }, 
      [9] = 
      {
         Vnum = 9, 
         ActionDescription = "", 
         Name = "corpse remains pieces parts", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "droid_corpse", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The shattered remains of %s are here.", 
         Layers = 0, 
         ShortDescr = "the broken parts of %s", 
      }, 
      [10] = 
      {
         Vnum = 10, 
         ActionDescription = "", 
         Name = "corpse", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "corpse", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The corpse of %s lies here.", 
         Layers = 0, 
         ShortDescr = "the corpse of %s", 
      }, 
      [11] = 
      {
         Vnum = 11, 
         ActionDescription = "", 
         Name = "corpse", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "corpse_pc", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The corpse of %s is lying here.", 
         Layers = 0, 
         ShortDescr = "the corpse of %s", 
      }, 
      [12] = 
      {
         Vnum = 12, 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         Name = "head", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Cost = 0, 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The severed head of %s is lying here.", 
         Layers = 0, 
         ShortDescr = "the head of %s", 
      }, 
      [13] = 
      {
         Vnum = 13, 
         ActionDescription = "%s savagely devour$q $p!", 
         Name = "heart", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 16, 
         }, 
         Cost = 0, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The torn-out heart of %s is lying here.", 
         Layers = 0, 
         ShortDescr = "the heart of %s", 
      }, 
      [14] = 
      {
         Vnum = 14, 
         ActionDescription = "%s chomp$q on $p.", 
         Name = "arm", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Cost = 0, 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sliced-off arm of %s is lying here.", 
         Layers = 0, 
         ShortDescr = "the arm of %s", 
      }, 
      [15] = 
      {
         Vnum = 15, 
         ActionDescription = "%s chomp$q on $p.", 
         Name = "leg", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Cost = 0, 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sliced-off leg of %s is lying here.", 
         Layers = 0, 
         ShortDescr = "the leg of %s", 
      }, 
      [16] = 
      {
         Vnum = 16, 
         ActionDescription = "", 
         Name = "guts", 
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
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         Layers = 0, 
         ShortDescr = "the spilled guts of %s", 
      }, 
      [17] = 
      {
         Vnum = 17, 
         ActionDescription = "", 
         Name = "blood", 
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
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A pool of spilled blood lies here.", 
         Layers = 0, 
         ShortDescr = "the spilled blood", 
      }, 
      [18] = 
      {
         Vnum = 18, 
         ActionDescription = "", 
         Name = "bloodstain", 
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
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Blood stains the ground.", 
         Layers = 0, 
         ShortDescr = "the bloodstain", 
      }, 
      [19] = 
      {
         Vnum = 19, 
         ActionDescription = "", 
         Name = "scraps", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "scraps", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The scraps of %s lie here.", 
         Layers = 0, 
         ShortDescr = "the scraps of %s", 
      }, 
      [20] = 
      {
         Vnum = 20, 
         ActionDescription = "%s enjoy$q $p.", 
         Name = "fruit roll-up", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Cost = 10, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A fruit roll-up lies here", 
         Layers = 0, 
         ShortDescr = "a fruit roll-up", 
      }, 
      [21] = 
      {
         Vnum = 21, 
         ActionDescription = "", 
         Name = "ball light", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
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
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A bright ball of light shimmers in the air.", 
         Layers = 0, 
         ShortDescr = "a bright ball of light", 
      }, 
      [22] = 
      {
         Vnum = 22, 
         ActionDescription = "", 
         Name = "spring", 
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         ItemType = "fountain", 
         Cost = 10, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Weight = 10, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A magical spring flows here.", 
         Layers = 0, 
         ShortDescr = "a magical spring", 
      }, 
      [23] = 
      {
         Vnum = 23, 
         ActionDescription = "", 
         Name = "the skin of %s", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 25, 
            }, 
         }, 
         ItemType = "fabric", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The skin of %s", 
         Layers = 0, 
         ShortDescr = "the skin of %s", 
      }, 
      [24] = 
      {
         Vnum = 24, 
         ActionDescription = "", 
         Name = "meat fresh slice", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
         ItemType = "food", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         Layers = 0, 
         ShortDescr = "a slice of raw meat from %s", 
      }, 
      [25] = 
      {
         Vnum = 25, 
         ActionDescription = "", 
         Name = "shopping bag", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Cost = 20, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         Layers = 0, 
         ShortDescr = "a bag", 
      }, 
      [26] = 
      {
         Vnum = 26, 
         ActionDescription = "", 
         Name = "fighter module", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "fightercomp", 
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
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         Description = "What looks like a part of a ship lies here.", 
         Layers = 0, 
         ShortDescr = "A ship part for %s", 
      }, 
      [27] = 
      {
         Vnum = 27, 
         ActionDescription = "", 
         Name = "midsize midship module", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "midcomp", 
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
         Weight = 150, 
         ExtraDescriptions = 
         {
         }, 
         Description = "What looks like a decent size part for a ship lies here.", 
         Layers = 0, 
         ShortDescr = "A midsize ship part for %s", 
      }, 
      [28] = 
      {
         Vnum = 28, 
         ActionDescription = "", 
         Name = "capship capital module", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "capitalcomp", 
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
         Weight = 350, 
         ExtraDescriptions = 
         {
         }, 
         Description = "What looks like a huge ship part lies here.", 
         Layers = 0, 
         ShortDescr = "A capital-class ship part for %s", 
      }, 
      [30] = 
      {
         Vnum = 30, 
         ActionDescription = "", 
         Name = "fire", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "fire", 
         Cost = 10, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Weight = 10, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A magical fire burns brightly.", 
         Layers = 0, 
         ShortDescr = "a magical fire", 
      }, 
      [31] = 
      {
         Vnum = 31, 
         ActionDescription = "", 
         Name = "trap", 
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
         Cost = 10, 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You detect a trap.", 
         Layers = 0, 
         ShortDescr = "a trap", 
      }, 
      [32] = 
      {
         Vnum = 32, 
         ActionDescription = "", 
         Name = "portal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "_portal", 
         Cost = 10, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A misty portal beckons you to the unknown.", 
         Layers = 0, 
         ShortDescr = "a portal", 
      }, 
      [33] = 
      {
         Vnum = 33, 
         ActionDescription = "", 
         Name = "black poison powder", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
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
         Cost = 48000, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         Layers = 0, 
         ShortDescr = "black poisoning powder", 
      }, 
      [34] = 
      {
         Vnum = 34, 
         ActionDescription = "", 
         Name = "scroll scribing blank", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "scroll", 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 10000, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A blank scroll lays here gathering dust.", 
         Layers = 0, 
         ShortDescr = "a blank scroll", 
      }, 
      [35] = 
      {
         Vnum = 35, 
         ActionDescription = "", 
         Name = "flask empty", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "potion", 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Cost = 15000, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "An empty flask lays here gathering dust.", 
         Layers = 0, 
         ShortDescr = "an empty flask", 
      }, 
      [36] = 
      {
         Vnum = 36, 
         ActionDescription = "", 
         Name = "parchment paper note data disk message info", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
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
         Cost = 1500, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A message disk has been discarded here.", 
         Layers = 0, 
         ShortDescr = "a message disk", 
      }, 
      [37] = 
      {
         Vnum = 37, 
         ActionDescription = "", 
         Name = "quill pen datapad recorder message disk", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "pen", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Cost = 2000, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A datapad used for recording message disks is here.", 
         Layers = 0, 
         ShortDescr = "a datapad", 
      }, 
      [38] = 
      {
         Vnum = 38, 
         ActionDescription = "", 
         Name = "mail terminal", 
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
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         Layers = 0, 
         ShortDescr = "a mail terminal", 
      }, 
      [43] = 
      {
         Vnum = 43, 
         ActionDescription = "", 
         Name = "holy symbol faith", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 4, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Cost = 0, 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A holy symbol lies here, shining.", 
         Layers = 0, 
         ShortDescr = "a symbol of faith", 
      }, 
      [45] = 
      {
         Vnum = 45, 
         ActionDescription = "", 
         Name = "grenade", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "grenade", 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Cost = 1200, 
         Weight = 1, 
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
         Description = "A grenade .... run!!!!", 
         Layers = 0, 
         ShortDescr = "a grenade", 
      }, 
      [46] = 
      {
         Vnum = 46, 
         ActionDescription = "", 
         Name = "landmine mine", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "landmine", 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Cost = 1000, 
         Weight = 1, 
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
         Description = "Don't step on the landmine.", 
         Layers = 0, 
         ShortDescr = "a landmine", 
      }, 
      [50] = 
      {
         Vnum = 50, 
         ActionDescription = "", 
         Name = "blaster Blastech E11 rifle E-11", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Cost = 3250, 
         Weight = 10, 
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
         Description = "A Blastech E-11 blaster rifle was left here.", 
         Layers = 0, 
         ShortDescr = "a Blastech E-11 blaster rifle", 
      }, 
      [51] = 
      {
         Vnum = 51, 
         ActionDescription = "", 
         Name = "blaster blastech dl-18 blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Cost = 3000, 
         Weight = 6, 
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
         Description = "A Blastech DL-18 lies here on the floor.", 
         Layers = 0, 
         ShortDescr = "a blastech DL-18 blaster pistol", 
      }, 
      [52] = 
      {
         Vnum = 52, 
         ActionDescription = "", 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Cost = 3600, 
         Weight = 8, 
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
         Description = "A heavy blaster pistol was dropped here.", 
         Layers = 0, 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
      }, 
      [53] = 
      {
         Vnum = 53, 
         ActionDescription = "", 
         Name = "blaster blastech dlt-19 assault rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Cost = 3750, 
         Weight = 12, 
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
         Description = "An assault rifle was left here.", 
         Layers = 0, 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
      }, 
      [54] = 
      {
         Vnum = 54, 
         ActionDescription = "", 
         Name = "blastech t-21 repeating blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Cost = 3900, 
         Weight = 10, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
\13", 
            }, 
            [2] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
            }, 
            [4] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
            }, 
            [5] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
\13", 
            }, 
            [6] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled blaster.\
\13", 
            }, 
            [7] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "", 
            }, 
            [8] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long barreled blaster\
\13", 
            }, 
         }, 
         Description = "A repeating blaster is collecting dust.", 
         Layers = 0, 
         ShortDescr = "a Blastech T-21 repeating blaster", 
      }, 
      [55] = 
      {
         Vnum = 55, 
         ActionDescription = "", 
         Name = "bryar pistol blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 3700, 
         Weight = 8, 
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
         Description = "A Bryar heavy blaster pistol could come in handy.", 
         Layers = 0, 
         ShortDescr = "a Bryar heavy blaster pistol", 
      }, 
      [56] = 
      {
         Vnum = 56, 
         ActionDescription = "", 
         Name = "blaster Budgetline 3.0/12 holdout", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -3, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 300, 
            [5] = 300, 
            [0] = 0, 
         }, 
         Cost = 900, 
         Weight = 4, 
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
         Description = "A cheap holdout blaster is here.", 
         Layers = 0, 
         ShortDescr = "a Budgetline 3.0/12", 
      }, 
      [57] = 
      {
         Vnum = 57, 
         ActionDescription = "", 
         Name = "sorosuub q2 holdout blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Cost = 2800, 
         ItemType = "weapon", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         Layers = 0, 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
      }, 
      [58] = 
      {
         Vnum = 58, 
         ActionDescription = "", 
         Name = "blastech last resort mini-blaster blaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Cost = 2000, 
         ItemType = "weapon", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "A very small blaster was dropped here.", 
         Layers = 0, 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
      }, 
      [59] = 
      {
         Vnum = 59, 
         Cost = 350, 
         ActionDescription = "", 
         Name = "long vibro-blade", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "A sharp looking blade is here.", 
         Layers = 0, 
         ShortDescr = "a long sharp vibro-blade", 
      }, 
      [60] = 
      {
         Vnum = 60, 
         ActionDescription = "", 
         Name = "Sorosuub One Blaster Rifle", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 3000, 
         Weight = 10, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A blaster rifle was dropped here.", 
         Layers = 0, 
         ShortDescr = "a Sorosuub One blaster rifle", 
      }, 
      [99] = 
      {
         Vnum = 99, 
         ActionDescription = "", 
         Name = "final object", 
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
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some god dropped a newly created final object here.", 
         Layers = 0, 
         ShortDescr = "a newly created final object", 
      }, 
      [90] = 
      {
         Vnum = 90, 
         ActionDescription = "", 
         Name = "Suggestions Board", 
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
         Cost = 0, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The suggestions board is here.", 
         Layers = 0, 
         ShortDescr = "the suggestions board", 
      }, 
      [70] = 
      {
         Layers = 0, 
         Vnum = 70, 
         Cost = 0, 
         ActionDescription = "", 
         Name = "quest weapon double bladed lightsaber saber", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
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
         ItemType = "weapon", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "The hilt of a lightsaber lies on the ground.", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
               Arguments = "100", 
               MudProgType = "wear_prog", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
               Arguments = "100", 
               MudProgType = "remove_prog", 
            }, 
         }, 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
      }, 
      [71] = 
      {
         Layers = 0, 
         Vnum = 71, 
         Cost = 0, 
         ActionDescription = "", 
         Name = "quest armor mandalorian battle helmet", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
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
         ItemType = "armor", 
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
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "quest armor mandalorian battle helmet", 
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
            }, 
         }, 
         Description = "An evil looking battle helmet.", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
               Arguments = "100", 
               MudProgType = "wear_prog", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
               Arguments = "100", 
               MudProgType = "remove_prog", 
            }, 
         }, 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
      }, 
      [72] = 
      {
         Vnum = 72, 
         ActionDescription = "", 
         Name = "quest item", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ItemType = "container", 
         Cost = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A dud is here.", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10313\
put ration item\
", 
               Arguments = "100", 
               MudProgType = "use_prog", 
            }, 
         }, 
         ShortDescr = "Mystery Box 1", 
      }, 
      [73] = 
      {
         Layers = 0, 
         Vnum = 73, 
         Cost = 0, 
         ActionDescription = "", 
         Name = "quest shield generator", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
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
         ItemType = "armor", 
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
         Description = "A small energy device lies on the floor.", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
               Arguments = "100", 
               MudProgType = "wear_prog", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
               Arguments = "100", 
               MudProgType = "remove_prog", 
            }, 
         }, 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
      }, 
      [74] = 
      {
         Vnum = 74, 
         ActionDescription = "", 
         Name = "quest item dinner", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Cost = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A dud is here.", 
         Layers = 0, 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
      }, 
      [75] = 
      {
         Vnum = 75, 
         Layers = 0, 
         ActionDescription = "", 
         Name = "quest token sapphire", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
         ItemType = "treasure", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
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
            }, 
         }, 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
      }, 
      [76] = 
      {
         Vnum = 76, 
         Layers = 0, 
         ActionDescription = "", 
         Name = "quest token diamond", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
         ItemType = "treasure", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
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
            }, 
         }, 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
      }, 
      [77] = 
      {
         Vnum = 77, 
         Layers = 0, 
         ActionDescription = "", 
         Name = "quest token emerald", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
         ItemType = "treasure", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
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
            }, 
         }, 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
      }, 
      [78] = 
      {
         Vnum = 78, 
         Layers = 0, 
         ActionDescription = "", 
         Name = "quest token amythest", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
         ItemType = "treasure", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
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
            }, 
         }, 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
      }, 
      [79] = 
      {
         Vnum = 79, 
         Layers = 0, 
         ActionDescription = "", 
         Name = "quest token ruby", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
         ItemType = "treasure", 
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
         ExtraDescriptions = 
         {
         }, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
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
            }, 
         }, 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
      }, 
   }, 
   ResetFrequency = 0, 
   Flags = 
   {
      [1] = "_01", 
   }, 
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
   FileFormatVersion = 1, 
   Filename = "limbo.lua", 
   HighEconomy = 0, 
   ResetMessage = "&rYour soul burns...", 
}
