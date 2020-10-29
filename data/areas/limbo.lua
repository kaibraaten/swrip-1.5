-- Limbo
-- Last saved Thursday 29-Oct-2020 14:32:40

AreaEntry
{
   Mobiles = 
   {
      [1] = 
      {
         ArmorClass = -30, 
         HitRoll = 0, 
         Credits = 10000, 
         DefaultPosition = "standing", 
         Sex = "female", 
         Level = 50, 
         Name = "Puff", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 5, 
            HitPlus = 30550, 
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
         NumberOfAttacks = 0, 
         Race = "Gand", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Vnum = 1, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "Puff", 
         Height = 0, 
         Alignment = 1000, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
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
               MudProgType = "speech_prog", 
               Arguments = "test", 
               ScriptType = "MProg", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 10, 
            DamPlus = 200, 
         }, 
         Position = "standing", 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
      }, 
      [2] = 
      {
         ArmorClass = -300, 
         HitRoll = 0, 
         Credits = 10000, 
         DefaultPosition = "standing", 
         Level = 50, 
         Name = "Richard Simmons", 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 5, 
            HitPlus = 31550, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Vnum = 2, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "Richard Simmons", 
         Height = 0, 
         Alignment = -1000, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "c heal $n\
c heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p wields", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mptrans $n 6\
", 
               MudProgType = "act_prog", 
               Arguments = "p is DEAD!!", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "25", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               Code = "mpforce $n drink\
c heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p is dying", 
               ScriptType = "MProg", 
            }, 
            [5] = 
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
               ScriptType = "MProg", 
            }, 
            [6] = 
            {
               Code = "cast heal $n\
cast heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p bashes against", 
               ScriptType = "MProg", 
            }, 
            [7] = 
            {
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p shivers and", 
               ScriptType = "MProg", 
            }, 
            [8] = 
            {
               Code = "c heal $n\
c heal $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p wears", 
               ScriptType = "MProg", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 2, 
            DamPlus = 2, 
         }, 
         Position = "standing", 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
      }, 
      [3] = 
      {
         ArmorClass = -162, 
         HitRoll = 21, 
         Credits = 10000, 
         DefaultPosition = "standing", 
         Level = 105, 
         Name = "supermob", 
         Description = "How clever he looks!\
", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 21, 
            HitPlus = 1050, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Vnum = 3, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 21, 
         Weight = 0, 
         ShortDescr = "the supermob", 
         Height = 0, 
         Alignment = -1000, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpinvis 101\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mpinvis 101\
", 
               MudProgType = "rand_prog", 
               Arguments = "25", 
               ScriptType = "MProg", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Position = "standing", 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
      }, 
      [4] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 103, 
         Name = "a vendor", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         Shop = 
         {
            ProfitBuy = 120, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
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
            ProfitSell = 90, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
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
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a vendor", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A Vendor owned by %s\
", 
      }, 
      [5] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "undead animated corpse", 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Human", 
         Vnum = 5, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "an animated corpse", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
      }, 
      [6] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "Rosie O'Donnel", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         Vnum = 6, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "Rosie O'Donnel...", 
         Height = 0, 
         Alignment = -1000, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
      }, 
      [7] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "Al Gore", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         Vnum = 7, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a newly created Al Gore", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
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
               MudProgType = "act_prog", 
               Arguments = "p is thirsty", 
               ScriptType = "MProg", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
      }, 
      [10] = 
      {
         ArmorClass = -100, 
         HitRoll = 16, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 80, 
         Name = "mauzumi die wolf", 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 16, 
            HitPlus = 800, 
         }, 
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
         NumberOfAttacks = 2, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
         Race = "_69", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         Vnum = 10, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 16, 
         Weight = 0, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 8, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Position = "standing", 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
      }, 
      [11] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "mist", 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
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
         NumberOfAttacks = 2, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "_85", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         Vnum = 11, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "mist", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A thick mist plays with your senses.\
