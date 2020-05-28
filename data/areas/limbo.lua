-- Limbo
-- Last saved Thursday 28-May-2020 11:08:45

AreaEntry
{
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 1, 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 90, 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 6, 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 2, 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 7, 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 7, 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
   }, 
   ResetMessage = "&rYour soul burns...", 
   Mobiles = 
   {
      [1] = 
      {
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 30550, 
            HitNoDice = 5, 
         }, 
         DefaultPosition = "standing", 
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
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         ShortDescr = "Puff", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 1, 
         DamRoll = 0, 
         Sex = "female", 
         Name = "Puff", 
         ArmorClass = -30, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 4, 
            DamPlus = 200, 
         }, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Height = 0, 
         Race = "Gand", 
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
               MudProgType = "speech_prog", 
               Arguments = "test2", 
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
               MudProgType = "speech_prog", 
               Arguments = "test", 
            }, 
         }, 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         Credits = 10000, 
         Alignment = 1000, 
         Description = "", 
      }, 
      [2] = 
      {
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 31550, 
            HitNoDice = 5, 
         }, 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
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
         ShortDescr = "Richard Simmons", 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
         Vnum = 2, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "Richard Simmons", 
         ArmorClass = -300, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 2, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "25", 
            }, 
            [2] = 
            {
               Code = "mpforce $n drink\
c heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p is dying", 
            }, 
            [3] = 
            {
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
            [4] = 
            {
               Code = "cast heal $n\
cast heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p bashes against", 
            }, 
            [5] = 
            {
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p shivers and", 
            }, 
            [6] = 
            {
               Code = "c heal $n\
c heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p wears", 
            }, 
            [7] = 
            {
               Code = "c heal $n\
c heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p wields", 
            }, 
            [8] = 
            {
               Code = "mptrans $n 6\
", 
               MudProgType = "act_prog", 
               Arguments = "p is DEAD!!", 
            }, 
         }, 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         Credits = 10000, 
         Alignment = -1000, 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
      }, 
      [3] = 
      {
         Level = 105, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1050, 
            HitNoDice = 21, 
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
         Flags = 
         {
            [0] = "Npc", 
            [13] = "PolySelf", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
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
         ShortDescr = "the supermob", 
         HitRoll = 21, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
         Vnum = 3, 
         DamRoll = 21, 
         Sex = "undistinguished", 
         Name = "supermob", 
         ArmorClass = -162, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpinvis 101\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "mpinvis 101\
", 
               MudProgType = "rand_prog", 
               Arguments = "25", 
            }, 
         }, 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         Credits = 10000, 
         Alignment = -1000, 
         Description = "How clever he looks!\
", 
      }, 
      [4] = 
      {
         Level = 103, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
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
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a vendor", 
            ProfitSell = 90, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
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
         ShortDescr = "a vendor", 
         DamRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
         Vnum = 4, 
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
         Name = "a vendor", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "A Vendor owned by %s\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [5] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "an animated corpse", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 5, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "undead animated corpse", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
      }, 
      [6] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "Rosie O'Donnel...", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 6, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "Rosie O'Donnel", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         Credits = 0, 
         Alignment = -1000, 
         Description = "", 
      }, 
      [7] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         ShortDescr = "a newly created Al Gore", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 7, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "Al Gore", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
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
               MudProgType = "act_prog", 
               Arguments = "p is thirsty", 
            }, 
         }, 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [10] = 
      {
         Level = 80, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 800, 
            HitNoDice = 16, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
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
         ShortDescr = "Mauzumi, the Dire Wolf", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
         Vnum = 10, 
         DamRoll = 16, 
         Sex = "undistinguished", 
         Name = "mauzumi die wolf", 
         ArmorClass = -100, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 8, 
            DamPlus = 2, 
         }, 
         HitRoll = 16, 
         Weight = 0, 
         NumberOfAttacks = 2, 
         Height = 0, 
         Race = "_69", 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
      }, 
      [11] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         ShortDescr = "mist", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 11, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "mist", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Height = 0, 
         Race = "_85", 
         DefaultPosition = "standing", 
         LongDescr = "A thick mist plays with your senses.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
      }, 
      [12] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         ShortDescr = "bat", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 12, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "bat", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Height = 0, 
         Race = "Barabel", 
         DefaultPosition = "standing", 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
      }, 
      [13] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         ShortDescr = "hawk", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 13, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "hawk", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Height = 0, 
         Race = "_78", 
         DefaultPosition = "standing", 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
      }, 
      [14] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         ShortDescr = "black cat", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 14, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "black cat", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 2, 
         Weight = 0, 
         Height = 0, 
         Race = "Gran", 
         DefaultPosition = "standing", 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
      }, 
      [15] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         ShortDescr = "dove", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 15, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "dove", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 1, 
         Weight = 0, 
         Height = 0, 
         Race = "_78", 
         DefaultPosition = "standing", 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
      }, 
      [16] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
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
         ShortDescr = "fish", 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
         Vnum = 16, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "fish", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 1, 
         Weight = 0, 
         Height = 0, 
         Race = "_81", 
         DefaultPosition = "standing", 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
      }, 
      [20] = 
      {
         Level = 10, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         ShortDescr = "a stormtrooper", 
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
         DamRoll = 2, 
         Position = "standing", 
         Vnum = 20, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "imperial trooper stormtrooper", 
         ArmorClass = 75, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         HitRoll = 2, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [21] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "an imperial guard", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 21, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "imperial guard stormtrooper", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "An imperial guard stands at attention.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [22] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "a Rebel Alliance guard", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 22, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "Rebel Alliance guard", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [23] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         ShortDescr = "a rebel alliance trooper", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 23, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "Rebel Alliance Trooper soldier", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [24] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         ShortDescr = "a mercenary", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Position = "standing", 
         Vnum = 24, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "A mercenary", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 1, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "A mercenary stands here ready for battle.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [25] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "a guard", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 25, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "bouncer guard thug", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "An alert guard stands at attention.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [26] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         ShortDescr = "an imperial guard", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 26, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "Imperial Elite Guard", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         DefaultPosition = "standing", 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [27] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "an imperial guard", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 27, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "The Empire", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "An imperial guard stands at attention.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [28] = 
      {
         Level = 10, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         ShortDescr = "a stormtrooper", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 28, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "an imperial specfor trooper", 
         ArmorClass = 75, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [29] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         ShortDescr = "a Rebel Alliance guard", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 29, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "rebel elite guard", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         DefaultPosition = "standing", 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [30] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "a Rebel Alliance guard", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 30, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "The Rebel Alliance", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [31] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         ShortDescr = "a rebel alliance trooper", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 31, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "a rebel specfor trooper", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         DefaultPosition = "standing", 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [32] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         ShortDescr = "a guard", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Vnum = 32, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "a merc elite guard", 
         ArmorClass = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 3, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         DefaultPosition = "standing", 
         LongDescr = "An elite guard stands at rigid attention.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [40] = 
      {
         Level = 105, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1050, 
            HitNoDice = 21, 
         }, 
         Race = "Human", 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [12] = "Deadly", 
            [25] = "NoKill", 
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
         ShortDescr = "the ship upgrades technician", 
         DamRoll = 21, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
         Vnum = 40, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Sex = "undistinguished", 
         Name = "Ship Upgrades Technician", 
         ArmorClass = -162, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         HitRoll = 21, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 5991 autopilot\
", 
               MudProgType = "speech_prog", 
               Arguments = "autopilot", 
            }, 
         }, 
         LongDescr = "The ship upgrades technician is here.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [33] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         ShortDescr = "a guard", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 33, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "bouncer guard thug", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "An alert guard stands at attention.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [50] = 
      {
         Level = 105, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 5000, 
            HitNoDice = 21, 
         }, 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
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
         HitRoll = 21, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
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
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         ShortDescr = "Jedi Master Yoda", 
         Immune = 
         {
            [20] = "magic", 
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
         Position = "standing", 
         Vnum = 50, 
         DamRoll = 21, 
         Sex = "male", 
         Name = "Master Yoda", 
         ArmorClass = -162, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
               MudProgType = "speech_prog", 
               Arguments = "shop", 
            }, 
            [2] = 
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
               MudProgType = "act_prog", 
               Arguments = "package.", 
            }, 
            [3] = 
            {
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
               MudProgType = "speech_prog", 
               Arguments = "corusca", 
            }, 
            [4] = 
            {
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
               MudProgType = "speech_prog", 
               Arguments = "give", 
            }, 
         }, 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         Credits = 0, 
         Alignment = 1000, 
         Description = "", 
      }, 
      [98] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         ShortDescr = "a janitor", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 98, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "janitor", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 32179 drop all\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         LongDescr = "A janitor cleans up the ship here.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
      [34] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         ShortDescr = "a mercenary", 
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
         DamRoll = 0, 
         Position = "standing", 
         Vnum = 34, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "A mercenary", 
         ArmorClass = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Race = "Human", 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         Credits = 0, 
         Alignment = 0, 
         Description = "", 
      }, 
   }, 
   Objects = 
   {
      [2] = 
      {
         Vnum = 2, 
         ExtraDescriptions = 
         {
         }, 
         Name = "credit credits", 
         Cost = 0, 
         ItemType = "money", 
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
         ActionDescription = "", 
         ShortDescr = "a credit", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "One miserable credit.", 
      }, 
      [3] = 
      {
         Vnum = 3, 
         ExtraDescriptions = 
         {
         }, 
         Name = "credits credit", 
         Cost = 0, 
         ItemType = "money", 
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
         ActionDescription = "", 
         ShortDescr = "%d credits", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "Some credits.", 
      }, 
      [4] = 
      {
         Vnum = 4, 
         ExtraDescriptions = 
         {
         }, 
         Name = "deed", 
         Cost = 0, 
         ItemType = "paper", 
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
         ActionDescription = "", 
         ShortDescr = "A deed", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "A deed for a shop", 
      }, 
      [5] = 
      {
         Vnum = 5, 
         ExtraDescriptions = 
         {
         }, 
         Name = "an amulet", 
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
         Cost = 100000, 
         Weight = 1, 
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
            [17] = "_17", 
            [2] = "_02", 
            [21] = "ClanObject", 
            [5] = "Invis", 
            [6] = "Magic", 
            [15] = "_15", 
         }, 
         ActionDescription = "", 
         ShortDescr = "a metal amulet", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
      }, 
      [6] = 
      {
         Vnum = 6, 
         ExtraDescriptions = 
         {
         }, 
         Name = "charm", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2097152, 
               Location = 27, 
            }, 
         }, 
         Cost = 0, 
         Weight = 1, 
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
            [23] = "_23", 
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         ActionDescription = "", 
         ShortDescr = "A small charm", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
      }, 
      [7] = 
      {
         Vnum = 7, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Tipper Gore", 
         Cost = 0, 
         ItemType = "fountain", 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         ShortDescr = "Tipper Gore!", 
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
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
      }, 
      [9] = 
      {
         Vnum = 9, 
         ExtraDescriptions = 
         {
         }, 
         Name = "corpse remains pieces parts", 
         Cost = 0, 
         ItemType = "droid_corpse", 
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
         ActionDescription = "", 
         ShortDescr = "the broken parts of %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "The shattered remains of %s are here.", 
      }, 
      [10] = 
      {
         Vnum = 10, 
         ExtraDescriptions = 
         {
         }, 
         Name = "corpse", 
         Cost = 0, 
         ItemType = "corpse", 
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
         ActionDescription = "", 
         ShortDescr = "the corpse of %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "The corpse of %s lies here.", 
      }, 
      [11] = 
      {
         Vnum = 11, 
         ExtraDescriptions = 
         {
         }, 
         Name = "corpse", 
         Cost = 0, 
         ItemType = "corpse_pc", 
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
         ActionDescription = "", 
         ShortDescr = "the corpse of %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "The corpse of %s is lying here.", 
      }, 
      [12] = 
      {
         Vnum = 12, 
         ExtraDescriptions = 
         {
         }, 
         Name = "head", 
         Cost = 0, 
         ItemType = "food", 
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
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         ShortDescr = "the head of %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "The severed head of %s is lying here.", 
      }, 
      [13] = 
      {
         Vnum = 13, 
         ExtraDescriptions = 
         {
         }, 
         Name = "heart", 
         Cost = 0, 
         ItemType = "food", 
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
         ActionDescription = "%s savagely devour$q $p!", 
         ShortDescr = "the heart of %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "The torn-out heart of %s is lying here.", 
      }, 
      [14] = 
      {
         Vnum = 14, 
         ExtraDescriptions = 
         {
         }, 
         Name = "arm", 
         Cost = 0, 
         ItemType = "food", 
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
         ActionDescription = "%s chomp$q on $p.", 
         ShortDescr = "the arm of %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "The sliced-off arm of %s is lying here.", 
      }, 
      [15] = 
      {
         Vnum = 15, 
         ExtraDescriptions = 
         {
         }, 
         Name = "leg", 
         Cost = 0, 
         ItemType = "food", 
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
         ActionDescription = "%s chomp$q on $p.", 
         ShortDescr = "the leg of %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "The sliced-off leg of %s is lying here.", 
      }, 
      [16] = 
      {
         Vnum = 16, 
         ExtraDescriptions = 
         {
         }, 
         Name = "guts", 
         ItemType = "trash", 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "The spilled guts of %s makes you lose your appetite.", 
      }, 
      [17] = 
      {
         Vnum = 17, 
         ExtraDescriptions = 
         {
         }, 
         Name = "blood", 
         ItemType = "_blood", 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "A pool of spilled blood lies here.", 
      }, 
      [18] = 
      {
         Vnum = 18, 
         ExtraDescriptions = 
         {
         }, 
         Name = "bloodstain", 
         ItemType = "_bloodstain", 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "Blood stains the ground.", 
      }, 
      [19] = 
      {
         Vnum = 19, 
         ExtraDescriptions = 
         {
         }, 
         Name = "scraps", 
         Cost = 0, 
         ItemType = "scraps", 
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
         ActionDescription = "", 
         ShortDescr = "the scraps of %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "The scraps of %s lie here.", 
      }, 
      [20] = 
      {
         Vnum = 20, 
         ExtraDescriptions = 
         {
         }, 
         Name = "fruit roll-up", 
         Cost = 10, 
         ItemType = "food", 
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
         ActionDescription = "%s enjoy$q $p.", 
         ShortDescr = "a fruit roll-up", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A fruit roll-up lies here", 
      }, 
      [21] = 
      {
         Vnum = 21, 
         ExtraDescriptions = 
         {
         }, 
         Name = "ball light", 
         Cost = 0, 
         ItemType = "light", 
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
         ActionDescription = "", 
         ShortDescr = "a bright ball of light", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A bright ball of light shimmers in the air.", 
      }, 
      [22] = 
      {
         Vnum = 22, 
         ExtraDescriptions = 
         {
         }, 
         Name = "spring", 
         Cost = 10, 
         ItemType = "fountain", 
         Weight = 10, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ShortDescr = "a magical spring", 
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Layers = 0, 
         Description = "A magical spring flows here.", 
      }, 
      [23] = 
      {
         Vnum = 23, 
         ExtraDescriptions = 
         {
         }, 
         Name = "the skin of %s", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 25, 
            }, 
         }, 
         Cost = 0, 
         ItemType = "fabric", 
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
         ActionDescription = "", 
         ShortDescr = "the skin of %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Description = "The skin of %s", 
      }, 
      [24] = 
      {
         Vnum = 24, 
         ExtraDescriptions = 
         {
         }, 
         Name = "meat fresh slice", 
         Cost = 0, 
         Weight = 2, 
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
         ActionDescription = "", 
         ShortDescr = "a slice of raw meat from %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
      }, 
      [25] = 
      {
         Vnum = 25, 
         ExtraDescriptions = 
         {
         }, 
         Name = "shopping bag", 
         Cost = 20, 
         ItemType = "container", 
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
         ActionDescription = "", 
         ShortDescr = "a bag", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "A shopping bag lies discarded on the ground nearby.", 
      }, 
      [26] = 
      {
         Vnum = 26, 
         ExtraDescriptions = 
         {
         }, 
         Name = "fighter module", 
         Cost = 0, 
         ItemType = "fightercomp", 
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
         ActionDescription = "", 
         ShortDescr = "A ship part for %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "What looks like a part of a ship lies here.", 
      }, 
      [27] = 
      {
         Vnum = 27, 
         ExtraDescriptions = 
         {
         }, 
         Name = "midsize midship module", 
         Cost = 0, 
         ItemType = "midcomp", 
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
         ActionDescription = "", 
         ShortDescr = "A midsize ship part for %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "What looks like a decent size part for a ship lies here.", 
      }, 
      [28] = 
      {
         Vnum = 28, 
         ExtraDescriptions = 
         {
         }, 
         Name = "capship capital module", 
         Cost = 0, 
         ItemType = "capitalcomp", 
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
         ActionDescription = "", 
         ShortDescr = "A capital-class ship part for %s", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "What looks like a huge ship part lies here.", 
      }, 
      [30] = 
      {
         Vnum = 30, 
         ExtraDescriptions = 
         {
         }, 
         Name = "fire", 
         Cost = 10, 
         ItemType = "fire", 
         Weight = 10, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ShortDescr = "a magical fire", 
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
         Description = "A magical fire burns brightly.", 
      }, 
      [31] = 
      {
         Vnum = 31, 
         ExtraDescriptions = 
         {
         }, 
         Name = "trap", 
         ItemType = "trap", 
         Cost = 10, 
         Weight = 100, 
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "You detect a trap.", 
      }, 
      [32] = 
      {
         Vnum = 32, 
         ExtraDescriptions = 
         {
         }, 
         Name = "portal", 
         Cost = 10, 
         ItemType = "_portal", 
         Weight = 100, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ShortDescr = "a portal", 
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
         Description = "A misty portal beckons you to the unknown.", 
      }, 
      [33] = 
      {
         Vnum = 33, 
         ExtraDescriptions = 
         {
         }, 
         Name = "black poison powder", 
         Cost = 48000, 
         ItemType = "trash", 
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
         ActionDescription = "", 
         ShortDescr = "black poisoning powder", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
      }, 
      [34] = 
      {
         Vnum = 34, 
         ExtraDescriptions = 
         {
         }, 
         Name = "scroll scribing blank", 
         Cost = 10000, 
         ItemType = "scroll", 
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
         ActionDescription = "", 
         ShortDescr = "a blank scroll", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "A blank scroll lays here gathering dust.", 
      }, 
      [35] = 
      {
         Vnum = 35, 
         ExtraDescriptions = 
         {
         }, 
         Name = "flask empty", 
         Cost = 15000, 
         ItemType = "potion", 
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
         ActionDescription = "", 
         ShortDescr = "an empty flask", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "An empty flask lays here gathering dust.", 
      }, 
      [36] = 
      {
         Vnum = 36, 
         ExtraDescriptions = 
         {
         }, 
         Name = "parchment paper note data disk message info", 
         Cost = 1500, 
         ItemType = "paper", 
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
         ActionDescription = "", 
         ShortDescr = "a message disk", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "A message disk has been discarded here.", 
      }, 
      [37] = 
      {
         Vnum = 37, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quill pen datapad recorder message disk", 
         Cost = 2000, 
         ItemType = "pen", 
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
         ActionDescription = "", 
         ShortDescr = "a datapad", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A datapad used for recording message disks is here.", 
      }, 
      [38] = 
      {
         Vnum = 38, 
         ExtraDescriptions = 
         {
         }, 
         Name = "mail terminal", 
         ItemType = "furniture", 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "A standard galactic-net mail terminal has been installed here.", 
      }, 
      [43] = 
      {
         Vnum = 43, 
         ExtraDescriptions = 
         {
         }, 
         Name = "holy symbol faith", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 4, 
            }, 
         }, 
         Cost = 0, 
         ItemType = "armor", 
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
         ActionDescription = "", 
         ShortDescr = "a symbol of faith", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "A holy symbol lies here, shining.", 
      }, 
      [45] = 
      {
         Vnum = 45, 
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
         Name = "grenade", 
         Cost = 1200, 
         ItemType = "grenade", 
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
         ActionDescription = "", 
         ShortDescr = "a grenade", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "A grenade .... run!!!!", 
      }, 
      [46] = 
      {
         Vnum = 46, 
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
         Name = "landmine mine", 
         Cost = 1000, 
         ItemType = "landmine", 
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
         ActionDescription = "", 
         ShortDescr = "a landmine", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "Don't step on the landmine.", 
      }, 
      [50] = 
      {
         Vnum = 50, 
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
         Name = "blaster Blastech E11 rifle E-11", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Cost = 3250, 
         ItemType = "weapon", 
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
         ActionDescription = "", 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A Blastech E-11 blaster rifle was left here.", 
      }, 
      [51] = 
      {
         Vnum = 51, 
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
         Name = "blaster blastech dl-18 blaster pistol", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Cost = 3000, 
         ItemType = "weapon", 
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
         ActionDescription = "", 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A Blastech DL-18 lies here on the floor.", 
      }, 
      [52] = 
      {
         Vnum = 52, 
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
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         Cost = 3600, 
         ItemType = "weapon", 
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
         ActionDescription = "", 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A heavy blaster pistol was dropped here.", 
      }, 
      [53] = 
      {
         Vnum = 53, 
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
         Name = "blaster blastech dlt-19 assault rifle", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Cost = 3750, 
         ItemType = "weapon", 
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
         ActionDescription = "", 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "An assault rifle was left here.", 
      }, 
      [54] = 
      {
         Vnum = 54, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A long barreled blaster\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [2] = 
            {
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [3] = 
            {
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
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
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [6] = 
            {
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [7] = 
            {
               Description = "A long, thick barreled blaster.\
\13", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
            [8] = 
            {
               Description = "", 
               Keyword = "blastech t-21 repeating blaster", 
            }, 
         }, 
         Name = "blastech t-21 repeating blaster", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         Cost = 3900, 
         ItemType = "weapon", 
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
         ActionDescription = "", 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A repeating blaster is collecting dust.", 
      }, 
      [55] = 
      {
         Vnum = 55, 
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
         Name = "bryar pistol blaster", 
         Cost = 3700, 
         ItemType = "weapon", 
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
         ActionDescription = "", 
         ShortDescr = "a Bryar heavy blaster pistol", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
      }, 
      [56] = 
      {
         Vnum = 56, 
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
         Name = "blaster Budgetline 3.0/12 holdout", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -3, 
               Location = 18, 
            }, 
         }, 
         Cost = 900, 
         ItemType = "weapon", 
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
         ActionDescription = "", 
         ShortDescr = "a Budgetline 3.0/12", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A cheap holdout blaster is here.", 
      }, 
      [57] = 
      {
         Vnum = 57, 
         ExtraDescriptions = 
         {
         }, 
         Name = "sorosuub q2 holdout blaster", 
         Cost = 2800, 
         Weight = 4, 
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
         ActionDescription = "", 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A Sorosuub holdout blaster was dropped here.", 
      }, 
      [58] = 
      {
         Vnum = 58, 
         ExtraDescriptions = 
         {
         }, 
         Name = "blastech last resort mini-blaster blaster", 
         Cost = 2000, 
         Weight = 3, 
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
         ActionDescription = "", 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A very small blaster was dropped here.", 
      }, 
      [59] = 
      {
         Vnum = 59, 
         ExtraDescriptions = 
         {
         }, 
         Name = "long vibro-blade", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 18, 
            }, 
         }, 
         Cost = 350, 
         Weight = 4, 
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
         ActionDescription = "", 
         ShortDescr = "a long sharp vibro-blade", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A sharp looking blade is here.", 
      }, 
      [60] = 
      {
         Vnum = 60, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sorosuub One Blaster Rifle", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Cost = 3000, 
         ItemType = "weapon", 
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
         ActionDescription = "", 
         ShortDescr = "a Sorosuub One blaster rifle", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A blaster rifle was dropped here.", 
      }, 
      [99] = 
      {
         Vnum = 99, 
         ExtraDescriptions = 
         {
         }, 
         Name = "final object", 
         ItemType = "trash", 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "Some god dropped a newly created final object here.", 
      }, 
      [90] = 
      {
         Vnum = 90, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Suggestions Board", 
         ItemType = "furniture", 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "The suggestions board is here.", 
      }, 
      [70] = 
      {
         Vnum = 70, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest weapon double bladed lightsaber saber", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
               MudProgType = "remove_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
            }, 
         }, 
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
         Cost = 0, 
         Weight = 8, 
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
         ActionDescription = "", 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "The hilt of a lightsaber lies on the ground.", 
      }, 
      [71] = 
      {
         Vnum = 71, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
               Keyword = "quest armor mandalorian battle helmet", 
            }, 
         }, 
         Name = "quest armor mandalorian battle helmet", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
               MudProgType = "remove_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
            }, 
         }, 
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
         Cost = 0, 
         Weight = 10, 
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
         ActionDescription = "", 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Description = "An evil looking battle helmet.", 
      }, 
      [72] = 
      {
         Vnum = 72, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest item", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10313\
put ration item\
", 
               MudProgType = "use_prog", 
               Arguments = "100", 
            }, 
         }, 
         Cost = 0, 
         ItemType = "container", 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         ShortDescr = "Mystery Box 1", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         Description = "A dud is here.", 
      }, 
      [73] = 
      {
         Vnum = 73, 
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
         Name = "quest shield generator", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
               MudProgType = "remove_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
            }, 
         }, 
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
         Cost = 0, 
         Weight = 3, 
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
         ActionDescription = "", 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Description = "A small energy device lies on the floor.", 
      }, 
      [74] = 
      {
         Vnum = 74, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest item dinner", 
         Cost = 0, 
         ItemType = "trash", 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
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
         Description = "A dud is here.", 
      }, 
      [75] = 
      {
         Vnum = 75, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token sapphire", 
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
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Cost = 0, 
         Weight = 2, 
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
         ActionDescription = "", 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
      }, 
      [76] = 
      {
         Vnum = 76, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token diamond", 
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
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Cost = 0, 
         Weight = 1, 
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
         ActionDescription = "", 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
      }, 
      [77] = 
      {
         Vnum = 77, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token emerald", 
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
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Cost = 0, 
         Weight = 1, 
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
         ActionDescription = "", 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
      }, 
      [78] = 
      {
         Vnum = 78, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token amythest", 
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
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Cost = 0, 
         Weight = 1, 
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
         ActionDescription = "", 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
      }, 
      [79] = 
      {
         Vnum = 79, 
         ExtraDescriptions = 
         {
         }, 
         Name = "quest token ruby", 
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
               MudProgType = "get_prog", 
               Arguments = "100", 
            }, 
         }, 
         Cost = 0, 
         Weight = 1, 
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
         ActionDescription = "", 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
      }, 
   }, 
   Rooms = 
   {
      [1] = 
      {
         Vnum = 1, 
         ExtraDescriptions = 
         {
         }, 
         Name = "&CCorrans Insane Apartment&g", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
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
               MudProgType = "speech_prog", 
               Arguments = "test", 
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
               MudProgType = "speech_prog", 
               Arguments = "test2", 
            }, 
            [3] = 
            {
               Code = "mpdamage $n 234234\
", 
               MudProgType = "speech_prog", 
               Arguments = "die", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 100, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               DestinationVnum = 107, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
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
      }, 
      [2] = 
      {
         Vnum = 2, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Limbo", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               DestinationVnum = 32145, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [21] = "EmptyHome", 
            [10] = "Safe", 
         }, 
         Description = "You float in a formless void, detached from all sensation of physical\
matter, surrounded by swirling glowing light which fades into the\
relative darkness around you without any trace of edge or shadow.\
", 
      }, 
      [3] = 
      {
         Vnum = 3, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Storage", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
            [9] = "Private", 
            [11] = "_11", 
            [20] = "PlayerHome", 
            [13] = "Arena", 
            [21] = "EmptyHome", 
         }, 
         Description = "This room is reserved for storage of polymorphed players.\
", 
      }, 
      [4] = 
      {
         Vnum = 4, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Storage", 
         Sector = "inside", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This room is reserved for future use.\
", 
      }, 
      [5] = 
      {
         Vnum = 5, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
      }, 
      [6] = 
      {
         Vnum = 6, 
         ExtraDescriptions = 
         {
         }, 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
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
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
      }, 
      [7] = 
      {
         Vnum = 7, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mobprog Purge Room", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mppurge\
", 
               MudProgType = "speech_prog", 
               Arguments = "purge", 
            }, 
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
      }, 
      [8] = 
      {
         Vnum = 8, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Immhood ClanStoreRoom", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         Description = "", 
      }, 
      [10] = 
      {
         Vnum = 10, 
         ExtraDescriptions = 
         {
         }, 
         Name = "An Empty Apartment", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
               MudProgType = "speech_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               DestinationVnum = 100, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [9] = "Private", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [26] = "Factory", 
            [21] = "EmptyHome", 
            [25] = "Refinery", 
            [23] = "Hotel", 
         }, 
         Description = "Simple wood logs provide the structure for this room.  A stone fireplace\
dominates one wall, while large windows provide cool breezes in summer.\
Cheery gingham curtains add a bit of life to the room.  A comfy couch and\
chair sit with lamps nearby for reading. A small bed is pushed against one\
wall, a down comforter is rumpled at its foot. A large picture of a\
beautiful boy hangs prominently on a wall near the door. This is a place\
of refuge.\
", 
      }, 
      [11] = 
      {
         Vnum = 11, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
      }, 
      [12] = 
      {
         Vnum = 12, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
      }, 
      [19] = 
      {
         Vnum = 19, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Incognito Platform", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
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
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
      }, 
      [20] = 
      {
         Vnum = 20, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
      }, 
      [29] = 
      {
         Vnum = 29, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 30, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 32, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               DestinationVnum = 33, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [30] = 
      {
         Vnum = 30, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 40, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 31, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 33, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 29, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [31] = 
      {
         Vnum = 31, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               DestinationVnum = 34, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               DestinationVnum = 30, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               DestinationVnum = 33, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [32] = 
      {
         Vnum = 32, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 29, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 33, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 35, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [33] = 
      {
         Vnum = 33, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 30, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 34, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 36, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 32, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "northeast", 
               DestinationVnum = 31, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [6] = 
            {
               Direction = "northwest", 
               DestinationVnum = 29, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [7] = 
            {
               Direction = "southeast", 
               DestinationVnum = 37, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [8] = 
            {
               Direction = "southwest", 
               DestinationVnum = 35, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [34] = 
      {
         Vnum = 34, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 31, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 37, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               DestinationVnum = 33, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [35] = 
      {
         Vnum = 35, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 32, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 36, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               DestinationVnum = 33, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [36] = 
      {
         Vnum = 36, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 33, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 37, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 38, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 35, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [37] = 
      {
         Vnum = 37, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Arena", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 34, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               DestinationVnum = 36, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               DestinationVnum = 33, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
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
      }, 
      [38] = 
      {
         Vnum = 38, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Southern Sniper Tower Entrance", 
         Sector = "inside", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 36, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 39, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
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
      }, 
      [39] = 
      {
         Vnum = 39, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Southern Sniper Tower", 
         Sector = "inside", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 36, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 38, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 37, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "northwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 35, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
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
      }, 
      [40] = 
      {
         Vnum = 40, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Northern Sniper Tower Entrance", 
         Sector = "inside", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               DestinationVnum = 30, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 41, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
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
      }, 
      [41] = 
      {
         Vnum = 41, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Northern Sniper Tower", 
         Sector = "inside", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 30, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 40, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 31, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "southwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 29, 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
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
      }, 
      [42] = 
      {
         Vnum = 42, 
         ExtraDescriptions = 
         {
         }, 
         Name = "First Combatant's Chamber", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
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
      }, 
      [43] = 
      {
         Vnum = 43, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Second Combatant's Chamber", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
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
      }, 
      [44] = 
      {
         Vnum = 44, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Lost in Space", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "", 
      }, 
      [45] = 
      {
         Vnum = 45, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Limbo Shipyard", 
         Sector = "city", 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
      }, 
   }, 
   VnumRanges = 
   {
      Object = 
      {
         First = 2, 
         Last = 99, 
      }, 
      Room = 
      {
         First = 1, 
         Last = 45, 
      }, 
      Mob = 
      {
         First = 1, 
         Last = 98, 
      }, 
   }, 
   Author = "RoD/Durga", 
   ResetFrequency = 0, 
   Flags = 
   {
      [1] = "_01", 
   }, 
   Filename = "limbo.lua", 
   LevelRanges = 
   {
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
      Soft = 
      {
         High = 103, 
         Low = 0, 
      }, 
   }, 
   LowEconomy = 42175975, 
   FileFormatVersion = 1, 
   Name = "Limbo", 
}
