-- Skills
-- Last saved Tuesday 30-Jun-2020 18:36:19

SkillEntry
{
   Ability = "force", 
   Level = 2, 
   Messages = 
   {
      WearOff = "!Cause Light!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "spell", 
   }, 
   Mana = 15, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_cause_light", 
   Slot = 62, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "force spray", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 28, 
   Messages = 
   {
      WearOff = "Furrowing your brow, you sense the weight of wisdom leave you.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N grows serious as wisdom takes root within $M.", 
         ToVictim = "The wisdom of the Force blossoms within you.", 
         ToCaster = "$N grows serious as wisdom takes root within $M.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 12, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "1+(l/17)", 
         Location = 4, 
         Duration = "l*24", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 228, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "forethought", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 11, 
   Messages = 
   {
      WearOff = "The protection of the Force fades away.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N beams as a powerful blessing is laid upon $M.", 
         ToVictim = "A powerful blessing is laid upon you.", 
         ToCaster = "You lay the blessing of the Force upon $N.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 5, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "l/8", 
         Location = 18, 
         Duration = "l*23", 
      }, 
      [3] = 
      {
         Modifier = "-(l/8)", 
         Location = 24, 
         Duration = "l*23", 
      }, 
   }, 
   Alignment = 999, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 3, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "good fortune", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 43, 
   Messages = 
   {
      WearOff = "You are no longer masked.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N fades from existence.", 
         ToVictim = "You fade from existence.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 20, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "mass invis", 
         Location = 26, 
         Duration = "l*11", 
      }, 
   }, 
   Beats = 24, 
   Flags = 
   {
      [24] = "Group", 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 69, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "group masking", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 56, 
   Messages = 
   {
      WearOff = "!WEAROFF!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "Hand of Chaos", 
   }, 
   Mana = 15, 
   Beats = 8, 
   Alignment = -1001, 
   Flags = 
   {
      [8] = "_08", 
      [9] = "_09", 
      [2] = "_02", 
      [3] = "_03", 
      [7] = "_07", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_hand_of_chaos", 
   Slot = 307, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "Hand of Darkness", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 26, 
   Messages = 
   {
      WearOff = "!Harm!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "harm spell", 
   }, 
   Mana = 35, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_harm", 
   Slot = 27, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "harm", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 30, 
   Messages = 
   {
      WearOff = "!Heal!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "A warm feeling fills your body.", 
         ToCaster = "You lay a hand of healing upon $N.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 50, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "100", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 28, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "heal", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 15, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "You feel less aware of your surroundings.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's senses are heightened to those of an animal.", 
         ToVictim = "Your senses are heightened to those of an animal.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "detect hidden", 
         Location = 26, 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 44, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "heightened awareness", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Messages = 
   {
      WearOff = "!Continual Light!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "Shards of iridescent light collide to form a dazzling ball...", 
         ToVictim = "", 
         ToCaster = "Shards of iridescent light collide to form a dazzling ball...", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 4, 
   Beats = 12, 
   Mana = 7, 
   Flags = 
   {
      [9] = "_09", 
      [25] = "Object", 
      [3] = "_03", 
   }, 
   Value = 21, 
   Target = "ignore", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 57, 
   Type = "Force Power", 
   Dice = "0", 
   Name = "illuminate", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 55, 
   Messages = 
   {
      WearOff = "You soften.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's face hardens.", 
         ToVictim = "You steel yourself against pain.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 12, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "8192", 
         Location = 27, 
         Duration = "l*30", 
      }, 
      [3] = 
      {
         Modifier = "5", 
         Location = 5, 
         Duration = "l*20", 
      }, 
      [4] = 
      {
         Modifier = "l*4", 
         Location = 13, 
         Duration = "l*30", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 18, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 66, 
   Type = "Force Power", 
   Target = "self", 
   Name = "inner fortress", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 10, 
   Messages = 
   {
      WearOff = "!Cause Serious!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "spell", 
   }, 
   Mana = 17, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_cause_serious", 
   Slot = 64, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "invade essence", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 20, 
   Mana = 12, 
   Messages = 
   {
      WearOff = "!Identify!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 24, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_identify", 
   Slot = 53, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "know essence", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 5, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "You are no longer invisible.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "A momentary lapse in attention, and $N is out of sight.", 
         ToVictim = "You fade from existence.", 
         ToCaster = "A momentary lapse in attention, and $N is out of sight.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "invis", 
         Location = 26, 
         Duration = "l*11", 
      }, 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
      [7310] = "jedi salesman", 
      [50] = "Master Yoda", 
   }, 
   Function = "spell_invis", 
   Slot = 29, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "mask", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 13, 
   Mana = 10, 
   Messages = 
   {
      WearOff = "You feel less sick.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "poison", 
   }, 
   Alignment = -1001, 
   Beats = 20, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_poison", 
   Slot = 33, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "poison", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 150, 
   Messages = 
   {
      WearOff = "You return to your body.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "possess", 
   }, 
   Mana = 120, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_possess", 
   Slot = 232, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "possess", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 12, 
   Messages = 
   {
      WearOff = "You feel less protected from the Dark Side.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N is blessed with a protection from the Dark Side.", 
         ToVictim = "You are blessed with a protection from the Dark Side.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 5, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "protection", 
         Location = 26, 
         Duration = "l*10", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 34, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "protection from darkness", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 6, 
   Messages = 
   {
      WearOff = "!Refresh!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "Blooming vitality flows through you.", 
         ToCaster = "You allow blooming vitality to flow from you to $N.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "refresh", 
   }, 
   Mana = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 14, 
         Modifier = "l", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 18, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 81, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "refresh", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 8, 
   Mana = 10, 
   Messages = 
   {
      WearOff = "!Remove Invis!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_remove_invis", 
   Slot = 230, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "remove masking", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 29, 
   Mana = 35, 
   Messages = 
   {
      WearOff = "!Remove trap!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_remove_trap", 
   Slot = 87, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "remove trap", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "???", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 101, 
   Position = "standing", 
   Target = "ignore", 
   Name = "reserved", 
   Type = "Force Power", 
}

SkillEntry
{
   Ability = "force", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "A warm feeling flows through $N.", 
         ToVictim = "A warm feeling flows through you.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "200", 
      }, 
   }, 
   Level = 60, 
   Beats = 20, 
   Mana = 80, 
   Flags = 
   {
      [24] = "Group", 
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Alignment = 1001, 
   Participants = 2, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 113, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "restoration", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 27, 
   Messages = 
   {
      WearOff = "The luminous aura about your body fades away.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "A luminous aura spreads slowly over $N's body.", 
         ToVictim = "A luminous aura spreads slowly over your body.", 
         ToCaster = "A luminous aura spreads slowly over $N's body.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 75, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "sanctuary", 
         Location = 26, 
         Duration = "(l*4)+30", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 36, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "sanctuary", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 73, 
   Messages = 
   {
      WearOff = "!Scorching Surge!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "scorching surge", 
   }, 
   Mana = 25, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_scorching_surge", 
   Slot = 296, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "scorching surge", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 26, 
   Messages = 
   {
      WearOff = "Your force shield shimmers then fades away.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "A force shield of shimmering blue surrounds $N.", 
         ToVictim = "A force shield of shimmering blue surrounds you.", 
         ToCaster = "A force shield of shimmering blue surrounds $N.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 12, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "-50", 
         Location = 17, 
         Duration = "l*20", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 18, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 67, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "shield", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 14, 
   Messages = 
   {
      WearOff = "!Shocking Grasp!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "shocking grasp", 
   }, 
   Mana = 15, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_shocking_grasp", 
   Slot = 51, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "shocking grasp", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Messages = 
   {
      WearOff = "The torrents of cascading energy suddenly fade away.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "Torrents of cascading energy form around $N.", 
         ToVictim = "Torrents of cascading energy form around you.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 72, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "shockshield", 
         AffectedBy = "Blind", 
         Location = 26, 
         Duration = "(l*3)+14", 
      }, 
   }, 
   Mana = 95, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 89, 
   Type = "Force Power", 
   Target = "self", 
   Name = "shockshield", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 24, 
   Mana = 15, 
   Messages = 
   {
      WearOff = "You feel less tired.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_sleep", 
   Slot = 38, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "sleep", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 18, 
   Messages = 
   {
      WearOff = "You suddenly feel less coordinated...", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N suddenly appears more agile...", 
         ToVictim = "You suddenly feel more nimble...", 
         ToCaster = "$N suddenly appears more agile...", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 40, 
      }, 
      [3] = 
      {
         Modifier = "1+(l/17)", 
         Location = 2, 
         Duration = "l*24", 
      }, 
      [4] = 
      {
         Modifier = "l/8", 
         Location = 40, 
         Duration = "l*20", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 205, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "slink", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 77, 
   Mana = 70, 
   Messages = 
   {
      WearOff = "Your vision descends to the material plane.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's eyes begin to glow a soft white.", 
         ToVictim = "Your vision is elevated to the highest plane.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "truesight", 
         AffectedBy = "Blind", 
         Location = 26, 
         Duration = "l*5", 
      }, 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 235, 
   Type = "Force Power", 
   Target = "self", 
   Name = "true sight", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 66, 
   Messages = 
   {
      WearOff = "Your intricate defenses are restored to their original quality.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "Your spell has no effect upon $N.", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's eyes widen in fear as $S defenses are unravelled.", 
         ToVictim = "Your defenses are unravelled before your very eyes.", 
         ToCaster = "$N's eyes widen in fear as $S defenses are unravelled.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 70, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "8192", 
         Location = 29, 
         Duration = "(l*3)+25", 
      }, 
      [3] = 
      {
         Modifier = "1048576", 
         Location = 29, 
         Duration = "(l*3)+25", 
      }, 
   }, 
   Beats = 15, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 110, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "unravel defense", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 9, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "!Ventriloquate!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_ventriloquate", 
   Slot = 41, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "ventriloquate", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 3, 
   Mana = 20, 
   Messages = 
   {
      WearOff = "You feel stronger.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "spell", 
   }, 
   Alignment = -1001, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_weaken", 
   Slot = 68, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "weaken", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 50, 
   Beats = 20, 
   Messages = 
   {
      WearOff = "&cYour mind is no longer focused enough to see those hidden from you.&R&w", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "&cYou focus your senses to find those that would hide from you.&R&W", 
         ToCaster = "You focus your senses to find those that would hide from you.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your senses.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "detect hidden", 
         Location = 26, 
         Duration = "l*5", 
      }, 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "AcuteAwareness", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 99, 
   Beats = 20, 
   Messages = 
   {
      WearOff = "&cYour mind relaxes its focus on increasing your damage.&R&w", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "&cYou focus your strength to increase your damage.&R&W", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your abilities.&R&W", 
      }, 
      NounDamage = "You focus on your opponents weak points increasing your damage.", 
   }, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "2+(l/33)", 
         Location = 19, 
         Duration = "l*10", 
      }, 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "AcuteDamage", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "leadership", 
   Level = 50, 
   Beats = 12, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_add_patrol", 
   Name = "AddPatrol", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "diplomacy", 
   Level = 1, 
   Beats = 12, 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32006] = "old teacher master man human scholar", 
   }, 
   Messages = 
   {
      WearOff = "!Aid!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_aid", 
   Name = "aid", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 35, 
   Beats = 6, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "&RYou fumble with the binds.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Target = "offensive", 
   Type = "Skill", 
   Function = "spell_charm_person", 
   Name = "apprehend", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 6, 
   Beats = 12, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Messages = 
   {
      WearOff = "!Backstab!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "backstab", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_backstab", 
   Name = "backstab", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 47, 
   Beats = 8, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Bash!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "bash", 
   }, 
   Target = "offensive", 
   Type = "Skill", 
   Function = "do_bash", 
   Name = "bash", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 1, 
   Beats = 20, 
   Teachers = 
   {
      [210] = "begger", 
   }, 
   Messages = 
   {
      WearOff = "!Beg!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_beg", 
   Name = "beg", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 85, 
   Beats = 4, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "???", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "offensive", 
   Type = "Skill", 
   Function = "do_berserk", 
   Name = "berserk", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 45, 
   Beats = 3, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "offensive", 
   Type = "Skill", 
   Function = "do_bind", 
   Name = "bind", 
   Position = "dead", 
}

SkillEntry
{
   Ability = "diplomacy", 
   Level = 25, 
   Beats = 12, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_bribe", 
   Name = "bribe", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 90, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "capital ships", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 50, 
   Beats = 16, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Messages = 
   {
      WearOff = "!Circle!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "circle", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_circle", 
   Name = "circle", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 7, 
   Beats = 10, 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Messages = 
   {
      WearOff = "!climb!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "climb", 
   }, 
   Target = "offensive", 
   Type = "Skill", 
   Function = "do_climb", 
   Name = "climb", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 35, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "dead", 
   Name = "cloak", 
   Function = "do_disguise", 
}

SkillEntry
{
   Ability = "force", 
   Level = 20, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "dead", 
   Name = "cutdoor", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 32, 
   Beats = 24, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Messages = 
   {
      WearOff = "!Detrap!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_detrap", 
   Name = "detrap", 
   Position = "sitting", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 2, 
   Beats = 20, 
   Teachers = 
   {
      [6805] = "mine foreman Krauota", 
      [206] = "technician", 
      [6819] = "boss Hityii", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_dig", 
   Name = "dig", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 45, 
   Beats = 24, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Disarm!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_disarm", 
   Name = "disarm", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 70, 
   Beats = 12, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Messages = 
   {
      WearOff = "!disguise!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_disguise", 
   Name = "disguise", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 50, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Dodge!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "fighting", 
   Name = "dodge", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "leadership", 
   Level = 75, 
   Beats = 12, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "&BYou fail.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Target = "offensive", 
   Type = "Skill", 
   Function = "spell_charm_person", 
   Name = "dominate", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 10, 
   Beats = 24, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Messages = 
   {
      WearOff = "!Bash Door!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "bashdoor", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_bashdoor", 
   Name = "doorbash", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 27, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Dual Wield!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "standing", 
   Name = "dual wield", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "leadership", 
   Level = 85, 
   Beats = 12, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_elite_guard", 
   Name = "EliteGuard", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 10, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Enhanced Damage!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "fighting", 
   Name = "enhanced damage", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 105, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "dead", 
   Name = "fake signal", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 140, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Fifth Attack!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "fighting", 
   Name = "fifth attack", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "diplomacy", 
   Level = 1, 
   Beats = 12, 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32006] = "old teacher master man human scholar", 
   }, 
   Messages = 
   {
      WearOff = "!First Aid!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_first_aid", 
   Name = "FirstAid", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 70, 
   Beats = 20, 
   Messages = 
   {
      WearOff = "&cYour mind wanders from strengthening your body.&R&w", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "&cA strong mind leads to a stronger body.&R&W", 
         ToCaster = "A strong mind leads to a stronger body.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your energy.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "2+(l/33)", 
         Location = 1, 
         Duration = "l*10", 
      }, 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "FocusStrength", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 115, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Fourth Attack!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "fighting", 
   Name = "fourth attack", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "leadership", 
   Level = 100, 
   Beats = 40, 
   Difficulty = 4, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_gather_intelligence", 
   Name = "GatherIntelligence", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 30, 
   Beats = 10, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Gouge!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "gouge", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_gouge", 
   Name = "gouge", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 61, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "grenades", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 50, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Grip!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "fighting", 
   Name = "grip", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 85, 
   Beats = 20, 
   Messages = 
   {
      WearOff = "&cYou lose your focus on your opponent.&R&w", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "&cYou focus on your ability to hit your opponent.&R&W", 
         ToCaster = "You focus on your ability to hit your oponent.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your skills.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "2+(l/33)", 
         Location = 18, 
         Duration = "l*10", 
      }, 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "HeightenedAccuracy", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 95, 
   Beats = 12, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Messages = 
   {
      WearOff = "!Hijack!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_hijack", 
   Name = "hijack", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 87, 
   Beats = 12, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!HitAll!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "hit", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_hitall", 
   Name = "hitall", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 80, 
   Beats = 20, 
   Messages = 
   {
      WearOff = "&cYou soften against all pain.&R&w", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "&cYou harden yourself against all pain.&R&W", 
         ToCaster = "You harden yourself against pain.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your energy.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "32", 
         Location = 27, 
         Duration = "l*10", 
      }, 
      [3] = 
      {
         Modifier = "8192", 
         Location = 27, 
         Duration = "l*10", 
      }, 
      [4] = 
      {
         Modifier = "2097152", 
         Location = 27, 
         Duration = "l*10", 
      }, 
      [5] = 
      {
         Modifier = "8", 
         Location = 27, 
         Duration = "l*10", 
      }, 
      [6] = 
      {
         Modifier = "1+(l/50)", 
         Location = 5, 
         Duration = "l*10", 
      }, 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "InnerStrength", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "leadership", 
   Level = 25, 
   Beats = 12, 
   Teachers = 
   {
      [408] = "human police officer cop", 
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_jail", 
   Name = "jail", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 80, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "dead", 
   Name = "jumpvector", 
   Function = "do_jumpvector", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 6, 
   Beats = 8, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Kick!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "kick", 
   }, 
   Target = "offensive", 
   Type = "Skill", 
   Function = "do_kick", 
   Name = "kick", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 20, 
   Beats = 24, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Messages = 
   {
      WearOff = "!Steal!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_steal", 
   Name = "lift", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 25, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "lightsaber crafting", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 90, 
   Beats = 20, 
   Messages = 
   {
      WearOff = "&cYour muscles stiffen as your efforts to relax them fade.&R&w", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "&cYou relax your muscles becoming more limber and agile.&R&W", 
         ToCaster = "You relax your muscles becoming limber and agile.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "&RYou can't become any more limber.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "2+(l/33)", 
         Location = 2, 
         Duration = "l*10", 
      }, 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "limber", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 58, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makearmor", 
   Function = "do_makearmor", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 40, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makeblade", 
   Function = "do_makeblade", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 95, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makeblaster", 
   Function = "do_makeblaster", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 40, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makebowcaster", 
   Function = "do_makebowcaster", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 5, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makecomlink", 
   Function = "do_makecomlink", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 1, 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [206] = "technician", 
      [32010] = "Twilek craftswoman woman", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makecontainer", 
   Function = "do_makecontainer", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 10, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makeglowrod", 
   Function = "do_makeglowrod", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 95, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makegrenade", 
   Function = "do_makegrenade", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 60, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makejewelry", 
   Function = "do_makejewelry", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 80, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makelandmine", 
   Function = "do_makelandmine", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 70, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "makeshield", 
   Function = "do_makeshield", 
}

SkillEntry
{
   Ability = "diplomacy", 
   Level = 80, 
   Beats = 12, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
   }, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_mass_propaganda", 
   Name = "MassPropaganda", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 1, 
   Beats = 25, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "You meditate peacefully, tuning yourself to the Force.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "You spend several minutes in deep concentration, but fail to find the Force.", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 12, 
         Modifier = "l", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [31900] = "zim failed jedi", 
   }, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "meditate", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 30, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "midships", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 90, 
   Beats = 12, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!mine!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_mine", 
   Name = "mine", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 7, 
   Beats = 10, 
   Teachers = 
   {
      [412] = "Self Defence Trainer", 
      [10509] = "An instructor", 
   }, 
   Messages = 
   {
      WearOff = "!Search!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_mount", 
   Name = "mount", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 1, 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [10340] = "Domick Dom teacher", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "navigation", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "force", 
   Level = 25, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Messages = 
   {
      WearOff = "!Parry!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "fighting", 
   Name = "parry", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 20, 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Messages = 
   {
      WearOff = "!Peek!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "standing", 
   Name = "peek", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 55, 
   Beats = 12, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Messages = 
   {
      WearOff = "!Pick!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_pick", 
   Name = "pick lock", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 90, 
   Beats = 12, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Messages = 
   {
      WearOff = "!Pickshiplock!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_pickshiplock", 
   Name = "pick ship lock", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 30, 
   Beats = 12, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Messages = 
   {
      WearOff = "!Poison Weapon!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "poisonous concoction", 
   }, 
   Target = "objinv", 
   Type = "Skill", 
   Function = "do_poison_weapon", 
   Name = "PoisonWeapon", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "leadership", 
   Level = 35, 
   Beats = 12, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!post guard!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_postguard", 
   Name = "PostGuard", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "diplomacy", 
   Level = 50, 
   Beats = 4, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_propaganda", 
   Name = "propaganda", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 40, 
   Beats = 8, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Punch!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "punch", 
   }, 
   Target = "offensive", 
   Type = "Skill", 
   Function = "do_punch", 
   Name = "punch", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "leadership", 
   Level = 60, 
   Beats = 12, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!reinforcements!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_reinforcements", 
   Name = "reinforcements", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 8, 
   Beats = 12, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Rescue!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_rescue", 
   Name = "rescue", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 120, 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [10340] = "Domick Dom teacher", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "dead", 
   Name = "sabotage", 
   Function = "do_sabotage", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 1, 
   Beats = 12, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [10340] = "Domick Dom teacher", 
      [320] = "human citizen", 
   }, 
   Messages = 
   {
      WearOff = "!Scan!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_scan", 
   Name = "scan", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 3, 
   Beats = 20, 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Messages = 
   {
      WearOff = "!Search!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_search", 
   Name = "search", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 45, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Second Attack!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "fighting", 
   Name = "second attack", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "diplomacy", 
   Level = 65, 
   Beats = 12, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
   }, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_seduce", 
   Name = "seduce", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 60, 
   Beats = 20, 
   Messages = 
   {
      WearOff = "&cYour focus to see the unseen relaxes.&R&w", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "&cYou focus your senses in an effort to detect the unseen.&R&W", 
         ToCaster = "You focus your senses in an effort to detect the unseen.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your mind.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "detect invis", 
         Location = 26, 
         Duration = "l*5", 
      }, 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "SeeMasking", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 30, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "dead", 
   Name = "ship docking", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 25, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "ship maintenance", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 1, 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [10340] = "Domick Dom teacher", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "ship systems", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 1, 
   Beats = 5, 
   Teachers = 
   {
      [328] = "Sleejat", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_skin", 
   Name = "skin", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 105, 
   Beats = 3, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "spell_null", 
   Name = "slicing", 
   Position = "dead", 
}

SkillEntry
{
   Ability = "diplomacy", 
   Level = 10, 
   Beats = 4, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_smalltalk", 
   Name = "smalltalk", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 5, 
   Beats = 1, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "You attempt to move silently.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "You attempt to move silently.", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "sneak", 
         Location = 26, 
         Duration = "l*23", 
      }, 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "sneak", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 2, 
   Beats = 12, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!snipe!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_snipe", 
   Name = "snipe", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 25, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "space combat 1", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 50, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "space combat 2", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 75, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "space combat 3", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "leadership", 
   Level = 95, 
   Beats = 12, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_special_forces", 
   Name = "SpecialForces", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 75, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "dead", 
   Name = "speeder combat", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 30, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "dead", 
   Name = "speeders", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "engineering", 
   Level = 50, 
   Teachers = 
   {
      [32029] = "hutt crimelord", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "spice refining", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 1, 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [10340] = "Domick Dom teacher", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "starfighters", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "smuggling", 
   Level = 50, 
   Beats = 12, 
   Messages = 
   {
      WearOff = "You are no longer hidden.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "You attempt to hide.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "You attempt to hide.", 
      }, 
      NounDamage = "", 
   }, 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "hide", 
         Location = 26, 
         Duration = "l*23", 
      }, 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "do_hide", 
   Name = "stealth", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "diplomacy", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32006] = "old teacher master man human scholar", 
   }, 
   Function = "do_study", 
   Type = "Skill", 
   Target = "objinv", 
   Name = "study", 
   Position = "dead", 
}

SkillEntry
{
   Ability = "none", 
   Level = 105, 
   Beats = 8, 
   Messages = 
   {
      WearOff = "You regain consciousness.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "stun", 
   }, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Target = "offensive", 
   Type = "Skill", 
   Function = "do_punch", 
   Name = "stun", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 95, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Third Attack!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "fighting", 
   Name = "third attack", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 5, 
   Beats = 3, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!throw!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_throw", 
   Name = "throw", 
   Position = "sitting", 
}

SkillEntry
{
   Ability = "leadership", 
   Level = 85, 
   Beats = 12, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32029] = "hutt crimelord", 
   }, 
   Messages = 
   {
      WearOff = "!torture!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_torture", 
   Name = "torture", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "bounty hunting", 
   Level = 3, 
   Beats = 14, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Messages = 
   {
      WearOff = "!Track!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Function = "do_track", 
   Name = "track", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 35, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "tractor beams", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "force", 
   Level = 60, 
   Beats = 32, 
   Messages = 
   {
      WearOff = "!TRANCE!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "You enter a peaceful trance, tuning yourself to the Force.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "You spend several minutes in a deep trance, but fail to find the Force.", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 12, 
         Modifier = "l*2", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Target = "self", 
   Type = "Skill", 
   Function = "spell_smaug", 
   Name = "trance", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "piloting", 
   Level = 2, 
   Teachers = 
   {
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
   }, 
   Messages = 
   {
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Skill", 
   Position = "resting", 
   Name = "weapon systems", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 2, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "!Blasters!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Weapon", 
   Position = "fighting", 
   Name = "blasters", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Bludgeons!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 101, 
   Position = "fighting", 
   Function = "spell_null", 
   Name = "bludgeons", 
   Type = "Weapon", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 4, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Weapon", 
   Position = "fighting", 
   Name = "bowcasters", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Flexible Arms!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 101, 
   Position = "fighting", 
   Function = "spell_null", 
   Name = "flexible arms", 
   Type = "Weapon", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 3, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Weapon", 
   Position = "dead", 
   Name = "force pikes", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "force", 
   Level = 2, 
   Teachers = 
   {
      [31900] = "zim failed jedi", 
      [605] = "ancient sith spirit teacher sith9870", 
      [50] = "Master Yoda", 
   }, 
   Messages = 
   {
      WearOff = "!Lightsabers!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Weapon", 
   Position = "fighting", 
   Name = "lightsabers", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Talonous Arms!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 101, 
   Position = "fighting", 
   Function = "spell_null", 
   Name = "talonous arms", 
   Type = "Weapon", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 1, 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [10340] = "Domick Dom teacher", 
   }, 
   Messages = 
   {
      WearOff = "!Vibro-Blades!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Type = "Weapon", 
   Position = "fighting", 
   Name = "vibro-blades", 
   Function = "spell_null", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Adarian!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "adarese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_smaug", 
   Name = "antarian", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "barabel", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Common!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "basic", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_smaug", 
   Name = "binary", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "bothese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "chadra-fan", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "coyn", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "defel", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_smaug", 
   Name = "devaronese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "dosh", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "durese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "ewokese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_smaug", 
   Name = "falleen", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "firrerreo", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Gamorrean!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "gamorrese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "gand", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Hutt!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "huttese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_smaug", 
   Name = "ithorese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Jawa!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "jawaese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "kubazian", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Mon Calamari!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "mon calamarian", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "quarrenese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Rodian!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "rodese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Noghri!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "shistavanen", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Wookiee!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "shyriiwook", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "sullustese", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "togorian", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!Dwarven!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "twileki", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "!!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "verpine", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "none", 
   Target = "ignore", 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Name = "yevethan", 
   Type = "Tongue", 
}

SkillEntry
{
   Ability = "force", 
   Level = 55, 
   Messages = 
   {
      WearOff = "You soften.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's face hardens.", 
         ToVictim = "You steel yourself against pain.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 12, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "8192", 
         Location = 27, 
         Duration = "l*30", 
      }, 
      [3] = 
      {
         Modifier = "4", 
         Location = 5, 
         Duration = "l*30", 
      }, 
      [4] = 
      {
         Modifier = "l*4", 
         Location = 13, 
         Duration = "l*30", 
      }, 
   }, 
   Alignment = -1001, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Beats = 18, 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Target = "self", 
   Name = "harden", 
   Position = "dead", 
}

SkillEntry
{
   Ability = "force", 
   Level = 105, 
   Messages = 
   {
      WearOff = "!Dispel Evil!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "dispel evil", 
   }, 
   Mana = 15, 
   Beats = 12, 
   Alignment = 1001, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_dispel_evil", 
   Slot = 22, 
   Type = "unknown", 
   Target = "offensive", 
   Name = "dispel dark", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 105, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Target = "ignore", 
   Type = "unknown", 
   Position = "dead", 
   Name = "stun", 
   Function = "spell_smaug", 
}

SkillEntry
{
   Ability = "combat", 
   Level = 101, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Target = "ignore", 
   Type = "unknown", 
   Position = "dead", 
   Name = "unknown", 
   Function = "spell_smaug", 
}

SkillEntry
{
   Ability = "force", 
   Messages = 
   {
      WearOff = "Your pent up energy disperses into the deck.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's eyelids seem heavy for a moment.", 
         ToVictim = "You prepare to absorb incoming energy.", 
         ToCaster = "$N's eyelids seem heavy for a moment.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "8", 
         Location = 28, 
         Duration = "l*5", 
      }, 
   }, 
   Level = 60, 
   Beats = 4, 
   Mana = 50, 
   Flags = 
   {
      [9] = "_09", 
   }, 
   Value = 30, 
   Target = "self", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 85, 
   Type = "Force Power", 
   Dice = "none", 
   Name = "absorb energy", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 28, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "You feel more self-confident.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_charm_person", 
   Slot = 7, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "affect mind", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 26, 
   Mana = 60, 
   Messages = 
   {
      WearOff = "You are suddenly less alert.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's eyes dart about the room in an alert manner.", 
         ToVictim = "You suddenly feel alert.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "4194304", 
         Location = 27, 
         Duration = "l*15", 
      }, 
      [3] = 
      {
         Modifier = "1024", 
         Location = 27, 
         Duration = "l*15", 
      }, 
      [4] = 
      {
         Modifier = "32", 
         Location = 28, 
         Duration = "l*15", 
      }, 
      [5] = 
      {
         Modifier = "8", 
         Location = 27, 
         Duration = "l*15", 
      }, 
   }, 
   Beats = 15, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 102, 
   Type = "Force Power", 
   Target = "self", 
   Name = "alertness", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      WearOff = "Your lungs revert to their original state.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's lungs take on the ability to breathe water...", 
         ToVictim = "Your lungs take on the ability to breathe water...", 
         ToCaster = "$N's lungs take on the ability to breathe water...", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 101, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "aqua breath", 
         Location = 26, 
         Duration = "l*23", 
      }, 
   }, 
   Mana = 50, 
   Beats = 12, 
   Alignment = 100, 
   Flags = 
   {
      [21] = "Recastable", 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 236, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "aqua breath", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 5, 
   Messages = 
   {
      WearOff = "Your armor returns to its mundane value.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's armor begins to glow softly as it is enhanced by the Force.", 
         ToVictim = "Your armor begins to glow softly as it is enhanced by the Force.", 
         ToCaster = "$N's armor begins to glow softly as it is enhanced by the Force.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 5, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "-20", 
         Location = 17, 
         Duration = "l*20", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 1, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "armor", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 6, 
   Messages = 
   {
      WearOff = "You stop enhancing yourself.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N suddenly seems like a much nicer person.", 
         ToVictim = "Drawing the Force, you change yourself to be more likeable.", 
         ToCaster = "$N seems more jovial.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 14, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "1+(l/17)", 
         Location = 25, 
         Duration = "l*24", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 226, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "beauty", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 10, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "You can see again.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Alignment = -1001, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_blindness", 
   Slot = 4, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "blindness", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 20, 
   Messages = 
   {
      WearOff = "!Cause Critical!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N begins to claw at $S throat.", 
         ToVictim = "You feel a tight pressure around your throat.", 
         ToCaster = "Stretching out with the force you slowly choke your victim.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "spell", 
   }, 
   Mana = 20, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_cause_critical", 
   Slot = 63, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "choke", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 8, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "!Cure Blindness!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_cure_blindness", 
   Slot = 14, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "cure blindness", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 18, 
   Messages = 
   {
      WearOff = "!Cure Critical!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "Your critical wounds close and your pain ebbs away.", 
         ToCaster = "You cure $N's critical wounds.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 20, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "3d8+(l-6)", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 15, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "cure critical", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 2, 
   Messages = 
   {
      WearOff = "Your ability to see in the dark fades away.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "Your light wounds mend and your pain ebbs slightly.", 
         ToCaster = "You cure $N's light wounds.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 10, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "1d8+(l/3)", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [31900] = "zim failed jedi", 
   }, 
   Function = "spell_smaug", 
   Slot = 16, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "cure light", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 16, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "!Cure Poison!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_cure_poison", 
   Slot = 43, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "cure poison", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 10, 
   Messages = 
   {
      WearOff = "!Cure Serious!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "Your serious wounds mend and your pain ebbs away.", 
         ToCaster = "You cure $N's serious wounds.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 15, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "2d8+(l/2)", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 61, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "cure serious", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 5, 
   Messages = 
   {
      WearOff = "You stop focusing on the Dark Side.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "A tint of red appears in $N's eyes, mirroring his own vision.", 
         ToVictim = "Traces of red outline all those who abuse the Force.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 5, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "detect evil", 
         Location = 26, 
         Duration = "l*24", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 18, 
   Type = "Force Power", 
   Target = "self", 
   Name = "detect darkness", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 5, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "The blue outlines disappear from your vision.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "A tint of blue in $N's eyes mirrors $S own perception.", 
         ToVictim = "Traces of blue outline objects touched by the Force.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "detect magic", 
         Location = 26, 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 20, 
   Type = "Force Power", 
   Target = "self", 
   Name = "detect force", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 8, 
   Mana = 9, 
   Messages = 
   {
      WearOff = "!Know Alignment!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_know_alignment", 
   Slot = 58, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "detect intent", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 4, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "You no longer see invisible objects.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's eyes fixate as they gain the ability to see the unseen.", 
         ToVictim = "Your eyes fixate as they gain the ability to see the unseen.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "detect invis", 
         Location = 26, 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
      [7310] = "jedi salesman", 
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 19, 
   Type = "Force Power", 
   Target = "self", 
   Name = "detect masking", 
   Position = "sitting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 9, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "!Detect Poison!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_detect_poison", 
   Slot = 21, 
   Type = "Force Power", 
   Target = "objinv", 
   Name = "detect poison", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 13, 
   Mana = 15, 
   Messages = 
   {
      WearOff = "You feel less aware of the dangers about you.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N peers about the room, intent on finding all manner of danger.", 
         ToVictim = "You suddenly grow aware of the dangers about you.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "detect traps", 
         Location = 26, 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 86, 
   Type = "Force Power", 
   Target = "self", 
   Name = "detect traps", 
   Position = "resting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 20, 
   Mana = 15, 
   Messages = 
   {
      WearOff = "!Dispel Magic!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_dispel_magic", 
   Slot = 59, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "dispel force", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 27, 
   Messages = 
   {
      WearOff = "!Energy Drain!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "energy drain", 
   }, 
   Mana = 35, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_energy_drain", 
   Slot = 25, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "drain essence", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 35, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "!Dream!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_dream", 
   Slot = 233, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "dream", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 15, 
   Mana = 15, 
   Messages = 
   {
      WearOff = "!Earthquake!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "earthquake", 
   }, 
   Alignment = -1001, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_earthquake", 
   Slot = 23, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "earthquake", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 70, 
   Mana = 15, 
   Messages = 
   {
      WearOff = "!Farsight!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_farsight", 
   Slot = 222, 
   Type = "Force Power", 
   Target = "ignore", 
   Name = "farsight", 
   Position = "sitting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 46, 
   Messages = 
   {
      WearOff = "You no longer feel so sleepy.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "Mysteriously, $N was not affected by your spell.", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N suddenly appears very tired and drowsy.", 
         ToVictim = "You suddenly grow very tired and drowsy.", 
         ToCaster = "$N suddenly appears very tired and drowsy.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 60, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "1024", 
         Location = 29, 
         Duration = "l*15", 
      }, 
   }, 
   Alignment = -1001, 
   Beats = 15, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 103, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "fatigue", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Messages = 
   {
      WearOff = "You no longer feel so feeble.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "$N is not affected by your spell.", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$n lays a curse of feebleness upon $N.", 
         ToVictim = "You grow feeble from a powerful curse.", 
         ToCaster = "You lay a curse of feebleness upon $N.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 80, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "512", 
         Location = 29, 
         Duration = "l*19", 
      }, 
   }, 
   Mana = 30, 
   Beats = 10, 
   Alignment = -1001, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 107, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "feebleness", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 18, 
   Messages = 
   {
      WearOff = "!Fireball!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "fireball", 
   }, 
   Mana = 15, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_fireball", 
   Slot = 26, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "fireball", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 26, 
   Messages = 
   {
      WearOff = "!Flamestrike!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "flamestrike", 
   }, 
   Mana = 20, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_flamestrike", 
   Slot = 65, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "flamestrike", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 10, 
   Mana = 8, 
   Messages = 
   {
      WearOff = "Your feet float slowly to the surface.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N begins to float in mid-air...", 
         ToVictim = "You begin to float in mid-air...", 
         ToCaster = "$N begins to float in mid-air...", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "float", 
         Location = 26, 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 18, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 292, 
   Type = "Force Power", 
   Target = "defensive", 
   Name = "float", 
   Position = "standing", 
}

SkillEntry
{
   Beats = 24, 
   Alignment = -1001, 
   Type = "Force Power", 
   Dice = "44*W", 
   Slot = 115, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "blindness", 
         Location = 26, 
         Duration = "6", 
      }, 
   }, 
   Participants = 3, 
   Mana = 120, 
   Messages = 
   {
      WearOff = "", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "spiritual wrath", 
   }, 
   Ability = "force", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Level = 50, 
   Flags = 
   {
      [8] = "_08", 
      [2] = "_02", 
      [3] = "_03", 
      [23] = "NoBrew", 
      [15] = "Area", 
      [22] = "NoScribe", 
      [7] = "_07", 
   }, 
   Position = "fighting", 
   Target = "ignore", 
   Name = "force blast wrath", 
   Function = "spell_smaug", 
}

SkillEntry
{
   Ability = "force", 
   Level = 27, 
   Messages = 
   {
      WearOff = "!Lightning Bolt!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "lightning bolt", 
   }, 
   Mana = 15, 
   Beats = 12, 
   Alignment = -1001, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_lightning_bolt", 
   Slot = 30, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "force bolt", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 90, 
   Messages = 
   {
      WearOff = "The shimmering shell and its protection from the Force fade away...", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "A shimmering translucent shell forms about $N.", 
         ToVictim = "A shimmering translucent shell forms about you.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 40, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "2907151", 
         Location = 27, 
         Duration = "l*24", 
      }, 
      [3] = 
      {
         Modifier = "-80", 
         Location = 17, 
         Duration = "l*20", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 224, 
   Type = "Force Power", 
   Target = "self", 
   Name = "force bubble", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 43, 
   Messages = 
   {
      WearOff = "The funnel of Force about you ceases to exist.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "The Force funnel dissipates before it reaches $N.", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "A Force funnel forms about $N...", 
         ToVictim = "An aura surrounds you, channeling violent energies in your direction!", 
         ToCaster = "You erect a Force funnel about $N...", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 75, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "8", 
         Location = 29, 
         Duration = "l*23", 
      }, 
   }, 
   Alignment = -1001, 
   Beats = 22, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_smaug", 
   Slot = 218, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "force funnel", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 90, 
   Messages = 
   {
      WearOff = "!WEAROFF!", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "Force Lightning", 
   }, 
   Mana = 35, 
   Beats = 8, 
   Alignment = -1001, 
   Flags = 
   {
      [8] = "_08", 
      [9] = "_09", 
      [2] = "_02", 
      [3] = "_03", 
      [7] = "_07", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Function = "spell_black_lightning", 
   Slot = 303, 
   Type = "Force Power", 
   Target = "offensive", 
   Name = "force lightning", 
   Position = "fighting", 
}

SkillEntry
{
   Ability = "force", 
   Level = 80, 
   Messages = 
   {
      WearOff = "You are returned to the mundane energy continuum.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "A shield of Force divides $N from the mundane energy continuum.", 
         ToVictim = "You fade from the mundane energy continuum.", 
         ToCaster = "", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Mana = 75, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "1048576", 
         Location = 27, 
         Duration = "l*24", 
      }, 
      [3] = 
      {
         Modifier = "-50", 
         Location = 17, 
         Duration = "l*20", 
      }, 
   }, 
   Alignment = 1001, 
   Beats = 22, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 217, 
   Type = "Force Power", 
   Target = "self", 
   Name = "force shield", 
   Position = "standing", 
}

SkillEntry
{
   Ability = "force", 
   Level = 4, 
   Mana = 5, 
   Messages = 
   {
      WearOff = "You no longer see in the dark.", 
      VictimImmune = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      VictimDeath = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      Success = 
      {
         ToRoom = "$N's eyes dart about as they grow accustomed to Force sight.", 
         ToVictim = "Heat appears red through your eyes.", 
         ToCaster = "$N's eyes dart about as they grow accustomed to Force sight.", 
      }, 
      Failure = 
      {
         ToRoom = "", 
         ToVictim = "", 
         ToCaster = "", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "infravision", 
         Location = 26, 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 18, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Function = "spell_smaug", 
   Slot = 77, 
   Type = "Force Power", 
   Target = "self", 
   Name = "force sight", 
   Position = "standing", 
}
