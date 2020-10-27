-- Adari - Alfuh City
-- Last saved Tuesday 27-Oct-2020 11:58:45

AreaEntry
{
   ResetMessage = "", 
   Author = "Merth", 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   Mobiles = 
   {
      [29008] = 
      {
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 15, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "LaNa", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DamRoll = 3, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Damage = 
         {
            DamSizeDice = 7, 
            DamPlus = 0, 
            DamNoDice = 2, 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho LaNa leaves in a rush.\
mpgoto 29030\
drop all\
mpgoto 29005\
mpecho LaNa has returned to his post.\
", 
               MudProgType = "time_prog", 
               Arguments = "16", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "feel heal me\
 \
", 
               MudProgType = "hitprcnt_prog", 
               Arguments = "20", 
            }, 
         }, 
         Description = "He is a fairly young Adarian.  It is his job to make sure weapons,\
drugs and other items of contreband don't come into or leave Alfuh\
City. \
", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_customs_smut", 
         }, 
         HitRoll = 3, 
         Race = "Adarian", 
         Vnum = 29008, 
         Name = "officer customs lana", 
         NumberOfAttacks = 1, 
         Height = 0, 
         Position = "standing", 
         Level = 15, 
         Sex = "male", 
         LongDescr = "LaNa, the customs officer inspects goods here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
         }, 
         ArmorClass = 0, 
      }, 
      [29059] = 
      {
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
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a newly created lasmob", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Race = "Human", 
         Vnum = 29059, 
         Name = "lasmob", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Position = "standing", 
         Level = 1, 
         Sex = "undistinguished", 
         LongDescr = "Some god abandoned a newly created lasmob here.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ArmorClass = 0, 
      }, 
      [29000] = 
      {
         DefaultPosition = "standing", 
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
               [19] = "adarese", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 10, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "Feiht Krooc", 
         Alignment = 400, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Feiht Krooc", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 0, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "emote greets you with a slight nod and weak smile.\
say Welcome to Alfuh...\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "80", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "say TYPE list to see what I sell...\
emote shakes his head and mumbles something to himself.\
", 
               MudProgType = "act_prog", 
               Arguments = "p looks at you.", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "mpgoto 29015\
mptransfer $n\
mpechoat $n Feiht grabs hold of you, and tosses you into the street\
tell $n Dont came back unless you can act civilized...\
mpecho Feiht angrily turns around and storms back into his shop.\
mpgoto 29017\
", 
               MudProgType = "act_prog", 
               Arguments = "p rears back and slaps you cruelly for your stupidity.  OUCH!", 
            }, 
         }, 
         Description = "A young, but aged Adarian merchant.  He is short for an Adarian.  He\
is barely one meter tall.  His face is rough and scarred.  He is pathetic\
looking in and loathesome in every way.  Perhaps his value lies deeper\
within.  Or maybe he is just ugly.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         DamRoll = 2, 
         HitRoll = 2, 
         Race = "Adarian", 
         Vnum = 29000, 
         Name = "shopkeeper feiht krooc", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Position = "standing", 
         Level = 10, 
         Sex = "male", 
         LongDescr = "A shopkeeper, Feiht Krooc is here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
      }, 
      [29001] = 
      {
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 20, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "a religous Adarian", 
         Alignment = 450, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 2, 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho An Adarian worshipper begins to meditate.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "40", 
            }, 
         }, 
         Description = "", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         DamRoll = 4, 
         HitRoll = 4, 
         Race = "Adarian", 
         Vnum = 29001, 
         Name = "worshipper citizen adarian", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Position = "standing", 
         Level = 20, 
         Sex = "male", 
         LongDescr = "An Adarian worshipper meditates here.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
      }, 
      [29002] = 
      {
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 75, 
            HitNoDice = 7, 
         }, 
         ShortDescr = "Yllib Apa", 
         Alignment = 500, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         DamRoll = 15, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Damage = 
         {
            DamSizeDice = 37, 
            DamPlus = 0, 
            DamNoDice = 7, 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoat $n Yllib Apa carefully looks you over.\
mpechoaround Yllib Apa looks at $n.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "40", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "glare $n\
", 
               MudProgType = "act_prog", 
               Arguments = "p pokes you in the ribs.", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoaround Yllib Apa intensely studies the surroundings.\
", 
               MudProgType = "rand_prog", 
               Arguments = "1", 
            }, 
            [4] = 
            {
               ScriptType = "MProg", 
               Code = "emote gives $n a stern, harsh look.\
", 
               MudProgType = "act_prog", 
               Arguments = "p looks at you.", 
            }, 
            [5] = 
            {
               ScriptType = "MProg", 
               Code = "glare $n\
say A trouble-maker huh? fine...\
say we got a place for trouble-makers...\
mpechoaround Apa grabs $n and hauls him away.\
mpgoto 29029\
mptransfer $n\
mpechoat $n Yllib Apa takes you to jail.\
mpgoto 29028\
mpechoaround Yllib Apa has arrives from the Jail.\
", 
               MudProgType = "act_prog", 
               Arguments = "p rears back and slaps you cruelly for your stupidity.  OUCH!", 
            }, 
            [6] = 
            {
               ScriptType = "MProg", 
               Code = "mpechoaround $n is taken to jail on the charge of stupidity.\
mpgoto 29029\
mptransfer $n\
mpechoat $n Apa delivers you to the jail cell.\
mpgoto 29028\
mpechoaround Yllib Apa exits the Jail Cell.\
north\
east\
", 
               MudProgType = "hitprcnt_prog", 
               Arguments = "90", 
            }, 
         }, 
         Description = "He is a large well built Adarian.  He does not look like a very\
tolerant nor forgiving individual.  It is best to stay on his good\
side.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_customs_weapons", 
         }, 
         HitRoll = 15, 
         Race = "Adarian", 
         Vnum = 29002, 
         Name = "yllib apa local law enforcement", 
         NumberOfAttacks = 4, 
         Height = 0, 
         Position = "standing", 
         Level = 75, 
         Sex = "male", 
         LongDescr = "The local law, Yllib Apa is on patrol here.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ArmorClass = -40, 
      }, 
      [29003] = 
      {
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 10, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "tUmOch", 
         Alignment = 50, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho tUmOch looks up from his desk.\
say Hello, can I help you with something?\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "50", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "mpecho tUmOch begins to grow groggy.\
sit\
sleep\
", 
               MudProgType = "time_prog", 
               Arguments = "20", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "wake\
mpecho tUmOch awakens from a nap.\
stand\
say ok, back to work now...\
", 
               MudProgType = "time_prog", 
               Arguments = "4", 
            }, 
         }, 
         Description = "An older looking Adarian who goes by the name tUmOch.  He is the city\
auditor.  tUmOch is responsible for Alfuh City finances. \
", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         DamRoll = 2, 
         HitRoll = 2, 
         Race = "Adarian", 
         Vnum = 29003, 
         Name = "auditor aged adarian tUmOch", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Position = "standing", 
         Level = 15, 
         Sex = "male", 
         LongDescr = "An aged Adarian auditor studies some documents.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [7] = "Wimpy", 
         }, 
         ArmorClass = 0, 
      }, 
      [29004] = 
      {
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "a helpless droid", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Credits = 1, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpmload 29004 1\
mpecho A fresh droid is lowered in from above.\
", 
               MudProgType = "death_prog", 
               Arguments = "100", 
            }, 
         }, 
         Description = "", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Race = "Human", 
         Vnum = 29004, 
         Name = "droid helpless defenseless", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Position = "standing", 
         Level = 1, 
         Sex = "undistinguished", 
         LongDescr = "A helpless, defenseless droid is here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         ArmorClass = 80, 
      }, 
      [29005] = 
      {
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 5, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "a war droid", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "mpmload 29005 1\
mpecho A fresh War Droid is lowered in from above.\
", 
               MudProgType = "death_prog", 
               Arguments = "100", 
            }, 
         }, 
         Description = "", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         DamRoll = 2, 
         HitRoll = 1, 
         Race = "Adarian", 
         Vnum = 29005, 
         Name = "droid war", 
         NumberOfAttacks = 0, 
         Height = 0, 
         Position = "standing", 
         Level = 5, 
         Sex = "undistinguished", 
         LongDescr = "A War Droid pulsates in a corner here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [26] = "Droid", 
         }, 
         ArmorClass = 0, 
      }, 
      [29006] = 
      {
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 50, 
            HitNoDice = 5, 
         }, 
         ShortDescr = "Eral Tmat", 
         Alignment = 800, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Damage = 
         {
            DamSizeDice = 30, 
            DamPlus = 0, 
            DamNoDice = 5, 
         }, 
         Credits = 10, 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Code = "feel heal $n\
mpgoto 29030\
drop all\
mpgoto 29023\
", 
               MudProgType = "bribe_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Code = "feel lightning $n\
