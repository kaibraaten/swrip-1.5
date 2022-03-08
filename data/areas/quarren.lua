-- Quarren Mine City
-- Last saved Sunday 29-Nov-2020 17:45:48

AreaEntry
{
   LowEconomy = 999519344, 
   Author = "Ackbar", 
   Mobiles = 
   {
      [6800] = 
      {
         DefaultPosition = "standing", 
         Name = "krakanas", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         DamRoll = 4, 
         Alignment = -1, 
         HitRoll = 4, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "A Krakanas, sharklike animal with twin pincer tentacles swims near.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 2, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 50, 
         Position = "standing", 
         ShortDescr = "sharklike krakanas", 
         Level = 20, 
         Sex = "male", 
         Description = "This legandary and scary sea creature is the most feared aquatic member to\
Mon Calamari.\
", 
         Race = "Human", 
         Vnum = 6800, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 200, 
            HitNoDice = 4, 
         }, 
      }, 
      [6801] = 
      {
         DefaultPosition = "standing", 
         Name = "clear fish", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mppurge corpse\
mpoload 6822\
", 
               MudProgType = "death_prog", 
               Arguments = "100", 
            }, 
         }, 
         LongDescr = "&Y A translucent, self-illuminated fish swims here.&x\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Position = "standing", 
         ShortDescr = "Clear bottom fish", 
         Level = 1, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6801, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [6802] = 
      {
         DefaultPosition = "standing", 
         Name = "&Y Yellow Starfish &x", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "&O An eightlegged yellow starfish crawls around here. &x\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Position = "standing", 
         ShortDescr = "An eightlegged starfish", 
         Level = 1, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6802, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [6803] = 
      {
         DefaultPosition = "standing", 
         Name = "Sweegill", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mppurge corpse\
mpoload 6822\
", 
               MudProgType = "death_prog", 
               Arguments = "100", 
            }, 
         }, 
         LongDescr = "&c A rainbowed &R colored &Y Sweegill &G fish &P swims &B here. &x\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Position = "standing", 
         ShortDescr = "a Sweegill fish", 
         Level = 1, 
         Sex = "undistinguished", 
         Description = "A rainbowed fish native to Mon waters. Considered a could meal to\
outsiders, although Mon Calamarians prefer a non seafood diet. \
HMmmmmmm...strange. \
", 
         Race = "Human", 
         Vnum = 6803, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [6804] = 
      {
         DefaultPosition = "standing", 
         Name = "Shela kitchen cook", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 20, 
               Open = 8, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 100, 
            KeeperShortDescr = "&R Shela the  kitchen cook. &x", 
            ProfitBuy = 120, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&R Shela the  kitchen cook prepares quick meals for the miners. &x\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 5, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Position = "standing", 
         ShortDescr = "&R Shela the  kitchen cook. &x", 
         Level = 20, 
         Sex = "female", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6804, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 12998, 
            HitNoDice = 1, 
         }, 
      }, 
      [6805] = 
      {
         DefaultPosition = "standing", 
         Name = "mine foreman Krauota", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         DamRoll = 0, 
         Alignment = 700, 
         HitRoll = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "say &R What you need now! Can't you see I'm busy!!!!!!!\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "say &R $n your about to get your tail whipped with that language.  Infact\
your fired!\
mpecho Your work agreement has been revoke, Please leave immediatly!\
", 
               MudProgType = "speech_prog", 
               Arguments = "fuck dick asshole jerk ", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "Say  Well $n you want me to hold your hand?\
 say See you take a shovel out of the shed..\
say Stay with $n ...this is difficult.\
laugh\
say Then you get a ore carier..\
say then you go down the shaft and DIG!\
say Tuff huh?  \
laugh\
say Make sure you sell your minerals back.\
say the loading bay keeper will pay you.\
say Now get out !\
", 
               MudProgType = "speech_prog", 
               Arguments = "work job mine ", 
            }, 
            [4] = 
            {
               ScriptType = "MProg", 
               Code = "say Look you here for a reason?\
say or just hear to iritate me.\
", 
               MudProgType = "speech_prog", 
               Arguments = "hi hello ", 
            }, 
            [5] = 
            {
               ScriptType = "MProg", 
               Code = "say Alright loser...not sure how you got in here...\
say but I'm calling security\
", 
               MudProgType = "speech_prog", 
               Arguments = "iritate.", 
            }, 
         }, 
         LongDescr = "The mine foreman Krauota paces here stressed due to mine demands.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 6, 
            DamSizeDice = 10, 
            DamPlus = 2, 
         }, 
         ArmorClass = -50, 
         Position = "standing", 
         ShortDescr = "The mine foreman Krauota", 
         Level = 60, 
         Sex = "male", 
         Description = "Standing at his post in the checkpoint, this guard looks more than a little\
bored afterall who would be stupid enough to try to board and attack a\
capital ship. Maybe you. \
", 
         Race = "Quarren", 
         Vnum = 6805, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 12, 
         }, 
      }, 
      [6806] = 
      {
         DefaultPosition = "standing", 
         Name = "", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "A Quarren is daydreaming about the ocean.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 0, 
         }, 
         ArmorClass = 88, 
         Position = "standing", 
         ShortDescr = "a Quarren", 
         Level = 8, 
         Sex = "male", 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         Race = "Human", 
         Vnum = 6806, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [6807] = 
      {
         DefaultPosition = "standing", 
         Name = "Quarren miner", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "say &R Can't you see I'm working?  Some of us work you know!\
", 
               MudProgType = "speech_prog", 
               Arguments = "hello hi help hey can ", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "if ispc ($n)\
   mpecho The quarren miner stops working to stare at you.\
    mpecho Then decides to go back to work digging.\
else\
 endif\
endif\
", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         LongDescr = "&w A Quarren miner works diligently to strip the mine.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 0, 
         }, 
         ArmorClass = 88, 
         Position = "standing", 
         ShortDescr = "A Quarren miner", 
         Level = 8, 
         Sex = "male", 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         Race = "Quarren", 
         Vnum = 6807, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [6808] = 
      {
         DefaultPosition = "standing", 
         Name = "mine shop dealer", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 12, 
               Open = 8, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            KeeperShortDescr = "The mine ore dealer", 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "say &B Come over miner, if you have some goods. I'll Buy.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "The mine ore dealer, Ketson stands here ready to give you a bad deal!\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 5, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Position = "standing", 
         ShortDescr = "The mine ore dealer", 
         Level = 20, 
         Sex = "female", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6808, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 12998, 
            HitNoDice = 1, 
         }, 
      }, 
      [6809] = 
      {
         DefaultPosition = "standing", 
         Name = "quarren krusi clerk", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 2, 
         Alignment = 0, 
         HitRoll = 2, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "Say &R Ya need something pal?  Look can't you tell I'm busy twidling my\
say thumbs..\
", 
               MudProgType = "speech_prog", 
               Arguments = "hi hello ", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "Say talk to ackbar pal ,,I don't hire.\
", 
               MudProgType = "speech_prog", 
               Arguments = "job", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "Say Oh a crime on this planet..what else is new, here fill out 20 copies of\
say this form and then talk to the chief.\
", 
               MudProgType = "speech_prog", 
               Arguments = "report crime", 
            }, 
            [4] = 
            {
               ScriptType = "MProg", 
               Code = "say &R No chief! when that happen\
laugh\
", 
               MudProgType = "speech_prog", 
               Arguments = "chief", 
            }, 
            [5] = 
            {
               ScriptType = "MProg", 
               Code = "Say About time $n\
mpoload 6821\
give key $n\
say try not to goto sleep this time....\
", 
               MudProgType = "speech_prog", 
               Arguments = "reporting duty", 
            }, 
            [6] = 
            {
               ScriptType = "MProg", 
               Code = "Say oh you need to see a prisoner ah? well ok ..\
unlock n\
open door\
", 
               MudProgType = "speech_prog", 
               Arguments = "visit see prisoner", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "Krusi, A Quarren Security Clerk stands behind the counter waiting.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 72, 
         Position = "standing", 
         ShortDescr = "Krusi, A quarren clerk", 
         Level = 11, 
         Sex = "female", 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         Race = "Human", 
         Vnum = 6809, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 110, 
            HitNoDice = 2, 
         }, 
      }, 
      [6810] = 
      {
         DefaultPosition = "standing", 
         Name = "cook Borto", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DamRoll = 20, 
         Alignment = 0, 
         HitRoll = 20, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 12, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 110, 
            KeeperShortDescr = "&B Borto the Side order cook.", 
            ProfitBuy = 120, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&B Borto the Side order cook waits here paitently for a costomer.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -150, 
         Position = "standing", 
         ShortDescr = "&B Borto the Side order cook.", 
         Level = 100, 
         Sex = "male", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6810, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 20, 
         }, 
      }, 
      [6811] = 
      {
         DefaultPosition = "standing", 
         Name = "tech torisk", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "Some god abandoned a newly created tech torisk here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Position = "standing", 
         ShortDescr = "a newly created tech torisk", 
         Level = 1, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6811, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [6812] = 
      {
         DefaultPosition = "standing", 
         Name = "tech torisk inventor", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DamRoll = 10, 
         Alignment = 0, 
         HitRoll = 10, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 8, 
               Open = 22, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            KeeperShortDescr = "&c Torisk Inventor", 
            ProfitBuy = 120, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&c Torisk Inventor of high-tech weapons works hard here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -25, 
         Position = "standing", 
         ShortDescr = "&c Torisk Inventor", 
         Level = 50, 
         Sex = "male", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6812, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
      }, 
      [6813] = 
      {
         DefaultPosition = "standing", 
         Name = "cathia tailor", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DamRoll = 10, 
         Alignment = 0, 
         HitRoll = 10, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 13, 
               Open = 5, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            KeeperShortDescr = "&P Cathia the tailor", 
            ProfitBuy = 120, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&P Cathia the tailor sews diligently here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -25, 
         Position = "standing", 
         ShortDescr = "&P Cathia the tailor", 
         Level = 50, 
         Sex = "female", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6813, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
      }, 
      [6814] = 
      {
         DefaultPosition = "standing", 
         Name = "jewler joyta", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 7, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            KeeperShortDescr = "&p Plantik the jewler", 
            ProfitBuy = 120, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&p Plantik the jewler sits behind the security bars waiting for a customer.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 5, 
            DamPlus = 10, 
         }, 
         ArmorClass = 0, 
         Position = "standing", 
         ShortDescr = "&p Plantik the jewler", 
         Level = 20, 
         Sex = "male", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6814, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 12998, 
            HitNoDice = 1, 
         }, 
      }, 
      [6815] = 
      {
         DefaultPosition = "standing", 
         Name = "resale elderly security", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DamRoll = 10, 
         Alignment = 0, 
         HitRoll = 10, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
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
            ProfitSell = 90, 
            KeeperShortDescr = "An Elderly Security Weapon resaler", 
            ProfitBuy = 100, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "An Elderly Security Weapon resaler waits here paintently.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -25, 
         Position = "standing", 
         ShortDescr = "An Elderly Security Weapon resaler", 
         Level = 50, 
         Sex = "male", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6815, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
      }, 
      [6816] = 
      {
         DefaultPosition = "standing", 
         Name = "librarian quarren", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 10, 
         Alignment = 0, 
         HitRoll = 10, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "say &R Hey SHHHHhhhhhhh!   This is a library not your playpen $n!\
", 
               MudProgType = "speech_prog", 
               Arguments = "hello hi mam chick", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "say &b I can see your IQ matches the letters in those words.\
say so get out.\
mpforce $n n\
", 
               MudProgType = "speech_prog", 
               Arguments = "bitch fuck shit hoe", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "Say just look at the computer terminal it will tell you what to do.\
", 
               MudProgType = "speech_prog", 
               Arguments = "help how ", 
            }, 
         }, 
         LongDescr = "&p A female Quarren librarian retypes a new book.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -25, 
         Position = "standing", 
         ShortDescr = "A female Quarren librarian", 
         Level = 50, 
         Sex = "female", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6816, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
      }, 
      [6817] = 
      {
         DefaultPosition = "standing", 
         Name = "quarren man", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         LongDescr = "A Quarren citizen enjoys his day off.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 0, 
         }, 
         ArmorClass = 88, 
         Position = "standing", 
         ShortDescr = "&R A Quarren citizen", 
         Level = 8, 
         Sex = "male", 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         Race = "Quarren", 
         Vnum = 6817, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [6818] = 
      {
         DefaultPosition = "standing", 
         Name = "mining droid", 
         Credits = 0, 
         Flags = 
         {
            [24] = "NoAssist", 
            [2] = "Scavenger", 
            [26] = "Droid", 
            [6] = "StayArea", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "&c A LIN-V8K mining droid glides past here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 50, 
         Position = "standing", 
         ShortDescr = "&c A LIN-V8K mining droid &x", 
         Level = 20, 
         Sex = "undistinguished", 
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         Race = "Human", 
         Vnum = 6818, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [6819] = 
      {
         DefaultPosition = "standing", 
         Name = "boss Hityii", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         DamRoll = 0, 
         Alignment = 700, 
         HitRoll = 0, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "", 
               MudProgType = "speech_prog", 
               Arguments = "", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho The mine boss stares at you..\
mpecho The mine boss presses the secretary's call button.\
say Dang it I don't have time for visitors!\
", 
               MudProgType = "speech_prog", 
               Arguments = "hi", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "Say &R Oh you want to work ah?\
", 
               MudProgType = "speech_prog", 
               Arguments = "job mine work", 
            }, 
            [4] = 
            {
               ScriptType = "MProg", 
               Code = "say &R Good because we have a job for you.  \
say &R Here take this..it will help you.\
mpoload 6834\
give shield $n\
say &R good luck and be careful my insurance is high enough.\
say oh ya tell the security voice box : Krebbex\
Say if you don't know what that is look it up at the library!\
", 
               MudProgType = "speech_prog", 
               Arguments = "yes", 
            }, 
            [5] = 
            {
               ScriptType = "MProg", 
               Code = "say &R Get out already!\
mpforce $n w\
", 
               MudProgType = "speech_prog", 
               Arguments = "bye goodbye adios", 
            }, 
            [6] = 
            {
               ScriptType = "MProg", 
               Code = "Say Just goto the east entrance then once in water.\
Say go south until you reach the mine.\
", 
               MudProgType = "speech_prog", 
               Arguments = "where location find", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&R Mine boss, Krauota paces here due to stress.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 6, 
            DamSizeDice = 10, 
            DamPlus = 2, 
         }, 
         ArmorClass = -50, 
         Position = "standing", 
         ShortDescr = "&R Mine boss, Krauota", 
         Level = 60, 
         Sex = "male", 
         Description = "Standing at his post in the checkpoint, this guard looks more than a little\
bored afterall who would be stupid enough to try to board and attack a\
capital ship. Maybe you. \
", 
         Race = "Quarren", 
         Vnum = 6819, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 12, 
         }, 
      }, 
      [6820] = 
      {
         DefaultPosition = "standing", 
         Name = "female sec secretary ", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho The Secretary looks you up and down, then \
mpecho returns back to doodling.\
", 
               MudProgType = "speech_prog", 
               Arguments = "hi hello ", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "Say &R Ah a job let me see....\
mpecho you see her barly glance a sheet of paper.\
Say &R well I'm sorry $n there are some jobs but....\
say &r most of my friends need a job and I'm not sure .\
say &R why I should give you the job.\
wink\
", 
               MudProgType = "speech_prog", 
               Arguments = "job work mine ", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "Say &R i don't think that was what I'm refering to..\
wink\
", 
               MudProgType = "speech_prog", 
               Arguments = "good dick hard hoe bitch slut fuck ass", 
            }, 
            [4] = 
            {
               ScriptType = "MProg", 
               Code = "", 
               MudProgType = "act_prog", 
               Arguments = "", 
            }, 
            [5] = 
            {
               ScriptType = "MProg", 
               Code = "Say &R Something wrong with your eye?\
mpecho You see the Secretary eye your credits.\
", 
               MudProgType = "act_prog", 
               Arguments = "wink", 
            }, 
            [6] = 
            {
               ScriptType = "MProg", 
               Code = "Say Now that's more like it!!!\
mptransfer $n 6937\
", 
               MudProgType = "bribe_prog", 
               Arguments = "100 100", 
            }, 
         }, 
         LongDescr = "&P A female Quarren Secretary stands here and twidles here thumbs.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -25, 
         Position = "standing", 
         ShortDescr = "&P A female Quarren Secretary", 
         Level = 50, 
         Sex = "female", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6820, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
      }, 
      [6821] = 
      {
         DefaultPosition = "standing", 
         Name = "Mayor", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 700, 
         HitRoll = 0, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "Say ah well here take this ...\
say it's a map of our great city.\
mpecho You see the mayor reach in his desk and \
mpecho pull out a holo map\
mpoload 6842\
give map $n\
Say have a good time.\
", 
               MudProgType = "speech_prog", 
               Arguments = "yes yep ", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "Say ah well then your familiar with this town. \
Say in that case what do you need?\
", 
               MudProgType = "speech_prog", 
               Arguments = "no", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "Say sorry I'm the wrong person to be saying that to.\
", 
               MudProgType = "speech_prog", 
               Arguments = "shit fuck help job dick ass work", 
            }, 
            [4] = 
            {
               ScriptType = "MProg", 
               Code = "Say Hello $n , our Security said you were in town. \
say Is this your first time here?\
", 
               MudProgType = "speech_prog", 
               Arguments = "hi hello ", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
         }, 
         LongDescr = "&c Mayor of Domed City stands here always ready to talk.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 6, 
            DamSizeDice = 10, 
            DamPlus = 2, 
         }, 
         ArmorClass = -50, 
         Position = "standing", 
         ShortDescr = "&c Mayor of Domed City", 
         Level = 60, 
         Sex = "male", 
         Description = "Standing at his post in the checkpoint, this guard looks more than a little\
bored afterall who would be stupid enough to try to board and attack a\
capital ship. Maybe you. \
", 
         Race = "Quarren", 
         Vnum = 6821, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 12, 
         }, 
      }, 
      [6822] = 
      {
         DefaultPosition = "standing", 
         Name = "remote", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "A training remote hovers nearby.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 97, 
         Position = "standing", 
         ShortDescr = "a remote", 
         Level = 1, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6822, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 10, 
            HitNoDice = 0, 
         }, 
      }, 
      [6823] = 
      {
         DefaultPosition = "standing", 
         Name = "remote", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "A training remote hovers nearby.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 95, 
         Position = "standing", 
         ShortDescr = "a remote", 
         Level = 2, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6823, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 20, 
            HitNoDice = 0, 
         }, 
      }, 
      [6824] = 
      {
         DefaultPosition = "standing", 
         Name = "remote", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "A training remote hovers nearby.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 92, 
         Position = "standing", 
         ShortDescr = "a remote", 
         Level = 3, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6824, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 30, 
            HitNoDice = 0, 
         }, 
      }, 
      [6825] = 
      {
         DefaultPosition = "standing", 
         Name = "remote", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "A training remote hovers nearby.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 90, 
         Position = "standing", 
         ShortDescr = "a remote", 
         Level = 4, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6825, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 40, 
            HitNoDice = 0, 
         }, 
      }, 
      [6826] = 
      {
         DefaultPosition = "standing", 
         Name = "remote", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "A training remote hovers nearby.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 87, 
         Position = "standing", 
         ShortDescr = "a remote", 
         Level = 5, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6826, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 50, 
            HitNoDice = 1, 
         }, 
      }, 
      [6827] = 
      {
         DefaultPosition = "standing", 
         Name = "hotel clerk", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 700, 
         HitRoll = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "Say Hello $n looking for a place to stay?\
", 
               MudProgType = "speech_prog", 
               Arguments = "hello hi ", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "Say your safe in the lobby, but if you want to goto the hot-tub room\
say you have to get me 35 credits!\
", 
               MudProgType = "speech_prog", 
               Arguments = "yes room cost much", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "say Well have fun $n\
mptransfer $n 6910\
", 
               MudProgType = "bribe_prog", 
               Arguments = "35 100", 
            }, 
         }, 
         LongDescr = "&G A hotel clerk stands here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 6, 
            DamSizeDice = 10, 
            DamPlus = 2, 
         }, 
         ArmorClass = -50, 
         Position = "standing", 
         ShortDescr = "&G A hotel clerk ", 
         Level = 60, 
         Sex = "male", 
         Description = "Standing at his post in the checkpoint, this guard looks more than a little\
bored afterall who would be stupid enough to try to board and attack a\
capital ship. Maybe you. \
", 
         Race = "Quarren", 
         Vnum = 6827, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 12, 
         }, 
      }, 
      [6828] = 
      {
         DefaultPosition = "standing", 
         Name = "police cop security", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         SpecFuns = 
         {
            [0] = "spec_police_attack", 
         }, 
         LongDescr = "&y A Quarren Security Officer patrol the streets.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 37, 
         Position = "standing", 
         ShortDescr = "&y A Quarren Security Officer", 
         Level = 25, 
         Sex = "male", 
         Description = "", 
         Race = "Mon Calamari", 
         Vnum = 6828, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 250, 
            HitNoDice = 5, 
         }, 
      }, 
      [6829] = 
      {
         DefaultPosition = "standing", 
         Name = "police security", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 15, 
         Alignment = 0, 
         HitRoll = 15, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_police_attack", 
         }, 
         Tag = "", 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&y A Quarren Security Officer patrol the streets.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 7, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -95, 
         Position = "standing", 
         ShortDescr = "&y A Quarren Security Officer", 
         Level = 78, 
         Sex = "male", 
         Description = "", 
         Race = "Mon Calamari", 
         Vnum = 6829, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 780, 
            HitNoDice = 15, 
         }, 
      }, 
      [6830] = 
      {
         DefaultPosition = "standing", 
         Name = "Tired old seaman", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 700, 
         HitRoll = 0, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "Say hello $n thinking about taking a swim?\
", 
               MudProgType = "speech_prog", 
               Arguments = "hello hi sir ", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "Say Well you can always just swim on the top..\
say but then you can try your luck swimming to..\
say the Quarren mine city..\
stare $n\
say then again you look to weak to try that.\
", 
               MudProgType = "speech_prog", 
               Arguments = "yes", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "Say Ya well I enjoy just watching the sea to.\
", 
               MudProgType = "speech_prog", 
               Arguments = "no", 
            }, 
         }, 
         LongDescr = "&BTired old seaman rests here staring into the water.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 6, 
            DamSizeDice = 10, 
            DamPlus = 2, 
         }, 
         ArmorClass = -50, 
         Position = "standing", 
         ShortDescr = "&b Tired old seaman", 
         Level = 60, 
         Sex = "male", 
         Description = "Standing at his post in the checkpoint, this guard looks more than a little\
bored afterall who would be stupid enough to try to board and attack a\
capital ship. Maybe you. \
", 
         Race = "Quarren", 
         Vnum = 6830, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 12, 
         }, 
      }, 
      [6831] = 
      {
         DefaultPosition = "standing", 
         Name = "guard", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 700, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "if race($n) != mon calamari\
   say Your not allowed down here!\
     mpforce $n n\
 else\
   say Welcome to our city Calamrian.\
   mptransfer $n 6943\
endif\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         LongDescr = "Security Guard\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 6, 
            DamSizeDice = 10, 
            DamPlus = 2, 
         }, 
         ArmorClass = -50, 
         Position = "standing", 
         ShortDescr = "Security Guard", 
         Level = 60, 
         Sex = "undistinguished", 
         Description = "Standing at his post in the checkpoint, this guard looks more than a little\
bored afterall who would be stupid enough to try to board and attack a\
capital ship. Maybe you. \
", 
         Race = "Human", 
         Vnum = 6831, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 600, 
            HitNoDice = 12, 
         }, 
      }, 
      [6832] = 
      {
         DefaultPosition = "standing", 
         Name = "Guard", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "if race($n) != quarren\
  say Your not allowed down here!\
  mpforce $n w\
 else\
  Say Welcome Quarren to your city!\
    mptransfer $n 6943\
endif\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         LongDescr = "Quarren Guard stands here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ArmorClass = 0, 
         Position = "standing", 
         ShortDescr = "Quarren Guard", 
         Level = 1, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6832, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [6833] = 
      {
         DefaultPosition = "standing", 
         Name = "clerk bank", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "Say &c Hello, welcome to the first bank of Mon , \
Say Here your money is safe with us.\
smile\
mpecho You are reasured of that fact as you feal a red\
mpecho laser beam scan you for your bio-info.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         LongDescr = "&G A Quarren First Bank of Mon bank clerk stands here counting the intake.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = -25, 
         Position = "standing", 
         ShortDescr = "&G A Quarren First Bank of Mon bank clerk", 
         Level = 50, 
         Sex = "female", 
         Description = "", 
         Race = "Quarren", 
         Vnum = 6833, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
      }, 
      [6834] = 
      {
         DefaultPosition = "standing", 
         Name = "wookiee male Tacebeca", 
         Credits = 200, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         DamRoll = 6, 
         Alignment = 0, 
         HitRoll = 6, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "if race($n) != wookiee\
say I'll Kill you!!\
mpkill $n \
else\
say Please help me back to my planet\
endif\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         LongDescr = "&z Tacebeca, Wookiee repair tech is waiting trial here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 6, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 0, 
         }, 
         ArmorClass = 20, 
         Position = "standing", 
         ShortDescr = "&z Tacebeca, Wookiee repair tech", 
         Level = 40, 
         Sex = "male", 
         Description = "", 
         Race = "Wookiee", 
         Vnum = 6834, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 400, 
            HitNoDice = 8, 
         }, 
      }, 
      [6838] = 
      {
         DefaultPosition = "standing", 
         Name = "", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         HitRoll = 0, 
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
         Tag = "", 
         Weight = 0, 
         LongDescr = "A training remote hovers nearby.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Luck = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ArmorClass = 90, 
         Position = "standing", 
         ShortDescr = "a remote", 
         Level = 4, 
         Sex = "undistinguished", 
         Description = "", 
         Race = "Human", 
         Vnum = 6838, 
         Height = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 40, 
            HitNoDice = 0, 
         }, 
      }, 
   }, 
   Rooms = 
   {
      [6912] = 
      {
         TeleDelay = 0, 
         Name = "&G Facility Training  Remote 1", 
         Description = "&R This room is extremly large area that alows you to move around and dodge\
quite freely. It is mostly empty except for a remote launcher. The floors\
and walls are made up of carved out black gravel rock are covered in scuff\
marks. A sign warns that only one student may  use this room at a time.\
There is also a small Security camera used to analiyze your  skills. The\
Quarren are very cautious about who they train. And are curious why they\
want to be tougher.\
", 
         Vnum = 6912, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6911, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6913, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [8] = "Bank", 
         }, 
      }, 
      [6913] = 
      {
         TeleDelay = 0, 
         Name = "&G Facility Training  Remote 2", 
         Description = "&c This room is extremly large area that alows you to move around and dodge\
quite freely. It is mostly empty except for a remote launcher. The floors\
and walls are made up of carved out black gravel rock are covered in scuff\
marks. A sign warns that only one student may  use this room at a time.\
There is also a small Security camera used to analiyze your  skills. The\
Quarren are very cautious about who they train. And are curious why they\
want to be tougher.\
", 
         Vnum = 6913, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6912, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6914, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
      }, 
      [6914] = 
      {
         TeleDelay = 0, 
         Name = "&G Facility Training  Remote 3", 
         Description = "&Y This room is extremly large area that alows you to move around and dodge\
quite freely. It is mostly empty except for a remote launcher. The floors\
and walls are made up of carved out black gravel rock are covered in scuff\
marks. A sign warns that only one student may  use this room at a time.\
There is also a small Security camera used to analiyze your  skills. The\
Quarren are very cautious about who they train. And are curious why they\
want to be tougher.\
", 
         Vnum = 6914, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6915, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6913, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
      }, 
      [6915] = 
      {
         TeleDelay = 0, 
         Name = "&G Facility Training  Remote 4", 
         Description = "&P This room is extremly large area that alows you to move around and dodge\
quite freely. It is mostly empty except for a remote launcher. The floors\
and walls are made up of carved out black gravel rock are covered in scuff\
marks. A sign warns that only one student may  use this room at a time.\
There is also a small Security camera used to analiyze your  skills. The\
Quarren are very cautious about who they train. And are curious why they\
want to be tougher.\
", 
         Vnum = 6915, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6946, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6914, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
      }, 
      [6916] = 
      {
         TeleDelay = 0, 
         Name = "&G Facility Security Training", 
         Description = "&c Entering the main Security Officer's training room you feel a sense of\
wonder. This individual was known for killing three kraknasas in one\
sitting. His ability to detect criminals in the town was legendary until\
he decided to retire. This space is covered with honerary metals ,\
buttons, and awards. Even the real hero's would feel awe when it comes\
down to him. The floor is one large spongee material. While the walls are\
more of a plaster like surface.\
", 
         Vnum = 6916, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6911, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6917] = 
      {
         TeleDelay = 0, 
         Name = "Library Interior", 
         Description = "The interior of the library is covered with hand stiched seaweed rugs\
inported from the Coral city accross the ocean. In the center of the room\
is a large Krebbex focilized bone. These large creatures once ran wild on\
the planet and the ocean. The circular room was once covered with\
holo-books from old folk lore to how-to's until a fire broke out and all\
but burned most of the holo-books. The new librarian has the unfortunate\
task of retyping them. There is a small computer terminal in the center of\
the room.\
", 
         Vnum = 6917, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "computer terminal", 
               Description = "This computer terminal allows you to see the current holo-books that\
\13survied.\
\13 \
\13Type look list :   to see available reading\
\13", 
            }, 
            [2] = 
            {
               Keyword = "list", 
               Description = "To read the holo-book type look (name of book).\
\13.\
\13The Miner's Handbook\
\13;  The legendary Krebbex\
\13;  The shining Ultima-Pearl\
\13;  Our Bivalve Freinds\
\13;  Mon Calamrian History\
\13", 
            }, 
            [3] = 
            {
               Keyword = "krebbex", 
               Description = "Although scientists swear the extinction of the krebbex was long ago. A few\
\13Quarren swear to it's exisitence. These  extinct ten-legged crustaceans\
\13once lived in the great Mon ocean. But according to one witness, Witho\
\13Tokio just recently when she was staring out of the north dome edge she\
\13saw it in the merky waters above. City officials stated there was anything\
\13that big in the ocean the sensors would have picked it up a long time ago.\
\13 But Witho is not alone, over 28 diffrent sitings have come up in the past\
\13year. And several Quarren miners have not returned and are listed as\
\13missing(with no explination). A few Quarren residents fear the worst and\
\13have refused to leave the city. Although most think of it as a cute story.\
\13", 
            }, 
            [4] = 
            {
               Keyword = "history3", 
               Description = "Ackbar was later rescued from slavery by an Alliance force and named\
\13Admiral of the Rebel fleet. Six years after the Battle of Endor, the\
\13reborn Emperor used his World Devastators to attack Calamari's\
\13southern;territorial zone, destroying most of the city of Kee-Piru. The\
\13port city;of Hikahi was also;damaged, harming the planet's\
\13starship-building capability. One year after that, Leia Organa Solo\
\13visited Admiral Ackbar at his home in the seatree forest in an attempt to\
\13bring him out of his self-imposed exile. A subsequent attack by Admiral\
\13Daala's Star Destroyers resulted in the destruction of Reef Home City.\
\13", 
            }, 
            [5] = 
            {
               Keyword = "history2", 
               Description = "The Mon Calamari had already constructed enormous starships and begun\
\13traveling space when their planet was discovered by the Empire. The\
\13Imperials planned to enslave Calamari and, after meeting with resistance\
\13from its natives, destroyed three of its floating cities. A Quarren,\
\13Seggor Tels, is believed to have deliberately lowered Calamari's\
\13defenses;to allow the Empire's attack this has heightened tensions between\
\13the Mon Calamari and the Quarren ever since. After the Empire showed its\
\13true colors, Calamarian starships were converted into warships and the\
\13shipbuilding docks in orbit around Calamari and its single moon became an\
\13important resource for the Alliance. Many Calamarians were taken as slaves\
\13by the Empire including the famous Ackbar, who was forced to be the\
\13personal servant of Grand Moff Tarkin.  To see the next page type look\
\13history3 \
\13", 
            }, 
            [6] = 
            {
               Keyword = "history ", 
               Description = "Calamari (sometimes called Mons Calamari) is a tectonically stable world\
\13almost entirely covered with water, and is home to both the peaceful Mon\
\13Calamari and the cautious Quarren-- over 27 billion inhabitants in all.\
\13The surface of the planet is covered with small marshy islands and\
\13enormous floating cities that house both species, with the Quarren\
\13inhabiting the lowest, darkest levels. These attractive constructions\
\13include Reef Home, Coral Depths, Kee-Piru, Coral City, and Foamwander\
\13City. The architecture and design of the Mon Calamari have organic\
\13appearances, with rounded edges and irregular surfaces that show their\
\13love for the natural beauty of their world. Raw ores used in construction\
\13are mined by the Quarren (who can breathe both air and;water) from domed\
\13cities on the ocean floor. To see the next page type look history2\
\13", 
            }, 
            [7] = 
            {
               Keyword = "shining ", 
               Description = "The Ultima-Pearl is the greatest treasure Mon Calmarians have to offer.\
\13Only three have ever surfaced from the cold dark ocean. According to the\
\13legend by the bi-valve mollusks, there is only one place the Ultima-Pearl\
\13will be created. Fearing that the prize would be piliged from the ocean\
\13for good. The mollusks controled the currents so that noone can find the\
\13location. They also control a sharklike creature called  krakanas, which\
\13have now been know as the guardian of the pearl. Fearing the increase of\
\13smugglers in town city officials agreed to declare the pearl, offlimits.\
\13failure to follow this ruling results in you being wanted on the planet.\
\13", 
            }, 
            [8] = 
            {
               Keyword = "handbook", 
               Description = "How to mine! So you want to mine ah? Well first let me tell you a bit about\
\13mining. The iron ore occurs in near - vertical fissures or lodes, ranging\
\13from a few inches to a few feet wide. Generally though, the productive\
\13lodes were about a foot wide. Shallow pits were dug to prove the locations\
\13of the lodes. Once found, adits were driven into the hillside following\
\13the lode. The ore is very soft and the miners would first rake out all the\
\13material in sight from the lode above them, generally for two metres or so\
\13- a method known as `hulking'. We prefer to use our ore carriers to carry\
\13most of the ore as it allows us to enter further into the mine.\
\13To read on look mine2\
\13", 
            }, 
            [9] = 
            {
               Keyword = "mine2", 
               Description = "The miners blasted to create the mines, using mining droids to create the\
\13arched passageways that were braced with timers as in this picture. In\
\13order to blast the mountain, holes were drilled into the mountain and\
\13charges were placed within these holes. The charges in the center were\
\13blasted out first and then the charges around this center hole were\
\13blasted out until the large hole was blasted out.;Miners used ore carriers\
\13to go up and down to the depths of the mine. New miners, called \"muckers\",\
\13are teased (usually by being;tickled) in these Carriers.\
\13So you think you've heard enough background? type look mine3\
\13", 
            }, 
            [10] = 
            {
               Keyword = "mine3", 
               Description = "To begin here you must get a security id and password form the local mine\
\13shop boss. This becomes rather tricky, since most Quarren work them, and\
\13it takes a little extra to sweaten the secretary to let you in to see the\
\13boss .  Once you enter the mine you can check out a shovel or pick (your\
\13preference) and a ore carrier (if one is available) and go to work.\
\13Digging random works the best. When you have finished a jobs work stop by\
\13the cargo haul and get paid. Payment is based on amount dug.   You are\
\13free to stop and work at anytime, just understand the ore dealer is only\
\13there for four hours.\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "door", 
               Distance = 0, 
               DestinationVnum = 6887, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [6918] = 
      {
         TeleDelay = 0, 
         Name = "&G First of Mon Bank Lobby", 
         Description = "&g  This marble like surfaced bank allows for easy transactions between you\
and your currerncy. There is a large table in the center of the room to\
sign your life away along with, a counter towards the back where a very\
attractive (well for a quarren) clerk stands and counts the daily inflow\
of credits. On the top of the ceiling you can see a rather expensive\
security system tracking your everymove. The Quarren first bank of Mon's\
motto isn't \"your money is safe with us for no reason.\"\
To make a bank transaction please type bank.\
", 
         Vnum = 6918, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6899, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
      }, 
      [6925] = 
      {
         TeleDelay = 0, 
         Name = "&Y Public Lobby", 
         Description = "&Y The main lobby is a incredible site for tourists to visit. The floors\
are made of polished clam shells. giving off a silvery pink reflextion.\
The curved walls have pictures of former governors of this great city. The\
ceiling has a hand carved Quarren emblem made form rare yellow coral. In\
the middle of the room is a large sign with directions.\
", 
         Vnum = 6925, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6926, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6927, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6891, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6928, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6926] = 
      {
         TeleDelay = 0, 
         Name = "&Y Mayor's Office", 
         Description = "You enter the office space of the mayor of this great city. He has a large\
Quarren flag framed behind his desk. The rest of the walls are left blank\
and are a smooth polished red The rest of the walls are left blank and are\
a smooth polished &R red coral.&w The main desk fills most of the space\
while two chairs for visitors sit on the opposite side. On the ceiling you\
can see a state-of-the-art &Bwater mister &w which was put in place to\
maintainthe right humidity in the space.\
", 
         Vnum = 6926, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "water mister", 
               Description = "&B This top of the line mister costs more then all of your prized\
\13posessions combined. &w another sign of your hard earned taxes put to good\
\13work.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "flag", 
               Description = "&R The multi colored flag shows the Quarren 3 elements. &B Water, &Y Salt\
\13&c Wind &w\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6925, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [6927] = 
      {
         TeleDelay = 0, 
         Name = "&Y Defense Office", 
         Description = "The Quarren military base was stationed here, but do to a very unfortunate\
accident with a modified blaster he is no longer with us The military are\
currently looking for a few good men to fill the positon. A sign on the\
door says contact Ackbar for further details.\
", 
         Vnum = 6927, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6925, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6928] = 
      {
         TeleDelay = 0, 
         Name = "&Y Security Office", 
         Description = "&G You enter the main office of the Quarren Security. This room is\
slightly, less extravegant then the rest, and has more of a rough ocean\
bottom feel. The walls  are decorated with pictures of wanted men, and the\
floors are polished rock that imitates a marble look. In front of you is a\
large counter to which you se alot of people working behind. At the\
counter is a sign that says step up for assistance.\
", 
         Vnum = 6928, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Keyword = "door", 
               Distance = 0, 
               DestinationVnum = 6929, 
               Description = "", 
               Direction = "north", 
               Key = 6821, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6925, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6944, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6929] = 
      {
         TeleDelay = 0, 
         Name = "&Y Security Corridor", 
         Description = "The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them. There is a small sign placed on the\
door.\
", 
         Vnum = 6929, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "&z Tacebeca, Wookiee repair tech.\
\13&x\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "Cell door", 
               Distance = 0, 
               DestinationVnum = 6930, 
               Description = "", 
               Direction = "north", 
               Key = 6821, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Keyword = "block door", 
               Distance = 0, 
               DestinationVnum = 6928, 
               Description = "", 
               Direction = "south", 
               Key = 6821, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6933, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6930] = 
      {
         TeleDelay = 0, 
         Name = "&Y Security Cell A", 
         Description = "The Quarren cells are small 8' by 8' cubes. The walls consist of solid rock\
carved roughly to leave jagged edges. It is rumored that the guards like\
to throw prisoners up against the walls if they get out of hand There is\
no window except for the small tray  hole the guards use to feed the\
prisoner. There is a dmap and musty smell, and cold temperature will make\
a non-quarren quite uncomfortable. There is no use screaming as the walls\
are over 20 ft thick.\
", 
         Vnum = 6930, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Keyword = "Cell door", 
               Distance = 0, 
               DestinationVnum = 6929, 
               Description = "A cold grey door, over 5 ft thick.\
", 
               Direction = "south", 
               Key = 6821, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [6931] = 
      {
         TeleDelay = 0, 
         Name = "&Y Security Cell B", 
         Description = "The Quarren cells are small 8' by 8' cubes. The walls consist of solid rock\
carved roughly to leave jagged edges. It is rumored that the guards like\
to throw prisoners up against the walls if they get out of hand There is\
no window except for the small tray  hole the guards use to feed the\
prisoner. There is a dmap and musty smell, and cold temperature will make\
a non-quarren quite uncomfortable. There is no use screaming as the walls\
are over 20 ft thick.\
", 
         Vnum = 6931, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Keyword = "Cell door", 
               Distance = 0, 
               DestinationVnum = 6933, 
               Description = "A cold grey door, over 5 ft thick.\
", 
               Direction = "south", 
               Key = 6821, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [6932] = 
      {
         TeleDelay = 0, 
         Name = "&Y Security Cell C", 
         Description = "&w The Quarren cells are small 8' by 8' cubes. The walls consist of solid\
rock carved roughly to leave jagged edges. It is rumored that the guards\
like to throw prisoners up against the walls if they get out of hand There\
is no window except for the small tray hole the guards use to feed the\
prisoner. There is a dmap and musty smell, and cold temperature will make\
a non-quarren quite uncomfortable. There is no use screaming as the walls\
are over 20 ft thick.\
", 
         Vnum = 6932, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Keyword = "Cell Door", 
               Distance = 0, 
               DestinationVnum = 6934, 
               Description = "A cold grey door, over 5 ft thick.\
", 
               Direction = "south", 
               Key = 6821, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [6933] = 
      {
         TeleDelay = 0, 
         Name = "&Y Security Corridor", 
         Description = "The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of roc k between them and the corridor you\
are sure not to hear any of them. \
", 
         Vnum = 6933, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Keyword = "Cell door", 
               Distance = 0, 
               DestinationVnum = 6931, 
               Description = "", 
               Direction = "north", 
               Key = 6821, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6929, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6934, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6934] = 
      {
         TeleDelay = 0, 
         Name = "&Y Security Corridor", 
         Description = "The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         Vnum = 6934, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Keyword = "Cell door", 
               Distance = 0, 
               DestinationVnum = 6932, 
               Description = "", 
               Direction = "north", 
               Key = 6821, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6933, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6935] = 
      {
         TeleDelay = 0, 
         Name = "&R West Entrance Customs", 
         Description = "&c This very busy customs area is both interior and exterior. There is a\
large shell protecting the turbo-lift from the water sprinklers. In front\
of the turbo-lift is a small path leading back to the main roads. There is\
very little Security here as it is belived you have already gone througha\
check by now. The ground is a rough rock material carved in by ore miners.\
As you look up you can see the clear dome glass allowing you to see a pure\
picture of the ocean.\
", 
         Vnum = 6935, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6903, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6943, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6936] = 
      {
         TeleDelay = 0, 
         Name = "&B Mine Secritary's office", 
         Description = "The interior of the mine office is barely decorated. Most of the room is\
covered with dust and dirt form miners with complaints. There is only one\
picture on the wall, which is of the first shovel taken form the ground at\
the nearby mine. There is a very attractive Quarren secretary wasting\
times at the desk. and you can hear mubling and screaming from the\
adjacent room. There is a bash proof door to the east, that has no handles\
and cannot be opened form this side, without a mechanicla button. Which is\
most likely attached tot he secretary's desk.\
", 
         Vnum = 6936, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6896, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6937] = 
      {
         TeleDelay = 0, 
         Name = "&B Mine Boss's office", 
         Description = "This large room is made of think rock walls A desk is placed in the corner\
with comlinks, datapads and all sorts of mine pieces  scatterd all over\
it. A heavy filing cabinet is to the left of a large pickax sculpture\
Several  photos of Quarren officials line the walls and a large plush\
straight chair with  it's back towards you has been  placed behind the\
desk.  The floor is covered with mine layouts and statistics of mine\
output and costs.\
", 
         Vnum = 6937, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6936, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
         }, 
      }, 
      [6938] = 
      {
         TeleDelay = 0, 
         Name = "Miner's Interior", 
         Description = "", 
         Vnum = 6938, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - Not for Sale!\
\13", 
            }, 
         }, 
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6890, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6939] = 
      {
         TeleDelay = 0, 
         Name = "Miner Interior", 
         Description = "", 
         Vnum = 6939, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - Not for Sale!\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6885, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6940] = 
      {
         TeleDelay = 0, 
         Name = "Miner Interior", 
         Description = "", 
         Vnum = 6940, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost not for Sale\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6894, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6941] = 
      {
         TeleDelay = 0, 
         Name = "Miner Interior", 
         Description = "This is a empty house for sale!\
", 
         Vnum = 6941, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost 100,000 \
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6897, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6942] = 
      {
         TeleDelay = 0, 
         Name = "Security Doors", 
         Description = "The large doors are guarded by an extremly tough guard making sure noone\
who doesn't belong enters the service entrance of the city.\
", 
         Vnum = 6942, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6905, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6943, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6943] = 
      {
         TeleDelay = 0, 
         Name = "Slide Shaft", 
         Description = "This cold room leads around into a circle. There is nothing to look at\
except the small slide shaft in the middle of the room allowing you to\
slide down to what ever lies below. As you scan below you see nothing but\
darkness.  The walls are a shinny metals you swear you have seen before\
perhaps on a blaster of some kind. \
", 
         Vnum = 6943, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6905, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6935, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6944] = 
      {
         TeleDelay = 0, 
         Name = "Chief Security office", 
         Description = "The empty room is where the last top Security officer worked.\
Until he was blown away in an attack duringa peace mission.\
Apparently he wasn't cautious enough.\
 \
The post on the door read:\
 \
Help Wanted:  Security Chief -  Please talk to Ackbar if your interested in\
the job.\
", 
         Vnum = 6944, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6928, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6945] = 
      {
         TeleDelay = 0, 
         Name = "Real Estate Agent", 
         Description = "&c Entering in the Real Estate agents office you notice that the place was\
left bare. Rumor has it ever since Ackbar was promoted he deserted his\
former retiring job. The walls are bare of decoration and the floor looks\
as if it see's very little traffic. There is a large sign in the center of\
the room with writing on it.\
", 
         Vnum = 6945, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Sorry not for sale!\
\13", 
            }, 
            [2] = 
            {
               Keyword = "sign", 
               Description = "Welcome, due to demanding bosses I can no longer work form here.\
\13I have since placed a price tag on all the shops and buildings throughout\
\13the city\
\13if they are for sale.\
\13Please stay for awile and enjoy.\
\13 \
\13Type look cost      ( To see the price. )\
\13 \
\13If you have the stats and enough money please mudmail or contact me to sign\
\13the contract.\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6901, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6946] = 
      {
         TeleDelay = 0, 
         Name = "Remote training Level - 5", 
         Description = "This room is extremly large area that alows you to move around and dodge\
quite freely. It is mostly empty except for a remote launcher. The floors\
and walls are made up of carved out black gravel rock are covered in scuff\
marks. A sign warns that only one student may  use this room at a time.\
There is also a small Security camera used to analiyze your  skills. The\
Quarren are very cautious about who they train. And are curious why they\
want to be tougher.\
", 
         Vnum = 6946, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6915, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
      }, 
      [6947] = 
      {
         TeleDelay = 0, 
         Name = "Security Doors", 
         Description = "The large doors are guarded by an extremly tough guard making sure noone\
who doesn't belong enters the service entrance of the city. \
", 
         Vnum = 6947, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6905, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
         }, 
      }, 
      [6989] = 
      {
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Description = "", 
         Vnum = 6989, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [7000] = 
      {
         TeleDelay = 0, 
         Name = "Pick", 
         Description = "", 
         Vnum = 7000, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6800] = 
      {
         TeleDelay = 0, 
         Name = "&C Calamari Ocean - Top", 
         Description = "&c You glance across the great Mon Calamari Ocean , seeing a vast body of\
water. The view looks peaceful dispite the creatures that lurk below. A\
soft breeze blows past your head , and even through the strong smell of\
salt-water you can swear you smell, Rich Mon food cooking. Of coarse it\
might be the seaweed being burned by the sun But considering most food\
here is made of seaweed, the smell makes you hungrier yet. Maybe you\
should wrap up your swim early and head back to town. You can see the\
metal ladder leading you back up to the dock in fornt.\
", 
         Vnum = 6800, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "water", 
               Description = "The green seaweed infested water swirls around  you . It would most likely\
\13not be a good idea to drink this water.                                   \
\13 \
\13", 
            }, 
         }, 
         Sector = "water_swim", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6801, 
               Description = "Cargo Hold\
", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6906, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6801] = 
      {
         TeleDelay = 0, 
         Name = "&C Calamari Ocean - Top", 
         Description = "&c &CYou glance across the great Mon Calamari Ocean , seeing a vast body of\
water. The view looks peaceful dispite the creatures that lurk below. A\
soft breeze blows past your head , and even through the strong smell of\
salt-water you can swear you smell, Rich Mon food cooking. Of coarse it\
might be the seaweed being burned by the sun But considering most food\
here is made of seaweed, the smell makes you hungrier yet. Maybe you\
should wrap up your swim early and head back to town.\
", 
         Vnum = 6801, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "Calamri Ocean - Top\
", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6800, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6802] = 
      {
         TeleDelay = 0, 
         Name = "&C Calamari Ocean - Top", 
         Description = "&c &CYou glance across the great Mon Calamari Ocean , seeing a vast body of\
water. The view looks peaceful dispite the creatures that lurk below. A\
soft breeze blows past your head , and even through the strong smell of\
salt-water you can swear you smell, Rich Mon food cooking. Of coarse it\
might be the seaweed being burned by the sun But considering most food\
here is made of seaweed, the smell makes you hungrier yet. Maybe you\
should wrap up your swim early and head back to town.\
", 
         Vnum = 6802, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "water_swim", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6804, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6801, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6803, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6804, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6803] = 
      {
         TeleDelay = 0, 
         Name = "&C Calamari Ocean - Top ", 
         Description = "&c &CYou glance across the great Mon Calamari Ocean , seeing a vast body of\
water. The view looks peaceful dispite the creatures that lurk below. A\
soft breeze blows past your head , and even through the strong smell of\
salt-water you can swear you smell, Rich Mon food cooking. Of coarse it\
might be the seaweed being burned by the sun But considering most food\
here is made of seaweed, the smell makes you hungrier yet. Maybe you\
should wrap up your swim early and head back to town.\
", 
         Vnum = 6803, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "water_swim", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6803, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6803, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6803, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6803, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6803, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6803, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6803, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6804] = 
      {
         TeleDelay = 0, 
         Name = "&C Calamari Ocean - Top.", 
         Description = "&c &CYou glance across the great Mon Calamari Ocean , seeing a vast body of\
water. The view looks peaceful dispite the creatures that lurk below. A\
soft breeze blows past your head , and even through the strong smell of\
salt-water you can swear you smell, Rich Mon food cooking. Of coarse it\
might be the seaweed being burned by the sun But considering most food\
here is made of seaweed, the smell makes you hungrier yet. Maybe you\
should wrap up your swim early and head back to town.\
", 
         Vnum = 6804, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "water_swim", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6804, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6804, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6804, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6804, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6804, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6804, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6804, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6805] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&c The murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still primitive\
fish still reside. Movement through here is very difficult as you can see\
a swirling undertow below, that can move you to just about anywhere in the\
ocean. Below in the dark crevises you swear you can see movement or maybe\
&c it is just a strong current. &w\
", 
         Vnum = 6805, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6808, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6802, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6813, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6806] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&CThe murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still primitive\
