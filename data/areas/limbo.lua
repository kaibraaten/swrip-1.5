-- Limbo
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   VnumRanges = 
   {
      Room = 
      {
         Last = 45, 
         First = 1, 
      }, 
      Mob = 
      {
         Last = 98, 
         First = 1, 
      }, 
      Object = 
      {
         Last = 99, 
         First = 2, 
      }, 
   }, 
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 2, 
         MiscData = 0, 
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 1, 
      }, 
      [2] = 
      {
         Arg3 = 10, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 90, 
      }, 
      [3] = 
      {
         Arg3 = 6, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 6, 
      }, 
      [4] = 
      {
         Arg3 = 6, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 2, 
      }, 
      [5] = 
      {
         Arg3 = 6, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 7, 
      }, 
      [6] = 
      {
         Arg3 = 6, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 7, 
      }, 
   }, 
   ResetFrequency = 0, 
   Mobiles = 
   {
      [1] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "Puff", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         Race = "Gand", 
         Vnum = 1, 
         Sex = "female", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         ArmorClass = -30, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 10, 
            DamPlus = 200, 
         }, 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         HitRoll = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Alignment = 1000, 
         Credits = 10000, 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 30550, 
         }, 
         Level = 50, 
         MudProgs = 
         {
            [1] = 
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
            }, 
            [2] = 
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
            }, 
         }, 
         Description = "", 
         Name = "Puff", 
      }, 
      [2] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "Richard Simmons", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 2, 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ArmorClass = -300, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 2, 
            DamPlus = 2, 
         }, 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
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
         HitRoll = 0, 
         Race = "Human", 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Alignment = -1000, 
         Credits = 10000, 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 31550, 
         }, 
         Level = 50, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p wields", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is DEAD!!", 
               Code = "mptrans $n 6\
", 
            }, 
            [3] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is dying", 
               Code = "mpforce $n drink\
c heal $n\
", 
            }, 
            [5] = 
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
            }, 
            [6] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p bashes against", 
               Code = "cast heal $n\
cast heal $n\
", 
            }, 
            [7] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p shivers and", 
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
            }, 
            [8] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p wears", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
         }, 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         Name = "Richard Simmons", 
      }, 
      [3] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "the supermob", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 3, 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [13] = "PolySelf", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         ArmorClass = -162, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
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
         HitRoll = 21, 
         Race = "Human", 
         DamRoll = 21, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Alignment = -1000, 
         Credits = 10000, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Level = 105, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "mpinvis 101\
", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               Code = "mpinvis 101\
", 
            }, 
         }, 
         Description = "How clever he looks!\
", 
         Name = "supermob", 
      }, 
      [4] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a vendor", 
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
         Position = "standing", 
         Vnum = 4, 
         Sex = "undistinguished", 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "a vendor", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
         }, 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         HitRoll = 0, 
         Weight = 0, 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A Vendor owned by %s\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 103, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         Description = "", 
         Name = "a vendor", 
      }, 
      [5] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "an animated corpse", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 5, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         Name = "undead animated corpse", 
      }, 
      [6] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "Rosie O'Donnel...", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 6, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         DefaultPosition = "standing", 
         Alignment = -1000, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         Name = "Rosie O'Donnel", 
      }, 
      [7] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a newly created Al Gore", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 7, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
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
            }, 
         }, 
         Description = "", 
         Name = "Al Gore", 
      }, 
      [10] = 
      {
         NumberOfAttacks = 2, 
         Height = 0, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 10, 
         Sex = "undistinguished", 
         ArmorClass = -100, 
         Damage = 
         {
            DamNoDice = 8, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Race = "_69", 
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
         HitRoll = 16, 
         Weight = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 16, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 16, 
            HitSizeDice = 10, 
            HitPlus = 800, 
         }, 
         Level = 80, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         Name = "mauzumi die wolf", 
      }, 
      [11] = 
      {
         NumberOfAttacks = 2, 
         Height = 0, 
         ShortDescr = "mist", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 11, 
         Sex = "undistinguished", 
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
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         LongDescr = "A thick mist plays with your senses.\
", 
         Race = "_85", 
         HitRoll = 0, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         Name = "mist", 
      }, 
      [12] = 
      {
         NumberOfAttacks = 2, 
         Height = 0, 
         ShortDescr = "bat", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 12, 
         Sex = "undistinguished", 
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
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         Race = "Barabel", 
         HitRoll = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         Name = "bat", 
      }, 
      [13] = 
      {
         NumberOfAttacks = 2, 
         Height = 0, 
         ShortDescr = "hawk", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 13, 
         Sex = "undistinguished", 
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
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         Race = "_78", 
         HitRoll = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         Name = "hawk", 
      }, 
      [14] = 
      {
         NumberOfAttacks = 2, 
         Height = 0, 
         ShortDescr = "black cat", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 14, 
         Sex = "undistinguished", 
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
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         Race = "Gran", 
         HitRoll = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         Name = "black cat", 
      }, 
      [15] = 
      {
         NumberOfAttacks = 1, 
         Height = 0, 
         ShortDescr = "dove", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 15, 
         Sex = "undistinguished", 
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
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         Race = "_78", 
         HitRoll = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         Name = "dove", 
      }, 
      [16] = 
      {
         NumberOfAttacks = 1, 
         Height = 0, 
         ShortDescr = "fish", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 16, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
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
         HitRoll = 0, 
         Race = "_81", 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         Name = "fish", 
      }, 
      [20] = 
      {
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a stormtrooper", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 20, 
         Sex = "undistinguished", 
         ArmorClass = 75, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Race = "Human", 
         HitRoll = 2, 
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
         Weight = 0, 
         DamRoll = 2, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Level = 10, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         Description = "", 
         Name = "imperial trooper stormtrooper", 
      }, 
      [21] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "an imperial guard", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 21, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "An imperial guard stands at attention.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Description = "", 
         Name = "imperial guard stormtrooper", 
      }, 
      [22] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 22, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Description = "", 
         Name = "Rebel Alliance guard", 
      }, 
      [23] = 
      {
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a rebel alliance trooper", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 23, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Description = "", 
         Name = "Rebel Alliance Trooper soldier", 
      }, 
      [24] = 
      {
         NumberOfAttacks = 1, 
         Height = 0, 
         ShortDescr = "a mercenary", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 24, 
         Sex = "undistinguished", 
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
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
         Weight = 0, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A mercenary stands here ready for battle.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Description = "", 
         Name = "A mercenary", 
      }, 
      [25] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a guard", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 25, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "An alert guard stands at attention.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Description = "", 
         Name = "bouncer guard thug", 
      }, 
      [26] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         NumberOfAttacks = 3, 
         Height = 0, 
         ShortDescr = "an imperial guard", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
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
         Vnum = 26, 
         Sex = "undistinguished", 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Description = "", 
         Name = "Imperial Elite Guard", 
      }, 
      [27] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "an imperial guard", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 27, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "An imperial guard stands at attention.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "", 
         Name = "The Empire", 
      }, 
      [28] = 
      {
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a stormtrooper", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 28, 
         Sex = "undistinguished", 
         ArmorClass = 75, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Level = 10, 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Description = "", 
         Name = "an imperial specfor trooper", 
      }, 
      [29] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         NumberOfAttacks = 3, 
         Height = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
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
         Vnum = 29, 
         Sex = "undistinguished", 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Description = "", 
         Name = "rebel elite guard", 
      }, 
      [30] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 30, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "", 
         Name = "The Rebel Alliance", 
      }, 
      [31] = 
      {
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         NumberOfAttacks = 3, 
         Height = 0, 
         ShortDescr = "a rebel alliance trooper", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
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
         Vnum = 31, 
         Sex = "undistinguished", 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Description = "", 
         Name = "a rebel specfor trooper", 
      }, 
      [32] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         NumberOfAttacks = 3, 
         Height = 0, 
         ShortDescr = "a guard", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
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
         Vnum = 32, 
         Sex = "undistinguished", 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         LongDescr = "An elite guard stands at rigid attention.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Description = "", 
         Name = "a merc elite guard", 
      }, 
      [40] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "the ship upgrades technician", 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Position = "standing", 
         Vnum = 40, 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [12] = "Deadly", 
            [25] = "NoKill", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         ArmorClass = -162, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Race = "Human", 
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
         HitRoll = 21, 
         Weight = 0, 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         DamRoll = 21, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "The ship upgrades technician is here.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Level = 105, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "autopilot", 
               Code = "mpat 5991 autopilot\
", 
            }, 
         }, 
         Description = "", 
         Name = "Ship Upgrades Technician", 
      }, 
      [33] = 
      {
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a guard", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 33, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "An alert guard stands at attention.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "", 
         Name = "bouncer guard thug", 
      }, 
      [50] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "Jedi Master Yoda", 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [0] = "Npc", 
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
         Race = "Human", 
         Vnum = 50, 
         Sex = "male", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         ArmorClass = -162, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         HitRoll = 21, 
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
         Weight = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Alignment = 1000, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 5000, 
         }, 
         Level = 105, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "corusca", 
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "give", 
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "shop", 
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
            }, 
            [4] = 
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
            }, 
         }, 
         Description = "", 
         Name = "Master Yoda", 
      }, 
      [98] = 
      {
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a janitor", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 98, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "A janitor cleans up the ship here.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "mpat 32179 drop all\
", 
            }, 
         }, 
         Description = "", 
         Name = "janitor", 
      }, 
      [34] = 
      {
         NumberOfAttacks = 0, 
         Height = 0, 
         ShortDescr = "a mercenary", 
         Stats = 
         {
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Position = "standing", 
         Vnum = 34, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
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
         Weight = 0, 
         DamRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         Description = "", 
         Name = "A mercenary", 
      }, 
   }, 
   Objects = 
   {
      [2] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "money", 
         ShortDescr = "a credit", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 2, 
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
         Name = "credit credits", 
      }, 
      [3] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "money", 
         ShortDescr = "%d credits", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 3, 
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
         Name = "credits credit", 
      }, 
      [4] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "paper", 
         ShortDescr = "A deed", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 4, 
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
         Name = "deed", 
      }, 
      [5] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "armor", 
         ShortDescr = "a metal amulet", 
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
         Flags = 
         {
            [8] = "Bless", 
            [17] = "_17", 
            [2] = "_02", 
            [21] = "ClanObject", 
            [5] = "Invis", 
            [6] = "Magic", 
            [15] = "_15", 
         }, 
         Cost = 100000, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Vnum = 5, 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
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
         Name = "an amulet", 
      }, 
      [6] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "armor", 
         ShortDescr = "A small charm", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2097152, 
               Location = 27, 
            }, 
         }, 
         Flags = 
         {
            [23] = "_23", 
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         Vnum = 6, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
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
         Name = "charm", 
      }, 
      [7] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "fountain", 
         ShortDescr = "Tipper Gore!", 
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Cost = 0, 
         Vnum = 7, 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
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
         Name = "Tipper Gore", 
      }, 
      [9] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "droid_corpse", 
         ShortDescr = "the broken parts of %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 9, 
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
         Name = "corpse remains pieces parts", 
      }, 
      [10] = 
      {
         Weight = 100, 
         ActionDescription = "", 
         ItemType = "corpse", 
         ShortDescr = "the corpse of %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 10, 
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
         Name = "corpse", 
      }, 
      [11] = 
      {
         Weight = 100, 
         ActionDescription = "", 
         ItemType = "corpse_pc", 
         ShortDescr = "the corpse of %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 11, 
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
         Name = "corpse", 
      }, 
      [12] = 
      {
         Weight = 5, 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         ItemType = "food", 
         ShortDescr = "the head of %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 12, 
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
         Name = "head", 
      }, 
      [13] = 
      {
         Weight = 2, 
         ActionDescription = "%s savagely devour$q $p!", 
         ItemType = "food", 
         ShortDescr = "the heart of %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 13, 
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
         Name = "heart", 
      }, 
      [14] = 
      {
         Weight = 5, 
         ActionDescription = "%s chomp$q on $p.", 
         ItemType = "food", 
         ShortDescr = "the arm of %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 14, 
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
         Name = "arm", 
      }, 
      [15] = 
      {
         Weight = 5, 
         ActionDescription = "%s chomp$q on $p.", 
         ItemType = "food", 
         ShortDescr = "the leg of %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 15, 
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
         Name = "leg", 
      }, 
      [16] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "trash", 
         ShortDescr = "the spilled guts of %s", 
         Layers = 0, 
         Cost = 0, 
         Vnum = 16, 
         Description = "The spilled guts of %s makes you lose your appetite.", 
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
         Name = "guts", 
      }, 
      [17] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "_blood", 
         ShortDescr = "the spilled blood", 
         Layers = 0, 
         Cost = 0, 
         Vnum = 17, 
         Description = "A pool of spilled blood lies here.", 
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
         Name = "blood", 
      }, 
      [18] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "_bloodstain", 
         ShortDescr = "the bloodstain", 
         Layers = 0, 
         Cost = 0, 
         Vnum = 18, 
         Description = "Blood stains the ground.", 
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
         Name = "bloodstain", 
      }, 
      [19] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "scraps", 
         ShortDescr = "the scraps of %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 19, 
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
         Name = "scraps", 
      }, 
      [20] = 
      {
         Weight = 1, 
         ActionDescription = "%s enjoy$q $p.", 
         ItemType = "food", 
         ShortDescr = "a fruit roll-up", 
         Layers = 0, 
         Cost = 10, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 20, 
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
         Name = "fruit roll-up", 
      }, 
      [21] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "light", 
         ShortDescr = "a bright ball of light", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21, 
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
         Name = "ball light", 
      }, 
      [22] = 
      {
         Weight = 10, 
         ActionDescription = "", 
         ItemType = "fountain", 
         ShortDescr = "a magical spring", 
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Cost = 10, 
         Vnum = 22, 
         Description = "A magical spring flows here.", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Name = "spring", 
      }, 
      [23] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "fabric", 
         ShortDescr = "the skin of %s", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 25, 
            }, 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Vnum = 23, 
         Description = "The skin of %s", 
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
         Name = "the skin of %s", 
      }, 
      [24] = 
      {
         Weight = 2, 
         ActionDescription = "", 
         ItemType = "food", 
         ShortDescr = "a slice of raw meat from %s", 
         Layers = 0, 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 24, 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
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
         Name = "meat fresh slice", 
      }, 
      [25] = 
      {
         Weight = 2, 
         ActionDescription = "", 
         ItemType = "container", 
         ShortDescr = "a bag", 
         Layers = 0, 
         Cost = 20, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 25, 
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
         Name = "shopping bag", 
      }, 
      [26] = 
      {
         Weight = 100, 
         ActionDescription = "", 
         ItemType = "fightercomp", 
         ShortDescr = "A ship part for %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 26, 
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
         Name = "fighter module", 
      }, 
      [27] = 
      {
         Weight = 150, 
         ActionDescription = "", 
         ItemType = "midcomp", 
         ShortDescr = "A midsize ship part for %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 27, 
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
         Name = "midsize midship module", 
      }, 
      [28] = 
      {
         Weight = 350, 
         ActionDescription = "", 
         ItemType = "capitalcomp", 
         ShortDescr = "A capital-class ship part for %s", 
         Layers = 0, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 28, 
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
         Name = "capship capital module", 
      }, 
      [30] = 
      {
         Weight = 10, 
         ActionDescription = "", 
         ItemType = "fire", 
         ShortDescr = "a magical fire", 
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Cost = 10, 
         Vnum = 30, 
         Description = "A magical fire burns brightly.", 
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
         Name = "fire", 
      }, 
      [31] = 
      {
         Weight = 100, 
         ActionDescription = "", 
         ItemType = "trap", 
         ShortDescr = "a trap", 
         Layers = 0, 
         Cost = 10, 
         Vnum = 31, 
         Description = "You detect a trap.", 
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
         Name = "trap", 
      }, 
      [32] = 
      {
         Weight = 100, 
         ActionDescription = "", 
         ItemType = "_portal", 
         ShortDescr = "a portal", 
         Layers = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Cost = 10, 
         Vnum = 32, 
         Description = "A misty portal beckons you to the unknown.", 
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
         Name = "portal", 
      }, 
      [33] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "trash", 
         ShortDescr = "black poisoning powder", 
         Layers = 0, 
         Cost = 48000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 33, 
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
         Name = "black poison powder", 
      }, 
      [34] = 
      {
         Weight = 2, 
         ActionDescription = "", 
         ItemType = "scroll", 
         ShortDescr = "a blank scroll", 
         Layers = 0, 
         Cost = 10000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 34, 
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
         Name = "scroll scribing blank", 
      }, 
      [35] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "potion", 
         ShortDescr = "an empty flask", 
         Layers = 0, 
         Cost = 15000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 35, 
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
         Name = "flask empty", 
      }, 
      [36] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "paper", 
         ShortDescr = "a message disk", 
         Layers = 0, 
         Cost = 1500, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 36, 
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
         Name = "parchment paper note data disk message info", 
      }, 
      [37] = 
      {
         Weight = 2, 
         ActionDescription = "", 
         ItemType = "pen", 
         ShortDescr = "a datapad", 
         Layers = 0, 
         Cost = 2000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 37, 
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
         Name = "quill pen datapad recorder message disk", 
      }, 
      [38] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "furniture", 
         ShortDescr = "a mail terminal", 
         Layers = 0, 
         Cost = 0, 
         Vnum = 38, 
         Description = "A standard galactic-net mail terminal has been installed here.", 
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
         Name = "mail terminal", 
      }, 
      [43] = 
      {
         Weight = 5, 
         ActionDescription = "", 
         ItemType = "armor", 
         ShortDescr = "a symbol of faith", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 4, 
            }, 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 43, 
         Description = "A holy symbol lies here, shining.", 
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
         Name = "holy symbol faith", 
      }, 
      [45] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "grenade", 
         ShortDescr = "a grenade", 
         Layers = 0, 
         Cost = 1200, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 45, 
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
         Name = "grenade", 
      }, 
      [46] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "landmine", 
         ShortDescr = "a landmine", 
         Layers = 0, 
         Cost = 1000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 46, 
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
         Name = "landmine mine", 
      }, 
      [50] = 
      {
         Weight = 10, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Cost = 3250, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 50, 
         Description = "A Blastech E-11 blaster rifle was left here.", 
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
         Name = "blaster Blastech E11 rifle E-11", 
      }, 
      [51] = 
      {
         Weight = 6, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Cost = 3000, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 51, 
         Description = "A Blastech DL-18 lies here on the floor.", 
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
         Name = "blaster blastech dl-18 blaster pistol", 
      }, 
      [52] = 
      {
         Weight = 8, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         Cost = 3600, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 52, 
         Description = "A heavy blaster pistol was dropped here.", 
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
         Name = "blaster blastech dl-44 heavy blaster pistol", 
      }, 
      [53] = 
      {
         Weight = 12, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Cost = 3750, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 53, 
         Description = "An assault rifle was left here.", 
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
         Name = "blaster blastech dlt-19 assault rifle", 
      }, 
      [54] = 
      {
         Weight = 10, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         Cost = 3900, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 54, 
         Description = "A repeating blaster is collecting dust.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A long, thick barreled blaster.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [3] = 
            {
               Description = "A long barreled blaster\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [4] = 
            {
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
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
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [7] = 
            {
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [8] = 
            {
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
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
         Name = "blastech t-21 repeating blaster", 
      }, 
      [55] = 
      {
         Weight = 8, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a Bryar heavy blaster pistol", 
         Layers = 0, 
         Cost = 3700, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 55, 
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
         Name = "bryar pistol blaster", 
      }, 
      [56] = 
      {
         Weight = 4, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a Budgetline 3.0/12", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -3, 
               Location = 18, 
            }, 
         }, 
         Cost = 900, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 56, 
         Description = "A cheap holdout blaster is here.", 
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
         Name = "blaster Budgetline 3.0/12 holdout", 
      }, 
      [57] = 
      {
         Weight = 4, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Cost = 2800, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 57, 
         Description = "A Sorosuub holdout blaster was dropped here.", 
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
         Name = "sorosuub q2 holdout blaster", 
      }, 
      [58] = 
      {
         Weight = 3, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Cost = 2000, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 58, 
         Description = "A very small blaster was dropped here.", 
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
         Name = "blastech last resort mini-blaster blaster", 
      }, 
      [59] = 
      {
         Weight = 4, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a long sharp vibro-blade", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 18, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Cost = 350, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 59, 
         Description = "A sharp looking blade is here.", 
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
         Name = "long vibro-blade", 
      }, 
      [60] = 
      {
         Weight = 10, 
         ActionDescription = "", 
         ItemType = "weapon", 
         ShortDescr = "a Sorosuub One blaster rifle", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Cost = 3000, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 60, 
         Description = "A blaster rifle was dropped here.", 
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
         Name = "Sorosuub One Blaster Rifle", 
      }, 
      [99] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "trash", 
         ShortDescr = "a newly created final object", 
         Layers = 0, 
         Cost = 0, 
         Vnum = 99, 
         Description = "Some god dropped a newly created final object here.", 
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
         Name = "final object", 
      }, 
      [90] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "furniture", 
         ShortDescr = "the suggestions board", 
         Layers = 0, 
         Cost = 0, 
         Vnum = 90, 
         Description = "The suggestions board is here.", 
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
         Name = "Suggestions Board", 
      }, 
      [70] = 
      {
         Weight = 8, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
            }, 
            [2] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
            }, 
         }, 
         ItemType = "weapon", 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 5, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 5, 
               Location = 19, 
            }, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 70, 
         Description = "The hilt of a lightsaber lies on the ground.", 
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
         Name = "quest weapon double bladed lightsaber saber", 
      }, 
      [71] = 
      {
         Weight = 10, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
            }, 
            [2] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
            }, 
         }, 
         ItemType = "armor", 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 8, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 16777216, 
               Location = 26, 
            }, 
         }, 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Vnum = 71, 
         Description = "An evil looking battle helmet.", 
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
         Name = "quest armor mandalorian battle helmet", 
      }, 
      [72] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "container", 
         ShortDescr = "Mystery Box 1", 
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Arguments = "100", 
               Code = "mpoload 10313\
put ration item\
", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Cost = 0, 
         Vnum = 72, 
         Description = "A dud is here.", 
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
            [0] = 2, 
         }, 
         Name = "quest item", 
      }, 
      [73] = 
      {
         Weight = 3, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
            }, 
            [2] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
            }, 
         }, 
         ItemType = "armor", 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 8192, 
               Location = 28, 
            }, 
            [2] = 
            {
               Modifier = 67108864, 
               Location = 26, 
            }, 
         }, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Vnum = 73, 
         Description = "A small energy device lies on the floor.", 
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
         Name = "quest shield generator", 
      }, 
      [74] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "trash", 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Cost = 0, 
         Vnum = 74, 
         Description = "A dud is here.", 
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
         Name = "quest item dinner", 
      }, 
      [75] = 
      {
         Weight = 2, 
         ActionDescription = "", 
         ItemType = "treasure", 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         Layers = 0, 
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
            }, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 75, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
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
         Name = "quest token sapphire", 
      }, 
      [76] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "treasure", 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         Layers = 0, 
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
            }, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 76, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
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
         Name = "quest token diamond", 
      }, 
      [77] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "treasure", 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         Layers = 0, 
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
            }, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 77, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
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
         Name = "quest token emerald", 
      }, 
      [78] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "treasure", 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         Layers = 0, 
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
            }, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 78, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
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
         Name = "quest token amythest", 
      }, 
      [79] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         ItemType = "treasure", 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         Layers = 0, 
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
            }, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 79, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
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
         Name = "quest token ruby", 
      }, 
   }, 
   Rooms = 
   {
      [1] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 100, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 107, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "die", 
               Code = "mpdamage $n 234234\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 1, 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
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
         Name = "&CCorrans Insane Apartment&g", 
      }, 
      [2] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 32145, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Vnum = 2, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
      }, 
      [3] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Vnum = 3, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
      }, 
      [4] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Vnum = 4, 
         Description = "This room is reserved for future use.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Storage", 
      }, 
      [5] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 5, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [6] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 6, 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
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
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
      }, 
      [7] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "purge", 
               Code = "mppurge\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 7, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Mobprog Purge Room", 
      }, 
      [8] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 8, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         Name = "Immhood ClanStoreRoom", 
      }, 
      [10] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 100, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "100", 
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
            }, 
            [2] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 10, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
      }, 
      [11] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 11, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [12] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 12, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [19] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 19, 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
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
         Name = "Incognito Platform", 
      }, 
      [20] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 20, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [29] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 30, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 32, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 33, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 29, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Arena", 
      }, 
      [30] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 40, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 31, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 33, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 29, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 30, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Arena", 
      }, 
      [31] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 34, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 30, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 33, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 31, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Arena", 
      }, 
      [32] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 29, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 33, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 35, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 32, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
         Name = "The Arena", 
      }, 
      [33] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 30, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 34, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 36, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 32, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               DestinationVnum = 31, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
            }, 
            [6] = 
            {
               Distance = 0, 
               DestinationVnum = 29, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
            }, 
            [7] = 
            {
               Distance = 0, 
               DestinationVnum = 37, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
            }, 
            [8] = 
            {
               Distance = 0, 
               DestinationVnum = 35, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 33, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Arena", 
      }, 
      [34] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 31, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 37, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 33, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 34, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Arena", 
      }, 
      [35] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 32, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 36, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 33, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 35, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Arena", 
      }, 
      [36] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 33, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 37, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 38, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 35, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 36, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Arena", 
      }, 
      [37] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 34, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 36, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 33, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 37, 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Arena", 
      }, 
      [38] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 36, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 39, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 38, 
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
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Southern Sniper Tower Entrance", 
      }, 
      [39] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 36, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 38, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 37, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 35, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 39, 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Southern Sniper Tower", 
      }, 
      [40] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 30, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 41, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 40, 
         Description = "This large room is the main entrance to the Northern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising a portion of the arena. The lighting is\
quite dim, and the bellowing echoes of the crowd would be quite\
distracting to the untrained fighter. The walls are of thick duratanium,\
and many charred blaster/explosive marks are strewn about the entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Northern Sniper Tower Entrance", 
      }, 
      [41] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 30, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 40, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 31, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 29, 
               Keyword = "", 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "inside", 
         Tunnel = 0, 
         Vnum = 41, 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Northern Sniper Tower", 
      }, 
      [42] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 42, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
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
         Name = "First Combatant's Chamber", 
      }, 
      [43] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 43, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Second Combatant's Chamber", 
      }, 
      [44] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 44, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Lost in Space", 
      }, 
      [45] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 45, 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Limbo Shipyard", 
      }, 
   }, 
   ResetMessage = "&rYour soul burns...", 
   Flags = 
   {
      [1] = "_01", 
   }, 
   LowEconomy = 42135975, 
   Filename = "limbo.lua", 
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
   Author = "RoD/Durga", 
   FileFormatVersion = 1, 
   Name = "Limbo", 
}
