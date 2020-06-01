-- Adari - Baituh City
-- Last saved Monday 01-Jun-2020 11:08:47

AreaEntry
{
   Mobiles = 
   {
      [29060] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitSizeDice = 40, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29060, 
         SpecFuns = 
         {
            [1] = "spec_customs_spice", 
            [0] = "spec_police_jail", 
         }, 
         Description = "He is a big burly Adarian.  His only intention is to keep weapons\
from being imported or exported from Adari.\
", 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 20, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 8, 
         Race = "Adarian", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A deputy leaves in a rush.\
mpgoto 29030\
drop all\
mpgoto 29065\
mpecho A deputy has arrived.\
", 
               Arguments = "12", 
               MudProgType = "time_prog", 
            }, 
         }, 
         HitRoll = 8, 
         Name = "officer customs smotsuk", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Alignment = 350, 
         Weight = 0, 
         LongDescr = "Smotsuk, a customs officer is here.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 40, 
         ShortDescr = "Smotsuk", 
      }, 
      [29061] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29061, 
         Shop = 
         {
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
            KeeperShortDescr = "Baszturd", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         Description = "He is an elderly Adarian shop keeper. \
", 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 4, 
         Race = "Adarian", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 4, 
         Name = "shop keeper shopkeeper baszturd", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Alignment = -400, 
         Weight = 0, 
         LongDescr = "A shop keeper works here.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 20, 
         ShortDescr = "Baszturd", 
      }, 
      [29062] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29062, 
         Description = "This old Adarian may not know a great deal about fighting, but he\
knows many languages and other academic fields.  He might be able to\
help you learn another language. \
", 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 10, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 4, 
         Race = "Adarian", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
            [20] = "Scholar", 
         }, 
         Height = 0, 
         ArmorClass = 60, 
         HitRoll = 4, 
         Name = "scholar old saavy professor sumaretie", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [9] = "antarian", 
               [19] = "adarese", 
               [20] = "verpine", 
               [6] = "shistavanen", 
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [0] = "basic", 
               [9] = "antarian", 
               [19] = "adarese", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
            }, 
         }, 
         Alignment = 450, 
         Weight = 0, 
         LongDescr = "A saavy, old scholar studies here.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 20, 
         ShortDescr = "Professor Sumaretie", 
      }, 
      [29063] = 
      {
         Sex = "undistinguished", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 30, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29063, 
         Description = "A red astromech R2 unit idles here waiting to help you.  If you would\
like  to rent a room for the evening, give 50 credits to this R2\
unit. \
", 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 15, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 6, 
         Race = "Adarian", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A little red R2 Unit whistles happily towards you.\
", 
               Arguments = "75", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = "mpgoto 29110\
mptransfer $n\
mpechoat $n The R2 Unit escorts you to a room.\
east\
", 
               Arguments = "18", 
               MudProgType = "bribe_prog", 
            }, 
         }, 
         HitRoll = 6, 
         Name = "droid innkeeper keeper r2 unit", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Alignment = -400, 
         Weight = 0, 
         LongDescr = "An Innkeeper Droid idles here.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 30, 
         ShortDescr = "An Innkeeper Droid", 
      }, 
      [29064] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 50, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29064, 
         Shop = 
         {
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
            KeeperShortDescr = "Puttzu", 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 25, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 10, 
         Race = "Hutt", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 10, 
         Name = "bartender hutt puttzu", 
         NumberOfAttacks = 0, 
         Alignment = -500, 
         Weight = 0, 
         LongDescr = "A Hutt Bartender works here.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [4] = "huttese", 
               [0] = "basic", 
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Credits = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 50, 
         ShortDescr = "Puttzu", 
      }, 
      [29065] = 
      {
         Sex = "undistinguished", 
         HitChance = 
         {
            HitNoDice = 7, 
            HitSizeDice = 65, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29065, 
         Description = "This Astromech Droid is acting as a bouncer to the bar south of here.\
Only 'adults' can enter.  If you would like to enter the bar, tell\
the droid 'hutts rule!'. \
", 
         Damage = 
         {
            DamNoDice = 6, 
            DamSizeDice = 37, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 13, 
         Race = "Adarian", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [26] = "Droid", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpgoto puttzu\
mptransfer $n\
mpechoat $n The Droid ushers you into the bar.\
mpecho $n is ushered into the bar.\
mpgoto 29081\
", 
               Arguments = "p hutts rule!", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         HitRoll = 13, 
         Name = "droid astromech bouncer", 
         NumberOfAttacks = 0, 
         Alignment = -500, 
         Weight = 0, 
         LongDescr = "An Astromech Droid acts as a bouncer here.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Credits = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 65, 
         ShortDescr = "An Astromech Droid", 
      }, 
      [29066] = 
      {
         Sex = "undistinguished", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29066, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 10, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Height = 0, 
         ArmorClass = -100, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoaround $n $n exits the jail.\
mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpechoaround $n $n exits the jail.\
mpgoto 29108\
", 
               Arguments = "30", 
               MudProgType = "bribe_prog", 
            }, 
         }, 
         HitRoll = 10, 
         Name = "bailjfk boxjfk", 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A Bail Box has been installed in the wall here.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
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
         Credits = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 50, 
         ShortDescr = "a bail box", 
      }, 
      [29067] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 30, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29067, 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_police_jail", 
         }, 
         Description = "Deputy Snopaew is a tall and gangly looking Adarian.  It is his job to\
keep weapons out of the city.\
", 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 15, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 6, 
         Race = "Adarian", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho Deputy Snopaew surveys the area.\