fish still reside. Movement through here is very difficult as you can see\
a swirling undertow below, that can move you to just about anywhere in the\
ocean. Below in the dark crevises you swear you can see movement or maybe\
it is just a strong current. \
", 
         Vnum = 6806, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6801, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6807] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&CThe murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still primitive\
fish still reside. Movement through here is very difficult as you can see\
a swirling undertow below, that can move you to just about anywhere in the\
ocean. Below in the dark crevises you swear you can see movement or maybe\
it is just a strong current.\
", 
         Vnum = 6807, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6803, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6808] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&CThe murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still primitive\
fish still reside. Movement through here is very difficult as you can see\
a swirling undertow below, that can move you to just about anywhere in the\
ocean. Below in the dark crevises you swear you can see movement or maybe\
it is just a strong current.\
", 
         Vnum = 6808, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6808, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6808, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6808, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6816, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6808, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6808, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6808, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6808, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6809] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&CThe murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still primitive\
fish still reside. Movement through here is very difficult as you can see\
a swirling undertow below, that can move you to just about anywhere in the\
ocean. Below in the dark crevises you swear you can see movement or maybe\
it is just a strong current.\
", 
         Vnum = 6809, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6810] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&CThe murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still primitive\
fish still reside. Movement through here is very difficult as you can see\
a swirling undertow below, that can move you to just about anywhere in the\
ocean. Below in the dark crevises you swear you can see movement or maybe\
it is just a strong current.\
", 
         Vnum = 6810, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6811] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&CThe murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still primitive\
