-- Skills
-- Last saved Monday 27-Aug-2018 11:44:02

SkillEntry
{
   Mana = 12, 
   Type = "Force Power", 
   Name = "harden", 
   Affects = 
   {
      [2] = 
      {
         Location = 5, 
         Modifier = "4", 
         Duration = "l*30", 
      }, 
      [3] = 
      {
         Location = 27, 
         Modifier = "8192", 
         Duration = "l*30", 
      }, 
      [4] = 
      {
         Location = 13, 
         Modifier = "l*4", 
         Duration = "l*30", 
      }, 
   }, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's face hardens.", 
         ToVictim = "You steel yourself against pain.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You soften.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 18, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "dead", 
   Function = "spell_smaug", 
   Level = 55, 
   Target = "self", 
   Alignment = -1001, 
   Ability = "force", 
}

SkillEntry
{
   Mana = 15, 
   Type = "unknown", 
   Ability = "force", 
   Slot = 22, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Dispel Evil!", 
      NounDamage = "dispel evil", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "fighting", 
   Function = "spell_dispel_evil", 
   Level = 105, 
   Target = "offensive", 
   Alignment = 1001, 
   Name = "dispel dark", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "unknown", 
   Ability = "combat", 
   Position = "dead", 
   Function = "spell_smaug", 
   Level = 105, 
   Target = "ignore", 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Name = "stun", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "unknown", 
   Ability = "combat", 
   Position = "dead", 
   Function = "spell_smaug", 
   Level = 101, 
   Target = "ignore", 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Name = "unknown", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's eyelids seem heavy for a moment.", 
         ToVictim = "You prepare to absorb incoming energy.", 
         ToCaster = "$N's eyelids seem heavy for a moment.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "Your pent up energy disperses into the deck.", 
      VictimImmune = 
      {
      }, 
   }, 
   Mana = 50, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 85, 
   Affects = 
   {
      [2] = 
      {
         Location = 28, 
         Modifier = "8", 
         Duration = "l*5", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Beats = 4, 
   Flags = 
   {
      [9] = "_09", 
   }, 
   Level = 60, 
   Position = "resting", 
   Function = "spell_smaug", 
   Dice = "none", 
   Target = "self", 
   Value = 30, 
   Name = "absorb energy", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 7, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You feel more self-confident.", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "standing", 
   Function = "spell_charm_person", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Target = "offensive", 
   Level = 28, 
   Name = "affect mind", 
}

SkillEntry
{
   Mana = 60, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 102, 
   Beats = 15, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's eyes dart about the room in an alert manner.", 
         ToVictim = "You suddenly feel alert.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You are suddenly less alert.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 27, 
         Modifier = "1024", 
         Duration = "l*15", 
      }, 
      [3] = 
      {
         Location = 27, 
         Modifier = "4194304", 
         Duration = "l*15", 
      }, 
      [4] = 
      {
         Location = 27, 
         Modifier = "8", 
         Duration = "l*15", 
      }, 
      [5] = 
      {
         Location = 28, 
         Modifier = "32", 
         Duration = "l*15", 
      }, 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "self", 
   Level = 26, 
   Name = "alertness", 
}

SkillEntry
{
   Mana = 50, 
   Type = "Force Power", 
   Ability = "none", 
   Slot = 236, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's lungs take on the ability to breathe water...", 
         ToVictim = "Your lungs take on the ability to breathe water...", 
         ToCaster = "$N's lungs take on the ability to breathe water...", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "Your lungs revert to their original state.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "aqua breath", 
         Duration = "l*23", 
      }, 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [21] = "Recastable", 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Level = 101, 
   Target = "defensive", 
   Alignment = 100, 
   Name = "aqua breath", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 1, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's armor begins to glow softly as it is enhanced by the Force.", 
         ToVictim = "Your armor begins to glow softly as it is enhanced by the Force.", 
         ToCaster = "$N's armor begins to glow softly as it is enhanced by the Force.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "Your armor returns to its mundane value.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 17, 
         Modifier = "-20", 
         Duration = "l*20", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Level = 5, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "armor", 
}