", 
               Arguments = "50", 
               MudProgType = "entry_prog", 
            }, 
            [2] = 
            {
               Code = "glare $n\
", 
               Arguments = "75", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         HitRoll = 6, 
         Name = "deputy snopaew", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Alignment = 300, 
         Weight = 0, 
         LongDescr = "A deputy partols the area.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 30, 
         ShortDescr = "Deputy Snopaew", 
      }, 
      [29068] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 15, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29068, 
         SpecFuns = 
         {
            [1] = "spec_customs_alcohol", 
            [0] = "spec_police_attack", 
         }, 
         Description = "A young Adarian deputy.  You can see it is his dream to enforce\
laws.  He is a decent and moral being.\
", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 8, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 3, 
         Race = "Adarian", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 3, 
         Name = "deputy young", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Alignment = 300, 
         Weight = 0, 
         LongDescr = "A deputy patrols the area.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Credits = 15, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 15, 
         ShortDescr = "a young deputy", 
      }, 
      [29069] = 
      {
         Sex = "female", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 10, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29069, 
         Description = "Not the brightest nor most beautiful Adarian.  This is one of the\
citizens of the town.  She lives day to day.\
", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 5, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 2, 
         Race = "Adarian", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Height = 0, 
         ArmorClass = 75, 
         HitRoll = 2, 
         Name = "adarian townie", 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Alignment = -100, 
         Weight = 0, 
         LongDescr = "An Adarian Townie wanders about here.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 15, 
         ShortDescr = "a Townie", 
      }, 
      [29070] = 
      {
         Sex = "undistinguished", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 22, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29070, 
         Description = "Ears similar to a rabbit, eyes of a fly, teeth of a lion, body of an\
ape. This can be a very frightening beast to stumble upon.\
", 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 12, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 4, 
         Race = "Adarian", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
            [18] = "Mountable", 
         }, 
         Height = 0, 
         ArmorClass = 65, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if ispc($n) \