fish still reside. Movement through here is very difficult as you can see\
a swirling undertow below, that can move you to just about anywhere in the\
ocean. Below in the dark crevises you swear you can see movement or maybe\
it is just a strong current.\
", 
         Vnum = 6811, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6816, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6812] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&CThe murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still primitive\
fish still reside. Movement through here is very difficult as you can see\
a swirling undertow below, that can move you to just about anywhere in the\
ocean. Below in the dark crevises you swear you can see movement or maybe\
it is just a strong current.\
", 
         Vnum = 6812, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6813, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6813] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&c &CYou glance across the great Mon Calamari Ocean , seeing a vast body of\
water. The view looks peaceful dispite the creatures that lurk below. A\
soft breeze blows past your head , and even through the strong smell of\
salt-water you can swear you smell, Rich Mon food cooking. Of coarse it\
might be the seaweed being burned by the sun But considering most food\
here is made of seaweed, the smell makes you hungrier yet. Maybe you\
should wrap up your swim early and head back to town. &CThe murky waters\
of the Middle ocean are covered with small water born insects. Rotting\
leafy plant structures layout where the still primitive fish still reside.\
Movement through here is very difficult as you can see a swirling undertow\
below, that can move you to just about anywhere in the ocean. Below in the\
dark crevises you swear you can see movement or maybe &CThe murky waters\
of the Middle ocean are covered with small water born insects. Rotting\
leafy plant structures layout where the still primitive fish still reside.\
Movement through here is very difficult as you can see a swirling undertow\
below, that can move you to just about anywhere in the ocean. Below in the\
dark crevises you swear you can see movement or maybe it is just a strong\
current.\
", 
         Vnum = 6813, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6813, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6813, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6813, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6813, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6813, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6805, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6813, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6813, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6814] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle", 
         Description = "&CThe murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still primitive\
fish still reside. Movement through here is very difficult as you can see\
a swirling undertow below, that can move you to just about anywhere in the\
ocean. Below in the dark crevises you swear you can see movement or maybe\
it is just a strong current.\
", 
         Vnum = 6814, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6806, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6815] = 
      {
         TeleDelay = 0, 
         Name = "&B Mon Calamari Ocean - Middle &w", 
         Description = "&c The murky waters of the Middle ocean are covered with small water born\
insects. Rotting leafy plant structures layout where the still\
still reside. Movement through here is very difficult as\
you can see a swirling undertow below, that can move you to just about\
anywhere in the ocean. Below in the dark crevises you swear you can see\
movement or maybe it is just a strong current.\
", 
         Vnum = 6815, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underwater", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6815, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6815, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6815, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6815, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6807, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6815, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6815, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [10] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6815, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6816] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&c  &b You stand in the darkest part of the ocean, very few people other\
then Quarran have walked this land The ground surface is a coarsely edged\
rock surface, obviously from volcanic activity  ,although it apears to be\
quite old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it. &x\
", 
         Vnum = 6816, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6808, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6817] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6817, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6816, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6818] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6818, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6827, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6819, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6819] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6819, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6820, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6820] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6820, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6819, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6809, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6821, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6821] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6821, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6819, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6819, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6820, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6822] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&b You stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6822, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6821, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6823, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6819, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6823] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6823, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6821, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6821, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6819, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6810, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6821, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6821, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6824, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6820, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6824] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6824, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6825, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6823, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6825] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6825, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6823, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6824, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6823, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6826, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6826] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6826, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6822, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6823, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6824, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6824, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6811, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6825, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6823, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6824, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6836, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6827] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6827, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6818, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6828] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6828, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6829, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6829, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6827, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6829, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6829, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6829, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6829, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [0] = "Dark", 
         }, 
      }, 
      [6829] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6829, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6830, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [7] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [8] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [9] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6828, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6830] = 
      {
         TeleDelay = 0, 
         Name = "&O Clam Bed &w", 
         Description = "&O It appears you have found the hidden location of the rare &z Ultima\
Pearl &O This treasure is considered the greatest gem known to the galexy.\
The floor is covered with small clam shells laying one on top of each\
other to create a shell layered wall. In the middle is an extremly large\
shell that is unlike all the rest. This discovery will make you the envy\
of the Universe, ofcoarse if you take the pearl, you will be ^rwanted^x &O\
on Mon  Calamari\
", 
         Vnum = 6830, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "large", 
               Description = "This massive shell's color is much different from the rest being glossy\
\13pink the light from your artificial source reflects extremly well making\
\13visibility extremely easy. \
\13", 
            }, 
            [2] = 
            {
               Keyword = "floor", 
               Description = "The floor is made of shells that scoop up toward the east to form a wall.\
\13The shells  are brown and dirty of ages of not being disturbed.\
\13", 
            }, 
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6829, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6812, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [6831] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6831, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6837, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6834, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6832, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6834, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6834, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6832] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6832, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6831, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6834, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6833, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6834, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6834, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6833] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6833, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6832, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6833, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6834, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6833, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6833, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6834] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6834, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6833, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6833, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6835, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6814, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6833, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6833, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6835] = 
      {
         TeleDelay = 0, 
         Name = "&z Mine Enterence &w", 
         Description = "&w You stand before a Quarren mine enterence. The main hole is covered by a\
sythetic  clear dome. At one corner is a small one man hatch used for\
enterence. On the ground you can see scraps of metal and rock apparently\
dropped from a shipment boat heading up to the city of Akatamer. There is\
a large sign above the Enterance written in Quarran. But from the disign\
and colors you know the sign is not positive.\
", 
         Vnum = 6835, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "hatch", 
               Description = "&x The hatch is manmade, cilinder door a Quarren apparently climbs into.\
\13You can see a security panel on the wall, with a voice code box.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "ground", 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "ground metal ore", 
               Description = "It is nothing more than scrap ore and metals of very little worth.\
\13", 
            }, 
            [4] = 
            {
               Keyword = "sign", 
               Description = "&R DaxbnabEW    KLis'sjkdjfu     ^R Suop  Suop Suop!!!!!^x\
\13", 
            }, 
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6834, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6815, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "Hatch", 
               Distance = 0, 
               DestinationVnum = 6839, 
               Description = "A well lubed air compression hatch is closed here.\
", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6836] = 
      {
         TeleDelay = 0, 
         Name = "&b Mon Calamari Ocean - Bottom", 
         Description = "&bYou stand in the darkest part of the ocean, very few people other then\
Quarran have walked this land The ground surface is a coarsely edged rock\
surface, obviously from volcanic activity  ,although it apears to be quite\
old. The merky water temperature sends shivers down your spine and\
visibility is limited to around 10 ft in front of you. Very few things\
have the ability to withstand this enviroment. It seems strange to you\
that an entire race would prefer it.\
", 
         Vnum = 6836, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "oceanfloor", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6837, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6826, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [16] = "Silence", 
         }, 
      }, 
      [6837] = 
      {
         TeleDelay = 0, 
         Name = "&R Domed Quarren City of Heurkea &w", 
         Description = "&c Standing before you is one of the largest underwater cities on Mon\
Calamari  The dome shield hosts thousands of Quarren citizens who spend\
most of their life  underwater. Although the Quarren can breath Oxagen\
from water they do prefer a  change. So they contructed these massive\
domed cities to allow them to live underwater and still have the luxuries\
of above ground.   To the West is a workers enterence from a nerby Mine. \
In every other direction is the &B Mon Calamarian Ocean. &w\
", 
         Vnum = 6837, 
         Sector = "city", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "enterence", 
               Description = "The enterence is a water pressured enterence and looks highly\
\13sophisticated.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "dome", 
               Description = "The Quarren developed this dome in order to allow them to have both\
\13luxuries, air and water.\
\13", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6836, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6831, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6880, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6817, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6838] = 
      {
         TeleDelay = 0, 
         Name = "Security Post", 
         Description = "The security post is a large square box you entered disigned to do a\
bioscan of your entire body. Two miniture 5-tgy droids continue by\
anyalizing your fingerprints and retna lines. It is a cold damp machine\
that was created with no idea of luxuries. There is a red sign before you\
with directions. \
", 
         Vnum = 6838, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "&R Please place both hands on the bio scanner\
\13walls.\
\13Please reset the strat button by pulling bio-scan\
\13Next push the bioscan button to move to next checkpoint\
\13 Thanks\
\13 \
\13Quarren Security\
\13", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6880, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6839] = 
      {
         TeleDelay = 0, 
         Name = "Mine Enterance Door", 
         Description = "&c The interior of this enterence is loaded with hi-tech gadgets and\
devices. used to make sure the intended Quarran is authorized to enter.\
Precautionary measures do to the suspected allegince to the Empire. On the\
wall directly ahead is a voice activated code box. The floor has apparent\
dirt and soot , that most likely came from the mines.  There is a large\
sign written in two languages above the code box.\
", 
         Vnum = 6839, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "&R   Tkishdiihsh, Jisaidsydy, jidudusjalpsdo!\
\13 \
\13 \
\13If you don't have clerance from the employer in town, DONOT ENTER!\
\13", 
            }, 
            [2] = 
            {
               Keyword = "code box voice", 
               Description = "The device is used for enterence into the cave, It is a standard X-4t6\
\13model,\
\13that allows attmitence with use of the correct word!\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6835, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6840] = 
      {
         TeleDelay = 0, 
         Name = "Cave Enterence", 
         Description = "&c You enter the cave with a slight weasyness from the decompressure.\
Non-Quarren  creatures tend to have problems with the deep ocean pressure.\
The cave is a standard layout, with a Front office to the left. Some tools\
in the shed to the right. and up-ahead you can see the tail end of the ore\
carriers. The cave's humidity level is extremly high and smells damp and\
moldy. The brown carved out walls are jagged and unfinished, as if they\
were done by primitive tools. To the north is the mine shaft, just before\
it though is small gate, to make sure you donot fall down it , and to keep\
pesky ore haulers from buzzing around the office window.\
", 
         Vnum = 6840, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6844, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6843, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6841, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6839, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6841] = 
      {
         TeleDelay = 0, 
         Name = "Mine Office", 
         Description = "&c You stand in the Main lobby of the mine shaft . The floor is\
constructed, of old Takisi plant timbers layed over one another. The walls\
are slightly decorated with pictures of the mine shafts and pinups of\
Quarran women. The room smells of some strong drink made from an exotic\
bean plant, a mainstay in long hour professions. To the south is the\
Foreman's office . Back East is the Cave Enterence.&x \
", 
         Vnum = 6841, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "pictures", 
               Description = "|\
\13                          |\
\13                   --------\
\13                          |\
\13                          |------------------\
\13        ------------------|\
\13 \
\13 \
\13&R ^R Middle Coridor is unstable.........Priority Fix!^x\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6840, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6842, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6842] = 
      {
         TeleDelay = 0, 
         Name = "Large Wooden Desk", 
         Description = "&c The mine foreman's office is true Quarran decorating. Plant boards are\
stacked on the floor to allow easy movement, a man-made shower system is\
installed in the  ceiling to keep the room at an exact humidity level. \
There is a large desk, a chair and various books attached to wall. A sign\
rests on the door, and you can tell by the foot marks on the floor this is\
a place of heavy trafic.\
", 
         Vnum = 6842, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "shower", 
               Description = "If you stare at this device long enough you will see water as it bounces of\
\13your eyelids.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "desk chair", 
               Description = "This great wooden desk/chair set obiviously was imported from a different\
\13planet, as you have never seen this grain before.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "books", 
               Description = "You glance over at the books and see old mine shaft lore and fables.\
\13", 
            }, 
            [4] = 
            {
               Keyword = "floor ", 
               Description = "The floor is made from the base of a Higjk ocean plant. Known for it's\
\13durability.\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6841, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6843] = 
      {
         TeleDelay = 0, 
         Name = "Tool Shed", 
         Description = "&c The mine tool shed was made for easy access of the tools when a worker\
reports to duty. Originally, the foreman was having trouble with workers\
leaving thier tools in the mine or taking them home. So this beaten up,\
tool shed was built. The two main doors always remain open , exposing\
several shelves with tools placed on the rack.\
", 
         Vnum = 6843, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6840, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6844] = 
      {
         TeleDelay = 0, 
         Name = "Cave Corridor", 
         Description = "&c You stand before the mine shaft that goes straight down as far as you\
can imagine. There is a cut away walkway in a circular motion that allows\
workers to go down. Although most prefer to just ride the Ore hauler down.\
These machines ride the metal shaft through the center of the hole down to\
various levels and can drive to differnt mining locations. The floor is\
damp and covered in some kind of shimering metal that must have been mined\
recently. To the west is the Ore carrier shed.\
", 
         Vnum = 6844, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "metal", 
               Description = "The shimmering metal is of no use to you considering it is in dust form.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "mine shaft", 
               Description = "The shaft goes down to a point where you can only see blackness.\
\13", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6867, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6840, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6845, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6846, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6845] = 
      {
         TeleDelay = 0, 
         Name = "Ore Carrier Shed", 
         Description = "&c The ore carrier shed was sloped toghther in order to keep the sprinkler\
system from rusting out the machines. Tire tracks run from here to the ore\
shaft along the floor. There is a dim light reflecting from above and a\
large sign placed on top of the shed. There is also a note nailed to the\
main pole, that has cought your eye. \
", 
         Vnum = 6845, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "tracks", 
               Description = "You stare at the tracks already knowing what they are and think maybe I\
\13should be doing my job instead.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "sign", 
               Description = "&R Ore Carrier Shed &x\
\13", 
            }, 
            [3] = 
            {
               Keyword = "note", 
               Description = "If you check one of these out , you are responsible for returning it back\
\13here. Failure to do so will result in loss of job and a pissed off\
\13Foreman...(you don't want that) If your unfamiliar with this machine ( I\
\13think you should stay off it) but enter it and drive it anyway... Just\
\13don't break it or your buying new...   Foreman assisatnt ,   Kaytow\
\13", 
            }, 
            [4] = 
            {
               Keyword = "shed", 
               Description = "A small Quarran made shed for practical use.\
\13", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6844, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6846] = 
      {
         TeleDelay = 0, 
         Name = "Ore Shaft", 
         Description = "&c You stand in the middle of the main ore shaft. These massive corridors\
were created for easy access to  differnt areas of the mine. Along the\
sides are specially constructed walkways so that miners can travel around\
easier. In the center of the shaft is a large metal rod in which the Ore\
Carrier vehicles attach to to allow them to move around much faster and\
safer. The walls are clearly polished and smooth, you know this was done\
by highly sophisticated machinery.\
", 
         Vnum = 6846, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6844, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6847, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6847] = 
      {
         TeleDelay = 0, 
         Name = "Ore Shaft", 
         Description = "&c You stand in the middle of the main ore shaft. These massive corridors\
were created for easy access to  differnt areas of the mine. Along the\
sides are specially constructed walkways so that miners can travel around\
easier. In the center of the shaft is a large metal rod in which the Ore\
Carrier vehicles attach to to allow them to move around much faster and\
safer. The walls are clearly polished and smooth, you know this was done\
by highly sophisticated machinery. To the west you can see the first\
branch off corridor.\
", 
         Vnum = 6847, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "Level Corridor", 
               Distance = 0, 
               DestinationVnum = 6856, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6846, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6848, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6848] = 
      {
         TeleDelay = 0, 
         Name = "Ore Shaft", 
         Description = "&c You stand in the middle of the main ore shaft. These massive corridors\
were created for easy access to  differnt areas of the mine. Along the\
sides are specially constructed walkways so that miners can travel around\
easier. In the center of the shaft is a large metal rod in which the Ore\
Carrier vehicles attach to to allow them to move around much faster and\
safer. The walls are clearly polished and smooth, you know this was done\
by highly sophisticated machinery. To the north you can see the second\
branch off corridor.\
", 
         Vnum = 6848, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6861, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6847, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6849, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6849] = 
      {
         TeleDelay = 0, 
         Name = "Ore Shaft", 
         Description = "&c You stand in the middle of the main ore shaft. These massive corridors\
were created for easy access to  differnt areas of the mine. Along the\
sides are specially constructed walkways so that miners can travel around\
easier. In the center of the shaft is a large metal rod in which the Ore\
Carrier vehicles attach to to allow them to move around much faster and\
safer. The walls are clearly polished and smooth, you know this was done\
by highly sophisticated machinery.\
", 
         Vnum = 6849, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6848, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6850, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6850] = 
      {
         TeleDelay = 0, 
         Name = "Ore Shaft", 
         Description = "&c You stand in the middle of the main ore shaft. These massive corridors\
were created for easy access to  differnt areas of the mine. Along the\
sides are specially constructed walkways so that miners can travel around\
easier. In the center of the shaft is a large metal rod in which the Ore\
Carrier vehicles attach to to allow them to move around much faster and\
safer. The walls are clearly polished and smooth, you know this was done\
by highly sophisticated machinery. To the East you can see the third\
branch off corridor.\
", 
         Vnum = 6850, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6851, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6849, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6851] = 
      {
         TeleDelay = 0, 
         Name = "Lower Level Corridor", 
         Description = "&c Standing in the lower Level corridor you can see why most of the\
oldtimers prefer not to work down here..The shaft is not carved out well\
and is extremly dry (something residents of here don't like alot) The\
ground is a lighter sandy color and you can see sparkles of silver metal\
coming through. It is this corridor that the the younger Quarren miners\
make their money as this is the metal most of the shipbuilders prefer. To\
the west you can see the main ore shaft.\
", 
         Vnum = 6851, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6852, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6850, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6852] = 
      {
         TeleDelay = 0, 
         Name = "Lower Level Corridor", 
         Description = "&c Standing in the lower Level corridor you can see why most of the\
oldtimers prefer not to work down here..The shaft is not carved out well\
and is extremly dry (something residents of here don't like alot) The\
ground is a lighter sandy color and you can see sparkles of silver metal\
coming through. It is this corridor that the the younger Quarren miners\
make their money as this is the metal most of the shipbuilders prefer.\
", 
         Vnum = 6852, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6853, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6851, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6853] = 
      {
         TeleDelay = 0, 
         Name = "Lower Level Corridor", 
         Description = "&c Standing in the lower Level corridor you can see why most of the\
oldtimers prefer not to work down here..The shaft is not carved out well\
and is extremly dry (something residents of here don't like alot) The\
ground is a lighter sandy color and you can see sparkles of silver metal\
coming through. It is this corridor that the the younger Quarren miners\
make their money as this is the metal most of the shipbuilders prefer.\
", 
         Vnum = 6853, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6854, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6852, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6854] = 
      {
         TeleDelay = 0, 
         Name = "Lower Level Corridor", 
         Description = "&c Standing in the lower Level corridor you can see why most of the\
oldtimers prefer not to work down here..The shaft is not carved out well\
and is extremly dry (something residents of here don't like alot) The\
ground is a lighter sandy color and you can see sparkles of silver metal\
coming through. It is this corridor that the the younger Quarren miners\
make their money as this is the metal most of the shipbuilders prefer.\
", 
         Vnum = 6854, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6855, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6853, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6855] = 
      {
         TeleDelay = 0, 
         Name = "Lower Level Corridor", 
         Description = "&c Standing in the lower Level corridor you can see why most of the\
oldtimers prefer not to work down here..The shaft is not carved out well\
and is extremly dry (something residents of here don't like alot) The\
ground is a lighter sandy color and you can see sparkles of silver metal\
coming through. It is this corridor that the the younger Quarren miners\
make their money as this is the metal most of the shipbuilders prefer. To\
the west you see a boarded up turn in the corridor.\
", 
         Vnum = 6855, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "note", 
               Description = "&w Stay Out ,  Unsafe area!\
\13 \
\13&R Failure to follow these orders will result in imediate dismisal of\
\13job.\
\13 \
\13^R These corridors have already taken several Quarren life !^x\
\13&w This is your last an only warning.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "boarded east", 
               Description = "The boarded up corridor is covered in cob-webs, from an underground insect.\
\13from this and the residue you can figure out that noone has mined over\
\13there in some time. \
\13There is a small white note draped across the boards.\
\13", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6854, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [8] = "Dig", 
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6870, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6856] = 
      {
         TeleDelay = 0, 
         Name = "Upper Level Corridor", 
         Description = "&c  You stand in the upper corridor mine. This shaft travels within the\
ground, and was used extensively for rock fuel mining in the early years\
of the mine. There are still a few old-time miners who swear to it's\
worth, but most of the newer guys prefer the lower mines. The shaft itself\
is a dark brown , and the edges are carved out like somone used a pick ax.\
This corridor is unlike the ones your used to, smooth and carved from\
machines. You can see the Main Ore shaft is to the East.\
", 
         Vnum = 6856, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6857, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "Level Corridor", 
               Distance = 0, 
               DestinationVnum = 6847, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6857] = 
      {
         TeleDelay = 0, 
         Name = "Upper Level Corridor", 
         Description = "&c You stand in the upper corridor mine. This shaft travels within the\
ground, and was used extensively for rock fuel mining in the early years\
of the mine. There are still a few old-time miners who swear to it's\
worth, but most of the newer guys prefer the lower mines. The shaft itself\
is a dark brown , and the edges are carved out like somone used a pick ax.\
This corridor is unlike the ones your used to, smooth and carved from\
machines.\
", 
         Vnum = 6857, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6856, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6858, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6858] = 
      {
         TeleDelay = 0, 
         Name = "Upper Level Corridor", 
         Description = "&c You stand in the upper corridor mine. This shaft travels within the\
ground, and was used extensively for rock fuel mining in the early years\
of the mine. There are still a few old-time miners who swear to it's\
worth, but most of the newer guys prefer the lower mines. The shaft itself\
is a dark brown , and the edges are carved out like somone used a pick ax.\
This corridor is unlike the ones your used to, smooth and carved from\
machines.\
", 
         Vnum = 6858, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6859, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6857, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6859] = 
      {
         TeleDelay = 0, 
         Name = "Upper Level Corridor", 
         Description = "&c You stand in the upper corridor mine. This shaft travels within the\
ground, and was used extensively for rock fuel mining in the early years\
of the mine. There are still a few old-time miners who swear to it's\
worth, but most of the newer guys prefer the lower mines. The shaft itself\
is a dark brown , and the edges are carved out like somone used a pick ax.\
This corridor is unlike the ones your used to, smooth and carved from\
machines.\
", 
         Vnum = 6859, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6858, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6860, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6860] = 
      {
         TeleDelay = 0, 
         Name = "Upper Level Corridor", 
         Description = "&c You stand in the upper corridor mine. This shaft travels within the\
ground, and was used extensively for rock fuel mining in the early years\
of the mine. There are still a few old-time miners who swear to it's\
worth, but most of the newer guys prefer the lower mines. The shaft itself\
is a dark brown , and the edges are carved out like somone used a pick ax.\
This corridor is unlike the ones your used to, smooth and carved from\
machines.\
", 
         Vnum = 6860, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6859, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6866, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6861] = 
      {
         TeleDelay = 0, 
         Name = "Middle Level Corridor", 
         Description = "&c The middle level corridor is nicely polished and you can tell most of\
the high ranking miners work thisone. Ease alone would make you want to\
work here, the money might not be as great but the danger is way down. The\
floor has well driven ore vehicle tracks and you can tell by the activity\
that has been going around, this is a very active shaft. Mostly likely you\
will find some fikler metals used for weapons and tools.\
", 
         Vnum = 6861, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6862, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6848, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6862] = 
      {
         TeleDelay = 0, 
         Name = "Middle Level Corridor", 
         Description = "&c The middle level corridor is nicely polished and you can tell most of\
the high ranking miners work thisone. Ease alone would make you want to\
work here, the money might not be as great but the danger is way down. The\
floor has well driven ore vehicle tracks and you can tell by the activity\
that has been going around, this is a very active shaft. Mostly likely you\
will find some fikler metals used for weapons and tools.\
", 
         Vnum = 6862, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6863, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6861, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6863] = 
      {
         TeleDelay = 0, 
         Name = "Middle Level Corridor", 
         Description = "&c The middle level corridor is nicely polished and you can tell most of\
the high ranking miners work thisone. Ease alone would make you want to\
work here, the money might not be as great but the danger is way down. The\
floor has well driven ore vehicle tracks and you can tell by the activity\
that has been going around, this is a very active shaft. Mostly likely you\
will find some fikler metals used for weapons and tools.\
", 
         Vnum = 6863, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6864, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6862, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6864] = 
      {
         TeleDelay = 0, 
         Name = "Middle Level Corridor", 
         Description = "&c The middle level corridor is nicely polished and you can tell most of\
the high ranking miners work thisone. Ease alone would make you want to\
work here, the money might not be as great but the danger is way down. The\
floor has well driven ore vehicle tracks and you can tell by the activity\
that has been going around, this is a very active shaft. Mostly likely you\
will find some fikler metals used for weapons and tools.\
", 
         Vnum = 6864, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6865, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6863, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6865] = 
      {
         TeleDelay = 0, 
         Name = "Middle Level Corridor", 
         Description = "&c  The middle level corridor is nicely polished and you can tell most of\
the high ranking miners work thisone. Ease alone would make you want to\
work here, the money might not be as great but the danger is way down. The\
floor has well driven ore vehicle tracks and you can tell by the activity\
that has been going around, this is a very active shaft. Mostly likely you\
will find some fikler metals used for weapons and tools.\
", 
         Vnum = 6865, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6864, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6866] = 
      {
         TeleDelay = 0, 
         Name = "&R Break Shed &x", 
         Description = "&Y The break shed is a place for the Quarren to hang out and relax during\
thier ten minute breaks. The shed was created out of the wall and food and\
drink dispensors were brought in. The upper shaft was used to house the\
place, due to the inactivity the digging has provided. There are several\
creates on the ground to sit on although most miners just soon use the\
floor. \
There is a sign posted of the hours, above the shed.\
", 
         Vnum = 6866, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "I will be open from 8 am until 8 pm big fish ...Wink wink.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "open ", 
               Description = "The crate is open , there is no need to open it.\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6860, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6867] = 
      {
         TeleDelay = 0, 
         Name = "Cargo Hall", 
         Description = "&c You stand in the Cargo Hall of the mine. To the north is a loading bay\
for the ore shippers so they can take the mine's riches to the surface.\
This room is just used for storage and so that the miners can get paid. \
Everyone knows the man with the money. And after a hard days work, it is\
always nice to trade in your finds for credits. There is a small sign\
tacked to the wall here.\
", 
         Vnum = 6867, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "&R Welcome miners to Ketson's Ore purchasing!\
\13 \
\13I will buy only between 8 a.m. and 12p.m.  sorry but i work for\
\13union.\
\13 \
\13Hahahahahaha!\
\13 \
\13Ketson\
\13", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6868, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6844, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
         }, 
      }, 
      [6868] = 
      {
         TeleDelay = 0, 
         Name = "Ore Shippers Loading Bay", 
         Description = "&c The loading Bay is a very active area of the mine. It is here trained\
drivers, truck the mined ores and treasure to the surface. On the main\
wall you can see the extremly large hide belts feeding the ore into the\
cargo area through a sealed hatchway. The floor has remains of ore droped,\
but nothing of worth. The activity in this room is extreme so it's not\
recommended that you stay long. Somthing is liable to drop on your head.\
", 
         Vnum = 6868, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6867, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6869] = 
      {
         TeleDelay = 0, 
         Name = "Ore Carrier Interior", 
         Description = "The interior of the ore miner is quite spacious. The above area is a clear\
holobubble, so you can see where your driving and that you don't run some\
poor miner over. The floor board has two pedals , one for fuel the second\
for brake. They are currently extremely dirty from the last guy who used\
it.  The chair is made for a quarren , A straight water moisturizing back\
that goes through the length of the vehicle. Directly behind the back is a\
large bin so you can place your digs in here for movement purposes.\
To drive just type Drive then the direction ...\
EX drive E         (will take you east)\
", 
         Vnum = 6869, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6870] = 
      {
         TeleDelay = 0, 
         Name = "Dark Cave Corridor", 
         Description = "", 
         Vnum = 6870, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6855, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6871] = 
      {
         TeleDelay = 0, 
         Name = "Down the dark Corridor", 
         Description = "", 
         Vnum = 6871, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6872] = 
      {
         TeleDelay = 0, 
         Name = "&w Down the dark Corridor", 
         Description = "", 
         Vnum = 6872, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6876] = 
      {
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Description = "", 
         Vnum = 6876, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [7200] = 
      {
         TeleDelay = 0, 
         Name = "Ackbar's building problems.", 
         Description = "Make blasters not work underwater.\
 \
Figure out how to set a button so it automatically pulls it back out after\
use.\
 \
how do you set the vip and speach for MOn cal?   \
The program says mon  mon_cal or the spelled out versions are not\
recognized.\
 \
Doors what am i doing wrong, they say closed but i cant seem to open still\
won't work\
check the security doors to the cells to see what i mean.\
 \
Need to know how you make a portal or enterable object(turbo-lift)\
 \
How do i add more then one mob spec tothe police and how do i get the jail\
spec to work.\
", 
         Vnum = 7200, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6878] = 
      {
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Description = "", 
         Vnum = 6878, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6879] = 
      {
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Description = "", 
         Vnum = 6879, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6880] = 
      {
         TeleDelay = 0, 
         Name = "Miner's Enterence", 
         Description = "&B Standing in front of the miner enterence security post. you realize the\
seriousness the quarren take thier job. The room is layedout with sveral\
flatback chairs for the tired Miners to rest on. Uphead you see a\
bio-scanner disigned to make sure you are who you say you are. The walls\
are well decorated and have a smooth polished look. The Quarren use alot\
of coral and natural rocks to sculp thier underground city.\
", 
         Vnum = 6880, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6837, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6838, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6881] = 
      {
         TeleDelay = 0, 
         Name = "&R Gateway to Heurkea ", 
         Description = "", 
         Vnum = 6881, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "gateway", 
               Description = "It is a large rock made archway to welcome visitors to the city.\
\13", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6880, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6882, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6883, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6884, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6882] = 
      {
         TeleDelay = 0, 
         Name = "East Coral St", 
         Description = "The domed city of Heurkea is divided into three main streets. Each having\
distinct and differnt purposes. It was designed for easy access and so\
that security could patrol and maintain order. One of the best Security\
features of Heurkea is that threr are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white. To the west you smell barbecue and ale.\
", 
         Vnum = 6882, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6881, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21055, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6886, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6883] = 
      {
         TeleDelay = 0, 
         Name = "East Lamprey St", 
         Description = "The domed city of Heurkea is divided into three main streets. Each having\
distinct and differnt purposes. It was designed for easy access and so\
that security could patrol and maintain order. One of the best Security\
features of Heurkea is that threr are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white.\
", 
         Vnum = 6883, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6885, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6881, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6884] = 
      {
         TeleDelay = 0, 
         Name = "East Kelp St", 
         Description = "&w The domed city of Heurkea is divided into three main streets. Each\
having distinct and differnt purposes. It was designed for easy access and\
so that security could patrol and maintain order. One of the best Security\
features of Heurkea is that there are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white. You can see a large building of importance to the\
southwest.\
", 
         Vnum = 6884, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6881, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6887, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6885] = 
      {
         TeleDelay = 0, 
         Name = "East Lamprey St", 
         Description = "&w The domed city of Heurkea is divided into three main streets. Each\
having distinct and differnt purposes. It was designed for easy access and\
so that security could patrol and maintain order. One of the best Security\
features of Heurkea is that there are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white.  Lining the walls of the street are small shacks the\
miners use for domicles.\
", 
         Vnum = 6885, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
               }, 
               Keyword = "door", 
               Distance = 0, 
               DestinationVnum = 6939, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6890, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6883, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6886] = 
      {
         TeleDelay = 0, 
         Name = "Sea Bird &w Bar and Grill &x", 
         Description = "Standing on Coral st. You see the everyday rituals of the citizens(mostly\
miners). From stoping by to get a quick meal or a faster weapon. City life\
underwater seems to go on forever. Of coarse there isn't a sun rise or set\
so time has very little relevince. Most of the people wake up and go\
whenever they feel like it, Unfortunately so do the shop owners.  Infront\
of you is a small stand for purchasing food or drink. There is a large\
sign above the stand and a smaller note tacked to the edge of the wall.\
", 
         Vnum = 6886, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign ", 
               Description = "&B SEA BIRD  &Y BAR AND GRILL\
\13&w Where you can get the best food this side of the ocean.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "note", 
               Description = "Sorry open only form 12:00p.m. until 11:00 p.m.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "cost ", 
               Description = "Cost - 12,000 credits and Good taste buds!\
\13", 
            }, 
            [4] = 
            {
               Keyword = "stand", 
               Description = "The stand is decorated by dried out &G seaweed &w draped along the edge. \
\13There is three chairs placed in front of the stand for customers to rest\
\13while they eat.\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6882, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6889, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6887] = 
      {
         TeleDelay = 0, 
         Name = "Quarren Library", 
         Description = "Standing on Lamprey St. You see the everyday rituals of the\
citizens(mostly;miners). From stoping by to get a quick meal or a faster\
weapon. City life underwater seems to go on forever. Of coarse there isn't\
a sun rise or set so time has very little relevince. Most of the people\
wake up and go whenever they feel like it, Unfortunately so do the\
building owners. There is a large building before you constructed from a\
dark grey rock. This building is of great importance to the Quarren as\
they have spent many hours carving into the rock extravegant sculptures.\
There is a large Sign on top of the building and a smaller posting on the\
door.\
", 
         Vnum = 6887, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "You want to buy a Library?  \
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Keyword = "door", 
               Distance = 0, 
               DestinationVnum = 6917, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6884, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6888, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6888] = 
      {
         TeleDelay = 0, 
         Name = "&R Seabed Tavern", 
         Description = "&g Standing on Lamprey St.. You see the everyday rituals of the\
citizens(mostly miners). From stoping by to get a quick meal or a faster\
weapon. City life underwater seems to go on forever. Of coarse there isn't\
a sun rise or set so time has very little relevince. Most of the people\
wake up and go whenever they feel like it, Unfortunately so do the shop\
owners.  In front of you is a large well decorated house used for a quick\
overnite stay for wandering visitors.\
", 
         Vnum = 6888, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - 100,000 credits and a freindly face!\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6889, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6909, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6893, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6887, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [6889] = 
      {
         TeleDelay = 0, 
         Name = "Expiremental Wares", 
         Description = "&O Standing on Coral st. You see the everyday rituals of the\
citizens(mostly miners). From stoping by to get a quick meal or a faster\
weapon. City life underwater seems to go on forever. Of coarse there isn't\
a sun rise or set so time has very little relevince. Most of the people\
wake up and go whenever they feel like it, Unfortunately so do the shop\
owners.  A high-tech building stands here with a small window for\
conversation. The buildings walls are constructed of a rare metal found in\
the Quarren underwater mines. It is here that the legendary inventor\
Torisk creates some of his famous and not so famous, weapons.\
There is a large sign and a small note fixed to the stand.\
", 
         Vnum = 6889, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "&z Expiremental Wares\
\13We are not responible for any malfunctions as all weapons are in the\
\13development\
\13stage.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "note", 
               Description = "Store is open at 10:00 P.m. until 8:00 a.m.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "cost", 
               Description = "Cost - 68,000 credits Wis -13\
\13", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6886, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6888, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6892, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6890, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6888, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6890] = 
      {
         TeleDelay = 0, 
         Name = "East Lamprey St", 
         Description = "&w The domed city of Heurkea is divided into three main streets. Each\
having distinct and differnt purposes. It was designed for easy access and\
so that security could patrol and maintain order. One of the best Security\
features of Heurkea is that there are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white. Lining the walls of the street are small shacks the\
miners use for domicles.\
", 
         Vnum = 6890, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6938, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6891, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6885, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6889, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6891] = 
      {
         TeleDelay = 0, 
         Name = "&Y Public Offices", 
         Description = "The domed city of Heurkea is divided into three main streets. Each having\
distinct and differnt purposes. It was designed for easy access and so\
that security could patrol and maintain order. One of the best Security\
features of Heurkea is that there are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white. Lining the walls of the street are small shacks the\
miners use for domicles. To the North is a large white structure with\
statues of great Quarren fighters framing the main steps.\
", 
         Vnum = 6891, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Keyword = "door", 
               Distance = 0, 
               DestinationVnum = 6925, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6890, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6892, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6894, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6892] = 
      {
         TeleDelay = 0, 
         Name = "&g Serpant Wares", 
         Description = "Standing on Coral st. You see the everyday rituals of the citizens(mostly\
miners). From stoping by to get a quick meal or a faster weapon. City life\
underwater seems to go on forever. Of coarse there isn't a sun rise or set\
so time has very little relevince. Most of the people wake up and go\
whenever they feel like it, Unfortunately so do the shop owners. In front\
of you is a small clothing tent that can be uplifted and moved at a\
moments notice. The creator and tailor Cathia works very hard to cloth\
most of the miners. There is a large sign and a small note fixed to the\
tent.\
", 
         Vnum = 6892, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "tent", 
               Description = "It is a large tent that can be taken down instantly.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "note", 
               Description = "Store hours are from 5 a.m. until 1 p.m.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "cost", 
               Description = "Cost - 50,000 credits Cha - 15\
\13", 
            }, 
            [4] = 
            {
               Keyword = "sign", 
               Description = "&G SERPANT WARES\
\13Where you will always get the best clothing deal.\
\13", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6891, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6889, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6893, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6895, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6893] = 
      {
         TeleDelay = 0, 
         Name = "&G Quarren Training Facility", 
         Description = "Standing on Lamprey St.. You see the everyday rituals of the\
citizens(mostly miners). From stoping by to get a quick meal or a faster\
weapon. City life underwater seems to go on forever. Of coarse there isn't\
a sun rise or set so time has very little relevince. Most of the people\
wake up and go whenever they feel like it, Unfortunately so do the shop\
owners.   The main building to the south is well guarded by some of the\
largest Quarren you have ever seen. It is said that it is there that\
Security forces train individual quarren on weapon and battle tricks.\
", 
         Vnum = 6893, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - Not for Sale\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6892, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6888, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6911, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6896, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6894] = 
      {
         TeleDelay = 0, 
         Name = "West Lamprey St.", 
         Description = "&w The domed city of Heurkea is divided into three main streets. Each\
having distinct and differnt purposes. It was designed for easy access and\
so that security could patrol and maintain order. One of the best Security\
features of Heurkea is that there are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white. Lining the walls of the street are small shacks the\
miners use for domicles.\
", 
         Vnum = 6894, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
               }, 
               Keyword = "door", 
               Distance = 0, 
               DestinationVnum = 6940, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6891, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6895, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6897, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6895] = 
      {
         TeleDelay = 0, 
         Name = "&P Mother of Pearl Jewlery", 
         Description = "Standing on Coral st. You see the everyday rituals of the\
citizens(mostly;miners). From stoping by to get a quick meal or a faster\
weapon. City life underwater seems to go on forever. Of coarse there isn't\
a sun rise or set so time has very little relevince. Most of the people\
wake up and go whenever they feel like it, Unfortunately so do the shop\
owners. There is a well guarded building with huge windows here. In the\
glass windows you can see various gems and pearls from the Mon Cal ocean\
and odd planets. There is a small speaker by the window where you can talk\
and see Plantik inside. There is large sign hanging above and a small\
letter tacked to the wall.\
", 
         Vnum = 6895, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "&p Mother of Pearl Jewlery \
\13The greatest selection of fine jewlery in the ocean.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "letter", 
               Description = "Shop window is open between 7a.m. and 11 p.m.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "cost", 
               Description = "Cost - 84,000 credits and CHA - 17\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6894, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6892, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6896, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6898, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6896] = 
      {
         TeleDelay = 0, 
         Name = "&B Mine main office", 
         Description = "Standing on Lamprey St.. You see the everyday rituals of the\
citizens(mostly miners). From stoping by to get a quick meal or a faster\
weapon. City life underwater seems to go on forever. Of coarse there isn't\
a sun rise or set so time has very little relevince. Most of the people\
wake up and go whenever they feel like it, Unfortunately so do the shop\
owners.   The small office space to the south is the main mine branch. It\
is not well decorated in fact is rather plain. In the window is a bright\
red sign.\
", 
         Vnum = 6896, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - Not for Sale\
\13", 
            }, 
            [2] = 
            {
               Keyword = "sign", 
               Description = "&R Help Wanted :  Apply within!\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6895, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6893, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6936, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6899, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6897] = 
      {
         TeleDelay = 0, 
         Name = "West Lamprey St.", 
         Description = "&w The domed city of Heurkea is divided into three main streets. Each\
having distinct and differnt purposes. It was designed for easy access and\
so that security could patrol and maintain order. One of the best Security\
features of Heurkea is that there are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white. Lining the walls of the street are small shacks the\
miners use for domicles.\
", 
         Vnum = 6897, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6941, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6898, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6894, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6900, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6898] = 
      {
         TeleDelay = 0, 
         Name = "Quarren Security Armory", 
         Description = "&z Standing on Coral st. You see the everyday rituals of the\
citizens(mostly;miners). From stoping by to get a quick meal or a faster\
weapon. City life underwater seems to go on forever. Of coarse there isn't\
a sun rise or set so time has very little relevince. Most of the people\
wake up and go whenever they feel like it, Unfortunately so do the shop\
owners.  The open tent in front of you is a resale shop for old Security\
weapons. While most of the inventory is generic stuff you never know what\
he might have in. There is large sign hanging above and a small letter\
tacked to the wall.\
", 
         Vnum = 6898, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - 29,000 credits and Str - 16\
\13", 
            }, 
            [2] = 
            {
               Keyword = "sign", 
               Description = "&z Quarren Security Armory\
\13We buy and sell all weapons.\
\13Dealing mostly with older models.\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6897, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6895, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6899, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6902, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [6899] = 
      {
         TeleDelay = 0, 
         Name = "&G Quarren First of Mon Bank", 
         Description = "Standing on Lamprey St.. You see the everyday rituals of the\
citizens(mostly miners). From stoping by to get a quick meal or a faster\
weapon. City life underwater seems to go on forever. Of coarse there isn't\
a sun rise or set so time has very little relevince. Most of the people\
wake up and go whenever they feel like it, Unfortunately so do the shop\
owners.   To the south is the First of Mon Bank, the prefered bank of most\
underwater individuals.\
", 
         Vnum = 6899, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cost", 
               Description = "Cost - 500,000 credits INT - 17\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6896, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6896, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6918, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6901, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6900] = 
      {
         TeleDelay = 0, 
         Name = "West Lamprey St", 
         Description = "&w The domed city of Heurkea is divided into three main streets. Each\
having distinct and differnt purposes. It was designed for easy access and\
so that security could patrol and maintain order. One of the best Security\
features of Heurkea is that there are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white.\
", 
         Vnum = 6900, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6897, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6903, 
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [6901] = 
      {
         TeleDelay = 0, 
         Name = "West Kelp St.", 
         Description = "Standing on Lamprey St.. You see the everyday rituals of the\
citizens(mostly miners). From stoping by to get a quick meal or a faster\
weapon. City life underwater seems to go on forever. Of coarse there isn't\
a sun rise or set so time has very little relevince. Most of the people\
wake up and go whenever they feel like it, Unfortunately so do the shop\
owners.   \
", 
         Vnum = 6901, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6945, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6903, 
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6899, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6902] = 
      {
         TeleDelay = 0, 
         Name = "West Coral St.", 
         Description = "&w The domed city of Heurkea is divided into three main streets. Each\
having distinct and differnt purposes. It was designed for easy access and\
so that security could patrol and maintain order. One of the best Security\
features of Heurkea is that there are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white.\
", 
         Vnum = 6902, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6898, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6903, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6903] = 
      {
         TeleDelay = 0, 
         Name = "West Entrance to City", 
         Description = "The domed city of Heurkea is divided into three main streets. Each having\
distinct and differnt purposes. It was designed for easy access and so\
that security could patrol and maintain order. One of the best Security\
features of Heurkea is that there are only three roads to hide on and they\
all lead to only to exits The streets are made out of the old molten rock\
ocean floor that used to be here covered with water. They have managed to\
adapt a plant that uses very little to grow down here although the leaves\
are a pale white.\
", 
         Vnum = 6903, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6902, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6935, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6900, 
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6901, 
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [6904] = 
      {
         TeleDelay = 0, 
         Name = "&B Quarren City Platform", 
         Description = "You stand on a large platform surrounded by extremely rough waters. The\
platform is well hidden and to this day is not locatable from the air.\
Only this specific taxi knows of it's wearabouts. The platform floor is a\
rough dark rock almost like dried magma. In front of you is a small\
turbo-lift heading straight down. It would be best for you to enter it\
before the wind picks up and the waves start kncking over the platform.\
", 
         Vnum = 6904, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6935, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6905] = 
      {
         TeleDelay = 0, 
         Name = "&R Tunnel system", 
         Description = "&w  &W This small branch off of the road leads to two underground tunnels\
marked Mon Calamrian to the south. While the tunnel to the east is marked\
Quarren There is extreme measures taken to make sure only those two races\
would have access to the service entrance to the city. The floor is dark\
and covered with soot from miners who have a few days off on vaction.\
", 
         Vnum = 6905, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6947, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6942, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21016, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6906] = 
      {
         TeleDelay = 0, 
         Name = "End of Dock", 
         Description = "&c  You stand on the end of an extremly old dock. The wooden fibers were\
from a rare underwater tree of very little color. It's pale white timbers\
creak as you shift your weight form side to side. On the sides of the dock\
you can see the dark blue ocean's waves and ocasionally you swear to see a\
rainbow colored fish swim by. The sky is a pale green and staring into one\
of the two suns you can see the black shadow of a indigenice bird. At the\
end of the dock you can see a shiny metal bar laying across.\
", 
         Vnum = 6906, 
         Sector = "field", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bar shiny metal", 
               Description = "This metal bar is connected to a ladder that allows you to climb down into\
\13the water.\
\13", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6907, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6800, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6907] = 
      {
         TeleDelay = 0, 
         Name = "Middle of Dock", 
         Description = "&c You stand on the middle of an extremly old dock. The wooden fibers were\
from a rare underwater tree of very little color. It's pale white\
timbers;creak as you shift your weight form side to side. On the sides of\
the dock;you can see the dark blue ocean's waves and ocasionally you swear\
to see a rainbow colored fish swim by. The sky is a pale green and staring\
into one of the two suns you can see the black shadow of a indigenice bird\
To the west you can see the end of the dock , while to the east is the\
begining.\
", 
         Vnum = 6907, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6908, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6906, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleVnum = 0, 
      }, 
      [6908] = 
      {
         TeleDelay = 0, 
         Name = "Front of Dock", 
         Description = "&c You stand on the beginning of an extremly old dock. The wooden fibers\
were from a rare underwater tree of very little color. It's pale white\
timbers;creak as you shift your weight form side to side. On the sides of\
the dock;you can see the dark blue ocean's waves and ocasionally you swear\
to see a rainbow colored fish swim by. The sky is a pale green and staring\
into one of the two suns you can see the black shadow of a indigenice bird\
To the east is the land and city of Akatamer\
", 
         Vnum = 6908, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 21081, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6907, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [6909] = 
      {
         TeleDelay = 0, 
         Name = "Lobby", 
         Description = "Here a weary traveller can seek a good rest in comfort without fear of \
theft or, worse yet, murder.  A long counter stretches across much of the\
room, and for a few credits the hotel keeper will gladly rent you one of\
his rooms.  Drunken laughter emerges from behind the room's doors.  To the\
south beyond a door barred by the hotel keeper are the rooms. ;You may\
safely quit here.\
", 
         Vnum = 6909, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6888, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [23] = "Hotel", 
            [7] = "NoMagic", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [6910] = 
      {
         TeleDelay = 0, 
         Name = "Hot-Tub", 
         Description = "&c This former mariage suite is now known for its sociol atmosphere. The\
owner of the hotel added a large Hot-Tub (a fovorite past time for\
Quarren's). This additon and the removal of all the beds and dressors have\
allowed this place to become a brathal of sorts. The Walls are decorated\
with ocean lanscape pictures and soft sounds the ocean can be heard of the\
radio system. The lighting is very low and all communication devices are\
being scrabled in this room. \
", 
         Vnum = 6910, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6909, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [10] = "Safe", 
            [7] = "NoMagic", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [6911] = 
      {
         TeleDelay = 0, 
         Name = "&G Facility Main Hall", 
         Description = "&w This extremly large building is the Security Officers Training facility.\
For a small fee you can enter the remote area and practice your skills. \
Although they are allowed to kick you out at anytime. The walls are\
decorated with pictures of Victory's against the Empire! And of famous\
Quarren citizens, There is one large statue in the middle of the room that\
seems to have scraches and blaster marks through it, as if people were\
practicing on it. To the south is the remote room . To the East is the\
elderly Security trainer.\
", 
         Vnum = 6911, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "statue", 
               Description = "The large statue is of the great &Y ^R Admiral Ackbar &x ^x it is no\
\13wonder, the Quarren citizens fire randomly at the statue, as they resent\
\13having the MOn Cal's control them. Including making them add this statue\
\13to thier Security Office.\
\13", 
            }, 
         }, 
         Sector = "underground", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6893, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6916, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 6912, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 6801, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg3 = 6806, 
      }, 
      [2] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6806, 
      }, 
      [3] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6807, 
      }, 
      [4] = 
      {
         Arg1 = 6801, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg3 = 6807, 
      }, 
      [5] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6808, 
      }, 
      [6] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6809, 
      }, 
      [7] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6809, 
      }, 
      [8] = 
      {
         Arg1 = 6801, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg3 = 6809, 
      }, 
      [9] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6811, 
      }, 
      [10] = 
      {
         Arg1 = 6801, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg3 = 6812, 
      }, 
      [11] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6813, 
      }, 
      [12] = 
      {
         Arg1 = 6801, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg3 = 6817, 
      }, 
      [13] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6818, 
      }, 
      [14] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6818, 
      }, 
      [15] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6818, 
      }, 
      [16] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6818, 
      }, 
      [17] = 
      {
         Arg1 = 6803, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
         Arg3 = 6818, 
      }, 
      [18] = 
      {
         Arg1 = 6802, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 6828, 
      }, 
      [19] = 
      {
         Arg1 = 6802, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 6829, 
      }, 
      [20] = 
      {
         Arg1 = 6800, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 6830, 
      }, 
      [21] = 
      {
         Arg1 = 6800, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 6830, 
      }, 
      [22] = 
      {
         Arg1 = 6800, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 6830, 
      }, 
      [23] = 
      {
         Arg1 = 6802, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 6832, 
      }, 
      [24] = 
      {
         Arg1 = 6810, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6839, 
      }, 
      [25] = 
      {
         Arg1 = 6805, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6842, 
      }, 
      [26] = 
      {
         Arg1 = 6802, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6842, 
      }, 
      [27] = 
      {
         Arg1 = 6805, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6842, 
      }, 
      [28] = 
      {
         Arg1 = 6811, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6843, 
      }, 
      [29] = 
      {
         Arg1 = 6811, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6843, 
      }, 
      [30] = 
      {
         Arg1 = 6812, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6843, 
      }, 
      [31] = 
      {
         Arg1 = 6812, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6843, 
      }, 
      [32] = 
      {
         Arg1 = 6813, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6843, 
      }, 
      [33] = 
      {
         Arg1 = 6813, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6843, 
      }, 
      [34] = 
      {
         Arg1 = 6807, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
         Arg3 = 6847, 
      }, 
      [35] = 
      {
         Arg1 = 6807, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
         Arg3 = 6847, 
      }, 
      [36] = 
      {
         Arg1 = 6804, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6866, 
      }, 
      [37] = 
      {
         Arg1 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [38] = 
      {
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [39] = 
      {
         Arg1 = 6807, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [40] = 
      {
         Arg1 = 6814, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [41] = 
      {
         Arg1 = 6815, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [42] = 
      {
         Arg1 = 6803, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6866, 
      }, 
      [43] = 
      {
         Arg1 = 6808, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 6867, 
      }, 
      [44] = 
      {
         Arg1 = 6819, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6838, 
      }, 
      [45] = 
      {
         Arg1 = 6818, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6854, 
      }, 
      [46] = 
      {
         Arg1 = 6818, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6851, 
      }, 
      [47] = 
      {
         Arg1 = 6816, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6862, 
      }, 
      [48] = 
      {
         Arg1 = 6807, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
         Arg3 = 6864, 
      }, 
      [49] = 
      {
         Arg1 = 6816, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6864, 
      }, 
      [50] = 
      {
         Arg1 = 6816, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6865, 
      }, 
      [51] = 
      {
         Arg1 = 6807, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
         Arg3 = 6856, 
      }, 
      [52] = 
      {
         Arg1 = 6807, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
         Arg3 = 6856, 
      }, 
      [53] = 
      {
         Arg1 = 6817, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6856, 
      }, 
      [54] = 
      {
         Arg1 = 6807, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
         Arg3 = 6857, 
      }, 
      [55] = 
      {
         Arg1 = 6817, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6857, 
      }, 
      [56] = 
      {
         Arg1 = 6816, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6917, 
      }, 
      [57] = 
      {
         Arg1 = 6812, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6889, 
      }, 
      [58] = 
      {
         Arg1 = 6826, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [59] = 
      {
         Arg1 = 6827, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [60] = 
      {
         Arg1 = 6828, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [61] = 
      {
         Arg1 = 6829, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [62] = 
      {
         Arg1 = 6810, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6886, 
      }, 
      [63] = 
      {
         Arg1 = 6814, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [64] = 
      {
         Arg1 = 6815, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [65] = 
      {
         Arg1 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [66] = 
      {
         Arg1 = 6823, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [67] = 
      {
         Arg1 = 6824, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [68] = 
      {
         Arg1 = 6825, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [69] = 
      {
         Arg1 = 6817, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6886, 
      }, 
      [70] = 
      {
         Arg1 = 6815, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6898, 
      }, 
      [71] = 
      {
         Arg1 = 6817, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 6898, 
      }, 
      [72] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6896, 
      }, 
      [73] = 
      {
         Arg1 = 6817, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
         Arg3 = 6896, 
      }, 
      [74] = 
      {
         Arg1 = 6814, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6895, 
      }, 
      [75] = 
      {
         Arg1 = 6839, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [76] = 
      {
         Arg1 = 6840, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [77] = 
      {
         Arg1 = 6841, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [78] = 
      {
         Arg1 = 6840, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [79] = 
      {
         Arg1 = 6840, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [80] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 6895, 
      }, 
      [81] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 6885, 
      }, 
      [82] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg3 = 6881, 
      }, 
      [83] = 
      {
         Arg1 = 6820, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6881, 
      }, 
      [84] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
         Arg3 = 6844, 
      }, 
      [85] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
         Arg3 = 6861, 
      }, 
      [86] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
         Arg3 = 6852, 
      }, 
      [87] = 
      {
         Arg1 = 6818, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6852, 
      }, 
      [88] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 9, 
         Arg3 = 6855, 
      }, 
      [89] = 
      {
         Arg1 = 6818, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6855, 
      }, 
      [90] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg3 = 6859, 
      }, 
      [91] = 
      {
         Arg1 = 6817, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6859, 
      }, 
      [92] = 
      {
         Arg1 = 6806, 
         Command = "O", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 6845, 
      }, 
      [93] = 
      {
         Arg1 = 6820, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6936, 
      }, 
      [94] = 
      {
         Arg1 = 6818, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg3 = 6936, 
      }, 
      [95] = 
      {
         Arg1 = 6802, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6936, 
      }, 
      [96] = 
      {
         Arg1 = 6805, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6936, 
      }, 
      [97] = 
      {
         Arg1 = 6819, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6937, 
      }, 
      [98] = 
      {
         Arg1 = 6802, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6937, 
      }, 
      [99] = 
      {
         Arg1 = 6805, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6937, 
      }, 
      [100] = 
      {
         Arg1 = 6821, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6926, 
      }, 
      [101] = 
      {
         Arg1 = 6842, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [102] = 
      {
         Arg1 = 6805, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6926, 
      }, 
      [103] = 
      {
         Arg1 = 6802, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6926, 
      }, 
      [104] = 
      {
         Arg1 = 6822, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6912, 
      }, 
      [105] = 
      {
         Arg1 = 6823, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6913, 
      }, 
      [106] = 
      {
         Arg1 = 6824, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6914, 
      }, 
      [107] = 
      {
         Arg1 = 6825, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6915, 
      }, 
      [108] = 
      {
         Arg1 = 6826, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6946, 
      }, 
      [109] = 
      {
         Arg1 = 6852, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6910, 
      }, 
      [110] = 
      {
         Arg1 = 6813, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6892, 
      }, 
      [111] = 
      {
         Arg1 = 6831, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [112] = 
      {
         Arg1 = 6832, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [113] = 
      {
         Arg1 = 6833, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [114] = 
      {
         Arg1 = 6835, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [115] = 
      {
         Arg1 = 6836, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [116] = 
      {
         Arg1 = 6837, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [117] = 
      {
         Arg1 = 6828, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 6892, 
      }, 
      [118] = 
      {
         Arg1 = 6827, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6909, 
      }, 
      [119] = 
      {
         Arg1 = 6828, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 6909, 
      }, 
      [120] = 
      {
         Arg1 = 6828, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 6899, 
      }, 
      [121] = 
      {
         Arg1 = 6829, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6897, 
      }, 
      [122] = 
      {
         Arg1 = 6830, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6906, 
      }, 
      [123] = 
      {
         Arg1 = 6831, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6942, 
      }, 
      [124] = 
      {
         Arg1 = 6832, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6947, 
      }, 
      [125] = 
      {
         Arg1 = 6829, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg3 = 6883, 
      }, 
      [126] = 
      {
         Arg1 = 6829, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg3 = 6894, 
      }, 
      [127] = 
      {
         Arg1 = 6829, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 6901, 
      }, 
      [128] = 
      {
         Arg1 = 6833, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6918, 
      }, 
      [129] = 
      {
         Arg1 = 6933, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
      }, 
      [130] = 
      {
         Arg1 = 21115, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6931, 
      }, 
      [131] = 
      {
         Arg1 = 21116, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6931, 
      }, 
      [132] = 
      {
         Arg1 = 6931, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 2, 
      }, 
      [133] = 
      {
         Arg1 = 6828, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
         Arg3 = 6934, 
      }, 
      [134] = 
      {
         Arg1 = 6934, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
      }, 
      [135] = 
      {
         Arg1 = 21115, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6932, 
      }, 
      [136] = 
      {
         Arg1 = 21116, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6932, 
      }, 
      [137] = 
      {
         Arg1 = 6932, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 2, 
      }, 
      [138] = 
      {
         Arg1 = 6834, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6930, 
      }, 
      [139] = 
      {
         Arg1 = 10311, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [140] = 
      {
         Arg1 = 32269, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [141] = 
      {
         Arg1 = 21115, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6930, 
      }, 
      [142] = 
      {
         Arg1 = 21116, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6930, 
      }, 
      [143] = 
      {
         Arg1 = 6930, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 2, 
      }, 
      [144] = 
      {
         Arg1 = 6821, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6929, 
      }, 
      [145] = 
      {
         Arg1 = 6929, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
      }, 
      [146] = 
      {
         Arg1 = 6929, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg3 = 0, 
      }, 
      [147] = 
      {
         Arg1 = 6809, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 6928, 
      }, 
      [148] = 
      {
         Arg1 = 6821, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 0, 
      }, 
      [149] = 
      {
         Arg1 = 6928, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg3 = 2, 
      }, 
   }, 
   ResetMessage = "", 
   FileFormatVersion = 1, 
   Objects = 
   {
      [6850] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "credits", 
         Description = "A creidts is here.", 
         Cost = 0, 
         Vnum = 6850, 
         ShortDescr = "a creidts", 
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
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6851] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "remote", 
         Description = "A remote is here.", 
         Cost = 0, 
         Vnum = 6851, 
         ShortDescr = "a remote", 
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
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6852] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "hot tub bath", 
         Description = "&b A Hot-Tub sits in the middle of the room.", 
         Cost = 0, 
         Vnum = 6852, 
         ShortDescr = "&b A Hot-Tub", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         ItemType = "furniture", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 300, 
      }, 
      [6800] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Comlink Blaster", 
         Description = "A Comlink Blaster is here.", 
         Cost = 0, 
         Vnum = 6800, 
         ShortDescr = "a Comlink Blaster", 
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
         WearFlags = 
         {
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6801] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "&P large clam shell", 
         Description = "&P A large shimering clam shell rests between the smaller browish clams.", 
         Cost = 0, 
         Vnum = 6801, 
         ShortDescr = "&P A large clam shell", 
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
            [0] = "Glow", 
            [12] = "NoRemove", 
         }, 
         ItemType = "container", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 2000, 
      }, 
      [6802] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Large Wooden Desk", 
         Description = "A large wooden desk lies prominently in the center of the room.", 
         Cost = 0, 
         Vnum = 6802, 
         ShortDescr = "A large wooden desk", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "furniture", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 150, 
      }, 
      [6803] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "crate", 
         Description = "A wooden crate used to bring in tools sits here.", 
         Cost = 0, 
         Vnum = 6803, 
         ShortDescr = "A wooden crate.", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         ItemType = "furniture", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 200, 
      }, 
      [6804] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "", 
         Description = "Chair", 
         Cost = 0, 
         Vnum = 6804, 
         ShortDescr = "Chair", 
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
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Chair", 
               Description = "What you've never seen a chair before??\
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6805] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "wooden chair", 
         Description = "A wooden chair sits here.", 
         Cost = 0, 
         Vnum = 6805, 
         ShortDescr = "A wooden chair", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ItemType = "furniture", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Chair", 
               Description = "What you've never seen a chair before??\
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6806] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Ore Carrier", 
         Description = "&B A X-56ty7 Ore Carrier sits here waiting for use.&x", 
         Cost = 0, 
         Vnum = 6806, 
         ShortDescr = "A Ore Carrier", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "spacecraft", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6807] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Bantha rib", 
         Description = "A bantha rib is here for your enjoyment.", 
         Cost = 10, 
         Vnum = 6807, 
         ShortDescr = "a bantha rib", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6808] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Hatch door", 
         Description = "A Hatch door is here.", 
         Cost = 0, 
         Vnum = 6808, 
         ShortDescr = "a Hatch door", 
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
            [1] = "Hum", 
         }, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6810] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Voice box", 
         Description = "A Security Voice Box is attached to the wall.", 
         Cost = 0, 
         Vnum = 6810, 
         ShortDescr = "A Security Voice Box", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "Say Welcome Miner step this way...\
mptransfer all 6840\
", 
               MudProgType = "speech_prog", 
               Arguments = "krebbex", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho &R That is the wrong password..Please be advised Security Has been\
mpecho Called!  Please stand back from the door!\
", 
               MudProgType = "speech_prog", 
               Arguments = "fuck asshole quarran mon ackbar ghett fish ", 
            }, 
         }, 
         ItemType = "circuit", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 200, 
      }, 
      [6811] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "shoval ", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho You hear a loud click as the shoval vibrates back and forth, ready\
for\
use.\
", 
               MudProgType = "speech_prog", 
               Arguments = "on", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho You hear a slow HMMMMmmmmmmmmm as th shoval comes to a complete\
mpecho stop!\
", 
               MudProgType = "speech_prog", 
               Arguments = "off", 
            }, 
         }, 
         Description = "&w A automated Shovel rests here waiting for use.", 
         Cost = 0, 
         Vnum = 6811, 
         Flags = 
         {
            [1] = "Hum", 
         }, 
         ShortDescr = "a automated shoval", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "shovel", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "shoval ", 
               Description = "&W The automated shoval was designed to speed up the mining process. This\
\13unit is voice activated. To work it just say \"shovel on\" then type dig\
\13floor. \
\13", 
            }, 
            [2] = 
            {
               Keyword = "Automated Shovel", 
               Description = "&W The automated shoval was designed to speed up the mining process. This\
\13unit is voice activated. To work it just say \"shovel on\" then type dig\
\13floor. \
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6812] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Hack pick", 
         Description = "A hack pick of some age sits here.", 
         Cost = 0, 
         Vnum = 6812, 
         ShortDescr = "A hack pick", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "shovel", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Automated Shovel", 
               Description = "&W The automated shoval was designed to speed up the mining process. This\
\13unit is voice activated. To work it just say \"shovel on\" then type dig\
\13floor. \
\13", 
            }, 
            [2] = 
            {
               Keyword = "shoval ", 
               Description = "&W The automated shoval was designed to speed up the mining process. This\
\13unit is voice activated. To work it just say \"shovel on\" then type dig\
\13floor. \
\13", 
            }, 
            [3] = 
            {
               Keyword = "Hack pick", 
               Description = "Elderly pick tool used for mining.\
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6813] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "rope", 
         Description = "A coil of very strong rope is here.", 
         Cost = 60, 
         Vnum = 6813, 
         Affects = 
         {
            [1] = 
            {
               Location = 52, 
               Modifier = 30, 
            }, 
         }, 
         ShortDescr = "A coil of Seaweed Rope", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "rope", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 3, 
      }, 
      [6814] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "&G Kelp salad", 
         Description = "&G  A Kelp salad lies here ready to be eaten.", 
         Cost = 18, 
         Vnum = 6814, 
         ShortDescr = "&G  A Kelp salad", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "&G Kelp salad", 
               Description = "&G the salad is comprised of kelp and seaweed. A tasty treat for Quarren.\
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6815] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "&B glass salt water", 
         Description = "&B A glass of salt water looks mighty tasty.", 
         Cost = 2, 
         Vnum = 6815, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "&B A glass of salt water.", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6816] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "katasik metal", 
         Description = "A chunk of Katasik metal lies here.", 
         Cost = 40, 
         Vnum = 6816, 
         ShortDescr = "A chunk of Katasik metal.", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 3, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ItemType = "rare_metal", 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Katasik metal", 
               Description = "The katasik metal is used in most weapons, as it is highly durable and easy\
\13to minipulate.\
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6817] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "coal rock", 
         Description = "&W A lump of coal rock is laying here..", 
         Cost = 30, 
         Vnum = 6817, 
         Flags = 
         {
            [29] = "Burried", 
            [25] = "Hidden", 
         }, 
         ShortDescr = "&W A lump of coal rock", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "treasure", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6818] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Platiciki Metel", 
         Description = "A chunck of Platiciki metal lies here.", 
         Cost = 50, 
         Vnum = 6818, 
         Flags = 
         {
            [29] = "Burried", 
            [25] = "Hidden", 
         }, 
         ShortDescr = "A chunck of Platiciki metal ", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "treasure", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6819] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "bio scan bio-scan button", 
         Description = "A Security BioScan button is attached here.", 
         Cost = 0, 
         Vnum = 6819, 
         ShortDescr = "A bio-scan button sits here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoat $n The lights go out in total darkness.\
mpecho you see a   Red scanner aray flash through the your body\
mpechoat $n starting from the bottom up to the top.\
mptransfer $n 6881\
mpforce $n pull button\
mpechoat $n Welcome $n you have passed all security checks!\
", 
               MudProgType = "push_prog", 
               Arguments = "100", 
            }, 
         }, 
         ItemType = "button", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 200, 
      }, 
      [6820] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Archway", 
         Description = "A &R Gateway to Heurkea stands here.", 
         Cost = 0, 
         Vnum = 6820, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "&B ^B Say Please come agian $n!\
", 
               MudProgType = "greet_prog", 
               Arguments = "", 
            }, 
         }, 
         ShortDescr = "&R Gateway to Heurkea", 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6821] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "key", 
         Description = "A silver key lays here.", 
         Cost = 0, 
         Vnum = 6821, 
         ShortDescr = "a key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6822] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "fish fillet", 
         Description = "&b A fillet of fish lies here.", 
         Cost = 0, 
         Vnum = 6822, 
         ShortDescr = "fillet of fish", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "&G Kelp salad", 
               Description = "&G the salad is comprised of kelp and seaweed. A tasty treat for Quarren.\
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6823] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "soup", 
         Description = "&G A bowl of Algee soup rests here.", 
         Cost = 10, 
         Vnum = 6823, 
         ShortDescr = "&G A bowl of Algee soup", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6824] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "crunch", 
         Description = "&Y A starfish crunch bar rests here.", 
         Cost = 5, 
         Vnum = 6824, 
         ShortDescr = "&Y A starfish crunch bar sits here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6825] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "lamprey steaks", 
         Description = "&g A well done lamprey steak warms here.", 
         Cost = 10, 
         Vnum = 6825, 
         ShortDescr = "&g A well done lamprey steak", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6826] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Wrist Com-blaster", 
         Description = "&w XT-3000 Wrist Com-Blaster was left here.", 
         Cost = 3000, 
         Vnum = 6826, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         ShortDescr = "&w XT-3000 Wrist Com-Blaster ", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         WearFlags = 
         {
            [12] = "Wrist", 
            [13] = "Wield", 
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 10, 
      }, 
      [6827] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Coral knife", 
         Description = "A high-tech Coral knife was left here.", 
         Cost = 100, 
         Vnum = 6827, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ShortDescr = "A high-tech Coral knife ", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6828] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "Automated spear", 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Description = "&p A automated spear was left here.", 
         Cost = 4100, 
         Vnum = 6828, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "&p A automated spear", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 7, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 10, 
      }, 
      [6829] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "spear", 
         Description = "&G A polished spear was left here.", 
         Cost = 50, 
         Vnum = 6829, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "&G A polished spear", 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ItemType = "bolt", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6830] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "platiki earing", 
         Description = "&Y A platiki metal earing rests here.", 
         Cost = 300, 
         Vnum = 6830, 
         Affects = 
         {
            [1] = 
            {
               Location = 3, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 17, 
               Modifier = -2, 
            }, 
            [3] = 
            {
               Location = 17, 
               Modifier = 2, 
            }, 
            [4] = 
            {
               Location = 3, 
               Modifier = 0, 
            }, 
            [5] = 
            {
               Location = 3, 
               Modifier = 0, 
            }, 
            [6] = 
            {
               Location = 3, 
               Modifier = 0, 
            }, 
            [7] = 
            {
               Location = 3, 
               Modifier = 1, 
            }, 
            [8] = 
            {
               Location = 3, 
               Modifier = 0, 
            }, 
            [9] = 
            {
               Location = 3, 
               Modifier = 0, 
            }, 
            [10] = 
            {
               Location = 3, 
               Modifier = -1, 
            }, 
         }, 
         ShortDescr = "A platiki metal earing", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "comlink", 
         WearFlags = 
         {
            [0] = "Take", 
            [16] = "Ears", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6831] = 
      {
         ActionDescription = "", 
         Layers = 3, 
         Name = "Kelp shirt", 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = 2, 
            }, 
         }, 
         Description = "&g A Kelp shirt was left here.", 
         Cost = 2500, 
         Vnum = 6831, 
         Flags = 
         {
            [8] = "Bless", 
            [31] = "HumanSize", 
            [19] = "LargeSize", 
         }, 
         ShortDescr = "&g A Kelp shirt", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
            [10] = "About", 
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 2, 
      }, 
      [6832] = 
      {
         ActionDescription = "", 
         Layers = 2, 
         Name = "belt", 
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 1, 
            }, 
         }, 
         Description = "&p A lamprey skin belt was left here.", 
         Cost = 0, 
         Vnum = 6832, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "&p A lamprey skin belt", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "belt leather", 
               Description = "This belt is made of a fine leather, braided for strength. You can get\
\13it at the Darkhaven Academy.\
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 2, 
      }, 
      [6833] = 
      {
         ActionDescription = "", 
         Layers = 64, 
         Name = "vest", 
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = -10, 
            }, 
            [2] = 
            {
               Location = 17, 
               Modifier = 5, 
            }, 
            [3] = 
            {
               Location = 17, 
               Modifier = 15, 
            }, 
         }, 
         Description = "&B A Security Officers's vest lays here.", 
         Cost = 100, 
         Vnum = 6833, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "&B A Security Officers's vest ", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6834] = 
      {
         ActionDescription = "", 
         Layers = 1, 
         Name = "shield", 
         Description = "&b Quarren miner's Blast Shield rests here.", 
         Cost = 0, 
         Vnum = 6834, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "&b Quarren miner's Blast Shield", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6835] = 
      {
         ActionDescription = "", 
         Layers = 1, 
         Name = "pants", 
         Description = "Quarren miner's pants was left here.", 
         Cost = 300, 
         Vnum = 6835, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "Quarren miner's pants", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 5, 
      }, 
      [6836] = 
      {
         ActionDescription = "", 
         Layers = 64, 
         Name = "leg guards", 
         Affects = 
         {
            [1] = 
            {
               Location = 37, 
               Modifier = 4, 
            }, 
            [2] = 
            {
               Location = 37, 
               Modifier = -4, 
            }, 
            [3] = 
            {
               Location = 40, 
               Modifier = 5, 
            }, 
         }, 
         Description = "Leg blast guards were droped here.", 
         Cost = 450, 
         Vnum = 6836, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "Leg blast guards", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6837] = 
      {
         ActionDescription = "", 
         Layers = 1, 
         Name = "sleeves", 
         Description = "Miner's protective sleeves were carelessly left here.", 
         Cost = 20, 
         Vnum = 6837, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "Miner's protective sleeves", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 3, 
      }, 
      [6838] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "boots", 
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = -20, 
            }, 
         }, 
         Description = "&B Quarren Miner's boots were left here.", 
         Cost = 125, 
         Vnum = 6838, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "&B Quarren Miner's boots", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6839] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "earings", 
         Description = "&y A platiki metal earing was left here &x", 
         Cost = 299, 
         Vnum = 6839, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "&y A platiki metal earing", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [16] = "Ears", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 5, 
      }, 
      [6840] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "wrist cuffs", 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = 5, 
            }, 
         }, 
         Description = "&R Miner's cuffs were left here.", 
         Cost = 499, 
         Vnum = 6840, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "&R Miner's cuffs", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 12, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "wrist cuffs", 
               Description = "These metal cuffs are worn by most of the miner's to protect their wrist\
\13form blast debris , but normal citizens started wearing them as\
\13fashion.\
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6841] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "ring", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
            [3] = 
            {
               Location = 25, 
               Modifier = 1, 
            }, 
         }, 
         Description = "&P A coral ring was dropped here.", 
         Cost = 1000, 
         Vnum = 6841, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ShortDescr = "&R&GCoral Ring&R&W", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "crystal", 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6842] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "map", 
         Description = "A data map of the city was left here.", 
         Cost = 0, 
         Vnum = 6842, 
         ShortDescr = "A data map of the city", 
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
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "map", 
               Description = "Cells -   C|   B|   A |\
\13            -----------|\
\13                         |\
\13                         |  |Mayor\
\13            Security | --|--|--|Defense\
\13                         |\
\13            --|-----|----|----|------|---\
\13          /  A    J      W    EX      S   \\\
\13          -----|----|------|-----|------|------\
\13            \\                               /\
\13              ------|----|-----|-----|---|-- \
\13                    B    M     Q     T   L\
\13 \
\13Key A- armory    B- Bank     J- jewler    L - Library   M - Mine office\
\13Q - Quarren training     S- Seabird grill   T-Tavern  W-Weapons\
\13", 
            }, 
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
      [6899] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Name = "boots", 
         Description = "Large water boots", 
         Cost = 125, 
         Vnum = 6899, 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = 30, 
            }, 
            [2] = 
            {
               Location = 14, 
               Modifier = -20, 
            }, 
         }, 
         ShortDescr = "Large water boots", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Weight = 1, 
      }, 
   }, 
   ResetFrequency = 0, 
   VnumRanges = 
   {
      Room = 
      {
         First = 6800, 
         Last = 7200, 
      }, 
      Mob = 
      {
         First = 6800, 
         Last = 6838, 
      }, 
      Object = 
      {
         First = 6800, 
         Last = 6899, 
      }, 
   }, 
   Filename = "quarren.lua", 
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
   Name = "Quarren Mine City", 
   HighEconomy = -1, 
}