SkillEntry
{
   Mana = 14, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 226, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N suddenly seems like a much nicer person.", 
         ToVictim = "Drawing the Force, you change yourself to be more likeable.", 
         ToCaster = "$N seems more jovial.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You stop enhancing yourself.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 25, 
         Modifier = "1+(l/17)", 
         Duration = "l*24", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Level = 6, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "beauty", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 4, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You can see again.", 
      VictimImmune = 
      {
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "fighting", 
   Function = "spell_blindness", 
   Level = 10, 
   Target = "ignore", 
   Alignment = -1001, 
   Name = "blindness", 
}

SkillEntry
{
   Mana = 20, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 63, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N begins to claw at $S throat.", 
         ToVictim = "You feel a tight pressure around your throat.", 
         ToCaster = "Stretching out with the force you slowly choke your victim.", 
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Cause Critical!", 
      NounDamage = "spell", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Function = "spell_cause_critical", 
   Level = 20, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "choke", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 14, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Cure Blindness!", 
      VictimImmune = 
      {
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "fighting", 
   Function = "spell_cure_blindness", 
   Level = 8, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "cure blindness", 
}

SkillEntry
{
   Mana = 20, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 15, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your critical wounds close and your pain ebbs away.", 
         ToCaster = "You cure $N's critical wounds.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Cure Critical!", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "3d8+(l-6)", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Level = 18, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "cure critical", 
}

SkillEntry
{
   Mana = 10, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 16, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your light wounds mend and your pain ebbs slightly.", 
         ToCaster = "You cure $N's light wounds.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "Your ability to see in the dark fades away.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "1d8+(l/3)", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [7310] = "jedi salesman", 
   }, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Level = 2, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "cure light", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 43, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Cure Poison!", 
      VictimImmune = 
      {
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "standing", 
   Function = "spell_cure_poison", 
   Level = 16, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "cure poison", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 61, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your serious wounds mend and your pain ebbs away.", 
         ToCaster = "You cure $N's serious wounds.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Cure Serious!", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "2d8+(l/2)", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Level = 10, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "cure serious", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 18, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "A tint of red appears in $N's eyes, mirroring his own vision.", 
         ToVictim = "Traces of red outline all those who abuse the Force.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You stop focusing on the Dark Side.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect evil", 
         Duration = "l*24", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 5, 
   Target = "self", 
   Alignment = 1001, 
   Name = "detect darkness", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 20, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "A tint of blue in $N's eyes mirrors $S own perception.", 
         ToVictim = "Traces of blue outline objects touched by the Force.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "The blue outlines disappear from your vision.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect magic", 
         Duration = "l*24", 
      }, 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Target = "self", 
   Level = 5, 
   Name = "detect force", 
}

SkillEntry
{
   Mana = 9, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 58, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Know Alignment!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "fighting", 
   Function = "spell_know_alignment", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "defensive", 
   Level = 8, 
   Name = "detect intent", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 19, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's eyes fixate as they gain the ability to see the unseen.", 
         ToVictim = "Your eyes fixate as they gain the ability to see the unseen.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You no longer see invisible objects.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect invis", 
         Duration = "l*24", 
      }, 
   }, 
   Position = "sitting", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
      [7310] = "jedi salesman", 
      [50] = "Master Yoda", 
   }, 
   Target = "self", 
   Level = 4, 
   Name = "detect masking", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 21, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Detect Poison!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "standing", 
   Function = "spell_detect_poison", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "objinv", 
   Level = 9, 
   Name = "detect poison", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 86, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N peers about the room, intent on finding all manner of danger.", 
         ToVictim = "You suddenly grow aware of the dangers about you.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You feel less aware of the dangers about you.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect traps", 
         Duration = "l*24", 
      }, 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "self", 
   Level = 13, 
   Name = "detect traps", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 59, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Dispel Magic!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "fighting", 
   Function = "spell_dispel_magic", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "offensive", 
   Level = 20, 
   Name = "dispel force", 
}

SkillEntry
{
   Mana = 35, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 25, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Energy Drain!", 
      NounDamage = "energy drain", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Function = "spell_energy_drain", 
   Level = 27, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "drain essence", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 233, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Dream!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "standing", 
   Function = "spell_dream", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "ignore", 
   Level = 35, 
   Name = "dream", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 23, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Earthquake!", 
      NounDamage = "earthquake", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "fighting", 
   Function = "spell_earthquake", 
   Level = 15, 
   Target = "ignore", 
   Alignment = -1001, 
   Name = "earthquake", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 222, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Farsight!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "sitting", 
   Function = "spell_farsight", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "ignore", 
   Level = 70, 
   Name = "farsight", 
}

SkillEntry
{
   Mana = 60, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 103, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N suddenly appears very tired and drowsy.", 
         ToVictim = "You suddenly grow very tired and drowsy.", 
         ToCaster = "$N suddenly appears very tired and drowsy.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You no longer feel so sleepy.", 
      VictimImmune = 
      {
         ToCaster = "Mysteriously, $N was not affected by your spell.", 
      }, 
   }, 
   Beats = 15, 
   Affects = 
   {
      [2] = 
      {
         Location = 29, 
         Modifier = "1024", 
         Duration = "l*15", 
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Level = 46, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "fatigue", 
}

SkillEntry
{
   Mana = 30, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 107, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$n lays a curse of feebleness upon $N.", 
         ToVictim = "You grow feeble from a powerful curse.", 
         ToCaster = "You lay a curse of feebleness upon $N.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You no longer feel so feeble.", 
      VictimImmune = 
      {
         ToCaster = "$N is not affected by your spell.", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 29, 
         Modifier = "512", 
         Duration = "l*19", 
      }, 
   }, 
   Beats = 10, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Level = 80, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "feebleness", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 26, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Fireball!", 
      NounDamage = "fireball", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Function = "spell_fireball", 
   Level = 18, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "fireball", 
}

SkillEntry
{
   Mana = 20, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 65, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Flamestrike!", 
      NounDamage = "flamestrike", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Function = "spell_flamestrike", 
   Level = 26, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "flamestrike", 
}

SkillEntry
{
   Mana = 8, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 292, 
   Beats = 18, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N begins to float in mid-air...", 
         ToVictim = "You begin to float in mid-air...", 
         ToCaster = "$N begins to float in mid-air...", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "Your feet float slowly to the surface.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "float", 
         Duration = "l*24", 
      }, 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "defensive", 
   Level = 10, 
   Name = "float", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      NounDamage = "spiritual wrath", 
   }, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 115, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "fighting", 
   Target = "ignore", 
   Mana = 120, 
   Name = "force blast wrath", 
   Beats = 24, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "blindness", 
         Duration = "6", 
      }, 
   }, 
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
   Function = "spell_smaug", 
   Level = 50, 
   Participants = 3, 
   Alignment = -1001, 
   Dice = "44*W", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 30, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Lightning Bolt!", 
      NounDamage = "lightning bolt", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Function = "spell_lightning_bolt", 
   Level = 27, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "force bolt", 
}

