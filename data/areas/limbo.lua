-- Limbo
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   LowEconomy = 42155975, 
   FileFormatVersion = 1, 
   Mobiles = 
   {
      [1] = 
      {
         Sex = "female", 
         Credits = 10000, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ArmorClass = -30, 
         Vnum = 1, 
         HitChance = 
         {
            HitPlus = 30550, 
            HitSizeDice = 10, 
            HitNoDice = 5, 
         }, 
         Level = 50, 
         Alignment = 1000, 
         Weight = 0, 
         ShortDescr = "Puff", 
         DamRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
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
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
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
               MudProgType = "speech_prog", 
            }, 
         }, 
         Description = "", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Race = "Gand", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Name = "Puff", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Height = 0, 
         NumberOfAttacks = 0, 
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
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
      }, 
      [2] = 
      {
         Sex = "undistinguished", 
         Credits = 10000, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ArmorClass = -300, 
         Vnum = 2, 
         HitChance = 
         {
            HitPlus = 31550, 
            HitSizeDice = 10, 
            HitNoDice = 5, 
         }, 
         Level = 50, 
         Alignment = -1000, 
         Weight = 0, 
         ShortDescr = "Richard Simmons", 
         DamRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "p is DEAD!!", 
               Code = "mptrans $n 6\
", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Arguments = "25", 
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
               MudProgType = "rand_prog", 
            }, 
            [3] = 
            {
               Arguments = "p is dying", 
               Code = "mpforce $n drink\
c heal $n\
", 
               MudProgType = "act_prog", 
            }, 
            [4] = 
            {
               Arguments = "p is starved", 
               Code = "mpoload 20\
give roll $n\
mpforce $n eat roll\
cast heal $n\
emote cackles happily\
say Oh, the ponies!\
", 
               MudProgType = "act_prog", 
            }, 
            [5] = 
            {
               Arguments = "p bashes against", 
               Code = "cast heal $n\
cast heal $n\
", 
               MudProgType = "act_prog", 
            }, 
            [6] = 
            {
               Arguments = "p shivers and", 
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
               MudProgType = "act_prog", 
            }, 
            [7] = 
            {
               Arguments = "p wears", 
               Code = "c heal $n\
c heal $n\
", 
               MudProgType = "act_prog", 
            }, 
            [8] = 
            {
               Arguments = "p wields", 
               Code = "c heal $n\
c heal $n\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 2, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Name = "Richard Simmons", 
         Race = "Human", 
         Height = 0, 
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
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
      }, 
      [3] = 
      {
         Sex = "undistinguished", 
         Credits = 10000, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [13] = "PolySelf", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         ArmorClass = -162, 
         Vnum = 3, 
         HitChance = 
         {
            HitPlus = 1050, 
            HitSizeDice = 10, 
            HitNoDice = 21, 
         }, 
         Level = 105, 
         Alignment = -1000, 
         Weight = 0, 
         ShortDescr = "the supermob", 
         DamRoll = 21, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "25", 
               Code = "mpinvis 101\
", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "mpinvis 101\
", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         Description = "How clever he looks!\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         HitRoll = 21, 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Name = "supermob", 
         Race = "Human", 
         Height = 0, 
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
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
      }, 
      [4] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         ArmorClass = 0, 
         Vnum = 4, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 103, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a vendor", 
         DamRoll = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a vendor", 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Description = "", 
         HitRoll = 0, 
         Name = "a vendor", 
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
         NumberOfAttacks = 0, 
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
         LongDescr = "A Vendor owned by %s\
", 
      }, 
      [5] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 5, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "an animated corpse", 
         DamRoll = 0, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "undead animated corpse", 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         Height = 0, 
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
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
      }, 
      [6] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         ArmorClass = 0, 
         Vnum = 6, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = -1000, 
         Weight = 0, 
         ShortDescr = "Rosie O'Donnel...", 
         DamRoll = 0, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "Rosie O'Donnel", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
      }, 
      [7] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ArmorClass = 0, 
         Vnum = 7, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a newly created Al Gore", 
         DamRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "p is thirsty", 
               Code = "mpforce $n drink\
emote grins quietly\
say After no dose stopped giving me\
cash...\
say The wife HAD to go.\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "Al Gore", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
      }, 
      [10] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
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
         ArmorClass = -100, 
         Vnum = 10, 
         HitChance = 
         {
            HitPlus = 800, 
            HitSizeDice = 10, 
            HitNoDice = 16, 
         }, 
         Level = 80, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         DamRoll = 16, 
         Race = "_69", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 8, 
            DamPlus = 2, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         HitRoll = 16, 
         Name = "mauzumi die wolf", 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         Height = 0, 
         NumberOfAttacks = 2, 
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
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
      }, 
      [11] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 11, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "mist", 
         DamRoll = 0, 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         Name = "mist", 
         Race = "_85", 
         Height = 0, 
         NumberOfAttacks = 2, 
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
         LongDescr = "A thick mist plays with your senses.\
", 
      }, 
      [12] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 12, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "bat", 
         DamRoll = 0, 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Name = "bat", 
         Race = "Barabel", 
         Height = 0, 
         NumberOfAttacks = 2, 
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
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
      }, 
      [13] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 13, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "hawk", 
         DamRoll = 0, 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Name = "hawk", 
         Race = "_78", 
         Height = 0, 
         NumberOfAttacks = 2, 
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
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
      }, 
      [14] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 14, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "black cat", 
         DamRoll = 0, 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Name = "black cat", 
         Race = "Gran", 
         Height = 0, 
         NumberOfAttacks = 2, 
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
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
      }, 
      [15] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 15, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "dove", 
         DamRoll = 0, 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         Name = "dove", 
         Race = "_78", 
         Height = 0, 
         NumberOfAttacks = 1, 
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
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
      }, 
      [16] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 16, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "fish", 
         DamRoll = 0, 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         Name = "fish", 
         Race = "_81", 
         Height = 0, 
         NumberOfAttacks = 1, 
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
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
      }, 
      [20] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         ArmorClass = 75, 
         Vnum = 20, 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         Level = 10, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a stormtrooper", 
         DamRoll = 2, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 2, 
         Name = "imperial trooper stormtrooper", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
      }, 
      [21] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 21, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "imperial guard stormtrooper", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "An imperial guard stands at attention.\
", 
      }, 
      [22] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 22, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "Rebel Alliance guard", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
      }, 
      [23] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         ArmorClass = 0, 
         Vnum = 23, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a rebel alliance trooper", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "Rebel Alliance Trooper soldier", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
      }, 
      [24] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         ArmorClass = 0, 
         Vnum = 24, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a mercenary", 
         DamRoll = 0, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Position = "standing", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         HitRoll = 0, 
         Name = "A mercenary", 
         Description = "", 
         Height = 0, 
         NumberOfAttacks = 1, 
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
         LongDescr = "A mercenary stands here ready for battle.\
", 
      }, 
      [25] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 25, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "bouncer guard thug", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "An alert guard stands at attention.\
", 
      }, 
      [26] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 26, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Description = "", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Name = "Imperial Elite Guard", 
         Race = "Human", 
         Height = 0, 
         NumberOfAttacks = 3, 
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
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
      }, 
      [27] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 27, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "an imperial guard", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "The Empire", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "An imperial guard stands at attention.\
", 
      }, 
      [28] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         ArmorClass = 75, 
         Vnum = 28, 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         Level = 10, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a stormtrooper", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "an imperial specfor trooper", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
      }, 
      [29] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 29, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Description = "", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Name = "rebel elite guard", 
         Race = "Human", 
         Height = 0, 
         NumberOfAttacks = 3, 
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
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
      }, 
      [30] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 30, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a Rebel Alliance guard", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "The Rebel Alliance", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
      }, 
      [31] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         ArmorClass = 0, 
         Vnum = 31, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a rebel alliance trooper", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Description = "", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Name = "a rebel specfor trooper", 
         Race = "Human", 
         Height = 0, 
         NumberOfAttacks = 3, 
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
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
      }, 
      [32] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 32, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Description = "", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Position = "standing", 
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
         HitRoll = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Name = "a merc elite guard", 
         Race = "Human", 
         Height = 0, 
         NumberOfAttacks = 3, 
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
         LongDescr = "An elite guard stands at rigid attention.\
", 
      }, 
      [40] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [12] = "Deadly", 
            [25] = "NoKill", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         ArmorClass = -162, 
         Vnum = 40, 
         HitChance = 
         {
            HitPlus = 1050, 
            HitSizeDice = 10, 
            HitNoDice = 21, 
         }, 
         Level = 105, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "the ship upgrades technician", 
         DamRoll = 21, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "autopilot", 
               Code = "mpat 5991 autopilot\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         Description = "", 
         HitRoll = 21, 
         Name = "Ship Upgrades Technician", 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Height = 0, 
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
         LongDescr = "The ship upgrades technician is here.\
", 
      }, 
      [33] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         Vnum = 33, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a guard", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "bouncer guard thug", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "An alert guard stands at attention.\