if level($n) >= 15 \
mpkill $n \
endif \
else \
mpecho A Draagax snorts loudly.\
endif\
", 
               Arguments = "75", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         HitRoll = 4, 
         Name = "draagax crazed omnivore", 
         NumberOfAttacks = 0, 
         Alignment = -100, 
         Weight = 0, 
         LongDescr = "A crazed omnivore sniffs about.\
", 
         Stats = 
         {
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Credits = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 22, 
         ShortDescr = "a Draagax", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29061, 
         Arg3 = 29068, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 29002, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 10313, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 10314, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 10317, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29062, 
         Arg3 = 29083, 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29063, 
         Arg3 = 29084, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg2 = 3, 
         Command = "D", 
         Arg1 = 29084, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29065, 
         Arg3 = 29081, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg2 = 2, 
         Command = "D", 
         Arg1 = 29081, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29066, 
         Arg3 = 29108, 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Arg2 = 3, 
         Command = "D", 
         Arg1 = 29108, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [13] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 38, 
         Arg3 = 29096, 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29067, 
         Arg3 = 29066, 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29068, 
         Arg3 = 29069, 
         MiscData = 1, 
      }, 
      [20] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [21] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [24] = 
      {
         Arg2 = 2, 
         Command = "M", 
         Arg1 = 29068, 
         Arg3 = 29078, 
         MiscData = 1, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Arg2 = 3, 
         Command = "M", 
         Arg1 = 29068, 
         Arg3 = 29090, 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [32] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [33] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Arg2 = 4, 
         Command = "M", 
         Arg1 = 29068, 
         Arg3 = 29100, 
         MiscData = 1, 
      }, 
      [35] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [36] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [37] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [38] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [39] = 
      {
         Arg2 = 5, 
         Command = "M", 
         Arg1 = 29068, 
         Arg3 = 29106, 
         MiscData = 1, 
      }, 
      [40] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [41] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [42] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [43] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [44] = 
      {
         Arg2 = 6, 
         Command = "M", 
         Arg1 = 29068, 
         Arg3 = 29107, 
         MiscData = 1, 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [46] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [47] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [48] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [49] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29060, 
         Arg3 = 29065, 
         MiscData = 1, 
      }, 
      [50] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [51] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [52] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [53] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [54] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29060, 
         Arg3 = 29065, 
         MiscData = 1, 
      }, 
      [55] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29062, 
         MiscData = 1, 
      }, 
      [56] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [57] = 
      {
         Arg2 = 2, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29071, 
         MiscData = 1, 
      }, 
      [58] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [59] = 
      {
         Arg2 = 3, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29080, 
         MiscData = 1, 
      }, 
      [60] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [61] = 
      {
         Arg2 = 4, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29073, 
         MiscData = 1, 
      }, 
      [62] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [63] = 
      {
         Arg2 = 5, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29092, 
         MiscData = 1, 
      }, 
      [64] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [65] = 
      {
         Arg2 = 6, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29104, 
         MiscData = 1, 
      }, 
      [66] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [67] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29127, 
         MiscData = 1, 
      }, 
      [68] = 
      {
         Arg2 = 2, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29129, 
         MiscData = 1, 
      }, 
      [69] = 
      {
         Arg2 = 3, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29131, 
         MiscData = 1, 
      }, 
      [70] = 
      {
         Arg2 = 4, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29133, 
         MiscData = 1, 
      }, 
      [71] = 
      {
         Arg2 = 5, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29135, 
         MiscData = 1, 
      }, 
      [72] = 
      {
         Arg2 = 6, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29137, 
         MiscData = 1, 
      }, 
      [73] = 
      {
         Arg2 = 7, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29139, 
         MiscData = 1, 
      }, 
      [74] = 
      {
         Arg2 = 8, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29141, 
         MiscData = 1, 
      }, 
      [75] = 
      {
         Arg2 = 9, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29143, 
         MiscData = 1, 
      }, 
      [76] = 
      {
         Arg2 = 10, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29145, 
         MiscData = 1, 
      }, 
      [77] = 
      {
         Arg2 = 11, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29147, 
         MiscData = 1, 
      }, 
      [78] = 
      {
         Arg2 = 12, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29149, 
         MiscData = 1, 
      }, 
      [79] = 
      {
         Arg2 = 13, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29151, 
         MiscData = 1, 
      }, 
      [80] = 
      {
         Arg2 = 14, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29153, 
         MiscData = 1, 
      }, 
      [81] = 
      {
         Arg2 = 15, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29155, 
         MiscData = 1, 
      }, 
      [82] = 
      {
         Arg2 = 16, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29157, 
         MiscData = 1, 
      }, 
      [83] = 
      {
         Arg2 = 17, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29115, 
         MiscData = 1, 
      }, 
      [84] = 
      {
         Arg2 = 18, 
         Command = "M", 
         Arg1 = 29070, 
         Arg3 = 29119, 
         MiscData = 1, 
      }, 
      [85] = 
      {
         Arg2 = 3, 
         Command = "D", 
         Arg1 = 29027, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [86] = 
      {
         Arg2 = 7, 
         Command = "M", 
         Arg1 = 29068, 
         Arg3 = 29027, 
         MiscData = 1, 
      }, 
      [87] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [88] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [89] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [90] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [91] = 
      {
         Arg2 = 3, 
         Command = "D", 
         Arg1 = 29027, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [92] = 
      {
         Arg2 = 8, 
         Command = "M", 
         Arg1 = 29068, 
         Arg3 = 29015, 
         MiscData = 1, 
      }, 
      [93] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [94] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [95] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [96] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [97] = 
      {
         Arg2 = 7, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29015, 
         MiscData = 1, 
      }, 
      [98] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [99] = 
      {
         Arg2 = 9, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29021, 
         MiscData = 1, 
      }, 
      [100] = 
      {
         Arg2 = 8, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29021, 
         MiscData = 1, 
      }, 
      [101] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [102] = 
      {
         Arg2 = 9, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29033, 
         MiscData = 1, 
      }, 
      [103] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [104] = 
      {
         Arg2 = 10, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29037, 
         MiscData = 1, 
      }, 
      [105] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [106] = 
      {
         Arg2 = 11, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29042, 
         MiscData = 1, 
      }, 
      [107] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [108] = 
      {
         Arg2 = 12, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29041, 
         MiscData = 1, 
      }, 
      [109] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [110] = 
      {
         Arg2 = 13, 
         Command = "M", 
         Arg1 = 29069, 
         Arg3 = 29050, 
         MiscData = 1, 
      }, 
      [111] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [112] = 
      {
         Arg2 = 10, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29064, 
         MiscData = 1, 
      }, 
      [113] = 
      {
         Arg2 = 11, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29088, 
         MiscData = 1, 
      }, 
      [114] = 
      {
         Arg2 = 12, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29082, 
         MiscData = 1, 
      }, 
      [115] = 
      {
         Arg2 = 13, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29101, 
         MiscData = 1, 
      }, 
      [116] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29064, 
         Arg3 = 29085, 
         MiscData = 1, 
      }, 
      [117] = 
      {
         MiscData = 1, 
         Arg1 = 21009, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [118] = 
      {
         MiscData = 1, 
         Arg1 = 21008, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [119] = 
      {
         MiscData = 1, 
         Arg1 = 21010, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [120] = 
      {
         MiscData = 1, 
         Arg1 = 32230, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [121] = 
      {
         MiscData = 1, 
         Arg1 = 10487, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [122] = 
      {
         MiscData = 1, 
         Arg1 = 29065, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [123] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 7316, 
         Arg3 = 29085, 
         MiscData = 1, 
      }, 
      [124] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 28200, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [125] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 32217, 
         Arg3 = 6, 
         MiscData = 1, 
      }, 
      [126] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 32215, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [127] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 32216, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [128] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 32204, 
         Arg3 = 13, 
         MiscData = 1, 
      }, 
      [129] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 32205, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [130] = 
      {
         Arg2 = 0, 
         Command = "D", 
         Arg1 = 29085, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
   }, 
   Name = "Adari - Baituh City", 
   VnumRanges = 
   {
      Object = 
      {
         First = 29060, 
         Last = 29065, 
      }, 
      Room = 
      {
         First = 29060, 
         Last = 29158, 
      }, 
      Mob = 
      {
         First = 29060, 
         Last = 29070, 
      }, 
   }, 
   Objects = 
   {
      [29060] = 
      {
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 29060, 
         Name = "sign welcome", 
         Description = "A Large sign has been posted here.", 
         ShortDescr = "a sign", 
         Weight = 5000, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign welcome", 
               Description = "-  Welcome to Baituh City  -\
\13Please follow our laws:\
\0131. No Weapons Permitted\
\0132. No Drugs Permitted\
\0133. No \"Adult Entertainment\"\
\13", 
            }, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Cost = 1, 
      }, 
      [29061] = 
      {
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               Arguments = "sorry", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               Arguments = "30", 
               MudProgType = "bribe_prog", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Vnum = 29061, 
         Name = "bail box", 
         Description = "A Bail Box has been built into the wall.", 
         ShortDescr = "a Bail Box", 
         Weight = 5000, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bail box", 
               Description = "To be released from jail you must apologize for your crimes.  Hint,\
\13say 'sorry' to be released. \
\13", 
            }, 
            [2] = 
            {
               Keyword = "bail box", 
               Description = "", 
            }, 
         }, 
         ItemType = "container", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Cost = 0, 
      }, 
      [29065] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 29065, 
         Name = "playhutt trashy magazine", 
         Description = "A copy of PlayHutt magazine has been left here.", 
         ShortDescr = "a copy of PlayHutt magazine", 
         Weight = 2, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "playhutt trashy magazine", 
               Description = "Be careful! You might go blind looking at such filth!\
\13", 
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
         ItemType = "smut", 
         Layers = 0, 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         Cost = 50, 
      }, 
   }, 
   Rooms = 
   {
      [29060] = 
      {
         Tunnel = 0, 
         Vnum = 29060, 
         Sector = "city", 
         Description = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Floating in a void", 
      }, 
      [29061] = 
      {
         Tunnel = 0, 
         Vnum = 29061, 
         Sector = "city", 
         Description = "This is the northern most entrance and exit of Baituh City.  Jagged\
rocks prevent your travel in most directions.  The air is thick and\
full of dirt and soil.  You can continue to either the north or the\
south from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29112, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29062, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29062] = 
      {
         Tunnel = 0, 
         Vnum = 29062, 
         Sector = "city", 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29061, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29064, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29063, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29063] = 
      {
         Tunnel = 0, 
         Vnum = 29063, 
         Sector = "city", 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29062, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29066, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29064] = 
      {
         Tunnel = 0, 
         Vnum = 29064, 
         Sector = "city", 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29067, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29062, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29065] = 
      {
         Tunnel = 0, 
         Vnum = 29065, 
         Sector = "city", 
         Description = "This barren little area is used for private space vessels to come\
and go.  This is not a nice or well kept facility, but it does serve\
a very useful purpose for the cities inhabitants.  This is not a bus\
stop. Commercial transportation does not and cannot dock here.  You\
can continue east from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29066, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Name = "Baituh City Landing Strip", 
      }, 
      [29066] = 
      {
         Tunnel = 0, 
         Vnum = 29066, 
         Sector = "city", 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29063, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29069, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29065, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29067] = 
      {
         Tunnel = 0, 
         Vnum = 29067, 
         Sector = "city", 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29064, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29068, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29071, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29068] = 
      {
         Tunnel = 0, 
         Vnum = 29068, 
         Sector = "city", 
         Description = "You are just inside a cave.  The room is very well lit and well\
kept. Whoever runs the shop is very clean and meticulous.  The floor\
is made up of smoothed marble like rock and has very little dirt on\
it. You can exit to the west.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29067, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Cafeteria", 
      }, 
      [29069] = 
      {
         Tunnel = 0, 
         Vnum = 29069, 
         Sector = "city", 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29066, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29070, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29070] = 
      {
         Tunnel = 0, 
         Vnum = 29070, 
         Sector = "city", 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29071, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29072, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29069, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29071] = 
      {
         Tunnel = 0, 
         Vnum = 29071, 
         Sector = "city", 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29067, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29070, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29072] = 
      {
         Tunnel = 0, 
         Vnum = 29072, 
         Sector = "city", 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29070, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29073, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29073] = 
      {
         Tunnel = 0, 
         Vnum = 29073, 
         Sector = "city", 
         Description = "This is the main intersection for Baituh City.  There are city\
blocks in all directions from here.  Each direction leads to\
something completely different than the other three.  Feel free to\
look around.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29072, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29086, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29098, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29074, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29074] = 
      {
         Tunnel = 0, 
         Vnum = 29074, 
         Sector = "city", 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29073, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29075, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29075] = 
      {
         Tunnel = 0, 
         Vnum = 29075, 
         Sector = "city", 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29076, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29074, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29082, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29076] = 
      {
         Tunnel = 0, 
         Vnum = 29076, 
         Sector = "city", 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29075, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29077, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29077] = 
      {
         Tunnel = 0, 
         Vnum = 29077, 
         Sector = "city", 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29083, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29076, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29078, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29078] = 
      {
         Tunnel = 0, 
         Vnum = 29078, 
         Sector = "city", 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29077, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29079, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29079] = 
      {
         Tunnel = 0, 
         Vnum = 29079, 
         Sector = "city", 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29078, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29080, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29084, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29080] = 
      {
         Tunnel = 0, 
         Vnum = 29080, 
         Sector = "city", 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29079, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29081, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29081] = 
      {
         Tunnel = 0, 
         Vnum = 29081, 
         Sector = "city", 
         Description = "Baituh City is known all over Adari for its city design.  Baituh City\
is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here. To the south is a 'bar'.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29082, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29085, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29080, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29082] = 
      {
         Tunnel = 0, 
         Vnum = 29082, 
         Sector = "city", 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29075, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29081, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29083] = 
      {
         Tunnel = 0, 
         Vnum = 29083, 
         Sector = "city", 
         Description = "At one time Baituh City produced the best and brightest Adarians in\
their state of the art academy.  Since the planet and town have hit\
hard times, things have changed.  Now students must travel to Alfuh\
to work on their fighting skills. Most of the faculty from the old\
school have also left.  This lone room now acts as a tutoring\
facility for the one remaining faculty member.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29077, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Academia", 
      }, 
      [29084] = 
      {
         Tunnel = 0, 
         Vnum = 29084, 
         Sector = "city", 
         Description = "Welcome to the Baituh City Inn.  Those who need to rest and such\
can do so here.  But, you have to purchase a room of course.  This is\
not the largest hotel on the planet by any means.  But if you need to\
rest, this place is as good as any other.  You can exit to the east.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29079, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29110, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [10] = "Safe", 
            [7] = "NoMagic", 
         }, 
         Name = "Baituh City Inn", 
      }, 
      [29085] = 
      {
         Tunnel = 0, 
         Vnum = 29085, 
         Sector = "city", 
         Description = "This dank fouls smelling hole in the ground is one of the few\
businesses able to survive these times of hardship.  It is a bar. \
Beings come here to forget about how miserable their lives are.  Feel\
free to join them.  But watch your step.  You can exit to the north.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29081, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Bar", 
      }, 
      [29086] = 
      {
         Tunnel = 0, 
         Vnum = 29086, 
         Sector = "city", 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29087, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29073, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29087] = 
      {
         Tunnel = 0, 
         Vnum = 29087, 
         Sector = "city", 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29088, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29094, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29086, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29088] = 
      {
         Tunnel = 0, 
         Vnum = 29088, 
         Sector = "city", 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29089, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29087, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29089] = 
      {
         Tunnel = 0, 
         Vnum = 29089, 
         Sector = "city", 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29095, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29090, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29088, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29090] = 
      {
         Tunnel = 0, 
         Vnum = 29090, 
         Sector = "city", 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29091, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29089, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29091] = 
      {
         Tunnel = 0, 
         Vnum = 29091, 
         Sector = "city", 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29090, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29096, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29092, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29092] = 
      {
         Tunnel = 0, 
         Vnum = 29092, 
         Sector = "city", 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29091, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29093, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29093] = 
      {
         Tunnel = 0, 
         Vnum = 29093, 
         Sector = "city", 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29092, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29097, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29094, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29094] = 
      {
         Tunnel = 0, 
         Vnum = 29094, 
         Sector = "city", 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29087, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29093, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29095] = 
      {
         Tunnel = 0, 
         Vnum = 29095, 
         Sector = "city", 
         Description = "This is not quite as elegant as one would expect of a government.\
 It would seem the government has been struggling a lot too during\
this time of hardship for the planet.  The room is well lit.  The\
walls are covered in dirt and filth, the floor is even worse.  You\
can escape to the south.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29089, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Governmental Offices", 
      }, 
      [29096] = 
      {
         Tunnel = 0, 
         Vnum = 29096, 
         Sector = "city", 
         Description = "Baituh City is still capable of communicating with other cities and\
planets. This was once a thriving postal service serving Baituh City\
and its the suburbs. Today, no one oversees the post office.  It is\
all done electronically.  You can exit to the west.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29091, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Post Office", 
      }, 
      [29097] = 
      {
         Tunnel = 0, 
         Vnum = 29097, 
         Sector = "city", 
         Description = "It is extremely warm here.  There is a large pool of lava\
directly south of here.  To continue south would almost certainly be\
instant death.  It would be best to get as far away from here as\
possible.  This is not a safe area.  Go north if you cherish life.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29093, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29111, 
               Description = "If you go south, you will surely die!\
", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
         }, 
         Name = "Lava Resevoir", 
      }, 
      [29098] = 
      {
         Tunnel = 0, 
         Vnum = 29098, 
         Sector = "city", 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29073, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29099, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29099] = 
      {
         Tunnel = 0, 
         Vnum = 29099, 
         Sector = "city", 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29098, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29101, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29100, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29100] = 
      {
         Tunnel = 0, 
         Vnum = 29100, 
         Sector = "city", 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29099, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29102, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29101] = 
      {
         Tunnel = 0, 
         Vnum = 29101, 
         Sector = "city", 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29103, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29099, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29102] = 
      {
         Tunnel = 0, 
         Vnum = 29102, 
         Sector = "city", 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29100, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29104, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29107, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29103] = 
      {
         Tunnel = 0, 
         Vnum = 29103, 
         Sector = "city", 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29101, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29108, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29106, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29104] = 
      {
         Tunnel = 0, 
         Vnum = 29104, 
         Sector = "city", 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29102, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29105, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29105] = 
      {
         Tunnel = 0, 
         Vnum = 29105, 
         Sector = "city", 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29106, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29109, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29104, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29106] = 
      {
         Tunnel = 0, 
         Vnum = 29106, 
         Sector = "city", 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29103, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29105, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29107] = 
      {
         Tunnel = 0, 
         Vnum = 29107, 
         Name = "Baituh City Police Station", 
         Description = "This is the Baituh City Police Station.  A large marble desk sits in\
the corner of the room.  The floor is covered in dirt and volcanic\
ash. Several communication terminals have been built into the walls\
around you.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29102, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
      }, 
      [29108] = 
      {
         Tunnel = 0, 
         Vnum = 29108, 
         Sector = "city", 
         Description = "This is a dank foul smelling armpit of a cell.  To be locked in this\
room means you must have broken the law.  Thick rocks make up the\
walls and ceiling. \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bail box", 
               Description = "This is a bail box.  To bereleased from jail, you must give 30 credits\
\13worth of bail to the box.  You will promptly be freed if you pay the\
\01330credit fine. \
\13", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29103, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Jail", 
      }, 
      [29109] = 
      {
         Tunnel = 0, 
         Vnum = 29109, 
         Sector = "city", 
         Description = "This road is very wide and seems to be in fairly decent condition. \
However, a large rock-like boulder blocks you from continuing any\
further south. \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29105, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29110] = 
      {
         Tunnel = 0, 
         Vnum = 29110, 
         Sector = "city", 
         Description = "This is where you can safely sleep and exit the game.  When you\
reenter the game, this is the room you will start in.  Be sure to\
thank the hotel staff for putting up with you.  Enjoy your stay.  You\
can exit to the east. \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29084, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [13] = "Arena", 
         }, 
         Name = "Baituh City Hotel", 
      }, 
      [29111] = 
      {
         Tunnel = 0, 
         Vnum = 29111, 
         Sector = "city", 
         Description = "It is unbelievably hot here.  You are in a lake of lava.  To be\
here is  almost certainly suicide.  If you can still escape to the\
north, do so! \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29097, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
            [16] = "Silence", 
            [13] = "Arena", 
         }, 
         Name = "Lava Lake", 
      }, 
      [29112] = 
      {
         Tunnel = 0, 
         Vnum = 29112, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.  To the south is Baituh\
City.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29158, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29061, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29113, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29113] = 
      {
         Tunnel = 0, 
         Vnum = 29113, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29112, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29114, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29114] = 
      {
         Tunnel = 0, 
         Vnum = 29114, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29115, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29113, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29115] = 
      {
         Tunnel = 0, 
         Vnum = 29115, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29116, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29114, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29116] = 
      {
         Tunnel = 0, 
         Vnum = 29116, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29117, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29115, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29117] = 
      {
         Tunnel = 0, 
         Vnum = 29117, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29118, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29116, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29118] = 
      {
         Tunnel = 0, 
         Vnum = 29118, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29119, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29117, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29119] = 
      {
         Tunnel = 0, 
         Vnum = 29119, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29120, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29118, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29120] = 
      {
         Tunnel = 0, 
         Vnum = 29120, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29121, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29119, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29121] = 
      {
         Tunnel = 0, 
         Vnum = 29121, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29122, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29120, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29122] = 
      {
         Tunnel = 0, 
         Vnum = 29122, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29123, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29121, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29123] = 
      {
         Tunnel = 0, 
         Vnum = 29123, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29124, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29125, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29122, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29124] = 
      {
         Tunnel = 0, 
         Vnum = 29124, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29049, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29123, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Name = "Outskirts of Alfuh City", 
      }, 
      [29125] = 
      {
         Tunnel = 0, 
         Vnum = 29125, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here. \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29126, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29123, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29126] = 
      {
         Tunnel = 0, 
         Vnum = 29126, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29127, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29125, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29127] = 
      {
         Tunnel = 0, 
         Vnum = 29127, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29130, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29128, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29126, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29128] = 
      {
         Tunnel = 0, 
         Vnum = 29128, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29127, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29129, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29129] = 
      {
         Tunnel = 0, 
         Vnum = 29129, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29128, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29130, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29130] = 
      {
         Tunnel = 0, 
         Vnum = 29130, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29129, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29131, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29131] = 
      {
         Tunnel = 0, 
         Vnum = 29131, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29130, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29132, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29138, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29132] = 
      {
         Tunnel = 0, 
         Vnum = 29132, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29131, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29133, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29128, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29133] = 
      {
         Tunnel = 0, 
         Vnum = 29133, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29134, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29132, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29134] = 
      {
         Tunnel = 0, 
         Vnum = 29134, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29140, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29135, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29128, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29133, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29135] = 
      {
         Tunnel = 0, 
         Vnum = 29135, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29136, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29134, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29136] = 
      {
         Tunnel = 0, 
         Vnum = 29136, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29143, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29131, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29137, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29135, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29137] = 
      {
         Tunnel = 0, 
         Vnum = 29137, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29136, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29132, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29138, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29138] = 
      {
         Tunnel = 0, 
         Vnum = 29138, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29137, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29139, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29139] = 
      {
         Tunnel = 0, 
         Vnum = 29139, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29138, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29140, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29140] = 
      {
         Tunnel = 0, 
         Vnum = 29140, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29139, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29136, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29141, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29141] = 
      {
         Tunnel = 0, 
         Vnum = 29141, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29140, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29142, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29142] = 
      {
         Tunnel = 0, 
         Vnum = 29142, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29141, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29143, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29136, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29143] = 
      {
         Tunnel = 0, 
         Vnum = 29143, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29142, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29139, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29144, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29144] = 
      {
         Tunnel = 0, 
         Vnum = 29144, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29143, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29145, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29145] = 
      {
         Tunnel = 0, 
         Vnum = 29145, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29146, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29144, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29146] = 
      {
         Tunnel = 0, 
         Vnum = 29146, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29147, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29145, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29147] = 
      {
         Tunnel = 0, 
         Vnum = 29147, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29148, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29146, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29148] = 
      {
         Tunnel = 0, 
         Vnum = 29148, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29151, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29149, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29147, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29149] = 
      {
         Tunnel = 0, 
         Vnum = 29149, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29139, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29150, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29148, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29150] = 
      {
         Tunnel = 0, 
         Vnum = 29150, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29149, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29151, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29151] = 
      {
         Tunnel = 0, 
         Vnum = 29151, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29152, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29150, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29152] = 
      {
         Tunnel = 0, 
         Vnum = 29152, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29151, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29147, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29153, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29153] = 
      {
         Tunnel = 0, 
         Vnum = 29153, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29152, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29154, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29154] = 
      {
         Tunnel = 0, 
         Vnum = 29154, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29155, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29153, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29155] = 
      {
         Tunnel = 0, 
         Vnum = 29155, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29154, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29156, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29156] = 
      {
         Tunnel = 0, 
         Vnum = 29156, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29155, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29157, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29157] = 
      {
         Tunnel = 0, 
         Vnum = 29157, 
         Sector = "city", 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29156, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29147, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29158, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29158] = 
      {
         Tunnel = 0, 
         Vnum = 29158, 
         Sector = "city", 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29157, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29112, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
   }, 
   LowEconomy = 4999576, 
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
   Filename = "adari01.lua", 
   HighEconomy = 0, 
   ResetFrequency = 0, 
   Author = "Merth", 
   ResetMessage = "", 
   FileFormatVersion = 1, 
}