SkillEntry
{
   Mana = 40, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 224, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "A shimmering translucent shell forms about $N.", 
         ToVictim = "A shimmering translucent shell forms about you.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "The shimmering shell and its protection from the Force fade away...", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 17, 
         Modifier = "-80", 
         Duration = "l*20", 
      }, 
      [3] = 
      {
         Location = 27, 
         Modifier = "2907151", 
         Duration = "l*24", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Level = 90, 
   Target = "self", 
   Alignment = 1001, 
   Name = "force bubble", 
}

SkillEntry
{
   Mana = 75, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 218, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "A Force funnel forms about $N...", 
         ToVictim = "An aura surrounds you, channeling violent energies in your direction!", 
         ToCaster = "You erect a Force funnel about $N...", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "The funnel of Force about you ceases to exist.", 
      VictimImmune = 
      {
         ToCaster = "The Force funnel dissipates before it reaches $N.", 
      }, 
   }, 
   Beats = 22, 
   Affects = 
   {
      [2] = 
      {
         Location = 29, 
         Modifier = "8", 
         Duration = "l*23", 
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Level = 43, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "force funnel", 
}

SkillEntry
{
   Mana = 35, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 303, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!WEAROFF!", 
      NounDamage = "Force Lightning", 
   }, 
   Beats = 8, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [8] = "_08", 
      [9] = "_09", 
      [2] = "_02", 
      [3] = "_03", 
      [7] = "_07", 
   }, 
   Position = "fighting", 
   Function = "spell_black_lightning", 
   Level = 90, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "force lightning", 
}

SkillEntry
{
   Mana = 75, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 217, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "A shield of Force divides $N from the mundane energy continuum.", 
         ToVictim = "You fade from the mundane energy continuum.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You are returned to the mundane energy continuum.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 22, 
   Affects = 
   {
      [2] = 
      {
         Location = 17, 
         Modifier = "-50", 
         Duration = "l*20", 
      }, 
      [3] = 
      {
         Location = 27, 
         Modifier = "1048576", 
         Duration = "l*24", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Level = 80, 
   Target = "self", 
   Alignment = 1001, 
   Name = "force shield", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 77, 
   Beats = 18, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's eyes dart about as they grow accustomed to Force sight.", 
         ToVictim = "Heat appears red through your eyes.", 
         ToCaster = "$N's eyes dart about as they grow accustomed to Force sight.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You no longer see in the dark.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "infravision", 
         Duration = "l*24", 
      }, 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Target = "self", 
   Level = 4, 
   Name = "force sight", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 62, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Cause Light!", 
      NounDamage = "spell", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Function = "spell_cause_light", 
   Level = 2, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "force spray", 
}

SkillEntry
{
   Mana = 12, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 228, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N grows serious as wisdom takes root within $M.", 
         ToVictim = "The wisdom of the Force blossoms within you.", 
         ToCaster = "$N grows serious as wisdom takes root within $M.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "Furrowing your brow, you sense the weight of wisdom leave you.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 4, 
         Modifier = "1+(l/17)", 
         Duration = "l*24", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 28, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "forethought", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 3, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N beams as a powerful blessing is laid upon $M.", 
         ToVictim = "A powerful blessing is laid upon you.", 
         ToCaster = "You lay the blessing of the Force upon $N.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "The protection of the Force fades away.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 24, 
         Modifier = "-(l/8)", 
         Duration = "l*23", 
      }, 
      [3] = 
      {
         Location = 18, 
         Modifier = "l/8", 
         Duration = "l*23", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 11, 
   Target = "defensive", 
   Alignment = 999, 
   Name = "good fortune", 
}

SkillEntry
{
   Mana = 20, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 69, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N fades from existence.", 
         ToVictim = "You fade from existence.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You are no longer masked.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 24, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "mass invis", 
         Duration = "l*11", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Level = 43, 
   Target = "defensive", 
   Flags = 
   {
      [24] = "Group", 
   }, 
   Name = "group masking", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 307, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!WEAROFF!", 
      NounDamage = "Hand of Chaos", 
   }, 
   Beats = 8, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [8] = "_08", 
      [9] = "_09", 
      [2] = "_02", 
      [3] = "_03", 
      [7] = "_07", 
   }, 
   Position = "fighting", 
   Function = "spell_hand_of_chaos", 
   Level = 56, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "Hand of Darkness", 
}

SkillEntry
{
   Mana = 35, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 27, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Harm!", 
      NounDamage = "harm spell", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Function = "spell_harm", 
   Level = 26, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "harm", 
}

SkillEntry
{
   Mana = 50, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 28, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "A warm feeling fills your body.", 
         ToCaster = "You lay a hand of healing upon $N.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Heal!", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "100", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Level = 30, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "heal", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 44, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's senses are heightened to those of an animal.", 
         ToVictim = "Your senses are heightened to those of an animal.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You feel less aware of your surroundings.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect hidden", 
         Duration = "l*24", 
      }, 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "defensive", 
   Level = 15, 
   Name = "heightened awareness", 
}