", 
      }, 
      [50] = 
      {
         Sex = "male", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         ArmorClass = -162, 
         Vnum = 50, 
         HitChance = 
         {
            HitPlus = 5000, 
            HitSizeDice = 10, 
            HitNoDice = 21, 
         }, 
         Level = 105, 
         Alignment = 1000, 
         Weight = 0, 
         ShortDescr = "Jedi Master Yoda", 
         DamRoll = 21, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "give", 
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "shop", 
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
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
               MudProgType = "act_prog", 
            }, 
            [4] = 
            {
               Arguments = "corusca", 
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Description = "", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         Race = "Human", 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         Position = "standing", 
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
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         HitRoll = 21, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Name = "Master Yoda", 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Height = 0, 
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
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
      }, 
      [98] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ArmorClass = 0, 
         Vnum = 98, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a janitor", 
         DamRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpat 32179 drop all\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "janitor", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "A janitor cleans up the ship here.\
", 
      }, 
      [34] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
            [15] = "Guardian", 
         }, 
         ArmorClass = 0, 
         Vnum = 34, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Level = 1, 
         Alignment = 0, 
         Weight = 0, 
         ShortDescr = "a mercenary", 
         DamRoll = 0, 
         Race = "Human", 
         Position = "standing", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Constitution = 0, 
         }, 
         HitRoll = 0, 
         Name = "A mercenary", 
         Description = "", 
         Height = 0, 
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
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
      }, 
   }, 
   Flags = 
   {
      [1] = "_01", 
   }, 
   Author = "RoD/Durga", 
   HighEconomy = 0, 
   Objects = 
   {
      [2] = 
      {
         ItemType = "money", 
         ActionDescription = "", 
         Vnum = 2, 
         Description = "One miserable credit.", 
         Layers = 0, 
         Cost = 0, 
         Name = "credit credits", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [3] = 
      {
         ItemType = "money", 
         ActionDescription = "", 
         Vnum = 3, 
         Description = "Some credits.", 
         Layers = 0, 
         Cost = 0, 
         Name = "credits credit", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [4] = 
      {
         ItemType = "paper", 
         ActionDescription = "", 
         Vnum = 4, 
         Description = "A deed for a shop", 
         Layers = 0, 
         Cost = 0, 
         Name = "deed", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [5] = 
      {
         ItemType = "armor", 
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
         Vnum = 5, 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
         Layers = 0, 
         Cost = 100000, 
         Name = "an amulet", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "a metal amulet", 
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
      }, 
      [6] = 
      {
         ItemType = "armor", 
         Flags = 
         {
            [23] = "_23", 
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 27, 
               Modifier = 2097152, 
            }, 
         }, 
         Vnum = 6, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "charm", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         ShortDescr = "A small charm", 
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
      }, 
      [7] = 
      {
         ItemType = "fountain", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         Vnum = 7, 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         Layers = 0, 
         Name = "Tipper Gore", 
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
         ShortDescr = "Tipper Gore!", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [9] = 
      {
         ItemType = "droid_corpse", 
         ActionDescription = "", 
         Vnum = 9, 
         Description = "The shattered remains of %s are here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "corpse remains pieces parts", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [10] = 
      {
         ItemType = "corpse", 
         ActionDescription = "", 
         Vnum = 10, 
         Description = "The corpse of %s lies here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "corpse", 
         Weight = 100, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11] = 
      {
         ItemType = "corpse_pc", 
         ActionDescription = "", 
         Vnum = 11, 
         Description = "The corpse of %s is lying here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "corpse", 
         Weight = 100, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [12] = 
      {
         ItemType = "food", 
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         Vnum = 12, 
         Description = "The severed head of %s is lying here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "head", 
         Weight = 5, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [13] = 
      {
         ItemType = "food", 
         ActionDescription = "%s savagely devour$q $p!", 
         Vnum = 13, 
         Description = "The torn-out heart of %s is lying here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "heart", 
         Weight = 2, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [14] = 
      {
         ItemType = "food", 
         ActionDescription = "%s chomp$q on $p.", 
         Vnum = 14, 
         Description = "The sliced-off arm of %s is lying here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "arm", 
         Weight = 5, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [15] = 
      {
         ItemType = "food", 
         ActionDescription = "%s chomp$q on $p.", 
         Vnum = 15, 
         Description = "The sliced-off leg of %s is lying here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "leg", 
         Weight = 5, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [16] = 
      {
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 16, 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         Layers = 0, 
         Name = "guts", 
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
         ShortDescr = "the spilled guts of %s", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [17] = 
      {
         ItemType = "_blood", 
         ActionDescription = "", 
         Vnum = 17, 
         Description = "A pool of spilled blood lies here.", 
         Layers = 0, 
         Name = "blood", 
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
         ShortDescr = "the spilled blood", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [18] = 
      {
         ItemType = "_bloodstain", 
         ActionDescription = "", 
         Vnum = 18, 
         Description = "Blood stains the ground.", 
         Layers = 0, 
         Name = "bloodstain", 
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
         ShortDescr = "the bloodstain", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [19] = 
      {
         ItemType = "scraps", 
         ActionDescription = "", 
         Vnum = 19, 
         Description = "The scraps of %s lie here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "scraps", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [20] = 
      {
         ItemType = "food", 
         ActionDescription = "%s enjoy$q $p.", 
         Vnum = 20, 
         Description = "A fruit roll-up lies here", 
         Layers = 0, 
         Cost = 10, 
         Name = "fruit roll-up", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [21] = 
      {
         ItemType = "light", 
         ActionDescription = "", 
         Vnum = 21, 
         Description = "A bright ball of light shimmers in the air.", 
         Layers = 0, 
         Cost = 0, 
         Name = "ball light", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [22] = 
      {
         ItemType = "fountain", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         Vnum = 22, 
         Description = "A magical spring flows here.", 
         Layers = 0, 
         Name = "spring", 
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
         ShortDescr = "a magical spring", 
         Cost = 10, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [23] = 
      {
         ItemType = "fabric", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 25, 
               Modifier = 2, 
            }, 
         }, 
         Vnum = 23, 
         Description = "The skin of %s", 
         Layers = 0, 
         Cost = 0, 
         Name = "the skin of %s", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [24] = 
      {
         ItemType = "food", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ActionDescription = "", 
         Vnum = 24, 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         Layers = 0, 
         Cost = 0, 
         Name = "meat fresh slice", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a slice of raw meat from %s", 
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
      }, 
      [25] = 
      {
         ItemType = "container", 
         ActionDescription = "", 
         Vnum = 25, 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         Layers = 0, 
         Cost = 20, 
         Name = "shopping bag", 
         Weight = 2, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [26] = 
      {
         ItemType = "fightercomp", 
         ActionDescription = "", 
         Vnum = 26, 
         Description = "What looks like a part of a ship lies here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "fighter module", 
         Weight = 100, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [27] = 
      {
         ItemType = "midcomp", 
         ActionDescription = "", 
         Vnum = 27, 
         Description = "What looks like a decent size part for a ship lies here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "midsize midship module", 
         Weight = 150, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28] = 
      {
         ItemType = "capitalcomp", 
         ActionDescription = "", 
         Vnum = 28, 
         Description = "What looks like a huge ship part lies here.", 
         Layers = 0, 
         Cost = 0, 
         Name = "capship capital module", 
         Weight = 350, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [30] = 
      {
         ItemType = "fire", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         Vnum = 30, 
         Description = "A magical fire burns brightly.", 
         Layers = 0, 
         Name = "fire", 
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
         ShortDescr = "a magical fire", 
         Cost = 10, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [31] = 
      {
         ItemType = "trap", 
         ActionDescription = "", 
         Vnum = 31, 
         Description = "You detect a trap.", 
         Layers = 0, 
         Name = "trap", 
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
         ShortDescr = "a trap", 
         Cost = 10, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [32] = 
      {
         ItemType = "_portal", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         Vnum = 32, 
         Description = "A misty portal beckons you to the unknown.", 
         Layers = 0, 
         Name = "portal", 
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
         ShortDescr = "a portal", 
         Cost = 10, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [33] = 
      {
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 33, 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         Layers = 0, 
         Cost = 48000, 
         Name = "black poison powder", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [34] = 
      {
         ItemType = "scroll", 
         ActionDescription = "", 
         Vnum = 34, 
         Description = "A blank scroll lays here gathering dust.", 
         Layers = 0, 
         Cost = 10000, 
         Name = "scroll scribing blank", 
         Weight = 2, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [35] = 
      {
         ItemType = "potion", 
         ActionDescription = "", 
         Vnum = 35, 
         Description = "An empty flask lays here gathering dust.", 
         Layers = 0, 
         Cost = 15000, 
         Name = "flask empty", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [36] = 
      {
         ItemType = "paper", 
         ActionDescription = "", 
         Vnum = 36, 
         Description = "A message disk has been discarded here.", 
         Layers = 0, 
         Cost = 1500, 
         Name = "parchment paper note data disk message info", 
         Weight = 1, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [37] = 
      {
         ItemType = "pen", 
         ActionDescription = "", 
         Vnum = 37, 
         Description = "A datapad used for recording message disks is here.", 
         Layers = 0, 
         Cost = 2000, 
         Name = "quill pen datapad recorder message disk", 
         Weight = 2, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [38] = 
      {
         ItemType = "furniture", 
         ActionDescription = "", 
         Vnum = 38, 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         Layers = 0, 
         Name = "mail terminal", 
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
         ShortDescr = "a mail terminal", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [43] = 
      {
         ItemType = "armor", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 2, 
            }, 
         }, 
         Vnum = 43, 
         Description = "A holy symbol lies here, shining.", 
         Layers = 0, 
         Cost = 0, 
         Name = "holy symbol faith", 
         Weight = 5, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [45] = 
      {
         ItemType = "grenade", 
         ActionDescription = "", 
         Vnum = 45, 
         Description = "A grenade .... run!!!!", 
         Layers = 0, 
         Cost = 1200, 
         Name = "grenade", 
         Weight = 1, 
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
      }, 
      [46] = 
      {
         ItemType = "landmine", 
         ActionDescription = "", 
         Vnum = 46, 
         Description = "Don't step on the landmine.", 
         Layers = 0, 
         Cost = 1000, 
         Name = "landmine mine", 
         Weight = 1, 
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
      }, 
      [50] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         Vnum = 50, 
         Description = "A Blastech E-11 blaster rifle was left here.", 
         Layers = 0, 
         Cost = 3250, 
         Name = "blaster Blastech E11 rifle E-11", 
         Weight = 10, 
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
      }, 
      [51] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 51, 
         Description = "A Blastech DL-18 lies here on the floor.", 
         Layers = 0, 
         Cost = 3000, 
         Name = "blaster blastech dl-18 blaster pistol", 
         Weight = 6, 
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
      }, 
      [52] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 52, 
         Description = "A heavy blaster pistol was dropped here.", 
         Layers = 0, 
         Cost = 3600, 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         Weight = 8, 
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
      }, 
      [53] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         Vnum = 53, 
         Description = "An assault rifle was left here.", 
         Layers = 0, 
         Cost = 3750, 
         Name = "blaster blastech dlt-19 assault rifle", 
         Weight = 12, 
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
      }, 
      [54] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 3, 
            }, 
         }, 
         Vnum = 54, 
         Description = "A repeating blaster is collecting dust.", 
         Layers = 0, 
         Cost = 3900, 
         Name = "blastech t-21 repeating blaster", 
         Weight = 10, 
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
      }, 
      [55] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Vnum = 55, 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
         Layers = 0, 
         Cost = 3700, 
         Name = "bryar pistol blaster", 
         Weight = 8, 
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
      }, 
      [56] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -3, 
            }, 
         }, 
         Vnum = 56, 
         Description = "A cheap holdout blaster is here.", 
         Layers = 0, 
         Cost = 900, 
         Name = "blaster Budgetline 3.0/12 holdout", 
         Weight = 4, 
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
      }, 
      [57] = 
      {
         ItemType = "weapon", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         Vnum = 57, 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         Layers = 0, 
         Cost = 2800, 
         Name = "sorosuub q2 holdout blaster", 
         Weight = 4, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
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
      }, 
      [58] = 
      {
         ItemType = "weapon", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         Vnum = 58, 
         Description = "A very small blaster was dropped here.", 
         Layers = 0, 
         Cost = 2000, 
         Name = "blastech last resort mini-blaster blaster", 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
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
      }, 
      [59] = 
      {
         ItemType = "weapon", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -1, 
            }, 
         }, 
         Vnum = 59, 
         Description = "A sharp looking blade is here.", 
         Layers = 0, 
         Cost = 350, 
         Name = "long vibro-blade", 
         Weight = 4, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a long sharp vibro-blade", 
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
      }, 
      [60] = 
      {
         ItemType = "weapon", 
         ActionDescription = "", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 60, 
         Description = "A blaster rifle was dropped here.", 
         Layers = 0, 
         Cost = 3000, 
         Name = "Sorosuub One Blaster Rifle", 
         Weight = 10, 
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
         ExtraDescriptions = 
         {
         }, 
      }, 
      [99] = 
      {
         ItemType = "trash", 
         ActionDescription = "", 
         Vnum = 99, 
         Description = "Some god dropped a newly created final object here.", 
         Layers = 0, 
         Name = "final object", 
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
         ShortDescr = "a newly created final object", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [90] = 
      {
         ItemType = "furniture", 
         ActionDescription = "", 
         Vnum = 90, 
         Description = "The suggestions board is here.", 
         Layers = 0, 
         Name = "Suggestions Board", 
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
         ShortDescr = "the suggestions board", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [70] = 
      {
         ItemType = "weapon", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
               MudProgType = "wear_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
               MudProgType = "remove_prog", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         ActionDescription = "", 
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
         Vnum = 70, 
         Description = "The hilt of a lightsaber lies on the ground.", 
         Layers = 0, 
         Cost = 0, 
         Name = "quest weapon double bladed lightsaber saber", 
         Weight = 8, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
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
      }, 
      [71] = 
      {
         ItemType = "armor", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
               MudProgType = "wear_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
               MudProgType = "remove_prog", 
            }, 
         }, 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         ActionDescription = "", 
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
         Vnum = 71, 
         Description = "An evil looking battle helmet.", 
         Layers = 0, 
         Cost = 0, 
         Name = "quest armor mandalorian battle helmet", 
         Weight = 10, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
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
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
               Keyword = "quest armor mandalorian battle helmet", 
            }, 
         }, 
      }, 
      [72] = 
      {
         ItemType = "container", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         Vnum = 72, 
         Description = "A dud is here.", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpoload 10313\
put ration item\
", 
               MudProgType = "use_prog", 
            }, 
         }, 
         Layers = 0, 
         Name = "quest item", 
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
         ShortDescr = "Mystery Box 1", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [73] = 
      {
         ItemType = "armor", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
               MudProgType = "wear_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
               MudProgType = "remove_prog", 
            }, 
         }, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
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
         Vnum = 73, 
         Description = "A small energy device lies on the floor.", 
         Layers = 0, 
         Cost = 0, 
         Name = "quest shield generator", 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
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
               Description = "A glowing energy shield that seems to pulse with power.  It looks strong\
\13enough to repel some blaster fire.\
\13", 
               Keyword = "quest shield", 
            }, 
         }, 
      }, 
      [74] = 
      {
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         Vnum = 74, 
         Description = "A dud is here.", 
         Layers = 0, 
         Name = "quest item dinner", 
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
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [75] = 
      {
         ItemType = "treasure", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if questobj($n) == 75\
mpechoat $n &YYou have found the sapphire!  Return to your employer!\
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop sapphire\
endif\
", 
               MudProgType = "get_prog", 
            }, 
         }, 
         Vnum = 75, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         Layers = 0, 
         Cost = 0, 
         Name = "quest token sapphire", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
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
      }, 
      [76] = 
      {
         ItemType = "treasure", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if questobj($n) == 76\
mpechoat $n &YYou have found the diamond!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop diamond\
endif\
", 
               MudProgType = "get_prog", 
            }, 
         }, 
         Vnum = 76, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         Layers = 0, 
         Cost = 0, 
         Name = "quest token diamond", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
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
      }, 
      [77] = 
      {
         ItemType = "treasure", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if questobj($n) == 77\
mpechoat $n &YYou have found the emerald!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop emerald\
endif\
", 
               MudProgType = "get_prog", 
            }, 
         }, 
         Vnum = 77, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         Layers = 0, 
         Cost = 0, 
         Name = "quest token emerald", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
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
      }, 
      [78] = 
      {
         ItemType = "treasure", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if questobj($n) == 78\
mpechoat $n &YYou have found the amythest!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpfroce $n drop amythest\
endif\
", 
               MudProgType = "get_prog", 
            }, 
         }, 
         Vnum = 78, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         Layers = 0, 
         Cost = 0, 
         Name = "quest token amythest", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
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
      }, 
      [79] = 
      {
         ItemType = "treasure", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if questobj($n) == 79\
mpecohat $n &YYou have found the ruby!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this! \
mpforce $n drop ruby\
endif\
", 
               MudProgType = "get_prog", 
            }, 
         }, 
         Vnum = 79, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         Layers = 0, 
         Cost = 0, 
         Name = "quest token ruby", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
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
      }, 
   }, 
   Rooms = 
   {
      [1] = 
      {
         Sector = "city", 
         Flags = 
         {
            [26] = "Factory", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 1, 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
         Name = "&CCorrans Insane Apartment&g", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
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
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
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
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "die", 
               Code = "mpdamage $n 234234\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 100, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 107, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [2] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 2, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 32145, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [3] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 3, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [4] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 4, 
         Description = "This room is reserved for future use.\
", 
         Name = "Storage", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [5] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Vnum = 5, 
         Description = "", 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [6] = 
      {
         Sector = "city", 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [10] = "Safe", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         Vnum = 6, 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [7] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Vnum = 7, 
         Description = "", 
         Name = "Mobprog Purge Room", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "purge", 
               Code = "mppurge\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [8] = 
      {
         Sector = "city", 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         TeleDelay = 0, 
         Vnum = 8, 
         Description = "", 
         Name = "Immhood ClanStoreRoom", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [10] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 10, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
               MudProgType = "entry_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 100, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Vnum = 11, 
         Description = "", 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [12] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Vnum = 12, 
         Description = "", 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [19] = 
      {
         Sector = "city", 
         Flags = 
         {
            [10] = "Safe", 
            [4] = "CanLand", 
            [5] = "CanFly", 
            [30] = "Prototype", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Vnum = 19, 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
         Name = "Incognito Platform", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [20] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Vnum = 20, 
         Description = "", 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29] = 
      {
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 29, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 30, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 32, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 33, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [30] = 
      {
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 30, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 40, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 33, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [31] = 
      {
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 31, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 34, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 30, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 33, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [32] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         Vnum = 32, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 33, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 35, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [33] = 
      {
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 33, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 30, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 34, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 36, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 32, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [5] = 
            {
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 31, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [6] = 
            {
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 29, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [7] = 
            {
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 37, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [8] = 
            {
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 35, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [34] = 
      {
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 34, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 37, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 33, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [35] = 
      {
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 35, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 32, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 36, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 33, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [36] = 
      {
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 36, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
         Name = "The Arena", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 33, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 37, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 38, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 35, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [37] = 
      {
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 37, 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
         Name = "The Arena", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 34, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 36, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 33, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [38] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
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
         Name = "Southern Sniper Tower Entrance", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 36, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 39, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [39] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 39, 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Name = "Southern Sniper Tower", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 36, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 38, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "northeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 37, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "northwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 35, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [40] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
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
         Name = "Northern Sniper Tower Entrance", 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 30, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 41, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [41] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 41, 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
         Name = "Northern Sniper Tower", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 30, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               DestinationVnum = 40, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "southeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 31, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "southwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               DestinationVnum = 29, 
               Keyword = "", 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [42] = 
      {
         Sector = "city", 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 42, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Name = "First Combatant's Chamber", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [43] = 
      {
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Vnum = 43, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
         Name = "Second Combatant's Chamber", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [44] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Vnum = 44, 
         Description = "", 
         Name = "Lost in Space", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [45] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         Vnum = 45, 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
         Name = "Limbo Shipyard", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
   }, 
   Filename = "limbo.lua", 
   Name = "Limbo", 
   ResetMessage = "&rYour soul burns...", 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Arg3 = 2, 
         Arg1 = 1, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg3 = 10, 
         Arg1 = 90, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 6, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 2, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 7, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg3 = 6, 
         Arg1 = 7, 
         Arg2 = 1, 
         Command = "O", 
      }, 
   }, 
   ResetFrequency = 0, 
   VnumRanges = 
   {
      Mob = 
      {
         First = 1, 
         Last = 98, 
      }, 
      Room = 
      {
         First = 1, 
         Last = 45, 
      }, 
      Object = 
      {
         First = 2, 
         Last = 99, 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
}