", 
               MudProgType = "fight_prog", 
               Arguments = "10", 
            }, 
            [3] = 
            {
               ScriptType = "MProg", 
               Code = "feel 'earthquake' $n\
", 
               MudProgType = "fight_prog", 
               Arguments = "5", 
            }, 
         }, 
         Description = "A very old looking fellow.  Things are not always what they seem. \
Watch your step around this one.  He was once a great Jedi.  His\
powers have\
weakened, but are still strong.  He can heal you for 100\
credits.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         DamRoll = 10, 
         HitRoll = 10, 
         Race = "Adarian", 
         Vnum = 29006, 
         Name = "Eral Tmat healer", 
         NumberOfAttacks = 5, 
         Height = 0, 
         Position = "standing", 
         Level = 50, 
         Sex = "male", 
         LongDescr = "An old and religous Adarian is here.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         ArmorClass = 0, 
      }, 
      [29007] = 
      {
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a borcatu", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Credits = 0, 
         Description = "A small but fierce looking little beast.  It has a hard shell and\
sharp teeth.\
", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Intelligence = 10, 
            Luck = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Race = "Human", 
         Vnum = 29007, 
         Name = "borcatu small scavenger", 
         NumberOfAttacks = 1, 
         Height = 0, 
         Position = "standing", 
         Level = 1, 
         Sex = "undistinguished", 
         LongDescr = "A scavenger rumages about here.\
", 
         Flags = 
         {
            [24] = "NoAssist", 
            [2] = "Scavenger", 
            [27] = "NoCorpse", 
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         ArmorClass = 75, 
      }, 
   }, 
   Name = "Adari - Alfuh City", 
   ResetFrequency = 0, 
   Rooms = 
   {
      [29056] = 
      {
         Description = "You are in a beautifully decorated hallway.  Many of the images\
displayed on the wall appear to have been made by children who attend\
this facility. Tacky may be a more appropriate word than beautiful. \
You can continue north or south from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29057, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29053, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29056, 
         Name = "Alfuh Elementary Academy", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29057] = 
      {
         Description = "This training room is the most difficult one available in this\
facility. Be careful!  The walls are stained with oil and various\
droid parts. You are not sure, but there seem to be some pools of\
blood in here too. This is a dangerous room, watch yourself. You can\
exit to the south.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29056, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29057, 
         Name = "Alfuh Elementary Academy", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29000] = 
      {
         Description = "The dark cavernous walls gleam lightly as drops of moisture\
glides down softly into the dirt.  A small multi-colored\
carpet lies in the center of this small yet dull room.\
This apparently the dwelling of a dark, sullen, and religious\
jawa.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29001, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29000, 
         Name = "Small Dark Cave", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29001] = 
      {
         Description = "You are on a barren landing pad of some sort.  The ground\
is largely made up of thick, coarse, black sand.  The area\
is virtually devoid of any vegetation or undergrowth.  To the\
west is a large rock.  Upon closer observation you notice\
a small opening.  It appears to be a small cave.  To the north\
and south there isn't really anything special.  Just vast desert\
plains.  To the east is a thin and winding road.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29002, 
               Key = -1, 
               Keyword = "desert sands", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29004, 
               Key = -1, 
               Keyword = "path", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29003, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29000, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29001, 
         Name = "Barren Landing Facility", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [4] = "CanLand", 
            [18] = "NoDrop", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29002] = 
      {
         Description = "Surrounded by a pale darkness.  The sky is a deep blue.\
It is also heavily overcast by the vastness of space.\
Virtually no clouds line the sky.  It is pale and clear.\
The air is cool and light.  Whisps of sand pick up from\
time to time.  The sand is unstable here.  With each\
step the ground beneath you shifts a great deal.  To\
continue on this path would be unwise.  It is impossible\
to know what lies to the north, east, and west.  It is too\
dark in those directions.  To the south you can see a barren\
plain.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29001, 
               Key = -1, 
               Keyword = "Plains landing zone", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29002, 
         Name = "Desolate Desert Plains", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [8] = "Bank", 
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29003] = 
      {
         Description = "The darkness had shrouded the mountainously jagged rocks\
that have virtually surrounded.  The dark sky makes it\
impossible for you to determine how high the rocks go.\
Your field of vision has been significantly lessened by\
your current surroundings.  In any case it would seem that\
continuing in any direction other than north is unrealistic.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29001, 
               Key = -1, 
               Keyword = "plains", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29003, 
         Name = "Surrounded by Rock", 
         TeleVnum = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29004] = 
      {
         Description = "Beset on all sides by unknown peril, you push on.  Knowing\
not what the future holds for you here.  Jagged rocks bar\
your passage either north or south.  The pale gray-blue\
sky masks the height of the surrounding mountains.  At\
this time it appears your only options are to continue \
east or west.  To the west you can see a broader space\
an opening of the path.  To the east, the path continues\
and does not look inviting.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29005, 
               Key = -1, 
               Keyword = "private dark", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29001, 
               Key = -1, 
               Keyword = "landing zone", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29004, 
         Name = "Narrow Roadway", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29005] = 
      {
         Description = "You are enclosed in darkness.  It is impossible to see\
your hand in front of your face.  As you move along you\
realize that your pathway to the north is blocked by\
mountainous rock.  There seems to be a small opening\
to the south.  I wouldn't try fitting landspeeder through\
these pathways.  Off to the east is a shallow light.\
It illuminates a sandy and barren plain.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29006, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29007, 
               Key = -1, 
               Keyword = "tunnel private", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29004, 
               Key = -1, 
               Keyword = "dark tunnel", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29005, 
         Name = "Narrow Pathway", 
         TeleVnum = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29006] = 
      {
         Description = "A few ground bound lighting fixtures softly illuminate\
your surroundings.  Judging by the available evidence, this\
is a landing zone for small vessels.  It would take a skilled\
pilot in a ship he was well-acustomed to, to even attempt\
landing in this narrow and dangerous area.  Anything larger than\
a Z-95 HEADHUNTER or Tie Fighter would find it nearly\
impossible to navigate into this region.  The point being made\
here is this, it wouldn't appear that Imperials or Rebels have\
seriously developed the landscape.  That means one of two things.\
Either they have and their base is hidden or you are someplace\
really frickin remote and desolate.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29005, 
               Key = -1, 
               Keyword = "tunnel private solitary", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29006, 
         Name = "Lighted Landing Zone", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [18] = "NoDrop", 
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29007] = 
      {
         Description = "This planet leaves alot to be desired.  Whoever put this path\
here hardly made it wide enough for you to walk on.  It would\
be nearly impossible for other traffic to get through.  You are\
begining to make out a faint odor in the air about you.  It is\
tough to recognize initially, but you are almost sure that the\
smell is volcanic ash.  That figures.  The rock around you is\
actually old volcanic lava that has cooled and hardened.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29005, 
               Key = -1, 
               Keyword = "tunnel private", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29008, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29007, 
         Name = "Narrow Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [8] = "Bank", 
            [9] = "Private", 
            [0] = "Dark", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29008] = 
      {
         Description = "The path is narrow and dirty.  Sand and dirt mingle in a unsettling\
fashion.  The air is thin and difficult to breath.  The east and west\
are both blocked from further passage.  Large mountainous rock stands as\
a forbidding factor before you.  You can more easily continue to the \
north or south.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29007, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29009, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29008, 
         Name = "Path O Sand", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [8] = "Bank", 
            [16] = "Silence", 
            [0] = "Dark", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29009] = 
      {
         Description = "Large pieces of jagged rock portrude from the mountains beside you.\
The ground is slightly elevated here due to the amounts of rock\
beneath your feet.  The rocky ground is covered by a thin layer of\
volcanic ash and residue.  Particles of ash lay heavy in the air.\
Breathing is a chore at this altitude.  You can continue north\
or south.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29008, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29010, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29009, 
         Name = "Rocky Pathway", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [8] = "Bank", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29010] = 
      {
         Description = "Enormous mountains block your path to the east and west.  The\
mountians nearly block out all forms of natural light.  The ground\
beneath your feet is comprised of dirt, sand, and rock.  A thin\
air of volcanic ash floats about making breathing somewhat difficult.\
You can conitinue north or south from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29009, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29011, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29010, 
         Name = "Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [8] = "Bank", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29011] = 
      {
         Description = "The path leads in several directions from here.  It would seem that\
the mountianous rock has been chisled away from these parts.  The\
rock is still quite jagged and sharp in some places.  The ground\
beneath your feet is soft and dulled.  This area has been used to alot of\
traffic apprently.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29010, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29012, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29044, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29045, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29011, 
         Name = "Rocky intersection", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29012] = 
      {
         Description = "Mountians, mountians everywhere.  The mountian you are on/in seriously\
limits your possible paths to travel.  You are just outside the a small\
town.  There is a sign nearby that can shed light on your location.  To\
the east is town.  To the west is an intersection.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29013, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29011, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29012, 
         Name = "Edge of Alfuh", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [8] = "Bank", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29013] = 
      {
         Description = "This is the outskirts of Alfuh.  To the east is more of town.  Alfuh\
is a religous city for the Adarian race.  From here, you can't really\
see that much of the city.  The road beneath your feet is made up of rock\
and is covered with volcanic ash.  You can continue in just about any\
direction.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29014, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29020, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29026, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29012, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29013, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29014] = 
      {
         Description = "The road beneath your feet is composed of rock dirt and volcanic\
ash.  To the east and west, your path is blocked by mountians.  To\
the north you can see some shops.  Well, buildings anyway.  To the\
south is an intersection.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29015, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29013, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29014, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29015] = 
      {
         Description = "The cool air and soft climate can calm the nerves of even the most\
frazzled travellers.  You are near a sacred shrine of the Adarian\
population.  You can vaguely make it out to the north.  To the east is\
a small cave.  Someone took the time to carve out the rock - mountian.\
To the west is another of these cave cut outs.  The road continues\
to the north and south.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29016, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29018, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29014, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29017, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29015, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29016] = 
      {
         Description = "You are immediately south of an Adarian Shrine.  Each year Adarians\
from every part of the galaxy return to this.  Their homeworld.  They\
do so at least twice each year.  It is considered a religous pilgrimage.\
To the north is an old shrine that has been heavily visited through out the\
years.  Please be respectful of others.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29019, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29015, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29016, 
         Name = "Shrine Entrance", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29017] = 
      {
         Description = "This place was cut out of the side of a mountian.  The floor is made\
of rock and is covered in dirt.  This appears to be a restraunt.  Adarians\
who have travelled from far away galaxies can replinish themselves here.\
To the east is the store exit.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29015, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29017, 
         Name = "Alfuh R & R", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [7] = "NoMagic", 
            [13] = "Arena", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29018] = 
      {
         Description = "This is a donation room.  Adarians make several pilgrimages to their \
homeworld every year.  When they do, it is customary for them to leave\
one or two material items as a sign of thanks for their prosperty \
and health.  They drop items here and then continue on to the shrine\
to meditate.  The items left in this room are free to the needy.  If\
you need something here, take it.  If you have something you don't plan\
to keep, leave it here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29015, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29018, 
         Name = "Alfuh Donation Grounds", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [7] = "NoMagic", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29019] = 
      {
         Description = "There is a strong sense of peace in the air about you.  This is a safe\
place where Adarians worship.  This is a place great knowledge and\
wisdom.  It is forbidden to speak in here.  The tranquility and silence\
has not been broken in centuries.  Clarity is achieved through total and\
complete silence.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29016, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29019, 
         Name = "Religous Shrine", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29020] = 
      {
         Description = "Volcanic ash steadily descends from above.  This is the planet               \
Adari.  The Adarian race is built on technology and mining.  Sadly,\
they have mined their own planet and all asteroids in their galaxy.\
You can continue east or west from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29021, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29013, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 3, 
         Vnum = 29020, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29021] = 
      {
         Description = "Alfuh City, on the wonderful planet of Adari.  Adarians are\
very religous by nature.  It is very important that they visit their\
homeworld at least once every year.  This city is a tourist trap\
though.  Watch yourself.  You can continue East or West from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29022, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29020, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 4, 
         Vnum = 29021, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29022] = 
      {
         Description = "This place is in shambles.  This city was apparenlty cut out of a\
mountian.  Not just any mountian either.  It was cut out of a volcano.\
Volcanic ash steadily drops from the sky and lines the road.  You can\
continue east or west from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29023, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29021, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 2, 
         Vnum = 29022, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29023] = 
      {
         Description = "You are at an intersection.  There are paths chisled out of the \
rock to the north, east, south, and west.  The road seems to\
continue for quite a while in each direction.  If you can avoid\
all the active lava, you should be fine.  This planet is very\
volcanic in nature.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29032, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29024, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29038, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29022, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 5, 
         Vnum = 29023, 
         Name = "Alfuh City Intersection", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29024] = 
      {
         Description = "Alfuh City, was meant to be among the grand cities of the galaxy.\
Unfortunately, living on a planet that is an active vocano has its\
draw backs.  Worse than that, Adarians are deeply involved in the\
mining industry.  So they have raped Adari of all its natural resources.\
This could be a civilization on the downward spiral.  You can continue\
east or west from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29025, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29023, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 3, 
         Vnum = 29024, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29025] = 
      {
         Description = "The road abrubtly ends to here.  It is impossible to continue to\
the east.  The only possible direction to go is west.  It appears\
that the path continued on in this direction at some point.  But,\
the road just disappeared.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29024, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 3, 
         Vnum = 29025, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29026] = 
      {
         Description = "Volcanic ash continues to drop in steady increments.  The ground\
is heavily laden in ash.  The mountian becomes particularly narrow\
here.  It would be difficult for more than two persons to attempt to\
fit through here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29013, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29027, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 2, 
         Vnum = 29026, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29027] = 
      {
         Description = "The ground is covered by a thin layer of ash.  A steady stream of ash\
continues to drop to the ground.  There are openings in the rock to the\
east and west.  You can continue in either direction.  This path also\
continues to the north and south.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29026, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29031, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29028, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               DestinationVnum = 29030, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 4, 
         Vnum = 29027, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29028] = 
      {
         Description = "The road is wrought with peril and hardship.  The reason is a simple\
one.  Directly south of here is the town jail.  Anyone has broken the law\
faces jail time in -thee olde cell-.  It isn't a pretty site.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29027, 
               Key = -1, 
               Keyword = "celldoor door", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               DestinationVnum = 29029, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 4, 
         Vnum = 29028, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29029] = 
      {
         Description = "A spacious cell large enough to accomodate several criminals at once.\
Seeing the inside of this cell is not good thing.  Tourists don't get this\
as a part of the tour.  But, you are probably here for a reason.  You will \
be given a chance to think about your wrong doings.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               DestinationVnum = 29028, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Keyword = "celldoor door", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29029, 
         Name = "Alfuh City Jail", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29030] = 
      {
         Description = "This is the Alfuh City Customs Office.  Not much to it really.  There\
is a desk against the wall.  Some papers have been placed on the\
desk.  This is kind of the impound area.  Items confiscated from tourists,\
smugglers, or whoever end up here before being destroyed.  This area is\
often full of contraband articles such as dirty magazines, alcohol, and\
spices.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               DestinationVnum = 29027, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29030, 
         Name = "Alfuh City Customs Office", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29031] = 
      {
         Description = "This is the office of the local law enforcement.  In the corner is a\
desk with some papers scattered about on it.  If you want to bail out a\
friend, this is the place to visit.  The ultra conservative city and well\
for that matter planet, have a low tolerance for what they percieve as\
crime.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29027, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29031, 
         Name = "Alfuh City Law Enforcement", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29032] = 
      {
         Description = "The road is filthy.  The air is heavy with ash.  All around you is\
jagged rock.  This portion of the path is wide.  Much wider than some\
parts of town.  This seems like a more regal part of town than some\
of the other parts of Alfuh City.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29033, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29023, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29032, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [8] = "Bank", 
            [13] = "Arena", 
            [15] = "NoDropAll", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29033] = 
      {
         Description = "This is an intersection of sorts.  There are small offices to the\
East and West.  It is unclear from here what are in those offices.\
They appear to be government offices of some kind.  You can  continue\
North, East, South, or West from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29036, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29035, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29032, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29034, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29033, 
         Name = "Alfuh City Intersection", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [8] = "Bank", 
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29034] = 
      {
         Description = "The walls of this room are comprised of smoothed rock.  It would be\
remiss not to mention the genuinely unique decore off you\
surroundings. The floor is comprised of rock, bevelled, sanded, and\
glossified. The walls bear photo images of historic sites around\
town.  Many of the images make town appear more beautiful and serene\
that is now the case\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29033, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29034, 
         Name = "Alfuh Auditors Office", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [7] = "NoMagic", 
            [13] = "Arena", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29035] = 
      {
         Description = "A dank and stuffy office with little to appeal to the eye or nose.\
The walls are covered in dirt and filth.  Small pieces of ash\
continually drift in through cracks in the ceiling.  You can continue\
to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29033, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29035, 
         Name = "Alfuh City Office", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [0] = "Dark", 
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29036] = 
      {
         Description = "The road is extremely wide and well taken care of.  Only thin layers\
of ash cover the road here.  This would seem to be the upper class\
part of town. To the north is an official looking meeting facility. \
To the south the road continues.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29037, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29033, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29036, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29037] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29036, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29037, 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29038] = 
      {
         Description = "The sulfur covered ground makes breathing challenging from time to\
time. To the north is an intersection that can lead back to the main\
part of Alfuh City.  To the south is a rather large looking cave\
where visitors and tourists can rest their weary bones free of\
charge.  This is a service provided by the city.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29023, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29039, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 3, 
         Vnum = 29038, 
         Name = "Outside the Alfuh City Homeless Shelter", 
         TeleVnum = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29039] = 
      {
         Description = "The walls are composed of jagged rock.  Thin cracks in the wall\
allow for moisture to intrude.  The moisture adds to the humidity of\
the room. It seems very warm in here.  There is a lot of volcanic\
activity nearby, so be careful.  To the north is fresh air.  To the\
south the cave continues.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29038, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29041, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29042, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29040, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 3, 
         Vnum = 29039, 
         Name = "Alfuh City Shelter", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29040] = 
      {
         Description = "This looks like a nice place to rest your weary bones.  You are out\
of the main hallway.  A vent above you brings in freshing cool air.\
The space here is somewhat small.  It would be impossible for more\
than a couple people to rest here at the same time.  Be curtious to\
others who need rest and sleep.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29039, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 2, 
         Vnum = 29040, 
         Name = "Alfuh City Shelter", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29041] = 
      {
         Description = "This looks like a nice place to rest your weary bones.  You are out\
of the main hallway.  A vent above you brings in freshing cool air.\
The space here is somewhat small.  It would be impossible for more\
than a couple people to rest here at the same time.  Be curtious to\
others who need rest and sleep.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29039, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 2, 
         Vnum = 29041, 
         Name = "Alfuh City Shelter", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29042] = 
      {
         Description = "It is incredibly warm here.  It is impossible not to have broken to\
a feverish sweat simply by walking through this section of the\
hallway.   The jagged rock walls contain the heat and turn this into\
a sauna.  You can continue north or south from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29039, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29043, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29042, 
         Name = "Alfuh City Shelter", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29043] = 
      {
         Description = "This looks like a nice place to rest your weary bones.  You are out\
of the main hallway.  A vent above you brings in freshing cool air.\
The space here is somewhat small.  It would be impossible for more\
than a couple people to rest here at the same time.  Be curtious to\
others who need rest and sleep.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29042, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 2, 
         Vnum = 29043, 
         Name = "Alfuh City Shelter", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29044] = 
      {
         Description = "This at one time was a path that led out of and into Alfuh City.\
Over the years, lava flooded the path and has turned to molten rock.\
Due to limited funds and lack of interest, city officials have never\
bothered to have the road cleared.  You can continue to the north.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29011, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 2, 
         Vnum = 29044, 
         Name = "Dead End", 
         TeleVnum = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29045] = 
      {
         Description = "This is one narrow path.  It would be impossible for more than one\
being to come through here at any given moment.  Molten lava walls\
completely block off the north and south.  If you are careful you can\
continue to either the east or west.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29011, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29046, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 1, 
         Vnum = 29045, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29046] = 
      {
         Description = "This is an extremely narrow and dangerous path.  Be careful or you\
could seriously injure yourself on the jagged rocks.  It would be\
impossible for anymore than one being to slink through this passage\
at any given time. You can continue east or west.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29045, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29047, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 1, 
         Vnum = 29046, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29047] = 
      {
         Description = "The pathway is difficult at best.  Jagged rock portrudes from all\
angles and all sides.  It would be very easy to injury yourself on\
some of these rocks.  You can continue north, east, west, or south. \
This is an intersection.  Proceed with caution.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29048, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29046, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29049, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29050, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29047, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29048] = 
      {
         Description = "A foul stench invades your nostrils.  Further to the north, east and\
west large heaping mounds of garbage block your path.  This is where\
garbage is stored prior to being sent off to the recycling plant. \
The aroma is horrid. Flee the area as quickly as you can!  Save your\
smelling glands!\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29047, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29048, 
         Name = "Alfuh City Dump", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [23] = "Hotel", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29049] = 
      {
         Description = "You are just outside Alfuh City limits.  If you continue north you\
will enter the city.  If you continue south, you will be on a\
desolate and narrow pathway.  The east and west is blocked by large\
volcanic rock.  Continuing in either of those directions would be\
impossible.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29047, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29124, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29049, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [8] = "Bank", 
            [13] = "Arena", 
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29050] = 
      {
         Description = "A ranks smell is coming from the north east.  Whatever it is died a\
long time ago.  As of if the smell of this planet wasn't enough to\
gag any non residents, this stench puts it over the top. The pathway\
continues to the east and west.  Your path to the north and south has\
been blocked by rock.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29047, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29051, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 3, 
         Vnum = 29050, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29051] = 
      {
         Description = "You are at a fork in the road, kind of.  The road turnsm it doesn't\
really fork.  At one time it may have forked, but it doesn't fork\
anymore. To the way, way far east is the heart of Alfuh City.  To the\
west is a big rock.  To the north is the Alfuh City Academy.  Young\
Adarians practice their fighting skills there.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29052, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29050, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29051, 
         Name = "Alfuh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29052] = 
      {
         Description = "Hand-made pictures hang on the walls.    The rock walls have been\
smoothed over so that the children will not poke an eye out or\
something.  This Academy was formed so that the children of the town\
could learn the basics to surviving. You can continue north or south\
from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29053, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29051, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29052, 
         Name = "Alfuh Elementary Academy", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [7] = "NoMagic", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29053] = 
      {
         Description = "The ceiling is pretty low in here.  Watch yourself.  To the west is\
one of the training rooms.  You can practice your skills against a\
droid.  To the east is a small donation/equipment room.  You can also\
continue north or south from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 29056, 
               Key = -1, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29055, 
               Key = -1, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 29052, 
               Key = -1, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29054, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29053, 
         Name = "Alfuh Elementary Academy", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29054] = 
      {
         Description = "Young and unexperienced members of Alfuh City come here to practice\
their skills of battle. The walls are stained from oil and droid\
parts line the walls of the room. There is a sign here too.  Look at\
the sign for more information. You can continue east from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 29053, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29054, 
         Name = "Alfuh Elementary Academy", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [29055] = 
      {
         Description = "Welcome to the Alfuh City Academy!  This is the room in which youth\
members can get some free armor and equipment.  Well it isn't\
completely free, the town pays for it.  Be warned, this equipment is\
NOT high quality, it is only intended to get young players started. \
To the west is more of the academy. If you have any equipment you\
would like to leave for others, you can do that too.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 29053, 
               Key = -1, 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Tunnel = 0, 
         Vnum = 29055, 
         Name = "Alfuh Elementary Academy", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [23] = "Hotel", 
            [7] = "NoMagic", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
   }, 
   Objects = 
   {
      [29059] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29059, 
         Name = "lasmob", 
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
         Description = "Some god dropped a newly created lasmob here.", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a newly created lasmob", 
         ActionDescription = "", 
      }, 
      [29000] = 
      {
         Layers = 0, 
         Weight = 1500, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East: Town of Alfuh\
\13-Adarian Religous Grounds-\
\13", 
               Keyword = "sign board message", 
            }, 
         }, 
         Vnum = 29000, 
         Name = "sign board message", 
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
         Description = "A sign has been posted here.", 
         ActionDescription = "", 
         ShortDescr = "a sign is here", 
      }, 
      [29001] = 
      {
         Layers = 0, 
         Weight = 1500, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "- Adarian Religous Grounds -\
\13Proverb 01:05\
\13  May you always be guide by Knowledge, Peace, and Harmony.\
\13", 
               Keyword = "sign message board holy", 
            }, 
         }, 
         Vnum = 29001, 
         Name = "sign", 
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
         Description = "A sign has been posted here.\
\13", 
         ActionDescription = "", 
         ShortDescr = "a sign.", 
      }, 
      [29002] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 5, 
         ItemType = "food", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29002, 
         Name = "gresha", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 24, 
         }, 
         Cost = 50, 
         Description = "A piece of gresha has been left here.\
\13", 
         Flags = 
         {
            [8] = "Bless", 
            [13] = "Inventory", 
            [18] = "SmallSize", 
         }, 
         ShortDescr = "a piece of gresha", 
         ActionDescription = "", 
      }, 
      [29003] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ItemType = "drink_container", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29003, 
         Name = "tunma", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Cost = 120, 
         Description = "A tunma jar has been left here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a tunma jar", 
         ActionDescription = "", 
      }, 
      [29004] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Weight = 5, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29004, 
         Name = "robe garment religous", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 300, 
         Description = "An Adarian religous garment has been left here.", 
         ActionDescription = "", 
         ShortDescr = "a religous robe", 
      }, 
      [29005] = 
      {
         Layers = 0, 
         Weight = 1500, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "- NOTICE -\
\13ROAD CLOSED, TILL RE-OPENED\
\13- Alfuh City Council\
\13", 
               Keyword = "sign", 
            }, 
         }, 
         Vnum = 29005, 
         Name = "sign road", 
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
         Description = "A sign as been posted along the road here.", 
         ActionDescription = "", 
         ShortDescr = "a road sign", 
      }, 
      [29006] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
            [10] = "About", 
            [3] = "Body", 
         }, 
         Weight = 5, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29006, 
         Name = "shirt protective", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 2500, 
         Description = "An officer's protective shirt has been left here.", 
         Flags = 
         {
            [8] = "Bless", 
            [31] = "HumanSize", 
         }, 
         ShortDescr = "a protective shirt", 
         ActionDescription = "", 
      }, 
      [29007] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
            [14] = "Hold", 
         }, 
         Weight = 5, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29007, 
         Name = "trousers adarian pair", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 2500, 
         Description = "A pair of Adarian trousers have been left here.", 
         ActionDescription = "", 
         ShortDescr = "a pair of Adarian trousers", 
      }, 
      [29008] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
            [14] = "Hold", 
         }, 
         Weight = 5, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29008, 
         Name = "boots adarian", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 1000, 
         Description = "A pair if Adarian boots have been dropped here.", 
         ActionDescription = "", 
         ShortDescr = "a pair if Adarian boots", 
      }, 
      [29009] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
            [14] = "Hold", 
         }, 
         Weight = 10, 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29009, 
         Name = "ac blaster rifle", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 7, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Cost = 5500, 
         Description = "An AC Blaster Rifle has been left unguarded here.", 
         ActionDescription = "", 
         ShortDescr = "an AC Blaster Rifle", 
      }, 
      [29010] = 
      {
         Layers = 0, 
         Weight = 5000, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29010, 
         Name = "desk", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 300, 
         Description = "An old rock carved desk sits in the center of the room.", 
         ActionDescription = "", 
         ShortDescr = "An old rock carved desk", 
      }, 
      [29011] = 
      {
         Layers = 0, 
         Weight = 10000, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Dead End - Alfuh City Academy\
\13This is a Dead End!  To the north is the local Academy.\
\13", 
               Keyword = "sign rock road", 
            }, 
         }, 
         Vnum = 29011, 
         Name = "sign rock road", 
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
         Description = "A sign has been tacked up on the rock here.", 
         ActionDescription = "", 
         ShortDescr = "a sign", 
      }, 
      [29012] = 
      {
         Layers = 0, 
         Weight = 5000, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "To attack a droid type 'kill droid'.  This droid is very weak, but\
\13be careful against other foes.  Be sure to rest when you get weak.\
\13", 
               Keyword = "sign help newbie", 
            }, 
         }, 
         Vnum = 29012, 
         Name = "sign help newbie", 
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
         Description = "A sign has been posted here.", 
         ActionDescription = "", 
         ShortDescr = "a sign", 
      }, 
      [29013] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
            [14] = "Hold", 
         }, 
         Weight = 5, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "They are thong sandals, enough said!\
\13", 
               Keyword = "sandals ", 
            }, 
         }, 
         Vnum = 29013, 
         Name = "sandals ", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 5, 
         Description = "A pair of sandals have been left here.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "a pair of sandals", 
         ActionDescription = "", 
      }, 
      [29014] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
            [14] = "Hold", 
         }, 
         Weight = 3, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A little on the short side, even for shorts.\