SkillEntry
{
   Mana = 7, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 57, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "Shards of iridescent light collide to form a dazzling ball...", 
         ToCaster = "Shards of iridescent light collide to form a dazzling ball...", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Continual Light!", 
      VictimImmune = 
      {
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Beats = 12, 
   Flags = 
   {
      [9] = "_09", 
      [25] = "Object", 
      [3] = "_03", 
   }, 
   Level = 4, 
   Position = "standing", 
   Function = "spell_smaug", 
   Dice = "0", 
   Target = "ignore", 
   Value = 21, 
   Name = "illuminate", 
}

SkillEntry
{
   Mana = 12, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 66, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's face hardens.", 
         ToVictim = "You steel yourself against pain.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You soften.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 18, 
   Affects = 
   {
      [2] = 
      {
         Location = 5, 
         Modifier = "5", 
         Duration = "l*20", 
      }, 
      [3] = 
      {
         Location = 27, 
         Modifier = "8192", 
         Duration = "l*30", 
      }, 
      [4] = 
      {
         Location = 13, 
         Modifier = "l*4", 
         Duration = "l*30", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 55, 
   Target = "self", 
   Alignment = 1001, 
   Name = "inner fortress", 
}

SkillEntry
{
   Mana = 17, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 64, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Cause Serious!", 
      NounDamage = "spell", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Function = "spell_cause_serious", 
   Level = 10, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "invade essence", 
}

SkillEntry
{
   Mana = 12, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 53, 
   Beats = 24, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Identify!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "standing", 
   Function = "spell_identify", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "ignore", 
   Level = 20, 
   Name = "know essence", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 29, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "A momentary lapse in attention, and $N is out of sight.", 
         ToVictim = "You fade from existence.", 
         ToCaster = "A momentary lapse in attention, and $N is out of sight.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You are no longer invisible.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "invis", 
         Duration = "l*11", 
      }, 
   }, 
   Position = "resting", 
   Function = "spell_invis", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
      [7310] = "jedi salesman", 
      [50] = "Master Yoda", 
   }, 
   Target = "ignore", 
   Level = 5, 
   Name = "mask", 
}

SkillEntry
{
   Mana = 10, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 33, 
   Beats = 20, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You feel less sick.", 
      NounDamage = "poison", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "standing", 
   Function = "spell_poison", 
   Level = 13, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "poison", 
}

SkillEntry
{
   Mana = 120, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 232, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You return to your body.", 
      NounDamage = "possess", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "standing", 
   Function = "spell_possess", 
   Level = 150, 
   Target = "ignore", 
   Alignment = -1001, 
   Name = "possess", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 34, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N is blessed with a protection from the Dark Side.", 
         ToVictim = "You are blessed with a protection from the Dark Side.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You feel less protected from the Dark Side.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "protection", 
         Duration = "l*10", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 12, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "protection from darkness", 
}

SkillEntry
{
   Mana = 12, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 81, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Blooming vitality flows through you.", 
         ToCaster = "You allow blooming vitality to flow from you to $N.", 
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Refresh!", 
      NounDamage = "refresh", 
   }, 
   Beats = 18, 
   Affects = 
   {
      [2] = 
      {
         Location = 14, 
         Modifier = "l", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Level = 6, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "refresh", 
}

SkillEntry
{
   Mana = 10, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 230, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Remove Invis!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "standing", 
   Function = "spell_remove_invis", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "ignore", 
   Level = 8, 
   Name = "remove masking", 
}

SkillEntry
{
   Mana = 35, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 87, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Remove trap!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "standing", 
   Function = "spell_remove_trap", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "ignore", 
   Level = 29, 
   Name = "remove trap", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "???", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "standing", 
   Name = "reserved", 
   Level = 101, 
   Target = "ignore", 
   Type = "Force Power", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToRoom = "A warm feeling flows through $N.", 
         ToVictim = "A warm feeling flows through you.", 
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Mana = 80, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 113, 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "200", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Beats = 20, 
   Flags = 
   {
      [24] = "Group", 
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Level = 60, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Participants = 2, 
   Target = "ignore", 
   Alignment = 1001, 
   Name = "restoration", 
}

SkillEntry
{
   Mana = 75, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 36, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "A luminous aura spreads slowly over $N's body.", 
         ToVictim = "A luminous aura spreads slowly over your body.", 
         ToCaster = "A luminous aura spreads slowly over $N's body.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "The luminous aura about your body fades away.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "sanctuary", 
         Duration = "(l*4)+30", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 27, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "sanctuary", 
}

SkillEntry
{
   Mana = 25, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 296, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Scorching Surge!", 
      NounDamage = "scorching surge", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Function = "spell_scorching_surge", 
   Level = 73, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "scorching surge", 
}

SkillEntry
{
   Mana = 12, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 67, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "A force shield of shimmering blue surrounds $N.", 
         ToVictim = "A force shield of shimmering blue surrounds you.", 
         ToCaster = "A force shield of shimmering blue surrounds $N.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "Your force shield shimmers then fades away.", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 18, 
   Affects = 
   {
      [2] = 
      {
         Location = 17, 
         Modifier = "-50", 
         Duration = "l*20", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 26, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "shield", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 51, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Shocking Grasp!", 
      NounDamage = "shocking grasp", 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Function = "spell_shocking_grasp", 
   Level = 14, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "shocking grasp", 
}

SkillEntry
{
   Mana = 95, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 89, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "Torrents of cascading energy form around $N.", 
         ToVictim = "Torrents of cascading energy form around you.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "The torrents of cascading energy suddenly fade away.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "shockshield", 
         AffectedBy = "Blind", 
         Duration = "(l*3)+14", 
      }, 
   }, 
   Beats = 12, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Level = 72, 
   Target = "self", 
   Alignment = -1001, 
   Name = "shockshield", 
}

SkillEntry
{
   Mana = 15, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 38, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You feel less tired.", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "standing", 
   Function = "spell_sleep", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "ignore", 
   Level = 24, 
   Name = "sleep", 
}

SkillEntry
{
   Mana = 12, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 205, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N suddenly appears more agile...", 
         ToVictim = "You suddenly feel more nimble...", 
         ToCaster = "$N suddenly appears more agile...", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You suddenly feel less coordinated...", 
      VictimImmune = 
      {
      }, 
   }, 
   Beats = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = 2, 
         Modifier = "1+(l/17)", 
         Duration = "l*24", 
      }, 
      [3] = 
      {
         Location = 40, 
      }, 
      [4] = 
      {
         Location = 40, 
         Modifier = "l/8", 
         Duration = "l*20", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 18, 
   Target = "defensive", 
   Alignment = 1001, 
   Name = "slink", 
}

SkillEntry
{
   Mana = 70, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 235, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's eyes begin to glow a soft white.", 
         ToVictim = "Your vision is elevated to the highest plane.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "Your vision descends to the material plane.", 
      VictimImmune = 
      {
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "truesight", 
         AffectedBy = "Blind", 
         Duration = "l*5", 
      }, 
   }, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "self", 
   Level = 77, 
   Name = "true sight", 
}

