-- Adari - Alfuh City
-- Last saved Monday 01-Jun-2020 11:08:47

AreaEntry
{
   Mobiles = 
   {
      [29008] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 15, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29008, 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_customs_smut", 
         }, 
         Description = "He is a fairly young Adarian.  It is his job to make sure weapons,\
drugs and other items of contreband don't come into or leave Alfuh\
City. \
", 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 7, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 3, 
         Race = "Adarian", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
            [15] = "Guardian", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel heal me\
 \
", 
               Arguments = "20", 
               MudProgType = "hitprcnt_prog", 
            }, 
            [2] = 
            {
               Code = "mpecho LaNa leaves in a rush.\
mpgoto 29030\
drop all\
mpgoto 29005\
mpecho LaNa has returned to his post.\
", 
               Arguments = "16", 
               MudProgType = "time_prog", 
            }, 
         }, 
         HitRoll = 3, 
         Name = "officer customs lana", 
         NumberOfAttacks = 1, 
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
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "LaNa, the customs officer inspects goods here.\
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
         ShortDescr = "LaNa", 
      }, 
      [29059] = 
      {
         Sex = "undistinguished", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29059, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Name = "lasmob", 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "Some god abandoned a newly created lasmob here.\
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
         Level = 1, 
         ShortDescr = "a newly created lasmob", 
      }, 
      [29000] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 10, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29000, 
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
            KeeperShortDescr = "Feiht Krooc", 
            ProfitSell = 0, 
            ProfitBuy = 120, 
         }, 
         Description = "A young, but aged Adarian merchant.  He is short for an Adarian.  He\
is barely one meter tall.  His face is rough and scarred.  He is pathetic\
looking in and loathesome in every way.  Perhaps his value lies deeper\
within.  Or maybe he is just ugly.\
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
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "emote greets you with a slight nod and weak smile.\
say Welcome to Alfuh...\
", 
               Arguments = "80", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = "say TYPE list to see what I sell...\
emote shakes his head and mumbles something to himself.\
", 
               Arguments = "p looks at you.", 
               MudProgType = "act_prog", 
            }, 
            [3] = 
            {
               Code = "mpgoto 29015\
mptransfer $n\
mpechoat $n Feiht grabs hold of you, and tosses you into the street\
tell $n Dont came back unless you can act civilized...\
mpecho Feiht angrily turns around and storms back into his shop.\
mpgoto 29017\
", 
               Arguments = "p rears back and slaps you cruelly for your stupidity.  OUCH!", 
               MudProgType = "act_prog", 
            }, 
         }, 
         HitRoll = 2, 
         Name = "shopkeeper feiht krooc", 
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
               [0] = "basic", 
               [19] = "adarese", 
            }, 
         }, 
         Alignment = 400, 
         Weight = 0, 
         LongDescr = "A shopkeeper, Feiht Krooc is here.\
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
         Level = 10, 
         ShortDescr = "Feiht Krooc", 
      }, 
      [29001] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29001, 
         Description = "", 
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
            [0] = "Npc", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho An Adarian worshipper begins to meditate.\
", 
               Arguments = "40", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         HitRoll = 4, 
         Name = "worshipper citizen adarian", 
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
         Alignment = 450, 
         Weight = 0, 
         LongDescr = "An Adarian worshipper meditates here.\
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
         ShortDescr = "a religous Adarian", 
      }, 
      [29002] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 7, 
            HitSizeDice = 75, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29002, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_customs_weapons", 
         }, 
         Description = "He is a large well built Adarian.  He does not look like a very\
tolerant nor forgiving individual.  It is best to stay on his good\
side.\
", 
         Damage = 
         {
            DamNoDice = 7, 
            DamSizeDice = 37, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 15, 
         Race = "Adarian", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Height = 0, 
         ArmorClass = -40, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n Yllib Apa carefully looks you over.\
mpechoaround Yllib Apa looks at $n.\
", 
               Arguments = "40", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = "glare $n\
", 
               Arguments = "p pokes you in the ribs.", 
               MudProgType = "act_prog", 
            }, 
            [3] = 
            {
               Code = "mpechoaround Yllib Apa intensely studies the surroundings.\
", 
               Arguments = "1", 
               MudProgType = "rand_prog", 
            }, 
            [4] = 
            {
               Code = "emote gives $n a stern, harsh look.\
", 
               Arguments = "p looks at you.", 
               MudProgType = "act_prog", 
            }, 
            [5] = 
            {
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
               Arguments = "p rears back and slaps you cruelly for your stupidity.  OUCH!", 
               MudProgType = "act_prog", 
            }, 
            [6] = 
            {
               Code = "mpechoaround $n is taken to jail on the charge of stupidity.\
mpgoto 29029\
mptransfer $n\
mpechoat $n Apa delivers you to the jail cell.\
mpgoto 29028\
mpechoaround Yllib Apa exits the Jail Cell.\
north\
east\
", 
               Arguments = "90", 
               MudProgType = "hitprcnt_prog", 
            }, 
         }, 
         HitRoll = 15, 
         Name = "yllib apa local law enforcement", 
         NumberOfAttacks = 4, 
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
         Alignment = 500, 
         Weight = 0, 
         LongDescr = "The local law, Yllib Apa is on patrol here.\
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
         Level = 75, 
         ShortDescr = "Yllib Apa", 
      }, 
      [29003] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 10, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29003, 
         Description = "An older looking Adarian who goes by the name tUmOch.  He is the city\
auditor.  tUmOch is responsible for Alfuh City finances. \
", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 3, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 2, 
         Race = "Adarian", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [7] = "Wimpy", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho tUmOch looks up from his desk.\