", 
      }, 
      [12] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "bat", 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
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
         NumberOfAttacks = 2, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Barabel", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Vnum = 12, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "bat", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
      }, 
      [13] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "hawk", 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
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
         NumberOfAttacks = 2, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "_78", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Vnum = 13, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "hawk", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
      }, 
      [14] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "black cat", 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
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
         NumberOfAttacks = 2, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Gran", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Vnum = 14, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "black cat", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
      }, 
      [15] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "dove", 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
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
         NumberOfAttacks = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "_78", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Vnum = 15, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "dove", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
      }, 
      [16] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "fish", 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
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
         NumberOfAttacks = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "_81", 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         Vnum = 16, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "fish", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
      }, 
      [20] = 
      {
         ArmorClass = 75, 
         HitRoll = 2, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 10, 
         Name = "imperial trooper stormtrooper", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 2, 
            HitPlus = 100, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Race = "Human", 
         Vnum = 20, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 2, 
         Weight = 0, 
         ShortDescr = "a stormtrooper", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Position = "standing", 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
      }, 
      [21] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "imperial guard stormtrooper", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Vnum = 21, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "an imperial guard", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "An imperial guard stands at attention.\
", 
      }, 
      [22] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "Rebel Alliance guard", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Vnum = 22, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
      }, 
      [23] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "Rebel Alliance Trooper soldier", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Race = "Human", 
         Vnum = 23, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a rebel alliance trooper", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
      }, 
      [24] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "A mercenary", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Human", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Vnum = 24, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a mercenary", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A mercenary stands here ready for battle.\
", 
      }, 
      [25] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "bouncer guard thug", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Vnum = 25, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a guard", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "An alert guard stands at attention.\
", 
      }, 
      [26] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "Imperial Elite Guard", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 3, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Race = "Human", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Vnum = 26, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "an imperial guard", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
      }, 
      [27] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "The Empire", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Vnum = 27, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "an imperial guard", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "An imperial guard stands at attention.\
", 
      }, 
      [28] = 
      {
         ArmorClass = 75, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 10, 
         Name = "an imperial specfor trooper", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 2, 
            HitPlus = 100, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Race = "Human", 
         Vnum = 28, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a stormtrooper", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Position = "standing", 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
      }, 
      [29] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "rebel elite guard", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 3, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Race = "Human", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Vnum = 29, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
      }, 
      [30] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "The Rebel Alliance", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Vnum = 30, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
      }, 
      [31] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "a rebel specfor trooper", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 3, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Race = "Human", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Vnum = 31, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a rebel alliance trooper", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
      }, 
      [32] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "a merc elite guard", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 3, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Race = "Human", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Vnum = 32, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a guard", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "An elite guard stands at rigid attention.\
", 
      }, 
      [40] = 
      {
         ArmorClass = -162, 
         HitRoll = 21, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 105, 
         Name = "Ship Upgrades Technician", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 21, 
            HitPlus = 1050, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         Vnum = 40, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         DamRoll = 21, 
         Weight = 0, 
         ShortDescr = "the ship upgrades technician", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 5991 autopilot\
", 
               MudProgType = "speech_prog", 
               Arguments = "autopilot", 
               ScriptType = "MProg", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Position = "standing", 
         LongDescr = "The ship upgrades technician is here.\
", 
      }, 
      [33] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "bouncer guard thug", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Vnum = 33, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a guard", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "An alert guard stands at attention.\
", 
      }, 
      [50] = 
      {
         ArmorClass = -162, 
         HitRoll = 21, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
         Level = 105, 
         Name = "Master Yoda", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 21, 
            HitPlus = 5000, 
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
         NumberOfAttacks = 0, 
         Race = "Human", 
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
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Vnum = 50, 
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
         ShortDescr = "Jedi Master Yoda", 
         Height = 0, 
         Alignment = 1000, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
               MudProgType = "speech_prog", 
               Arguments = "corusca", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
               MudProgType = "speech_prog", 
               Arguments = "give", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
               MudProgType = "speech_prog", 
               Arguments = "shop", 
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
               MudProgType = "act_prog", 
               Arguments = "package.", 
               ScriptType = "MProg", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Position = "standing", 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
      }, 
      [98] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "janitor", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         Vnum = 98, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a janitor", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 32179 drop all\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "A janitor cleans up the ship here.\