\13", 
               Keyword = "shorts", 
            }, 
         }, 
         Vnum = 29014, 
         Name = "shorts", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 5, 
         Description = "A pair of shorts have been left here.", 
         Flags = 
         {
            [18] = "SmallSize", 
            [31] = "HumanSize", 
         }, 
         ShortDescr = "a pair of shorts", 
         ActionDescription = "", 
      }, 
      [29015] = 
      {
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
            [14] = "Hold", 
         }, 
         Weight = 5, 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29015, 
         Name = "club stick", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 2, 
         Description = "A club is laying on the ground here.", 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         ShortDescr = "a club", 
         ActionDescription = "", 
      }, 
      [29016] = 
      {
         Layers = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
            [10] = "About", 
            [3] = "Body", 
         }, 
         Weight = 5, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29016, 
         Name = "robe healer", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 400, 
         Description = "A robe has been left here.", 
         ActionDescription = "", 
         ShortDescr = "a robe", 
      }, 
      [29017] = 
      {
         Layers = 0, 
         Weight = 5000, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This road has been closed temporarily.  Thanks!\
\13", 
               Keyword = "sign closed road", 
            }, 
         }, 
         Vnum = 29017, 
         Name = "sign closed road", 
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
         Description = "A sign has been posted here.", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a sign", 
         ActionDescription = "", 
      }, 
      [29018] = 
      {
         Layers = 0, 
         Weight = 9000, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The Serin Pluogus (Public Shuttle) Stops\
\13Here.\
\13", 
               Keyword = "sign bustop ", 
            }, 
         }, 
         Vnum = 29018, 
         Name = "sign bustop ", 
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
         Description = "A bus stop sign is here.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ShortDescr = "bus stop sign", 
         ActionDescription = "", 
      }, 
   }, 
   VnumRanges = 
   {
      Room = 
      {
         First = 29000, 
         Last = 29057, 
      }, 
      Object = 
      {
         First = 29000, 
         Last = 29059, 
      }, 
      Mob = 
      {
         First = 29000, 
         Last = 29059, 
      }, 
   }, 
   Filename = "adari.lua", 
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
   LowEconomy = 31248106, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Arg3 = 29012, 
         Arg1 = 29000, 
         MiscData = 0, 
         Command = "O", 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Arg3 = 29012, 
         Arg1 = 29000, 
         MiscData = 0, 
         Command = "O", 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Arg3 = 29016, 
         Arg1 = 29001, 
         MiscData = 0, 
         Command = "O", 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Arg3 = 29016, 
         Arg1 = 29001, 
         MiscData = 0, 
         Command = "O", 
      }, 
      [5] = 
      {
         Arg2 = 2, 
         Arg3 = 29019, 
         Arg1 = 29001, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Arg3 = 12, 
         Arg1 = 29004, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [7] = 
      {
         Arg2 = 2, 
         Arg3 = 29019, 
         Arg1 = 29001, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg3 = 12, 
         Arg1 = 29004, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Arg3 = 29025, 
         Arg1 = 29005, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [10] = 
      {
         Arg2 = 2, 
         Arg3 = 2, 
         Arg1 = 29028, 
         MiscData = 0, 
         Command = "D", 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 29030, 
         MiscData = 0, 
         Command = "D", 
      }, 
      [12] = 
      {
         Arg2 = 1, 
         Arg3 = 29031, 
         Arg1 = 29002, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [13] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 29006, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 29008, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 29009, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Arg3 = 29035, 
         Arg1 = 29010, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Arg3 = 29034, 
         Arg1 = 29003, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 29006, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [20] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 29008, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [21] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         Arg3 = 29034, 
         Arg1 = 29010, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         Arg3 = 29051, 
         Arg1 = 29011, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [24] = 
      {
         Arg2 = 1, 
         Arg3 = 29054, 
         Arg1 = 29004, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         Arg3 = 29054, 
         Arg1 = 29012, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         Arg3 = 29055, 
         Arg1 = 29013, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [27] = 
      {
         Arg2 = 1, 
         Arg3 = 29055, 
         Arg1 = 29015, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         Arg3 = 29055, 
         Arg1 = 29014, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [29] = 
      {
         Arg2 = 1, 
         Arg3 = 29057, 
         Arg1 = 29005, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [30] = 
      {
         Arg2 = 1, 
         Arg3 = 29023, 
         Arg1 = 29006, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [31] = 
      {
         Arg2 = 1, 
         Arg3 = 29023, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [32] = 
      {
         Arg2 = 3, 
         Arg3 = 29004, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [33] = 
      {
         Arg2 = 3, 
         Arg3 = 29000, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [34] = 
      {
         Arg2 = 5, 
         Arg3 = 29007, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [35] = 
      {
         Arg2 = 5, 
         Arg3 = 29007, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [36] = 
      {
         Arg2 = 6, 
         Arg3 = 29010, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [37] = 
      {
         Arg2 = 7, 
         Arg3 = 29014, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [38] = 
      {
         Arg2 = 9, 
         Arg3 = 29048, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [39] = 
      {
         Arg2 = 9, 
         Arg3 = 29048, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [40] = 
      {
         Arg2 = 2, 
         Arg3 = 29013, 
         Arg1 = 29001, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [41] = 
      {
         Arg2 = 1, 
         Arg3 = 12, 
         Arg1 = 29004, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [42] = 
      {
         Arg2 = 1, 
         Arg3 = 29005, 
         Arg1 = 29008, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [43] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 29006, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [44] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Arg1 = 29007, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 29008, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [46] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 29009, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [47] = 
      {
         Arg2 = 1, 
         Arg3 = 29017, 
         Arg1 = 29000, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [48] = 
      {
         MiscData = 1, 
         Arg1 = 29002, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [49] = 
      {
         MiscData = 1, 
         Arg1 = 10313, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [50] = 
      {
         MiscData = 1, 
         Arg1 = 10314, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [51] = 
      {
         Arg2 = 1, 
         Arg3 = 29001, 
         Arg1 = 29018, 
         MiscData = 1, 
         Command = "O", 
      }, 
   }, 
}