say Hello, can I help you with something?\
", 
               Arguments = "50", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = "mpecho tUmOch begins to grow groggy.\
sit\
sleep\
", 
               Arguments = "20", 
               MudProgType = "time_prog", 
            }, 
            [3] = 
            {
               Code = "wake\
mpecho tUmOch awakens from a nap.\
stand\
say ok, back to work now...\
", 
               Arguments = "4", 
               MudProgType = "time_prog", 
            }, 
         }, 
         HitRoll = 2, 
         Name = "auditor aged adarian tUmOch", 
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
         Alignment = 50, 
         Weight = 0, 
         LongDescr = "An aged Adarian auditor studies some documents.\
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
         ShortDescr = "tUmOch", 
      }, 
      [29004] = 
      {
         Sex = "undistinguished", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29004, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 1, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Height = 0, 
         ArmorClass = 80, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpmload 29004 1\
mpecho A fresh droid is lowered in from above.\
", 
               Arguments = "100", 
               MudProgType = "death_prog", 
            }, 
         }, 
         HitRoll = 0, 
         Name = "droid helpless defenseless", 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A helpless, defenseless droid is here.\
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
         Credits = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Level = 1, 
         ShortDescr = "a helpless droid", 
      }, 
      [29005] = 
      {
         Sex = "undistinguished", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 5, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29005, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 3, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 2, 
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
               Code = "mpmload 29005 1\
mpecho A fresh War Droid is lowered in from above.\
", 
               Arguments = "100", 
               MudProgType = "death_prog", 
            }, 
         }, 
         HitRoll = 1, 
         Name = "droid war", 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A War Droid pulsates in a corner here.\
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
         Level = 5, 
         ShortDescr = "a war droid", 
      }, 
      [29006] = 
      {
         Sex = "male", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 50, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29006, 
         Description = "A very old looking fellow.  Things are not always what they seem. \
Watch your step around this one.  He was once a great Jedi.  His\
powers have\
weakened, but are still strong.  He can heal you for 100\
credits.\
", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 30, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 10, 
         Race = "Adarian", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel heal $n\
mpgoto 29030\
drop all\
mpgoto 29023\
", 
               Arguments = "100", 
               MudProgType = "bribe_prog", 
            }, 
            [2] = 
            {
               Code = "feel lightning $n\
", 
               Arguments = "10", 
               MudProgType = "fight_prog", 
            }, 
            [3] = 
            {
               Code = "feel 'earthquake' $n\
", 
               Arguments = "5", 
               MudProgType = "fight_prog", 
            }, 
         }, 
         HitRoll = 10, 
         Name = "Eral Tmat healer", 
         NumberOfAttacks = 5, 
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
         Alignment = 800, 
         Weight = 0, 
         LongDescr = "An old and religous Adarian is here.\
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
         Credits = 10, 
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
         Level = 50, 
         ShortDescr = "Eral Tmat", 
      }, 
      [29007] = 
      {
         Sex = "undistinguished", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Vnum = 29007, 
         Description = "A small but fierce looking little beast.  It has a hard shell and\
sharp teeth.\
", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         DamRoll = 0, 
         Race = "Human", 
         Flags = 
         {
            [24] = "NoAssist", 
            [2] = "Scavenger", 
            [27] = "NoCorpse", 
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Height = 0, 
         ArmorClass = 75, 
         HitRoll = 0, 
         Name = "borcatu small scavenger", 
         NumberOfAttacks = 1, 
         Alignment = 0, 
         Weight = 0, 
         LongDescr = "A scavenger rumages about here.\
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
         Level = 1, 
         ShortDescr = "a borcatu", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29000, 
         Arg3 = 29012, 
         MiscData = 0, 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29000, 
         Arg3 = 29012, 
         MiscData = 0, 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29001, 
         Arg3 = 29016, 
         MiscData = 0, 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29001, 
         Arg3 = 29016, 
         MiscData = 0, 
      }, 
      [5] = 
      {
         Arg2 = 2, 
         Command = "M", 
         Arg1 = 29001, 
         Arg3 = 29019, 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Arg2 = 2, 
         Command = "M", 
         Arg1 = 29001, 
         Arg3 = 29019, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29005, 
         Arg3 = 29025, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg2 = 2, 
         Command = "D", 
         Arg1 = 29028, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Command = "D", 
         Arg1 = 29030, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [12] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29002, 
         Arg3 = 29031, 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29010, 
         Arg3 = 29035, 
         MiscData = 1, 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29003, 
         Arg3 = 29034, 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [20] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
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
         Command = "O", 
         Arg1 = 29010, 
         Arg3 = 29034, 
         MiscData = 1, 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29011, 
         Arg3 = 29051, 
         MiscData = 1, 
      }, 
      [24] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29004, 
         Arg3 = 29054, 
         MiscData = 1, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29012, 
         Arg3 = 29054, 
         MiscData = 1, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29013, 
         Arg3 = 29055, 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29015, 
         Arg3 = 29055, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 29014, 
         Arg3 = 29055, 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29005, 
         Arg3 = 29057, 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29006, 
         Arg3 = 29023, 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29023, 
         MiscData = 1, 
      }, 
      [32] = 
      {
         Arg2 = 3, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29004, 
         MiscData = 1, 
      }, 
      [33] = 
      {
         Arg2 = 3, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29000, 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Arg2 = 5, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29007, 
         MiscData = 1, 
      }, 
      [35] = 
      {
         Arg2 = 5, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29007, 
         MiscData = 1, 
      }, 
      [36] = 
      {
         Arg2 = 6, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29010, 
         MiscData = 1, 
      }, 
      [37] = 
      {
         Arg2 = 7, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29014, 
         MiscData = 1, 
      }, 
      [38] = 
      {
         Arg2 = 9, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29048, 
         MiscData = 1, 
      }, 
      [39] = 
      {
         Arg2 = 9, 
         Command = "M", 
         Arg1 = 29007, 
         Arg3 = 29048, 
         MiscData = 1, 
      }, 
      [40] = 
      {
         Arg2 = 2, 
         Command = "M", 
         Arg1 = 29001, 
         Arg3 = 29013, 
         MiscData = 1, 
      }, 
      [41] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29004, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [42] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29008, 
         Arg3 = 29005, 
         MiscData = 1, 
      }, 
      [43] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29006, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [44] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29007, 
         Arg3 = 7, 
         MiscData = 1, 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29008, 
         Arg3 = 8, 
         MiscData = 1, 
      }, 
      [46] = 
      {
         Arg2 = 1, 
         Command = "E", 
         Arg1 = 29009, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [47] = 
      {
         Arg2 = 1, 
         Command = "M", 
         Arg1 = 29000, 
         Arg3 = 29017, 
         MiscData = 1, 
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
         Command = "O", 
         Arg1 = 29018, 
         Arg3 = 29001, 
         MiscData = 1, 
      }, 
   }, 
   Name = "Adari - Alfuh City", 
   VnumRanges = 
   {
      Object = 
      {
         First = 29000, 
         Last = 29059, 
      }, 
      Room = 
      {
         First = 29000, 
         Last = 29057, 
      }, 
      Mob = 
      {
         First = 29000, 
         Last = 29059, 
      }, 
   }, 
   Objects = 
   {
      [29059] = 
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
         Vnum = 29059, 
         Name = "lasmob", 
         Description = "Some god dropped a newly created lasmob here.", 
         ShortDescr = "a newly created lasmob", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Cost = 0, 
      }, 
      [29000] = 
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
         Vnum = 29000, 
         Name = "sign board message", 
         Description = "A sign has been posted here.", 
         ShortDescr = "a sign is here", 
         Weight = 1500, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign board message", 
               Description = "East: Town of Alfuh\
\13-Adarian Religous Grounds-\
\13", 
            }, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Cost = 0, 
      }, 
      [29001] = 
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
         Vnum = 29001, 
         Name = "sign", 
         Description = "A sign has been posted here.\
\13", 
         ShortDescr = "a sign.", 
         Weight = 1500, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign message board holy", 
               Description = "- Adarian Religous Grounds -\
\13Proverb 01:05\
\13  May you always be guide by Knowledge, Peace, and Harmony.\
\13", 
            }, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Cost = 0, 
      }, 
      [29002] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 29002, 
         Name = "gresha", 
         Description = "A piece of gresha has been left here.\
\13", 
         ShortDescr = "a piece of gresha", 
         Weight = 5, 
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
            [0] = 24, 
         }, 
         ItemType = "food", 
         Layers = 0, 
         Flags = 
         {
            [8] = "Bless", 
            [13] = "Inventory", 
            [18] = "SmallSize", 
         }, 
         Cost = 50, 
      }, 
      [29003] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 29003, 
         Name = "tunma", 
         Description = "A tunma jar has been left here.", 
         ShortDescr = "a tunma jar", 
         Weight = 1, 
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
            [0] = 12, 
         }, 
         ItemType = "drink_container", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Cost = 120, 
      }, 
      [29004] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Vnum = 29004, 
         Name = "robe garment religous", 
         Description = "An Adarian religous garment has been left here.", 
         ShortDescr = "a religous robe", 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "armor", 
         Layers = 0, 
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
      }, 
      [29005] = 
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
         Vnum = 29005, 
         Name = "sign road", 
         Description = "A sign as been posted along the road here.", 
         ShortDescr = "a road sign", 
         Weight = 1500, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign", 
               Description = "- NOTICE -\
\13ROAD CLOSED, TILL RE-OPENED\
\13- Alfuh City Council\
\13", 
            }, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Cost = 0, 
      }, 
      [29006] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
            [10] = "About", 
            [3] = "Body", 
         }, 
         Vnum = 29006, 
         Name = "shirt protective", 
         Description = "An officer's protective shirt has been left here.", 
         ShortDescr = "a protective shirt", 
         Weight = 5, 
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
         ItemType = "armor", 
         Layers = 0, 
         Flags = 
         {
            [8] = "Bless", 
            [31] = "HumanSize", 
         }, 
         Cost = 2500, 
      }, 
      [29007] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
            [14] = "Hold", 
         }, 
         Vnum = 29007, 
         Name = "trousers adarian pair", 
         Description = "A pair of Adarian trousers have been left here.", 
         ShortDescr = "a pair of Adarian trousers", 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "armor", 
         Layers = 0, 
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
      }, 
      [29008] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
            [14] = "Hold", 
         }, 
         Vnum = 29008, 
         Name = "boots adarian", 
         Description = "A pair if Adarian boots have been dropped here.", 
         ShortDescr = "a pair if Adarian boots", 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "armor", 
         Layers = 0, 
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
      }, 
      [29009] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
            [14] = "Hold", 
         }, 
         Vnum = 29009, 
         Name = "ac blaster rifle", 
         Description = "An AC Blaster Rifle has been left unguarded here.", 
         ShortDescr = "an AC Blaster Rifle", 
         Weight = 10, 
         ExtraDescriptions = 
         {
         }, 
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
         }, 
         ItemType = "weapon", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 7, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         Cost = 5500, 
      }, 
      [29010] = 
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
         Vnum = 29010, 
         Name = "desk", 
         Description = "An old rock carved desk sits in the center of the room.", 
         ShortDescr = "An old rock carved desk", 
         Weight = 5000, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Cost = 300, 
      }, 
      [29011] = 
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
         Vnum = 29011, 
         Name = "sign rock road", 
         Description = "A sign has been tacked up on the rock here.", 
         ShortDescr = "a sign", 
         Weight = 10000, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign rock road", 
               Description = "Dead End - Alfuh City Academy\
\13This is a Dead End!  To the north is the local Academy.\
\13", 
            }, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Cost = 0, 
      }, 
      [29012] = 
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
         Vnum = 29012, 
         Name = "sign help newbie", 
         Description = "A sign has been posted here.", 
         ShortDescr = "a sign", 
         Weight = 5000, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign help newbie", 
               Description = "To attack a droid type 'kill droid'.  This droid is very weak, but\
\13be careful against other foes.  Be sure to rest when you get weak.\
\13", 
            }, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Cost = 0, 
      }, 
      [29013] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
            [14] = "Hold", 
         }, 
         Vnum = 29013, 
         Name = "sandals ", 
         Description = "A pair of sandals have been left here.", 
         ShortDescr = "a pair of sandals", 
         Weight = 5, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sandals ", 
               Description = "They are thong sandals, enough said!\
\13", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         Layers = 0, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Cost = 5, 
      }, 
      [29014] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
            [14] = "Hold", 
         }, 
         Vnum = 29014, 
         Name = "shorts", 
         Description = "A pair of shorts have been left here.", 
         ShortDescr = "a pair of shorts", 
         Weight = 3, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "shorts", 
               Description = "A little on the short side, even for shorts.\
\13", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         Layers = 0, 
         Flags = 
         {
            [18] = "SmallSize", 
            [31] = "HumanSize", 
         }, 
         Cost = 5, 
      }, 
      [29015] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
            [14] = "Hold", 
         }, 
         Vnum = 29015, 
         Name = "club stick", 
         Description = "A club is laying on the ground here.", 
         ShortDescr = "a club", 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Layers = 0, 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         Cost = 2, 
      }, 
      [29016] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
            [10] = "About", 
            [3] = "Body", 
         }, 
         Vnum = 29016, 
         Name = "robe healer", 
         Description = "A robe has been left here.", 
         ShortDescr = "a robe", 
         Weight = 5, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "armor", 
         Layers = 2, 
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
      }, 
      [29017] = 
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
         Vnum = 29017, 
         Name = "sign closed road", 
         Description = "A sign has been posted here.", 
         ShortDescr = "a sign", 
         Weight = 5000, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign closed road", 
               Description = "This road has been closed temporarily.  Thanks!\
\13", 
            }, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Cost = 0, 
      }, 
      [29018] = 
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
         Vnum = 29018, 
         Name = "sign bustop ", 
         Description = "A bus stop sign is here.", 
         ShortDescr = "bus stop sign", 
         Weight = 9000, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign bustop ", 
               Description = "The Serin Pluogus (Public Shuttle) Stops\
\13Here.\
\13", 
            }, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Cost = 0, 
      }, 
   }, 
   Rooms = 
   {
      [29056] = 
      {
         Tunnel = 0, 
         Vnum = 29056, 
         Sector = "city", 
         Description = "You are in a beautifully decorated hallway.  Many of the images\
displayed on the wall appear to have been made by children who attend\
this facility. Tacky may be a more appropriate word than beautiful. \
You can continue north or south from here.\
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
               DestinationVnum = 29057, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29053, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh Elementary Academy", 
      }, 
      [29057] = 
      {
         Tunnel = 0, 
         Vnum = 29057, 
         Sector = "city", 
         Description = "This training room is the most difficult one available in this\
facility. Be careful!  The walls are stained with oil and various\
droid parts. You are not sure, but there seem to be some pools of\
blood in here too. This is a dangerous room, watch yourself. You can\
exit to the south.\
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
               DestinationVnum = 29056, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh Elementary Academy", 
      }, 
      [29000] = 
      {
         Tunnel = 0, 
         Vnum = 29000, 
         Sector = "city", 
         Description = "The dark cavernous walls gleam lightly as drops of moisture\
glides down softly into the dirt.  A small multi-colored\
carpet lies in the center of this small yet dull room.\
This apparently the dwelling of a dark, sullen, and religious\
jawa.\
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
               DestinationVnum = 29001, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Small Dark Cave", 
      }, 
      [29001] = 
      {
         Tunnel = 0, 
         Vnum = 29001, 
         Sector = "city", 
         Description = "You are on a barren landing pad of some sort.  The ground\
is largely made up of thick, coarse, black sand.  The area\
is virtually devoid of any vegetation or undergrowth.  To the\
west is a large rock.  Upon closer observation you notice\
a small opening.  It appears to be a small cave.  To the north\
and south there isn't really anything special.  Just vast desert\
plains.  To the east is a thin and winding road.\
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
               Keyword = "desert sands", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29002, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "path", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29004, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29003, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29000, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [18] = "NoDrop", 
         }, 
         Name = "Barren Landing Facility", 
      }, 
      [29002] = 
      {
         Tunnel = 0, 
         Vnum = 29002, 
         Sector = "city", 
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
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "Plains landing zone", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29001, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [13] = "Arena", 
         }, 
         Name = "Desolate Desert Plains", 
      }, 
      [29003] = 
      {
         Tunnel = 0, 
         Vnum = 29003, 
         Name = "Surrounded by Rock", 
         Description = "The darkness had shrouded the mountainously jagged rocks\
that have virtually surrounded.  The dark sky makes it\
impossible for you to determine how high the rocks go.\
Your field of vision has been significantly lessened by\
your current surroundings.  In any case it would seem that\
continuing in any direction other than north is unrealistic.\
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
               Keyword = "plains", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29001, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
      }, 
      [29004] = 
      {
         Tunnel = 0, 
         Vnum = 29004, 
         Sector = "city", 
         Description = "Beset on all sides by unknown peril, you push on.  Knowing\
not what the future holds for you here.  Jagged rocks bar\
your passage either north or south.  The pale gray-blue\
sky masks the height of the surrounding mountains.  At\
this time it appears your only options are to continue \
east or west.  To the west you can see a broader space\
an opening of the path.  To the east, the path continues\
and does not look inviting.\
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
               Keyword = "private dark", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29005, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "landing zone", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29001, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Name = "Narrow Roadway", 
      }, 
      [29005] = 
      {
         Tunnel = 0, 
         Vnum = 29005, 
         Name = "Narrow Pathway", 
         Description = "You are enclosed in darkness.  It is impossible to see\
your hand in front of your face.  As you move along you\
realize that your pathway to the north is blocked by\
mountainous rock.  There seems to be a small opening\
to the south.  I wouldn't try fitting landspeeder through\
these pathways.  Off to the east is a shallow light.\
It illuminates a sandy and barren plain.\
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
               DestinationVnum = 29006, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "tunnel private", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29007, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "dark tunnel", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29004, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
      }, 
      [29006] = 
      {
         Tunnel = 0, 
         Vnum = 29006, 
         Sector = "city", 
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
         TeleDelay = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "tunnel private solitary", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29005, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [18] = "NoDrop", 
            [13] = "Arena", 
         }, 
         Name = "Lighted Landing Zone", 
      }, 
      [29007] = 
      {
         Tunnel = 0, 
         Vnum = 29007, 
         Sector = "city", 
         Description = "This planet leaves alot to be desired.  Whoever put this path\
here hardly made it wide enough for you to walk on.  It would\
be nearly impossible for other traffic to get through.  You are\
begining to make out a faint odor in the air about you.  It is\
tough to recognize initially, but you are almost sure that the\
smell is volcanic ash.  That figures.  The rock around you is\
actually old volcanic lava that has cooled and hardened.\
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
               Keyword = "tunnel private", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29005, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29008, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [9] = "Private", 
            [0] = "Dark", 
         }, 
         Name = "Narrow Road", 
      }, 
      [29008] = 
      {
         Tunnel = 0, 
         Vnum = 29008, 
         Sector = "city", 
         Description = "The path is narrow and dirty.  Sand and dirt mingle in a unsettling\
fashion.  The air is thin and difficult to breath.  The east and west\
are both blocked from further passage.  Large mountainous rock stands as\
a forbidding factor before you.  You can more easily continue to the \
north or south.\
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
               DestinationVnum = 29007, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29009, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [16] = "Silence", 
            [0] = "Dark", 
         }, 
         Name = "Path O Sand", 
      }, 
      [29009] = 
      {
         Tunnel = 0, 
         Vnum = 29009, 
         Sector = "city", 
         Description = "Large pieces of jagged rock portrude from the mountains beside you.\
The ground is slightly elevated here due to the amounts of rock\
beneath your feet.  The rocky ground is covered by a thin layer of\
volcanic ash and residue.  Particles of ash lay heavy in the air.\
Breathing is a chore at this altitude.  You can continue north\
or south.\
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
               DestinationVnum = 29008, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29010, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [8] = "Bank", 
         }, 
         Name = "Rocky Pathway", 
      }, 
      [29010] = 
      {
         Tunnel = 0, 
         Vnum = 29010, 
         Sector = "city", 
         Description = "Enormous mountains block your path to the east and west.  The\
mountians nearly block out all forms of natural light.  The ground\
beneath your feet is comprised of dirt, sand, and rock.  A thin\
air of volcanic ash floats about making breathing somewhat difficult.\
You can conitinue north or south from here.\
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
               DestinationVnum = 29009, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29011, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
         }, 
         Name = "Dirt Path", 
      }, 
      [29011] = 
      {
         Tunnel = 0, 
         Vnum = 29011, 
         Sector = "city", 
         Description = "The path leads in several directions from here.  It would seem that\
the mountianous rock has been chisled away from these parts.  The\
rock is still quite jagged and sharp in some places.  The ground\
beneath your feet is soft and dulled.  This area has been used to alot of\
traffic apprently.\
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
               DestinationVnum = 29010, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29012, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29044, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29045, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         Name = "Rocky intersection", 
      }, 
      [29012] = 
      {
         Tunnel = 0, 
         Vnum = 29012, 
         Sector = "city", 
         Description = "Mountians, mountians everywhere.  The mountian you are on/in seriously\
limits your possible paths to travel.  You are just outside the a small\
town.  There is a sign nearby that can shed light on your location.  To\
the east is town.  To the west is an intersection.\
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
               DestinationVnum = 29013, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29011, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
         }, 
         Name = "Edge of Alfuh", 
      }, 
      [29013] = 
      {
         Tunnel = 0, 
         Vnum = 29013, 
         Name = "Alfuh City Road", 
         Description = "This is the outskirts of Alfuh.  To the east is more of town.  Alfuh\
is a religous city for the Adarian race.  From here, you can't really\
see that much of the city.  The road beneath your feet is made up of rock\
and is covered with volcanic ash.  You can continue in just about any\
direction.\
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
               DestinationVnum = 29014, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29020, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29026, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29012, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
      }, 
      [29014] = 
      {
         Tunnel = 0, 
         Vnum = 29014, 
         Name = "Alfuh City Road", 
         Description = "The road beneath your feet is composed of rock dirt and volcanic\
ash.  To the east and west, your path is blocked by mountians.  To\
the north you can see some shops.  Well, buildings anyway.  To the\
south is an intersection.\
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
               DestinationVnum = 29015, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29013, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
      }, 
      [29015] = 
      {
         Tunnel = 0, 
         Vnum = 29015, 
         Sector = "city", 
         Description = "The cool air and soft climate can calm the nerves of even the most\
frazzled travellers.  You are near a sacred shrine of the Adarian\
population.  You can vaguely make it out to the north.  To the east is\
a small cave.  Someone took the time to carve out the rock - mountian.\
To the west is another of these cave cut outs.  The road continues\
to the north and south.\
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
               DestinationVnum = 29016, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29018, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29014, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29017, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29016] = 
      {
         Tunnel = 0, 
         Vnum = 29016, 
         Sector = "city", 
         Description = "You are immediately south of an Adarian Shrine.  Each year Adarians\
from every part of the galaxy return to this.  Their homeworld.  They\
do so at least twice each year.  It is considered a religous pilgrimage.\
To the north is an old shrine that has been heavily visited through out the\
years.  Please be respectful of others.\
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
               DestinationVnum = 29019, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29015, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         Name = "Shrine Entrance", 
      }, 
      [29017] = 
      {
         Tunnel = 0, 
         Vnum = 29017, 
         Sector = "city", 
         Description = "This place was cut out of the side of a mountian.  The floor is made\
of rock and is covered in dirt.  This appears to be a restraunt.  Adarians\
who have travelled from far away galaxies can replinish themselves here.\
To the east is the store exit.\
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
               DestinationVnum = 29015, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [7] = "NoMagic", 
            [13] = "Arena", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh R & R", 
      }, 
      [29018] = 
      {
         Tunnel = 0, 
         Vnum = 29018, 
         Sector = "city", 
         Description = "This is a donation room.  Adarians make several pilgrimages to their \
homeworld every year.  When they do, it is customary for them to leave\
one or two material items as a sign of thanks for their prosperty \
and health.  They drop items here and then continue on to the shrine\
to meditate.  The items left in this room are free to the needy.  If\
you need something here, take it.  If you have something you don't plan\
to keep, leave it here.\
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
               DestinationVnum = 29015, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [7] = "NoMagic", 
            [14] = "Donation", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh Donation Grounds", 
      }, 
      [29019] = 
      {
         Tunnel = 0, 
         Vnum = 29019, 
         Sector = "city", 
         Description = "There is a strong sense of peace in the air about you.  This is a safe\
place where Adarians worship.  This is a place great knowledge and\
wisdom.  It is forbidden to speak in here.  The tranquility and silence\
has not been broken in centuries.  Clarity is achieved through total and\
complete silence.\
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
               DestinationVnum = 29016, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Religous Shrine", 
      }, 
      [29020] = 
      {
         Tunnel = 3, 
         Vnum = 29020, 
         Sector = "city", 
         Description = "Volcanic ash steadily descends from above.  This is the planet               \
Adari.  The Adarian race is built on technology and mining.  Sadly,\
they have mined their own planet and all asteroids in their galaxy.\
You can continue east or west from here.\
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
               DestinationVnum = 29021, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29013, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29021] = 
      {
         Tunnel = 4, 
         Vnum = 29021, 
         Sector = "city", 
         Description = "Alfuh City, on the wonderful planet of Adari.  Adarians are\
very religous by nature.  It is very important that they visit their\
homeworld at least once every year.  This city is a tourist trap\
though.  Watch yourself.  You can continue East or West from here.\
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
               DestinationVnum = 29022, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29020, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29022] = 
      {
         Tunnel = 2, 
         Vnum = 29022, 
         Sector = "city", 
         Description = "This place is in shambles.  This city was apparenlty cut out of a\
mountian.  Not just any mountian either.  It was cut out of a volcano.\
Volcanic ash steadily drops from the sky and lines the road.  You can\
continue east or west from here.\
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
               DestinationVnum = 29023, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29021, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29023] = 
      {
         Tunnel = 5, 
         Vnum = 29023, 
         Sector = "city", 
         Description = "You are at an intersection.  There are paths chisled out of the \
rock to the north, east, south, and west.  The road seems to\
continue for quite a while in each direction.  If you can avoid\
all the active lava, you should be fine.  This planet is very\
volcanic in nature.\
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
               DestinationVnum = 29032, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29024, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29038, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29022, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Alfuh City Intersection", 
      }, 
      [29024] = 
      {
         Tunnel = 3, 
         Vnum = 29024, 
         Sector = "city", 
         Description = "Alfuh City, was meant to be among the grand cities of the galaxy.\
Unfortunately, living on a planet that is an active vocano has its\
draw backs.  Worse than that, Adarians are deeply involved in the\
mining industry.  So they have raped Adari of all its natural resources.\
This could be a civilization on the downward spiral.  You can continue\
east or west from here.\
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
               DestinationVnum = 29025, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29023, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29025] = 
      {
         Tunnel = 3, 
         Vnum = 29025, 
         Sector = "city", 
         Description = "The road abrubtly ends to here.  It is impossible to continue to\
the east.  The only possible direction to go is west.  It appears\
that the path continued on in this direction at some point.  But,\
the road just disappeared.\
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
               DestinationVnum = 29024, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29026] = 
      {
         Tunnel = 2, 
         Vnum = 29026, 
         Sector = "city", 
         Description = "Volcanic ash continues to drop in steady increments.  The ground\
is heavily laden in ash.  The mountian becomes particularly narrow\
here.  It would be difficult for more than two persons to attempt to\
fit through here.\
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
               DestinationVnum = 29013, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29027, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29027] = 
      {
         Tunnel = 4, 
         Vnum = 29027, 
         Sector = "city", 
         Description = "The ground is covered by a thin layer of ash.  A steady stream of ash\
continues to drop to the ground.  There are openings in the rock to the\
east and west.  You can continue in either direction.  This path also\
continues to the north and south.\
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
               DestinationVnum = 29026, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29031, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29028, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29030, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29028] = 
      {
         Tunnel = 4, 
         Vnum = 29028, 
         Sector = "city", 
         Description = "The road is wrought with peril and hardship.  The reason is a simple\
one.  Directly south of here is the town jail.  Anyone has broken the law\
faces jail time in -thee olde cell-.  It isn't a pretty site.\
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
               Keyword = "celldoor door", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29027, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29029, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29029] = 
      {
         Tunnel = 0, 
         Vnum = 29029, 
         Sector = "city", 
         Description = "A spacious cell large enough to accomodate several criminals at once.\
Seeing the inside of this cell is not good thing.  Tourists don't get this\
as a part of the tour.  But, you are probably here for a reason.  You will \
be given a chance to think about your wrong doings.\
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
               Keyword = "celldoor door", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29028, 
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
            [7] = "NoMagic", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh City Jail", 
      }, 
      [29030] = 
      {
         Tunnel = 0, 
         Vnum = 29030, 
         Sector = "city", 
         Description = "This is the Alfuh City Customs Office.  Not much to it really.  There\
is a desk against the wall.  Some papers have been placed on the\
desk.  This is kind of the impound area.  Items confiscated from tourists,\
smugglers, or whoever end up here before being destroyed.  This area is\
often full of contraband articles such as dirty magazines, alcohol, and\
spices.\
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
               DestinationVnum = 29027, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Name = "Alfuh City Customs Office", 
      }, 
      [29031] = 
      {
         Tunnel = 0, 
         Vnum = 29031, 
         Sector = "city", 
         Description = "This is the office of the local law enforcement.  In the corner is a\
desk with some papers scattered about on it.  If you want to bail out a\
friend, this is the place to visit.  The ultra conservative city and well\
for that matter planet, have a low tolerance for what they percieve as\
crime.\
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
               DestinationVnum = 29027, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh City Law Enforcement", 
      }, 
      [29032] = 
      {
         Tunnel = 0, 
         Vnum = 29032, 
         Sector = "city", 
         Description = "The road is filthy.  The air is heavy with ash.  All around you is\
jagged rock.  This portion of the path is wide.  Much wider than some\
parts of town.  This seems like a more regal part of town than some\
of the other parts of Alfuh City.\
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
               DestinationVnum = 29033, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29023, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [13] = "Arena", 
            [15] = "NoDropAll", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29033] = 
      {
         Tunnel = 0, 
         Vnum = 29033, 
         Sector = "city", 
         Description = "This is an intersection of sorts.  There are small offices to the\
East and West.  It is unclear from here what are in those offices.\
They appear to be government offices of some kind.  You can  continue\
North, East, South, or West from here.\
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
               DestinationVnum = 29036, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29035, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29032, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29034, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Name = "Alfuh City Intersection", 
      }, 
      [29034] = 
      {
         Tunnel = 0, 
         Vnum = 29034, 
         Sector = "city", 
         Description = "The walls of this room are comprised of smoothed rock.  It would be\
remiss not to mention the genuinely unique decore off you\
surroundings. The floor is comprised of rock, bevelled, sanded, and\
glossified. The walls bear photo images of historic sites around\
town.  Many of the images make town appear more beautiful and serene\
that is now the case\
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
               DestinationVnum = 29033, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [7] = "NoMagic", 
            [13] = "Arena", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh Auditors Office", 
      }, 
      [29035] = 
      {
         Tunnel = 0, 
         Vnum = 29035, 
         Sector = "city", 
         Description = "A dank and stuffy office with little to appeal to the eye or nose.\
The walls are covered in dirt and filth.  Small pieces of ash\
continually drift in through cracks in the ceiling.  You can continue\
to the west.\
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
               DestinationVnum = 29033, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh City Office", 
      }, 
      [29036] = 
      {
         Tunnel = 0, 
         Vnum = 29036, 
         Sector = "city", 
         Description = "The road is extremely wide and well taken care of.  Only thin layers\
of ash cover the road here.  This would seem to be the upper class\
part of town. To the north is an official looking meeting facility. \
To the south the road continues.\
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
               DestinationVnum = 29037, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29033, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29037] = 
      {
         Tunnel = 0, 
         Vnum = 29037, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
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
               DestinationVnum = 29036, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
      }, 
      [29038] = 
      {
         Tunnel = 3, 
         Vnum = 29038, 
         Name = "Outside the Alfuh City Homeless Shelter", 
         Description = "The sulfur covered ground makes breathing challenging from time to\
time. To the north is an intersection that can lead back to the main\
part of Alfuh City.  To the south is a rather large looking cave\
where visitors and tourists can rest their weary bones free of\
charge.  This is a service provided by the city.\
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
               DestinationVnum = 29023, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29039, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
      }, 
      [29039] = 
      {
         Tunnel = 3, 
         Vnum = 29039, 
         Sector = "city", 
         Description = "The walls are composed of jagged rock.  Thin cracks in the wall\
allow for moisture to intrude.  The moisture adds to the humidity of\
the room. It seems very warm in here.  There is a lot of volcanic\
activity nearby, so be careful.  To the north is fresh air.  To the\
south the cave continues.\
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
               DestinationVnum = 29038, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29041, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29042, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29040, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Alfuh City Shelter", 
      }, 
      [29040] = 
      {
         Tunnel = 2, 
         Vnum = 29040, 
         Sector = "city", 
         Description = "This looks like a nice place to rest your weary bones.  You are out\
of the main hallway.  A vent above you brings in freshing cool air.\
The space here is somewhat small.  It would be impossible for more\
than a couple people to rest here at the same time.  Be curtious to\
others who need rest and sleep.\
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
               DestinationVnum = 29039, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh City Shelter", 
      }, 
      [29041] = 
      {
         Tunnel = 2, 
         Vnum = 29041, 
         Sector = "city", 
         Description = "This looks like a nice place to rest your weary bones.  You are out\
of the main hallway.  A vent above you brings in freshing cool air.\
The space here is somewhat small.  It would be impossible for more\
than a couple people to rest here at the same time.  Be curtious to\
others who need rest and sleep.\
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
               DestinationVnum = 29039, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh City Shelter", 
      }, 
      [29042] = 
      {
         Tunnel = 0, 
         Vnum = 29042, 
         Sector = "city", 
         Description = "It is incredibly warm here.  It is impossible not to have broken to\
a feverish sweat simply by walking through this section of the\
hallway.   The jagged rock walls contain the heat and turn this into\
a sauna.  You can continue north or south from here.\
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
               DestinationVnum = 29039, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29043, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh City Shelter", 
      }, 
      [29043] = 
      {
         Tunnel = 2, 
         Vnum = 29043, 
         Sector = "city", 
         Description = "This looks like a nice place to rest your weary bones.  You are out\
of the main hallway.  A vent above you brings in freshing cool air.\
The space here is somewhat small.  It would be impossible for more\
than a couple people to rest here at the same time.  Be curtious to\
others who need rest and sleep.\
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
               DestinationVnum = 29042, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh City Shelter", 
      }, 
      [29044] = 
      {
         Tunnel = 2, 
         Vnum = 29044, 
         Name = "Dead End", 
         Description = "This at one time was a path that led out of and into Alfuh City.\
Over the years, lava flooded the path and has turned to molten rock.\
Due to limited funds and lack of interest, city officials have never\
bothered to have the road cleared.  You can continue to the north.\
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
               DestinationVnum = 29011, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
      }, 
      [29045] = 
      {
         Tunnel = 1, 
         Vnum = 29045, 
         Sector = "city", 
         Description = "This is one narrow path.  It would be impossible for more than one\
being to come through here at any given moment.  Molten lava walls\
completely block off the north and south.  If you are careful you can\
continue to either the east or west.\
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
               DestinationVnum = 29011, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29046, 
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
         Name = "Alfuh City Road", 
      }, 
      [29046] = 
      {
         Tunnel = 1, 
         Vnum = 29046, 
         Sector = "city", 
         Description = "This is an extremely narrow and dangerous path.  Be careful or you\
could seriously injure yourself on the jagged rocks.  It would be\
impossible for anymore than one being to slink through this passage\
at any given time. You can continue east or west.\
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
               DestinationVnum = 29045, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29047, 
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
         Name = "Alfuh City Road", 
      }, 
      [29047] = 
      {
         Tunnel = 0, 
         Vnum = 29047, 
         Sector = "city", 
         Description = "The pathway is difficult at best.  Jagged rock portrudes from all\
angles and all sides.  It would be very easy to injury yourself on\
some of these rocks.  You can continue north, east, west, or south. \
This is an intersection.  Proceed with caution.\
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
               DestinationVnum = 29048, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29046, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29049, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29050, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29048] = 
      {
         Tunnel = 0, 
         Vnum = 29048, 
         Sector = "city", 
         Description = "A foul stench invades your nostrils.  Further to the north, east and\
west large heaping mounds of garbage block your path.  This is where\
garbage is stored prior to being sent off to the recycling plant. \
The aroma is horrid. Flee the area as quickly as you can!  Save your\
smelling glands!\
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
               DestinationVnum = 29047, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [7] = "NoMagic", 
         }, 
         Name = "Alfuh City Dump", 
      }, 
      [29049] = 
      {
         Tunnel = 0, 
         Vnum = 29049, 
         Sector = "city", 
         Description = "You are just outside Alfuh City limits.  If you continue north you\
will enter the city.  If you continue south, you will be on a\
desolate and narrow pathway.  The east and west is blocked by large\
volcanic rock.  Continuing in either of those directions would be\
impossible.\
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
               DestinationVnum = 29047, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29124, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [13] = "Arena", 
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29050] = 
      {
         Tunnel = 3, 
         Vnum = 29050, 
         Sector = "city", 
         Description = "A ranks smell is coming from the north east.  Whatever it is died a\
long time ago.  As of if the smell of this planet wasn't enough to\
gag any non residents, this stench puts it over the top. The pathway\
continues to the east and west.  Your path to the north and south has\
been blocked by rock.\
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
               DestinationVnum = 29047, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29051, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Name = "Alfuh City Road", 
      }, 
      [29051] = 
      {
         Tunnel = 0, 
         Vnum = 29051, 
         Sector = "city", 
         Description = "You are at a fork in the road, kind of.  The road turnsm it doesn't\
really fork.  At one time it may have forked, but it doesn't fork\
anymore. To the way, way far east is the heart of Alfuh City.  To the\
west is a big rock.  To the north is the Alfuh City Academy.  Young\
Adarians practice their fighting skills there.\
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
               DestinationVnum = 29052, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29050, 
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
         Name = "Alfuh City Road", 
      }, 
      [29052] = 
      {
         Tunnel = 0, 
         Vnum = 29052, 
         Sector = "city", 
         Description = "Hand-made pictures hang on the walls.    The rock walls have been\
smoothed over so that the children will not poke an eye out or\
something.  This Academy was formed so that the children of the town\
could learn the basics to surviving. You can continue north or south\
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
               DestinationVnum = 29053, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29051, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [7] = "NoMagic", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh Elementary Academy", 
      }, 
      [29053] = 
      {
         Tunnel = 0, 
         Vnum = 29053, 
         Sector = "city", 
         Description = "The ceiling is pretty low in here.  Watch yourself.  To the west is\
one of the training rooms.  You can practice your skills against a\
droid.  To the east is a small donation/equipment room.  You can also\
continue north or south from here.\
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
               DestinationVnum = 29056, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29055, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29052, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29054, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
            [3] = "Indoors", 
         }, 
         Name = "Alfuh Elementary Academy", 
      }, 
      [29054] = 
      {
         Tunnel = 0, 
         Vnum = 29054, 
         Sector = "city", 
         Description = "Young and unexperienced members of Alfuh City come here to practice\
their skills of battle. The walls are stained from oil and droid\
parts line the walls of the room. There is a sign here too.  Look at\
the sign for more information. You can continue east from here.\
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
               DestinationVnum = 29053, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Alfuh Elementary Academy", 
      }, 
      [29055] = 
      {
         Tunnel = 0, 
         Vnum = 29055, 
         Sector = "city", 
         Description = "Welcome to the Alfuh City Academy!  This is the room in which youth\
members can get some free armor and equipment.  Well it isn't\
completely free, the town pays for it.  Be warned, this equipment is\
NOT high quality, it is only intended to get young players started. \
To the west is more of the academy. If you have any equipment you\
would like to leave for others, you can do that too.\
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
               DestinationVnum = 29053, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [23] = "Hotel", 
            [14] = "Donation", 
            [7] = "NoMagic", 
         }, 
         Name = "Alfuh Elementary Academy", 
      }, 
   }, 
   LowEconomy = 31248311, 
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
   Filename = "adari.lua", 
   HighEconomy = 0, 
   ResetFrequency = 0, 
   Author = "Merth", 
   ResetMessage = "", 
   FileFormatVersion = 1, 
}