", 
      }, 
      [34] = 
      {
         ArmorClass = 0, 
         HitRoll = 0, 
         Credits = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Name = "A mercenary", 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
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
         NumberOfAttacks = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         Vnum = 34, 
         Stats = 
         {
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         DamRoll = 0, 
         Weight = 0, 
         ShortDescr = "a mercenary", 
         Height = 0, 
         Alignment = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
      }, 
   }, 
   Author = "RoD/Durga", 
   Rooms = 
   {
      [1] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 100, 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 107, 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
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
               MudProgType = "speech_prog", 
               Arguments = "test", 
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
               MudProgType = "speech_prog", 
               Arguments = "test2", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               Code = "mpdamage $n 234234\
", 
               MudProgType = "speech_prog", 
               Arguments = "die", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "&CCorrans Insane Apartment&g", 
         Tunnel = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [2] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32145, 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 2, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Description = "", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Limbo", 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [3] = 
      {
         Exits = 
         {
         }, 
         Vnum = 3, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "An Empty Home", 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [4] = 
      {
         Exits = 
         {
         }, 
         Vnum = 4, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Description = "The Imp functions spawnobj() and spawnmob() will dump their result here.\
Needless to say you should use tocontainer() to put it where it's supposed\
to go.\
\
IF THERE IS ANYTHING IN THIS ROOM, IT MEANS SOME SCRIPT IS MISBEHAVING.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Spawn Location for Scripts", 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [5] = 
      {
         Exits = 
         {
         }, 
         Vnum = 5, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [6] = 
      {
         Exits = 
         {
         }, 
         Vnum = 6, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
         TeleVnum = 0, 
         Tag = "", 
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
      }, 
      [7] = 
      {
         Exits = 
         {
         }, 
         Vnum = 7, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mppurge\
", 
               MudProgType = "speech_prog", 
               Arguments = "purge", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Mobprog Purge Room", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [8] = 
      {
         Exits = 
         {
         }, 
         Vnum = 8, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Immhood ClanStoreRoom", 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [10] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 100, 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
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
               MudProgType = "speech_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "An Empty Home", 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [11] = 
      {
         Exits = 
         {
         }, 
         Vnum = 11, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [12] = 
      {
         Exits = 
         {
         }, 
         Vnum = 12, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [19] = 
      {
         Exits = 
         {
         }, 
         Vnum = 19, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
         TeleVnum = 0, 
         Tag = "", 
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
      }, 
      [20] = 
      {
         Exits = 
         {
         }, 
         Vnum = 20, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [29] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 32, 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
               Direction = "southeast", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 29, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "The Arena", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [30] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 40, 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 31, 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               DestinationVnum = 29, 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 30, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "The Arena", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 34, 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 30, 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
               Direction = "southwest", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 31, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "The Arena", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [32] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29, 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 35, 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 32, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "The Arena", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
      }, 
      [33] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 34, 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 36, 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               DestinationVnum = 32, 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
            }, 
            [5] = 
            {
               DestinationVnum = 31, 
               Description = "", 
               Distance = 0, 
               Direction = "northeast", 
               Keyword = "", 
               Key = -1, 
            }, 
            [6] = 
            {
               DestinationVnum = 29, 
               Description = "", 
               Distance = 0, 
               Direction = "northwest", 
               Keyword = "", 
               Key = -1, 
            }, 
            [7] = 
            {
               DestinationVnum = 37, 
               Description = "", 
               Distance = 0, 
               Direction = "southeast", 
               Keyword = "", 
               Key = -1, 
            }, 
            [8] = 
            {
               DestinationVnum = 35, 
               Description = "", 
               Distance = 0, 
               Direction = "southwest", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 33, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "The Arena", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [34] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 31, 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 37, 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 34, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "The Arena", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [35] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32, 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 36, 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
               Direction = "northeast", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 35, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "The Arena", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [36] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 37, 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 38, 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               DestinationVnum = 35, 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 36, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "The Arena", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [37] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 34, 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 36, 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Description = "", 
               Distance = 0, 
               Direction = "northwest", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 37, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "The Arena", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [38] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 36, 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 39, 
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 38, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
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
         TeleVnum = 0, 
         Tag = "", 
         Name = "Southern Sniper Tower Entrance", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [39] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 36, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 38, 
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Distance = 0, 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 37, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Direction = "northeast", 
               Keyword = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               DestinationVnum = 35, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Direction = "northwest", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 39, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Southern Sniper Tower", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [40] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 41, 
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 40, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
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
         TeleVnum = 0, 
         Tag = "", 
         Name = "Northern Sniper Tower Entrance", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [41] = 
      {
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 40, 
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Distance = 0, 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 31, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Direction = "southeast", 
               Keyword = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               DestinationVnum = 29, 
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Direction = "southwest", 
               Keyword = "", 
               Key = -1, 
            }, 
         }, 
         Vnum = 41, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Northern Sniper Tower", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [42] = 
      {
         Exits = 
         {
         }, 
         Vnum = 42, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "First Combatant's Chamber", 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [43] = 
      {
         Exits = 
         {
         }, 
         Vnum = 43, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Second Combatant's Chamber", 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [44] = 
      {
         Exits = 
         {
         }, 
         Vnum = 44, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Lost in Space", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [45] = 
      {
         Exits = 
         {
         }, 
         Vnum = 45, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         TeleVnum = 0, 
         Tag = "", 
         Name = "Limbo Shipyard", 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 2, 
         Arg1 = 1, 
         Arg2 = 1, 
         MiscData = 0, 
         Command = "M", 
      }, 
      [2] = 
      {
         Arg3 = 10, 
         Arg1 = 90, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [3] = 
      {
         Arg3 = 6, 
         Arg1 = 6, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [4] = 
      {
         Arg3 = 6, 
         Arg1 = 2, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [5] = 
      {
         Arg3 = 6, 
         Arg1 = 7, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [6] = 
      {
         Arg3 = 6, 
         Arg1 = 7, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "O", 
      }, 
   }, 
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
   Objects = 
   {
      [2] = 
      {
         ItemType = "money", 
         ActionDescription = "", 
         Vnum = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Layers = 0, 
         ShortDescr = "a credit", 
         Name = "credit credits", 
         Description = "One miserable credit.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [3] = 
      {
         ItemType = "money", 
         ActionDescription = "", 
         Vnum = 3, 
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
         ShortDescr = "%d credits", 
         Name = "credits credit", 
         Description = "Some credits.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [4] = 
      {
         ItemType = "paper", 
         ActionDescription = "", 
         Vnum = 4, 
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
         ShortDescr = "A deed", 
         Name = "deed", 
         Description = "A deed for a shop", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [5] = 
      {
         ItemType = "armor", 
         ActionDescription = "", 
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
         ShortDescr = "a metal amulet", 
         Name = "an amulet", 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Weight = 1, 
         Cost = 100000, 
         Flags = 
         {
            [8] = "Bless", 
            [5] = "Invis", 
            [6] = "Magic", 
            [21] = "ClanObject", 
         }, 
      }, 
      [6] = 
      {
         ItemType = "armor", 
         ActionDescription = "", 
         Vnum = 6, 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 2097152, 
            }, 
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
         Layers = 0, 
         ShortDescr = "A small charm", 
         Name = "charm", 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         Cost = 0, 
         Flags = 
         {
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
      }, 
      [7] = 
      {
         ItemType = "fountain", 
         ActionDescription = "", 
         Vnum = 7, 
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
         ShortDescr = "Tipper Gore!", 
         Name = "Tipper Gore", 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [9] = 
      {
         ItemType = "droid_corpse", 
         ActionDescription = "", 
         Vnum = 9, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "the broken parts of %s", 
         Name = "corpse remains pieces parts", 
         Description = "The shattered remains of %s are here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [10] = 
      {
         ItemType = "corpse", 
         ActionDescription = "", 
         Vnum = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "the corpse of %s", 
         Name = "corpse", 
         Description = "The corpse of %s lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 100, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [11] = 
      {
         ItemType = "corpse_pc", 
         ActionDescription = "", 
         Vnum = 11, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "the corpse of %s", 
         Name = "corpse", 
         Description = "The corpse of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 100, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [12] = 
      {
         ItemType = "food", 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         Vnum = 12, 
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
         ShortDescr = "the head of %s", 
         Name = "head", 
         Description = "The severed head of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [13] = 
      {
         ItemType = "food", 
         ActionDescription = "%s savagely devour$q $p!", 
         Vnum = 13, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 16, 
         }, 
         Layers = 0, 
         ShortDescr = "the heart of %s", 
         Name = "heart", 
         Description = "The torn-out heart of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [14] = 
      {
         ItemType = "food", 
         ActionDescription = "%s chomp$q on $p.", 
         Vnum = 14, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Layers = 0, 
         ShortDescr = "the arm of %s", 
         Name = "arm", 
         Description = "The sliced-off arm of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [15] = 
      {
         ItemType = "food", 
         ActionDescription = "%s chomp$q on $p.", 
         Vnum = 15, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Layers = 0, 
         ShortDescr = "the leg of %s", 
         Name = "leg", 
         Description = "The sliced-off leg of %s is lying here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [16] = 
      {
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 16, 
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
         ShortDescr = "the spilled guts of %s", 
         Name = "guts", 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [17] = 
      {
         ItemType = "_blood", 
         ActionDescription = "", 
         Vnum = 17, 
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
         ShortDescr = "the spilled blood", 
         Name = "blood", 
         Description = "A pool of spilled blood lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [18] = 
      {
         ItemType = "_bloodstain", 
         ActionDescription = "", 
         Vnum = 18, 
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
         ShortDescr = "the bloodstain", 
         Name = "bloodstain", 
         Description = "Blood stains the ground.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [19] = 
      {
         ItemType = "scraps", 
         ActionDescription = "", 
         Vnum = 19, 
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
         ShortDescr = "the scraps of %s", 
         Name = "scraps", 
         Description = "The scraps of %s lie here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [20] = 
      {
         ItemType = "food", 
         ActionDescription = "%s enjoy$q $p.", 
         Vnum = 20, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Layers = 0, 
         ShortDescr = "a fruit roll-up", 
         Name = "fruit roll-up", 
         Description = "A fruit roll-up lies here", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 10, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [21] = 
      {
         ItemType = "light", 
         ActionDescription = "", 
         Vnum = 21, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a bright ball of light", 
         Name = "ball light", 
         Description = "A bright ball of light shimmers in the air.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [22] = 
      {
         ItemType = "fountain", 
         ActionDescription = "", 
         Vnum = 22, 
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
         ShortDescr = "a magical spring", 
         Name = "spring", 
         Description = "A magical spring flows here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Cost = 10, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
      }, 
      [23] = 
      {
         ItemType = "fabric", 
         ActionDescription = "", 
         Vnum = 23, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Layers = 0, 
         ShortDescr = "the skin of %s", 
         Name = "the skin of %s", 
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
         Weight = 1, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
      }, 
      [24] = 
      {
         ItemType = "food", 
         ActionDescription = "", 
         Vnum = 24, 
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
         ShortDescr = "a slice of raw meat from %s", 
         Name = "meat fresh slice", 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 2, 
         Cost = 0, 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
      }, 
      [25] = 
      {
         ItemType = "container", 
         ActionDescription = "", 
         Vnum = 25, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Layers = 0, 
         ShortDescr = "a bag", 
         Name = "shopping bag", 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         Cost = 20, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [26] = 
      {
         ItemType = "fightercomp", 
         ActionDescription = "", 
         Vnum = 26, 
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
         ShortDescr = "A ship part for %s", 
         Name = "fighter module", 
         Description = "What looks like a part of a ship lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 100, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [27] = 
      {
         ItemType = "midcomp", 
         ActionDescription = "", 
         Vnum = 27, 
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
         ShortDescr = "A midsize ship part for %s", 
         Name = "midsize midship module", 
         Description = "What looks like a decent size part for a ship lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 150, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [28] = 
      {
         ItemType = "capitalcomp", 
         ActionDescription = "", 
         Vnum = 28, 
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
         ShortDescr = "A capital-class ship part for %s", 
         Name = "capship capital module", 
         Description = "What looks like a huge ship part lies here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 350, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [30] = 
      {
         ItemType = "fire", 
         ActionDescription = "", 
         Vnum = 30, 
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
         ShortDescr = "a magical fire", 
         Name = "fire", 
         Description = "A magical fire burns brightly.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Cost = 10, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
      }, 
      [31] = 
      {
         ItemType = "trap", 
         ActionDescription = "", 
         Vnum = 31, 
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
         ShortDescr = "a trap", 
         Name = "trap", 
         Description = "You detect a trap.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         Weight = 100, 
      }, 
      [32] = 
      {
         ItemType = "_portal", 
         ActionDescription = "", 
         Vnum = 32, 
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
         ShortDescr = "a portal", 
         Name = "portal", 
         Description = "A misty portal beckons you to the unknown.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 100, 
         Cost = 10, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
      }, 
      [33] = 
      {
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 33, 
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
         ShortDescr = "black poisoning powder", 
         Name = "black poison powder", 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 48000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [34] = 
      {
         ItemType = "scroll", 
         ActionDescription = "", 
         Vnum = 34, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a blank scroll", 
         Name = "scroll scribing blank", 
         Description = "A blank scroll lays here gathering dust.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         Cost = 10000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [35] = 
      {
         ItemType = "potion", 
         ActionDescription = "", 
         Vnum = 35, 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Layers = 0, 
         ShortDescr = "an empty flask", 
         Name = "flask empty", 
         Description = "An empty flask lays here gathering dust.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 15000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [36] = 
      {
         ItemType = "paper", 
         ActionDescription = "", 
         Vnum = 36, 
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
         ShortDescr = "a message disk", 
         Name = "parchment paper note data disk message info", 
         Description = "A message disk has been discarded here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 1500, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [37] = 
      {
         ItemType = "pen", 
         ActionDescription = "", 
         Vnum = 37, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Layers = 0, 
         ShortDescr = "a datapad", 
         Name = "quill pen datapad recorder message disk", 
         Description = "A datapad used for recording message disks is here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 2, 
         Cost = 2000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [38] = 
      {
         ItemType = "furniture", 
         ActionDescription = "", 
         Vnum = 38, 
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
         ShortDescr = "a mail terminal", 
         Name = "mail terminal", 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [43] = 
      {
         ItemType = "armor", 
         ActionDescription = "", 
         Vnum = 43, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Layers = 0, 
         ShortDescr = "a symbol of faith", 
         Name = "holy symbol faith", 
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
         Weight = 5, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [45] = 
      {
         ItemType = "grenade", 
         ActionDescription = "", 
         Vnum = 45, 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Layers = 0, 
         ShortDescr = "a grenade", 
         Name = "grenade", 
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
         Weight = 1, 
         Cost = 1200, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [46] = 
      {
         ItemType = "landmine", 
         ActionDescription = "", 
         Vnum = 46, 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Layers = 0, 
         ShortDescr = "a landmine", 
         Name = "landmine mine", 
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
         Weight = 1, 
         Cost = 1000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
      [50] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 50, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         Name = "blaster Blastech E11 rifle E-11", 
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
         Weight = 10, 
         Cost = 3250, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [51] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 51, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         Name = "blaster blastech dl-18 blaster pistol", 
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
         Weight = 6, 
         Cost = 3000, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [52] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 52, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
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
         Weight = 8, 
         Cost = 3600, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [53] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 53, 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         Name = "blaster blastech dlt-19 assault rifle", 
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
         Weight = 12, 
         Cost = 3750, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [54] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 54, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         Name = "blastech t-21 repeating blaster", 
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
         Weight = 10, 
         Cost = 3900, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [55] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 55, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a Bryar heavy blaster pistol", 
         Name = "bryar pistol blaster", 
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
         Weight = 8, 
         Cost = 3700, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [56] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 56, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 300, 
            [5] = 300, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a Budgetline 3.0/12", 
         Name = "blaster Budgetline 3.0/12 holdout", 
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
         Weight = 4, 
         Cost = 900, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [57] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 57, 
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
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         Name = "sorosuub q2 holdout blaster", 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 4, 
         Cost = 2800, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [58] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 58, 
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
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         Name = "blastech last resort mini-blaster blaster", 
         Description = "A very small blaster was dropped here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 3, 
         Cost = 2000, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [59] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 59, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -1, 
            }, 
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
         Layers = 0, 
         ShortDescr = "a long sharp vibro-blade", 
         Name = "long vibro-blade", 
         Description = "A sharp looking blade is here.", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 4, 
         Cost = 350, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
      [60] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 60, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a Sorosuub One blaster rifle", 
         Name = "Sorosuub One Blaster Rifle", 
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
         Weight = 10, 
         Cost = 3000, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
      }, 
      [99] = 
      {
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 99, 
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
         ShortDescr = "a newly created final object", 
         Name = "final object", 
         Description = "Some god dropped a newly created final object here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [90] = 
      {
         ItemType = "furniture", 
         ActionDescription = "", 
         Vnum = 90, 
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
         ShortDescr = "the suggestions board", 
         Name = "Suggestions Board", 
         Description = "The suggestions board is here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [70] = 
      {
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
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
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
         Name = "quest weapon double bladed lightsaber saber", 
         Description = "The hilt of a lightsaber lies on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
               MudProgType = "remove_prog", 
               Arguments = "100", 
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
               MudProgType = "wear_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 8, 
         Cost = 0, 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
      }, 
      [71] = 
      {
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ActionDescription = "", 
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
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
         Name = "quest armor mandalorian battle helmet", 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
               MudProgType = "remove_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 10, 
         Cost = 0, 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
      }, 
      [72] = 
      {
         ItemType = "container", 
         ActionDescription = "", 
         Vnum = 72, 
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
         ShortDescr = "Mystery Box 1", 
         Name = "quest item", 
         Description = "A dud is here.", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10313\
put ration item\
", 
               MudProgType = "use_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 1, 
         Cost = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [73] = 
      {
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ActionDescription = "", 
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
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
         Name = "quest shield generator", 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
               MudProgType = "remove_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 3, 
         Cost = 0, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
      }, 
      [74] = 
      {
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 74, 
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
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
         Name = "quest item dinner", 
         Description = "A dud is here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [75] = 
      {
         ItemType = "treasure", 
         ActionDescription = "", 
         Vnum = 75, 
         WearFlags = 
         {
            [0] = "Take", 
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
         Layers = 0, 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         Name = "quest token sapphire", 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         ExtraDescriptions = 
         {
         }, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 2, 
         Cost = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [76] = 
      {
         ItemType = "treasure", 
         ActionDescription = "", 
         Vnum = 76, 
         WearFlags = 
         {
            [0] = "Take", 
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
         Layers = 0, 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         Name = "quest token diamond", 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         ExtraDescriptions = 
         {
         }, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 1, 
         Cost = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [77] = 
      {
         ItemType = "treasure", 
         ActionDescription = "", 
         Vnum = 77, 
         WearFlags = 
         {
            [0] = "Take", 
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
         Layers = 0, 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         Name = "quest token emerald", 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         ExtraDescriptions = 
         {
         }, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 1, 
         Cost = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [78] = 
      {
         ItemType = "treasure", 
         ActionDescription = "", 
         Vnum = 78, 
         WearFlags = 
         {
            [0] = "Take", 
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
         Layers = 0, 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         Name = "quest token amythest", 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         ExtraDescriptions = 
         {
         }, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 1, 
         Cost = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [79] = 
      {
         ItemType = "treasure", 
         ActionDescription = "", 
         Vnum = 79, 
         WearFlags = 
         {
            [0] = "Take", 
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
         Layers = 0, 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         Name = "quest token ruby", 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         ExtraDescriptions = 
         {
         }, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 1, 
         Cost = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
   }, 
   LowEconomy = 41975975, 
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
   Filename = "limbo.lua", 
   ResetMessage = "&rYour soul burns...", 
   HighEconomy = 0, 
   Flags = 
   {
      [1] = "_01", 
   }, 
}