SkillEntry
{
   Mana = 70, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 110, 
   Messages = 
   {
      Success = 
      {
         ToRoom = "$N's eyes widen in fear as $S defenses are unravelled.", 
         ToVictim = "Your defenses are unravelled before your very eyes.", 
         ToCaster = "$N's eyes widen in fear as $S defenses are unravelled.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "Your intricate defenses are restored to their original quality.", 
      VictimImmune = 
      {
         ToCaster = "Your spell has no effect upon $N.", 
      }, 
   }, 
   Beats = 15, 
   Affects = 
   {
      [2] = 
      {
         Location = 29, 
         Modifier = "1048576", 
         Duration = "(l*3)+25", 
      }, 
      [3] = 
      {
         Location = 29, 
         Modifier = "8192", 
         Duration = "(l*3)+25", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Level = 66, 
   Target = "offensive", 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Name = "unravel defense", 
}

SkillEntry
{
   Mana = 5, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 41, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Ventriloquate!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "standing", 
   Function = "spell_ventriloquate", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Target = "ignore", 
   Level = 9, 
   Name = "ventriloquate", 
}

SkillEntry
{
   Mana = 20, 
   Type = "Force Power", 
   Ability = "force", 
   Slot = 68, 
   Beats = 12, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You feel stronger.", 
      NounDamage = "spell", 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "fighting", 
   Function = "spell_weaken", 
   Level = 3, 
   Target = "offensive", 
   Alignment = -1001, 
   Name = "weaken", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou focus your senses to find those that would hide from you.&R&W", 
         ToCaster = "You focus your senses to find those that would hide from you.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your senses.&R&W", 
      }, 
      WearOff = "&cYour mind is no longer focused enough to see those hidden from you.&R&w", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "AcuteAwareness", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect hidden", 
         Duration = "l*5", 
      }, 
   }, 
   Beats = 20, 
   Position = "resting", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "self", 
   Level = 50, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou focus your strength to increase your damage.&R&W", 
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your abilities.&R&W", 
      }, 
      WearOff = "&cYour mind relaxes its focus on increasing your damage.&R&w", 
      NounDamage = "You focus on your opponents weak points increasing your damage.", 
   }, 
   Type = "Skill", 
   Name = "AcuteDamage", 
   Affects = 
   {
      [2] = 
      {
         Location = 19, 
         Modifier = "2+(l/33)", 
         Duration = "l*10", 
      }, 
   }, 
   Beats = 20, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "self", 
   Level = 99, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "AddPatrol", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_add_patrol", 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 50, 
   Ability = "leadership", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Aid!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "aid", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_aid", 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32006] = "old teacher master man human scholar", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Ability = "diplomacy", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&RYou fumble with the binds.&R&W", 
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "apprehend", 
   Beats = 6, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Position = "standing", 
   Function = "spell_charm_person", 
   Level = 35, 
   Target = "offensive", 
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Backstab!", 
      NounDamage = "backstab", 
   }, 
   Type = "Skill", 
   Name = "backstab", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_backstab", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "ignore", 
   Level = 6, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Bash!", 
      NounDamage = "bash", 
   }, 
   Type = "Skill", 
   Name = "bash", 
   Beats = 8, 
   Position = "fighting", 
   Function = "do_bash", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "offensive", 
   Level = 47, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Beg!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "beg", 
   Beats = 20, 
   Position = "standing", 
   Function = "do_beg", 
   Teachers = 
   {
      [210] = "begger", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "???", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "berserk", 
   Beats = 4, 
   Position = "fighting", 
   Function = "do_berserk", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "offensive", 
   Level = 85, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "bind", 
   Beats = 3, 
   Position = "dead", 
   Function = "do_bind", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "offensive", 
   Level = 45, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "bribe", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_bribe", 
   Target = "ignore", 
   Level = 25, 
   Ability = "diplomacy", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "capital ships", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 90, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Circle!", 
      NounDamage = "circle", 
   }, 
   Type = "Skill", 
   Name = "circle", 
   Beats = 16, 
   Position = "fighting", 
   Function = "do_circle", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "ignore", 
   Level = 50, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!climb!", 
      NounDamage = "climb", 
   }, 
   Type = "Skill", 
   Name = "climb", 
   Beats = 10, 
   Position = "standing", 
   Function = "do_climb", 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Target = "offensive", 
   Level = 7, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "cloak", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "dead", 
   Function = "do_disguise", 
   Target = "ignore", 
   Ability = "force", 
   Level = 35, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "cutdoor", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "force", 
   Level = 20, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Detrap!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "detrap", 
   Beats = 24, 
   Position = "sitting", 
   Function = "do_detrap", 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Target = "ignore", 
   Level = 32, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "dig", 
   Beats = 20, 
   Position = "standing", 
   Function = "do_dig", 
   Teachers = 
   {
      [6805] = "mine foreman Krauota", 
      [206] = "technician", 
      [6819] = "boss Hityii", 
   }, 
   Target = "ignore", 
   Level = 2, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Disarm!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "disarm", 
   Beats = 24, 
   Position = "fighting", 
   Function = "do_disarm", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 45, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!disguise!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "disguise", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_disguise", 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Target = "ignore", 
   Level = 70, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Dodge!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "dodge", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 50, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&BYou fail.&R&W", 
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "dominate", 
   Beats = 12, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "standing", 
   Function = "spell_charm_person", 
   Level = 75, 
   Target = "offensive", 
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Ability = "leadership", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Bash Door!", 
      NounDamage = "bashdoor", 
   }, 
   Type = "Skill", 
   Name = "doorbash", 
   Beats = 24, 
   Position = "standing", 
   Function = "do_bashdoor", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "ignore", 
   Level = 10, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Dual Wield!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "dual wield", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "standing", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 27, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "EliteGuard", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_elite_guard", 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 85, 
   Ability = "leadership", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Enhanced Damage!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "enhanced damage", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 10, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "fake signal", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 105, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Fifth Attack!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "fifth attack", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 140, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!First Aid!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "FirstAid", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_first_aid", 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32006] = "old teacher master man human scholar", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Ability = "diplomacy", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cA strong mind leads to a stronger body.&R&W", 
         ToCaster = "A strong mind leads to a stronger body.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your energy.&R&W", 
      }, 
      WearOff = "&cYour mind wanders from strengthening your body.&R&w", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "FocusStrength", 
   Affects = 
   {
      [2] = 
      {
         Location = 1, 
         Modifier = "2+(l/33)", 
         Duration = "l*10", 
      }, 
   }, 
   Beats = 20, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "self", 
   Level = 70, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Fourth Attack!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "fourth attack", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 115, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "GatherIntelligence", 
   Beats = 40, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "standing", 
   Function = "do_gather_intelligence", 
   Difficulty = 4, 
   Target = "ignore", 
   Level = 100, 
   Ability = "leadership", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Gouge!", 
      NounDamage = "gouge", 
   }, 
   Type = "Skill", 
   Name = "gouge", 
   Beats = 10, 
   Position = "fighting", 
   Function = "do_gouge", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 30, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "grenades", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 61, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Grip!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "grip", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 50, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou focus on your ability to hit your opponent.&R&W", 
         ToCaster = "You focus on your ability to hit your oponent.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your skills.&R&W", 
      }, 
      WearOff = "&cYou lose your focus on your opponent.&R&w", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "HeightenedAccuracy", 
   Affects = 
   {
      [2] = 
      {
         Location = 18, 
         Modifier = "2+(l/33)", 
         Duration = "l*10", 
      }, 
   }, 
   Beats = 20, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "self", 
   Level = 85, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Hijack!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "hijack", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_hijack", 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Target = "ignore", 
   Level = 95, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!HitAll!", 
      NounDamage = "hit", 
   }, 
   Type = "Skill", 
   Name = "hitall", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_hitall", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 87, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou harden yourself against all pain.&R&W", 
         ToCaster = "You harden yourself against pain.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your energy.&R&W", 
      }, 
      WearOff = "&cYou soften against all pain.&R&w", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "InnerStrength", 
   Affects = 
   {
      [2] = 
      {
         Location = 5, 
         Modifier = "1+(l/50)", 
         Duration = "l*10", 
      }, 
      [3] = 
      {
         Location = 27, 
         Modifier = "8", 
         Duration = "l*10", 
      }, 
      [4] = 
      {
         Location = 27, 
         Modifier = "2097152", 
         Duration = "l*10", 
      }, 
      [5] = 
      {
         Location = 27, 
         Modifier = "8192", 
         Duration = "l*10", 
      }, 
      [6] = 
      {
         Location = 27, 
         Modifier = "32", 
         Duration = "l*10", 
      }, 
   }, 
   Beats = 20, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "self", 
   Level = 80, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "jail", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_jail", 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [408] = "human police officer cop", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 25, 
   Ability = "leadership", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "jumpvector", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "dead", 
   Function = "do_jumpvector", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 80, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Kick!", 
      NounDamage = "kick", 
   }, 
   Type = "Skill", 
   Name = "kick", 
   Beats = 8, 
   Position = "fighting", 
   Function = "do_kick", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "offensive", 
   Level = 6, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Steal!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "lift", 
   Beats = 24, 
   Position = "standing", 
   Function = "do_steal", 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Target = "ignore", 
   Level = 20, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "lightsaber crafting", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "force", 
   Level = 25, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou relax your muscles becoming more limber and agile.&R&W", 
         ToCaster = "You relax your muscles becoming limber and agile.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&RYou can't become any more limber.&R&W", 
      }, 
      WearOff = "&cYour muscles stiffen as your efforts to relax them fade.&R&w", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "limber", 
   Affects = 
   {
      [2] = 
      {
         Location = 2, 
         Modifier = "2+(l/33)", 
         Duration = "l*10", 
      }, 
   }, 
   Beats = 20, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "self", 
   Level = 90, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makearmor", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "do_makearmor", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 58, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makeblade", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "do_makeblade", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 40, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makeblaster", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "do_makeblaster", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 95, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Ability = "engineering", 
   Position = "resting", 
   Function = "do_makebowcaster", 
   Level = 40, 
   Target = "ignore", 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Name = "makebowcaster", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makecomlink", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "do_makecomlink", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 5, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makecontainer", 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [206] = "technician", 
      [32010] = "Twilek craftswoman woman", 
   }, 
   Position = "resting", 
   Function = "do_makecontainer", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 1, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makeglowrod", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "do_makeglowrod", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 10, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makegrenade", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "do_makegrenade", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 95, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makejewelry", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "do_makejewelry", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 60, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makelandmine", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "do_makelandmine", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 80, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makeshield", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "do_makeshield", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 70, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "MassPropaganda", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_mass_propaganda", 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
   }, 
   Target = "ignore", 
   Level = 80, 
   Ability = "diplomacy", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "You meditate peacefully, tuning yourself to the Force.", 
      }, 
      Failure = 
      {
         ToVictim = "You spend several minutes in deep concentration, but fail to find the Force.", 
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "meditate", 
   Affects = 
   {
      [2] = 
      {
         Location = 12, 
         Modifier = "l", 
      }, 
   }, 
   Beats = 25, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 1, 
   Target = "self", 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Ability = "force", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "midships", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 30, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!mine!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "mine", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_mine", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 90, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Search!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "mount", 
   Beats = 10, 
   Position = "standing", 
   Function = "do_mount", 
   Teachers = 
   {
      [412] = "Self Defence Trainer", 
      [10509] = "An instructor", 
   }, 
   Target = "ignore", 
   Level = 7, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "navigation", 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 1, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Parry!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "parry", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "force", 
   Level = 25, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Peek!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "peek", 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Position = "standing", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "smuggling", 
   Level = 20, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Pick!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "pick lock", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_pick", 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Target = "ignore", 
   Level = 55, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Pickshiplock!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "pick ship lock", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_pickshiplock", 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
   Target = "ignore", 
   Level = 90, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Poison Weapon!", 
      NounDamage = "poisonous concoction", 
   }, 
   Type = "Skill", 
   Name = "PoisonWeapon", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_poison_weapon", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "objinv", 
   Level = 30, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!post guard!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "PostGuard", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_postguard", 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 35, 
   Ability = "leadership", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "propaganda", 
   Beats = 4, 
   Position = "standing", 
   Function = "do_propaganda", 
   Target = "ignore", 
   Level = 50, 
   Ability = "diplomacy", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Punch!", 
      NounDamage = "punch", 
   }, 
   Type = "Skill", 
   Name = "punch", 
   Beats = 8, 
   Position = "fighting", 
   Function = "do_punch", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "offensive", 
   Level = 40, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!reinforcements!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "reinforcements", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_reinforcements", 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 60, 
   Ability = "leadership", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Rescue!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "rescue", 
   Beats = 12, 
   Position = "fighting", 
   Function = "do_rescue", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 8, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "sabotage", 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "dead", 
   Function = "do_sabotage", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 120, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Scan!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "scan", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_scan", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [10340] = "Domick Dom teacher", 
      [320] = "human citizen", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Search!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "search", 
   Beats = 20, 
   Position = "standing", 
   Function = "do_search", 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Target = "ignore", 
   Level = 3, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Second Attack!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "second attack", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 45, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "seduce", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_seduce", 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
   }, 
   Target = "ignore", 
   Level = 65, 
   Ability = "diplomacy", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou focus your senses in an effort to detect the unseen.&R&W", 
         ToCaster = "You focus your senses in an effort to detect the unseen.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your mind.&R&W", 
      }, 
      WearOff = "&cYour focus to see the unseen relaxes.&R&w", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "SeeMasking", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect invis", 
         Duration = "l*5", 
      }, 
   }, 
   Beats = 20, 
   Position = "resting", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "self", 
   Level = 60, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "ship docking", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 30, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "ship maintenance", 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 25, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "ship systems", 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 1, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "skin", 
   Beats = 5, 
   Position = "resting", 
   Function = "do_skin", 
   Teachers = 
   {
      [328] = "Sleejat", 
   }, 
   Target = "ignore", 
   Level = 1, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "slicing", 
   Beats = 3, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Level = 105, 
   Target = "ignore", 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Ability = "force", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "smalltalk", 
   Beats = 4, 
   Position = "standing", 
   Function = "do_smalltalk", 
   Target = "ignore", 
   Level = 10, 
   Ability = "diplomacy", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "You attempt to move silently.", 
      }, 
      Failure = 
      {
         ToCaster = "You attempt to move silently.", 
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "sneak", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "sneak", 
         Duration = "l*23", 
      }, 
   }, 
   Beats = 1, 
   Position = "standing", 
   Function = "spell_smaug", 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Target = "self", 
   Level = 5, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!snipe!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "snipe", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_snipe", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 2, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "space combat 1", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 25, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "space combat 2", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 50, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "space combat 3", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 75, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "SpecialForces", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_special_forces", 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 95, 
   Ability = "leadership", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "speeder combat", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 75, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "speeders", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 30, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "spice refining", 
   Teachers = 
   {
      [32029] = "hutt crimelord", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "engineering", 
   Level = 50, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "starfighters", 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 1, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "You attempt to hide.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
         ToCaster = "You attempt to hide.", 
      }, 
      WearOff = "You are no longer hidden.", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "stealth", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "hide", 
         Duration = "l*23", 
      }, 
   }, 
   Beats = 12, 
   Position = "resting", 
   Function = "do_hide", 
   Teachers = 
   {
      [410] = "old wookiee woman", 
      [32009] = "suspicious fellow", 
   }, 
   Target = "self", 
   Level = 50, 
   Ability = "smuggling", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "study", 
   Beats = 12, 
   Position = "dead", 
   Function = "do_study", 
   Target = "objinv", 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32006] = "old teacher master man human scholar", 
   }, 
   Ability = "diplomacy", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "You regain consciousness.", 
      NounDamage = "stun", 
   }, 
   Type = "Skill", 
   Name = "stun", 
   Beats = 8, 
   Teachers = 
   {
      [412] = "Self Defence Trainer", 
      [32012] = "imperial trooper drill seargent", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "do_punch", 
   Level = 105, 
   Target = "offensive", 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Third Attack!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "third attack", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 95, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!throw!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "throw", 
   Beats = 3, 
   Position = "sitting", 
   Function = "do_throw", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Target = "ignore", 
   Level = 5, 
   Ability = "combat", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!torture!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "torture", 
   Beats = 12, 
   Position = "standing", 
   Function = "do_torture", 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
      [32029] = "hutt crimelord", 
   }, 
   Target = "ignore", 
   Level = 85, 
   Ability = "leadership", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Track!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "track", 
   Beats = 14, 
   Position = "standing", 
   Function = "do_track", 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   Target = "ignore", 
   Level = 3, 
   Ability = "bounty hunting", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "tractor beams", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 35, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "You enter a peaceful trance, tuning yourself to the Force.", 
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
         ToVictim = "You spend several minutes in a deep trance, but fail to find the Force.", 
      }, 
      WearOff = "!TRANCE!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "trance", 
   Affects = 
   {
      [2] = 
      {
         Location = 12, 
         Modifier = "l*2", 
      }, 
   }, 
   Beats = 32, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "resting", 
   Function = "spell_smaug", 
   Level = 60, 
   Target = "self", 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Ability = "force", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "weapon systems", 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32008] = "Rebel Alliance flight instructor", 
      [32007] = "imperial flight officer", 
   }, 
   Position = "resting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "piloting", 
   Level = 2, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Blasters!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Weapon", 
   Name = "blasters", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 2, 
}

SkillEntry
{
   Level = 101, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Bludgeons!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "fighting", 
   Name = "bludgeons", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Weapon", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Weapon", 
   Name = "bowcasters", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 4, 
}

SkillEntry
{
   Level = 101, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Flexible Arms!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "fighting", 
   Name = "flexible arms", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Weapon", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Type = "Weapon", 
   Name = "force pikes", 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32011] = "new repulic training officer", 
   }, 
   Position = "dead", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 3, 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Lightsabers!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Weapon", 
   Name = "lightsabers", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "force", 
   Level = 2, 
}

SkillEntry
{
   Level = 101, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Talonous Arms!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "fighting", 
   Name = "talonous arms", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Weapon", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Vibro-Blades!", 
      VictimImmune = 
      {
      }, 
   }, 
   Type = "Weapon", 
   Name = "vibro-blades", 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [10340] = "Domick Dom teacher", 
      [10509] = "An instructor", 
      [412] = "Self Defence Trainer", 
      [32012] = "imperial trooper drill seargent", 
   }, 
   Position = "fighting", 
   Function = "spell_null", 
   Target = "ignore", 
   Ability = "combat", 
   Level = 1, 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Adarian!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "adarese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "barabel", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "binary", 
   Function = "spell_smaug", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "bothese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "chadra-fan", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Common!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "basic", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "coyn", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "defel", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "devaronese", 
   Function = "spell_smaug", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "durese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "ewokese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "falleen", 
   Function = "spell_smaug", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "firrerreo", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Gamorrean!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "gamorrese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "gand", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "antarian", 
   Function = "spell_smaug", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Hutt!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "huttese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "ithorese", 
   Function = "spell_smaug", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Jawa!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "jawaese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "kubazian", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Mon Calamari!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "mon calamarian", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "quarrenese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Rodian!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "rodese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Noghri!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "shistavanen", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "sullustese", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "togorian", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "dosh", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Dwarven!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "twileki", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "verpine", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Failure = 
      {
      }, 
      WearOff = "!Wookiee!", 
      VictimImmune = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "shyriiwook", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
   }, 
   Position = "dead", 
   Name = "yevethan", 
   Function = "spell_null", 
   Target = "ignore", 
   Type = "Tongue", 
   Ability = "none", 
}
