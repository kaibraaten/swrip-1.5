-- Skills
-- Last saved Thursday 24-Mar-2016 22:22:33

SkillEntry
{
   Type = "Force Power", 
   Name = "reserved", 
   Position = "standing", 
   Ability = "none", 
   Level = 101, 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "???", 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "unknown", 
   Messages = 
   {
      NounDamage = "dispel evil", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Dispel Evil!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 22, 
   Ability = "force", 
   SpellFunction = "spell_dispel_evil", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Alignment = 1001, 
   Name = "dispel dark", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 105, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "unknown", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_smaug", 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Name = "stun", 
   Position = "dead", 
   Target = "ignore", 
   Level = 105, 
}

SkillEntry
{
   Type = "unknown", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_smaug", 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Name = "unknown", 
   Position = "dead", 
   Target = "ignore", 
   Level = 101, 
}

SkillEntry
{
   Affects = 
   {
      [2] = 
      {
         Location = "immune", 
         Duration = "l*5", 
         Modifier = "8", 
      }, 
   }, 
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You prepare to absorb incoming energy.", 
         ToCaster = "$N's eyelids seem heavy for a moment.", 
         ToRoom = "$N's eyelids seem heavy for a moment.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Your pent up energy disperses into the deck.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 85, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Value = 30, 
   Flags = 
   {
      [9] = "_09", 
   }, 
   Dice = "none", 
   Name = "absorb energy", 
   Position = "resting", 
   Target = "self", 
   Level = 60, 
   Beats = 4, 
   Mana = 50, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You feel more self-confident.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 7, 
   Ability = "force", 
   SpellFunction = "spell_charm_person", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Name = "affect mind", 
   Position = "standing", 
   Target = "offensive", 
   Level = 28, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You suddenly feel alert.", 
         ToRoom = "$N's eyes dart about the room in an alert manner.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You are suddenly less alert.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 102, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "immune", 
         Duration = "l*15", 
         Modifier = "32", 
      }, 
      [3] = 
      {
         Location = "resistant", 
         Duration = "l*15", 
         Modifier = "8", 
      }, 
      [4] = 
      {
         Location = "resistant", 
         Duration = "l*15", 
         Modifier = "1024", 
      }, 
      [5] = 
      {
         Location = "resistant", 
         Duration = "l*15", 
         Modifier = "4194304", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "alertness", 
   Position = "standing", 
   Target = "self", 
   Level = 26, 
   Beats = 15, 
   Mana = 60, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Your lungs take on the ability to breathe water...", 
         ToCaster = "$N's lungs take on the ability to breathe water...", 
         ToRoom = "$N's lungs take on the ability to breathe water...", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Your lungs revert to their original state.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 236, 
   Ability = "none", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*23", 
         AffectedBy = "aqua_breath", 
         Modifier = "aqua breath", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [21] = "Recastable", 
   }, 
   Alignment = 100, 
   Name = "aqua breath", 
   Position = "standing", 
   Target = "defensive", 
   Level = 101, 
   Beats = 12, 
   Mana = 50, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Your armor begins to glow softly as it is enhanced by the Force.", 
         ToCaster = "$N's armor begins to glow softly as it is enhanced by the Force.", 
         ToRoom = "$N's armor begins to glow softly as it is enhanced by the Force.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Your armor returns to its mundane value.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 1, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "armor", 
         Duration = "l*20", 
         Modifier = "-20", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "armor", 
   Position = "standing", 
   Target = "defensive", 
   Level = 5, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Drawing the Force, you change yourself to be more likeable.", 
         ToCaster = "$N seems more jovial.", 
         ToRoom = "$N suddenly seems like a much nicer person.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You stop enhancing yourself.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 226, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "charisma", 
         Duration = "l*24", 
         Modifier = "1+(l/17)", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Alignment = 1001, 
   Name = "beauty", 
   Position = "standing", 
   Target = "defensive", 
   Level = 6, 
   Beats = 12, 
   Mana = 14, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You can see again.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 4, 
   Ability = "force", 
   SpellFunction = "spell_blindness", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Alignment = -1001, 
   Name = "blindness", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 10, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "spell", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You feel a tight pressure around your throat.", 
         ToCaster = "Stretching out with the force you slowly choke your victim.", 
         ToRoom = "$N begins to claw at $S throat.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Cause Critical!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 63, 
   Ability = "force", 
   SpellFunction = "spell_cause_critical", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Alignment = -1001, 
   Name = "choke", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 20, 
   Beats = 12, 
   Mana = 20, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Cure Blindness!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 14, 
   Ability = "force", 
   SpellFunction = "spell_cure_blindness", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "cure blindness", 
   Position = "fighting", 
   Target = "defensive", 
   Level = 8, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Your critical wounds close and your pain ebbs away.", 
         ToCaster = "You cure $N's critical wounds.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Cure Critical!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 15, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "hit", 
         Modifier = "3d8+(l-6)", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "cure critical", 
   Position = "fighting", 
   Target = "defensive", 
   Level = 18, 
   Beats = 12, 
   Mana = 20, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Your light wounds mend and your pain ebbs slightly.", 
         ToCaster = "You cure $N's light wounds.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Your ability to see in the dark fades away.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 16, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "hit", 
         Modifier = "1d8+(l/3)", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [7310] = "jedi salesman", 
   }, 
   Alignment = 1001, 
   Name = "cure light", 
   Position = "fighting", 
   Target = "defensive", 
   Level = 2, 
   Beats = 12, 
   Mana = 10, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Cure Poison!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 43, 
   Ability = "force", 
   SpellFunction = "spell_cure_poison", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "cure poison", 
   Position = "standing", 
   Target = "defensive", 
   Level = 16, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Your serious wounds mend and your pain ebbs away.", 
         ToCaster = "You cure $N's serious wounds.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Cure Serious!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 61, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "hit", 
         Modifier = "2d8+(l/2)", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "cure serious", 
   Position = "fighting", 
   Target = "defensive", 
   Level = 10, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Traces of red outline all those who abuse the Force.", 
         ToRoom = "A tint of red appears in $N's eyes, mirroring his own vision.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You stop focusing on the Dark Side.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 18, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*24", 
         AffectedBy = "detect_evil", 
         Modifier = "detect evil", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "detect darkness", 
   Position = "resting", 
   Target = "self", 
   Level = 5, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Traces of blue outline objects touched by the Force.", 
         ToRoom = "A tint of blue in $N's eyes mirrors $S own perception.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "The blue outlines disappear from your vision.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 20, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*24", 
         AffectedBy = "detect_magic", 
         Modifier = "detect magic", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Name = "detect force", 
   Position = "resting", 
   Target = "self", 
   Level = 5, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Know Alignment!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 58, 
   Ability = "force", 
   SpellFunction = "spell_know_alignment", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "detect intent", 
   Position = "fighting", 
   Target = "defensive", 
   Level = 8, 
   Beats = 12, 
   Mana = 9, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Your eyes fixate as they gain the ability to see the unseen.", 
         ToRoom = "$N's eyes fixate as they gain the ability to see the unseen.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You no longer see invisible objects.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 19, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*24", 
         AffectedBy = "detect_invis", 
         Modifier = "detect invis", 
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
      [7310] = "jedi salesman", 
      [50] = "Master Yoda", 
   }, 
   Name = "detect masking", 
   Position = "sitting", 
   Target = "self", 
   Level = 4, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Detect Poison!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 21, 
   Ability = "force", 
   SpellFunction = "spell_detect_poison", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "detect poison", 
   Position = "standing", 
   Target = "objinv", 
   Level = 9, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You suddenly grow aware of the dangers about you.", 
         ToRoom = "$N peers about the room, intent on finding all manner of danger.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You feel less aware of the dangers about you.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 86, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*24", 
         AffectedBy = "detect_traps", 
         Modifier = "detect traps", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "detect traps", 
   Position = "resting", 
   Target = "self", 
   Level = 13, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Dispel Magic!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 59, 
   Ability = "force", 
   SpellFunction = "spell_dispel_magic", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "dispel force", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 20, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "energy drain", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Energy Drain!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 25, 
   Ability = "force", 
   SpellFunction = "spell_energy_drain", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Alignment = -1001, 
   Name = "drain essence", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 27, 
   Beats = 12, 
   Mana = 35, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Dream!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 233, 
   Ability = "force", 
   SpellFunction = "spell_dream", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "dream", 
   Position = "standing", 
   Target = "ignore", 
   Level = 35, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "earthquake", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Earthquake!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 23, 
   Ability = "force", 
   SpellFunction = "spell_earthquake", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Alignment = -1001, 
   Name = "earthquake", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 15, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Farsight!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 222, 
   Ability = "force", 
   SpellFunction = "spell_farsight", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "farsight", 
   Position = "sitting", 
   Target = "ignore", 
   Level = 70, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You suddenly grow very tired and drowsy.", 
         ToCaster = "$N suddenly appears very tired and drowsy.", 
         ToRoom = "$N suddenly appears very tired and drowsy.", 
      }, 
      VictimImmune = 
      {
         ToCaster = "Mysteriously, $N was not affected by your spell.", 
      }, 
      WearOff = "You no longer feel so sleepy.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 103, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "susceptible", 
         Duration = "l*15", 
         Modifier = "1024", 
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Alignment = -1001, 
   Name = "fatigue", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 46, 
   Beats = 15, 
   Mana = 60, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You grow feeble from a powerful curse.", 
         ToCaster = "You lay a curse of feebleness upon $N.", 
         ToRoom = "$n lays a curse of feebleness upon $N.", 
      }, 
      VictimImmune = 
      {
         ToCaster = "$N is not affected by your spell.", 
      }, 
      WearOff = "You no longer feel so feeble.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 107, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "susceptible", 
         Duration = "l*19", 
         Modifier = "512", 
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Alignment = -1001, 
   Name = "feebleness", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 80, 
   Beats = 10, 
   Mana = 30, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "fireball", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Fireball!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 26, 
   Ability = "force", 
   SpellFunction = "spell_fireball", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Alignment = -1001, 
   Name = "fireball", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 18, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "flamestrike", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Flamestrike!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 65, 
   Ability = "force", 
   SpellFunction = "spell_flamestrike", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Alignment = -1001, 
   Name = "flamestrike", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 26, 
   Beats = 12, 
   Mana = 20, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You begin to float in mid-air...", 
         ToCaster = "$N begins to float in mid-air...", 
         ToRoom = "$N begins to float in mid-air...", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Your feet float slowly to the surface.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 292, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*24", 
         AffectedBy = "floating", 
         Modifier = "float", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "float", 
   Position = "standing", 
   Target = "defensive", 
   Level = 10, 
   Beats = 18, 
   Mana = 8, 
}

SkillEntry
{
   Dice = "44*W", 
   Messages = 
   {
      NounDamage = "spiritual wrath", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Mana = 120, 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "6", 
         AffectedBy = "blind", 
         Modifier = "blindness", 
      }, 
   }, 
   Target = "ignore", 
   Level = 50, 
   Participants = 3, 
   Type = "Force Power", 
   Slot = 115, 
   Ability = "force", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [7] = "_07", 
      [8] = "_08", 
      [3] = "_03", 
      [22] = "NoScribe", 
      [15] = "Area", 
      [23] = "NoBrew", 
      [2] = "_02", 
   }, 
   Name = "force blast wrath", 
   Position = "fighting", 
   SpellFunction = "spell_smaug", 
   Alignment = -1001, 
   Beats = 24, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "lightning bolt", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Lightning Bolt!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 30, 
   Ability = "force", 
   SpellFunction = "spell_lightning_bolt", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Alignment = -1001, 
   Name = "force bolt", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 27, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "A shimmering translucent shell forms about you.", 
         ToRoom = "A shimmering translucent shell forms about $N.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "The shimmering shell and its protection from the Force fade away...", 
      Failure = 
      {
      }, 
   }, 
   Slot = 224, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "armor", 
         Duration = "l*20", 
         Modifier = "-80", 
      }, 
      [3] = 
      {
         Location = "resistant", 
         Duration = "l*24", 
         Modifier = "2907151", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "force bubble", 
   Position = "standing", 
   Target = "self", 
   Level = 90, 
   Beats = 12, 
   Mana = 40, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "An aura surrounds you, channeling violent energies in your direction!", 
         ToCaster = "You erect a Force funnel about $N...", 
         ToRoom = "A Force funnel forms about $N...", 
      }, 
      VictimImmune = 
      {
         ToCaster = "The Force funnel dissipates before it reaches $N.", 
      }, 
      WearOff = "The funnel of Force about you ceases to exist.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 218, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "susceptible", 
         Duration = "l*23", 
         Modifier = "8", 
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Alignment = -1001, 
   Name = "force funnel", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 43, 
   Beats = 22, 
   Mana = 75, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "Force Lightning", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!WEAROFF!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 303, 
   Ability = "force", 
   SpellFunction = "spell_black_lightning", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [7] = "_07", 
      [8] = "_08", 
      [3] = "_03", 
      [9] = "_09", 
      [2] = "_02", 
   }, 
   Alignment = -1001, 
   Name = "force lightning", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 90, 
   Beats = 8, 
   Mana = 35, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You fade from the mundane energy continuum.", 
         ToRoom = "A shield of Force divides $N from the mundane energy continuum.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You are returned to the mundane energy continuum.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 217, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "armor", 
         Duration = "l*20", 
         Modifier = "-50", 
      }, 
      [3] = 
      {
         Location = "resistant", 
         Duration = "l*24", 
         Modifier = "1048576", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "force shield", 
   Position = "standing", 
   Target = "self", 
   Level = 80, 
   Beats = 22, 
   Mana = 75, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Heat appears red through your eyes.", 
         ToCaster = "$N's eyes dart about as they grow accustomed to Force sight.", 
         ToRoom = "$N's eyes dart about as they grow accustomed to Force sight.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You no longer see in the dark.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 77, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*24", 
         AffectedBy = "infrared", 
         Modifier = "infravision", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Name = "force sight", 
   Position = "standing", 
   Target = "defensive", 
   Level = 4, 
   Beats = 18, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "spell", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Cause Light!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 62, 
   Ability = "force", 
   SpellFunction = "spell_cause_light", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Alignment = -1001, 
   Name = "force spray", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 2, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "The wisdom of the Force blossoms within you.", 
         ToCaster = "$N grows serious as wisdom takes root within $M.", 
         ToRoom = "$N grows serious as wisdom takes root within $M.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Furrowing your brow, you sense the weight of wisdom leave you.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 228, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "wisdom", 
         Duration = "l*24", 
         Modifier = "1+(l/17)", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "forethought", 
   Position = "resting", 
   Target = "defensive", 
   Level = 28, 
   Beats = 12, 
   Mana = 12, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "A powerful blessing is laid upon you.", 
         ToCaster = "You lay the blessing of the Force upon $N.", 
         ToRoom = "$N beams as a powerful blessing is laid upon $M.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "The protection of the Force fades away.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 3, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "save_spell", 
         Duration = "l*23", 
         Modifier = "-(l/8)", 
      }, 
      [3] = 
      {
         Location = "hitroll", 
         Duration = "l*23", 
         Modifier = "l/8", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 999, 
   Name = "good fortune", 
   Position = "resting", 
   Target = "defensive", 
   Level = 11, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You fade from existence.", 
         ToRoom = "$N fades from existence.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You are no longer masked.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 69, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*11", 
         AffectedBy = "invisible", 
         Modifier = "mass invis", 
      }, 
   }, 
   Flags = 
   {
      [24] = "Group", 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "group masking", 
   Position = "standing", 
   Target = "defensive", 
   Level = 43, 
   Beats = 24, 
   Mana = 20, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "Hand of Chaos", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!WEAROFF!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 307, 
   Ability = "force", 
   SpellFunction = "spell_hand_of_chaos", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [7] = "_07", 
      [8] = "_08", 
      [3] = "_03", 
      [9] = "_09", 
      [2] = "_02", 
   }, 
   Alignment = -1001, 
   Name = "hand of Darkness", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 56, 
   Beats = 8, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You steel yourself against pain.", 
         ToRoom = "$N's face hardens.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You soften.", 
      Failure = 
      {
      }, 
   }, 
   Ability = "force", 
   Mana = 12, 
   Affects = 
   {
      [2] = 
      {
         Location = "constitution", 
         Duration = "l*30", 
         Modifier = "4", 
      }, 
      [3] = 
      {
         Location = "hit", 
         Duration = "l*30", 
         Modifier = "l*4", 
      }, 
      [4] = 
      {
         Location = "resistant", 
         Duration = "l*30", 
         Modifier = "8192", 
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Alignment = -1001, 
   Name = "harden", 
   Position = "dead", 
   Target = "self", 
   Level = 55, 
   Beats = 18, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "harm spell", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Harm!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 27, 
   Ability = "force", 
   SpellFunction = "spell_harm", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Alignment = -1001, 
   Name = "harm", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 26, 
   Beats = 12, 
   Mana = 35, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "A warm feeling fills your body.", 
         ToCaster = "You lay a hand of healing upon $N.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Heal!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 28, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "hit", 
         Modifier = "100", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "heal", 
   Position = "fighting", 
   Target = "defensive", 
   Level = 30, 
   Beats = 12, 
   Mana = 50, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Your senses are heightened to those of an animal.", 
         ToRoom = "$N's senses are heightened to those of an animal.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You feel less aware of your surroundings.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 44, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*24", 
         AffectedBy = "detect_hidden", 
         Modifier = "detect hidden", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "heightened awareness", 
   Position = "resting", 
   Target = "defensive", 
   Level = 15, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToRoom = "Shards of iridescent light collide to form a dazzling ball...", 
         ToCaster = "Shards of iridescent light collide to form a dazzling ball...", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Continual Light!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 57, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Value = 21, 
   Flags = 
   {
      [3] = "_03", 
      [25] = "Object", 
      [9] = "_09", 
   }, 
   Dice = "0", 
   Name = "illuminate", 
   Position = "standing", 
   Target = "ignore", 
   Level = 4, 
   Beats = 12, 
   Mana = 7, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You steel yourself against pain.", 
         ToRoom = "$N's face hardens.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You soften.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 66, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "constitution", 
         Duration = "l*20", 
         Modifier = "5", 
      }, 
      [3] = 
      {
         Location = "hit", 
         Duration = "l*30", 
         Modifier = "l*4", 
      }, 
      [4] = 
      {
         Location = "resistant", 
         Duration = "l*30", 
         Modifier = "8192", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "inner fortress", 
   Position = "resting", 
   Target = "self", 
   Level = 55, 
   Beats = 18, 
   Mana = 12, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "spell", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Cause Serious!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 64, 
   Ability = "force", 
   SpellFunction = "spell_cause_serious", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Alignment = -1001, 
   Name = "invade essence", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 10, 
   Beats = 12, 
   Mana = 17, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Identify!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 53, 
   Ability = "force", 
   SpellFunction = "spell_identify", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "know essence", 
   Position = "standing", 
   Target = "ignore", 
   Level = 20, 
   Beats = 24, 
   Mana = 12, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You fade from existence.", 
         ToCaster = "A momentary lapse in attention, and $N is out of sight.", 
         ToRoom = "A momentary lapse in attention, and $N is out of sight.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You are no longer invisible.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 29, 
   Ability = "force", 
   SpellFunction = "spell_invis", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*11", 
         Modifier = "invis", 
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
      [7310] = "jedi salesman", 
      [50] = "Master Yoda", 
   }, 
   Name = "mask", 
   Position = "resting", 
   Target = "ignore", 
   Level = 5, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "poison", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You feel less sick.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 33, 
   Ability = "force", 
   SpellFunction = "spell_poison", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Alignment = -1001, 
   Name = "poison", 
   Position = "standing", 
   Target = "offensive", 
   Level = 13, 
   Beats = 20, 
   Mana = 10, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "possess", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You return to your body.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 232, 
   Ability = "force", 
   SpellFunction = "spell_possess", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Alignment = -1001, 
   Name = "possess", 
   Position = "standing", 
   Target = "ignore", 
   Level = 150, 
   Beats = 12, 
   Mana = 120, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You are blessed with a protection from the Dark Side.", 
         ToRoom = "$N is blessed with a protection from the Dark Side.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You feel less protected from the Dark Side.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 34, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*10", 
         AffectedBy = "protect", 
         Modifier = "protection", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "protection from darkness", 
   Position = "resting", 
   Target = "self", 
   Level = 12, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "refresh", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Blooming vitality flows through you.", 
         ToCaster = "You allow blooming vitality to flow from you to $N.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Refresh!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 81, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "move", 
         Modifier = "l", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "refresh", 
   Position = "standing", 
   Target = "defensive", 
   Level = 6, 
   Beats = 18, 
   Mana = 12, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Remove Invis!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 230, 
   Ability = "force", 
   SpellFunction = "spell_remove_invis", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "remove masking", 
   Position = "standing", 
   Target = "ignore", 
   Level = 8, 
   Beats = 12, 
   Mana = 10, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Remove trap!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 87, 
   Ability = "force", 
   SpellFunction = "spell_remove_trap", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "remove trap", 
   Position = "standing", 
   Target = "ignore", 
   Level = 29, 
   Beats = 12, 
   Mana = 35, 
}

SkillEntry
{
   Participants = 2, 
   Type = "Force Power", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "A warm feeling flows through you.", 
         ToRoom = "A warm feeling flows through $N.", 
      }, 
      Failure = 
      {
      }, 
   }, 
   Slot = 113, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "hit", 
         Modifier = "200", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Flags = 
   {
      [24] = "Group", 
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Alignment = 1001, 
   Name = "restoration", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 60, 
   Beats = 20, 
   Mana = 80, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "A luminous aura spreads slowly over your body.", 
         ToCaster = "A luminous aura spreads slowly over $N's body.", 
         ToRoom = "A luminous aura spreads slowly over $N's body.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "The luminous aura about your body fades away.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 36, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "(l*4)+30", 
         AffectedBy = "sanctuary", 
         Modifier = "sanctuary", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "sanctuary", 
   Position = "resting", 
   Target = "defensive", 
   Level = 27, 
   Beats = 12, 
   Mana = 75, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "scorching surge", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Scorching Surge!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 296, 
   Ability = "force", 
   SpellFunction = "spell_scorching_surge", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Alignment = -1001, 
   Name = "scorching surge", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 73, 
   Beats = 12, 
   Mana = 25, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "A force shield of shimmering blue surrounds you.", 
         ToCaster = "A force shield of shimmering blue surrounds $N.", 
         ToRoom = "A force shield of shimmering blue surrounds $N.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Your force shield shimmers then fades away.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 67, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "armor", 
         Duration = "l*20", 
         Modifier = "-50", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "shield", 
   Position = "resting", 
   Target = "defensive", 
   Level = 26, 
   Beats = 18, 
   Mana = 12, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "shocking grasp", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Shocking Grasp!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 51, 
   Ability = "force", 
   SpellFunction = "spell_shocking_grasp", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Alignment = -1001, 
   Name = "shocking grasp", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 14, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Torrents of cascading energy form around you.", 
         ToRoom = "Torrents of cascading energy form around $N.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "The torrents of cascading energy suddenly fade away.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 89, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "(l*3)+14", 
         AffectedBy = "shockshield", 
         Modifier = "shockshield", 
      }, 
   }, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Alignment = -1001, 
   Name = "shockshield", 
   Position = "standing", 
   Target = "self", 
   Level = 72, 
   Beats = 12, 
   Mana = 95, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You feel less tired.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 38, 
   Ability = "force", 
   SpellFunction = "spell_sleep", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "sleep", 
   Position = "standing", 
   Target = "ignore", 
   Level = 24, 
   Beats = 12, 
   Mana = 15, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You suddenly feel more nimble...", 
         ToCaster = "$N suddenly appears more agile...", 
         ToRoom = "$N suddenly appears more agile...", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You suddenly feel less coordinated...", 
      Failure = 
      {
      }, 
   }, 
   Slot = 205, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "dexterity", 
         Duration = "l*24", 
         Modifier = "1+(l/17)", 
      }, 
      [3] = 
      {
         Location = "dodge", 
         Duration = "l*20", 
         Modifier = "l/8", 
      }, 
      [4] = 
      {
         Location = "dodge", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
   Alignment = 1001, 
   Name = "slink", 
   Position = "resting", 
   Target = "defensive", 
   Level = 18, 
   Beats = 12, 
   Mana = 12, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Your vision is elevated to the highest plane.", 
         ToRoom = "$N's eyes begin to glow a soft white.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Your vision descends to the material plane.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 235, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*5", 
         AffectedBy = "truesight", 
         Modifier = "truesight", 
      }, 
   }, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "true sight", 
   Position = "standing", 
   Target = "self", 
   Level = 77, 
   Beats = 12, 
   Mana = 70, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Your defenses are unravelled before your very eyes.", 
         ToCaster = "$N's eyes widen in fear as $S defenses are unravelled.", 
         ToRoom = "$N's eyes widen in fear as $S defenses are unravelled.", 
      }, 
      VictimImmune = 
      {
         ToCaster = "Your spell has no effect upon $N.", 
      }, 
      WearOff = "Your intricate defenses are restored to their original quality.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 110, 
   Ability = "force", 
   SpellFunction = "spell_smaug", 
   Affects = 
   {
      [2] = 
      {
         Location = "susceptible", 
         Duration = "(l*3)+25", 
         Modifier = "1048576", 
      }, 
      [3] = 
      {
         Location = "susceptible", 
         Duration = "(l*3)+25", 
         Modifier = "8192", 
      }, 
   }, 
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
   Name = "unravel defense", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 66, 
   Beats = 15, 
   Mana = 70, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Ventriloquate!", 
      Failure = 
      {
      }, 
   }, 
   Slot = 41, 
   Ability = "force", 
   SpellFunction = "spell_ventriloquate", 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Name = "ventriloquate", 
   Position = "standing", 
   Target = "ignore", 
   Level = 9, 
   Beats = 12, 
   Mana = 5, 
}

SkillEntry
{
   Type = "Force Power", 
   Messages = 
   {
      NounDamage = "spell", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You feel stronger.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 68, 
   Ability = "force", 
   SpellFunction = "spell_weaken", 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   Alignment = -1001, 
   Name = "weaken", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 3, 
   Beats = 12, 
   Mana = 20, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "&cYou focus your senses to find those that would hide from you.&R&W", 
         ToCaster = "You focus your senses to find those that would hide from you.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "&cYour mind is no longer focused enough to see those hidden from you.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your senses.&R&W", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*5", 
         AffectedBy = "detect_hidden", 
         Modifier = "detect hidden", 
      }, 
   }, 
   Name = "acute_awareness", 
   Position = "resting", 
   Target = "self", 
   Level = 50, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "You focus on your opponents weak points increasing your damage.", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "&cYou focus your strength to increase your damage.&R&W", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "&cYour mind relaxes its focus on increasing your damage.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your abilities.&R&W", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Affects = 
   {
      [2] = 
      {
         Location = "damroll", 
         Duration = "l*10", 
         Modifier = "2+(l/33)", 
      }, 
   }, 
   Name = "acute_damage", 
   Position = "standing", 
   Target = "self", 
   Level = 99, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "leadership", 
   Beats = 12, 
   Name = "add_patrol", 
   Position = "standing", 
   Target = "ignore", 
   Level = 50, 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Aid!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "diplomacy", 
   Beats = 12, 
   Name = "aid", 
   Position = "standing", 
   Target = "ignore", 
   Level = 1, 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32006] = "old teacher master man human scholar", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&RYou fumble with the binds.&R&W", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 6, 
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Name = "apprehend", 
   Position = "standing", 
   Target = "offensive", 
   Level = 35, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   SpellFunction = "spell_charm_person", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "backstab", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Backstab!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 12, 
   Name = "backstab", 
   Position = "standing", 
   Target = "ignore", 
   Level = 6, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "bash", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Bash!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 8, 
   Name = "bash", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 47, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Beg!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 20, 
   Name = "beg", 
   Position = "standing", 
   Target = "ignore", 
   Level = 1, 
   Teachers = 
   {
      [210] = "begger", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "???", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 4, 
   Name = "berserk", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 85, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 3, 
   Name = "bind", 
   Position = "dead", 
   Target = "offensive", 
   Level = 45, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "bribe", 
   Position = "standing", 
   Ability = "diplomacy", 
   Beats = 12, 
   Level = 25, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "capital ships", 
   Position = "resting", 
   Target = "ignore", 
   Level = 90, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "circle", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Circle!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 16, 
   Name = "circle", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 50, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "climb", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!climb!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 10, 
   Name = "climb", 
   Position = "standing", 
   Target = "offensive", 
   Level = 7, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
      [410] = "old wookiee woman", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "cloak", 
   Position = "dead", 
   Ability = "force", 
   Level = 35, 
   Teachers = 
   {
      [605] = "ancient sith spirit teacher sith9870", 
      [50] = "Master Yoda", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "force", 
   SpellFunction = "spell_null", 
   Name = "cutdoor", 
   Position = "dead", 
   Target = "ignore", 
   Level = 20, 
   Teachers = 
   {
      [50] = "Master Yoda", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Detrap!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 24, 
   Name = "detrap", 
   Position = "sitting", 
   Target = "ignore", 
   Level = 32, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 20, 
   Name = "dig", 
   Position = "standing", 
   Target = "ignore", 
   Level = 2, 
   Teachers = 
   {
      [6805] = "mine foreman Krauota", 
      [206] = "technician", 
      [6819] = "boss Hityii", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Disarm!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 24, 
   Name = "disarm", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 45, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!disguise!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 12, 
   Name = "disguise", 
   Position = "standing", 
   Target = "ignore", 
   Level = 70, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Dodge!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "dodge", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 50, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
         ToCaster = "&BYou fail.&R&W", 
      }, 
   }, 
   Ability = "leadership", 
   Beats = 12, 
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Name = "dominate", 
   Position = "standing", 
   Target = "offensive", 
   Level = 75, 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [10504] = "Corellian Diktat", 
   }, 
   SpellFunction = "spell_charm_person", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "bashdoor", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Bash Door!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 24, 
   Name = "doorbash", 
   Position = "standing", 
   Target = "ignore", 
   Level = 10, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Dual Wield!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "dual wield", 
   Position = "standing", 
   Target = "ignore", 
   Level = 27, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "leadership", 
   Beats = 12, 
   Name = "elite_guard", 
   Position = "standing", 
   Target = "ignore", 
   Level = 85, 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Enhanced Damage!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "enhanced damage", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 10, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "engineering", 
   SpellFunction = "spell_null", 
   Name = "fake signal", 
   Position = "dead", 
   Target = "ignore", 
   Level = 105, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Fifth Attack!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "fifth attack", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 140, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!First Aid!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "diplomacy", 
   Beats = 12, 
   Name = "first aid", 
   Position = "standing", 
   Target = "ignore", 
   Level = 1, 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32006] = "old teacher master man human scholar", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "&cA strong mind leads to a stronger body.&R&W", 
         ToCaster = "A strong mind leads to a stronger body.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "&cYour mind wanders from strengthening your body.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your energy.&R&W", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Affects = 
   {
      [2] = 
      {
         Location = "strength", 
         Duration = "l*10", 
         Modifier = "2+(l/33)", 
      }, 
   }, 
   Name = "focus strength", 
   Position = "standing", 
   Target = "self", 
   Level = 70, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Fourth Attack!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "fourth attack", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 115, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "leadership", 
   Beats = 40, 
   Difficulty = 4, 
   Name = "gather_intelligence", 
   Position = "standing", 
   Target = "ignore", 
   Level = 100, 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "gouge", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Gouge!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 10, 
   Name = "gouge", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 30, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "grenades", 
   Position = "resting", 
   Target = "ignore", 
   Level = 61, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Grip!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "grip", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 50, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "&cYou focus on your ability to hit your opponent.&R&W", 
         ToCaster = "You focus on your ability to hit your oponent.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "&cYou lose your focus on your opponent.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your skills.&R&W", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Affects = 
   {
      [2] = 
      {
         Location = "hitroll", 
         Duration = "l*10", 
         Modifier = "2+(l/33)", 
      }, 
   }, 
   Name = "heightened accuracy", 
   Position = "standing", 
   Target = "self", 
   Level = 85, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Hijack!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 12, 
   Name = "hijack", 
   Position = "standing", 
   Target = "ignore", 
   Level = 95, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "hit", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!HitAll!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 12, 
   Name = "hitall", 
   Position = "standing", 
   Target = "ignore", 
   Level = 87, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "&cYou harden yourself against all pain.&R&W", 
         ToCaster = "You harden yourself against pain.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "&cYou soften against all pain.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your energy.&R&W", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Affects = 
   {
      [2] = 
      {
         Location = "resistant", 
         Duration = "l*10", 
         Modifier = "8", 
      }, 
      [3] = 
      {
         Location = "resistant", 
         Duration = "l*10", 
         Modifier = "2097152", 
      }, 
      [4] = 
      {
         Location = "resistant", 
         Duration = "l*10", 
         Modifier = "8192", 
      }, 
      [5] = 
      {
         Location = "resistant", 
         Duration = "l*10", 
         Modifier = "32", 
      }, 
      [6] = 
      {
         Location = "constitution", 
         Duration = "l*10", 
         Modifier = "1+(l/50)", 
      }, 
   }, 
   Name = "inner strength", 
   Position = "standing", 
   Target = "self", 
   Level = 80, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "leadership", 
   Beats = 12, 
   Name = "jail", 
   Position = "standing", 
   Target = "ignore", 
   Level = 25, 
   Teachers = 
   {
      [408] = "human police officer cop", 
      [32011] = "new repulic training officer", 
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "jumpvector", 
   Position = "dead", 
   Ability = "piloting", 
   Level = 80, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "kick", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Kick!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 8, 
   Name = "kick", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 6, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Steal!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 24, 
   Name = "lift", 
   Position = "standing", 
   Target = "ignore", 
   Level = 20, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "force", 
   SpellFunction = "spell_null", 
   Name = "lightsaber crafting", 
   Position = "resting", 
   Target = "ignore", 
   Level = 25, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "&cYou relax your muscles becoming more limber and agile.&R&W", 
         ToCaster = "You relax your muscles becoming limber and agile.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "&cYour muscles stiffen as your efforts to relax them fade.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou can't become any more limber.&R&W", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Affects = 
   {
      [2] = 
      {
         Location = "dexterity", 
         Duration = "l*10", 
         Modifier = "2+(l/33)", 
      }, 
   }, 
   Name = "limber", 
   Position = "standing", 
   Target = "self", 
   Level = 90, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makearmor", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 58, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makeblade", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 40, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makeblaster", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 95, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Type = "Skill", 
   Name = "makebowcaster", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 40, 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makecomlink", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 5, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makecontainer", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 1, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
      [10340] = "Domick Dom teacher", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makeglowrod", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 10, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makegrenade", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 95, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makejewelry", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 60, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makelandmine", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 80, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "makeshield", 
   Position = "resting", 
   Ability = "engineering", 
   Level = 70, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "diplomacy", 
   Beats = 12, 
   Name = "mass_propaganda", 
   Position = "standing", 
   Target = "ignore", 
   Level = 80, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You meditate peacefully, tuning yourself to the Force.", 
      }, 
      Failure = 
      {
         ToVictim = "You spend several minutes in deep concentration, but fail to find the Force.", 
      }, 
   }, 
   Ability = "force", 
   Beats = 25, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = "force", 
         Modifier = "l", 
      }, 
   }, 
   Name = "meditate", 
   Position = "resting", 
   Target = "self", 
   Level = 1, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [3199] = "an old man", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "midships", 
   Position = "resting", 
   Target = "ignore", 
   Level = 30, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!mine!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 12, 
   Name = "mine", 
   Position = "standing", 
   Target = "ignore", 
   Level = 90, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Search!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 10, 
   Name = "mount", 
   Position = "standing", 
   Target = "ignore", 
   Level = 7, 
   Teachers = 
   {
      [412] = "Self Defence Trainer", 
      [10509] = "An instructor", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "navigation", 
   Position = "resting", 
   Target = "ignore", 
   Level = 1, 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [10340] = "Domick Dom teacher", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Parry!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "force", 
   SpellFunction = "spell_null", 
   Name = "parry", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 25, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Peek!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   SpellFunction = "spell_null", 
   Name = "peek", 
   Position = "standing", 
   Target = "ignore", 
   Level = 20, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
      [410] = "old wookiee woman", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Pick!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 12, 
   Name = "pick lock", 
   Position = "standing", 
   Target = "ignore", 
   Level = 55, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Pickshiplock!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 12, 
   Name = "pick ship lock", 
   Position = "standing", 
   Target = "ignore", 
   Level = 90, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "poisonous concoction", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Poison Weapon!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 12, 
   Name = "poison weapon", 
   Position = "standing", 
   Target = "objinv", 
   Level = 30, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!post guard!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "leadership", 
   Beats = 12, 
   Name = "post guard", 
   Position = "standing", 
   Target = "ignore", 
   Level = 35, 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "propaganda", 
   Position = "standing", 
   Ability = "diplomacy", 
   Beats = 4, 
   Level = 50, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "punch", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Punch!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 8, 
   Name = "punch", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 40, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!reinforcements!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "leadership", 
   Beats = 12, 
   Name = "reinforcements", 
   Position = "standing", 
   Target = "ignore", 
   Level = 60, 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Rescue!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 12, 
   Name = "rescue", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 8, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "sabotage", 
   Position = "dead", 
   Ability = "engineering", 
   Level = 120, 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [10340] = "Domick Dom teacher", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Scan!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 12, 
   Name = "scan", 
   Position = "standing", 
   Target = "ignore", 
   Level = 1, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10340] = "Domick Dom teacher", 
      [10509] = "An instructor", 
      [320] = "human citizen", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Search!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 20, 
   Name = "search", 
   Position = "standing", 
   Target = "ignore", 
   Level = 3, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
      [410] = "old wookiee woman", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Second Attack!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "second attack", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 45, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "diplomacy", 
   Beats = 12, 
   Name = "seduce", 
   Position = "standing", 
   Target = "ignore", 
   Level = 65, 
   Teachers = 
   {
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "&cYou focus your senses in an effort to detect the unseen.&R&W", 
         ToCaster = "You focus your senses in an effort to detect the unseen.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "&cYour focus to see the unseen relaxes.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your mind.&R&W", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*5", 
         AffectedBy = "detect_invis", 
         Modifier = "detect invis", 
      }, 
   }, 
   Name = "see masking", 
   Position = "resting", 
   Target = "self", 
   Level = 60, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "ship docking", 
   Position = "dead", 
   Target = "ignore", 
   Level = 30, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "engineering", 
   SpellFunction = "spell_null", 
   Name = "ship maintenance", 
   Position = "resting", 
   Target = "ignore", 
   Level = 25, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "ship systems", 
   Position = "resting", 
   Target = "ignore", 
   Level = 1, 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [10340] = "Domick Dom teacher", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 5, 
   Name = "skin", 
   Position = "resting", 
   Target = "ignore", 
   Level = 1, 
   Teachers = 
   {
      [328] = "Sleejat", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "force", 
   Beats = 3, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Name = "slicing", 
   Position = "dead", 
   Target = "ignore", 
   Level = 105, 
   Teachers = 
   {
      [32010] = "Twilek craftswoman woman", 
      [206] = "technician", 
   }, 
   SpellFunction = "spell_null", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "smalltalk", 
   Position = "standing", 
   Ability = "diplomacy", 
   Beats = 4, 
   Level = 10, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You attempt to move silently.", 
      }, 
      Failure = 
      {
         ToCaster = "You attempt to move silently.", 
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 1, 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*23", 
         AffectedBy = "sneak", 
         Modifier = "sneak", 
      }, 
   }, 
   Name = "sneak", 
   Position = "standing", 
   Target = "self", 
   Level = 5, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
      [410] = "old wookiee woman", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!snipe!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 12, 
   Name = "snipe", 
   Position = "standing", 
   Target = "ignore", 
   Level = 2, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "space combat 1", 
   Position = "resting", 
   Target = "ignore", 
   Level = 25, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "space combat 2", 
   Position = "resting", 
   Target = "ignore", 
   Level = 50, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "space combat 3", 
   Position = "resting", 
   Target = "ignore", 
   Level = 75, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "leadership", 
   Beats = 12, 
   Name = "special_forces", 
   Position = "standing", 
   Target = "ignore", 
   Level = 95, 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "speeder combat", 
   Position = "dead", 
   Target = "ignore", 
   Level = 75, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "speeders", 
   Position = "dead", 
   Target = "ignore", 
   Level = 30, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "engineering", 
   SpellFunction = "spell_null", 
   Name = "spice refining", 
   Position = "resting", 
   Target = "ignore", 
   Level = 50, 
   Teachers = 
   {
      [32029] = "hutt crimelord", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "starfighters", 
   Position = "resting", 
   Target = "ignore", 
   Level = 1, 
   Teachers = 
   {
      [32040] = "imperial flight lieutenant", 
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [10340] = "Domick Dom teacher", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You attempt to hide.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You are no longer hidden.", 
      Failure = 
      {
         ToCaster = "You attempt to hide.", 
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 12, 
   Name = "stealth", 
   Position = "resting", 
   Target = "self", 
   Level = 50, 
   Affects = 
   {
      [2] = 
      {
         Location = "affected", 
         Duration = "l*23", 
         Modifier = "hide", 
      }, 
   }, 
   Teachers = 
   {
      [32009] = "suspicious fellow", 
      [410] = "old wookiee woman", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Type = "Skill", 
   Name = "study", 
   Position = "dead", 
   Ability = "diplomacy", 
   Beats = 12, 
   Teachers = 
   {
      [10340] = "Domick Dom teacher", 
      [32006] = "old teacher master man human scholar", 
   }, 
   Target = "objinv", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      NounDamage = "stun", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "You regain consciousness.", 
      Failure = 
      {
      }, 
   }, 
   Ability = "none", 
   Beats = 8, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Name = "stun", 
   Position = "fighting", 
   Target = "offensive", 
   Level = 105, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Third Attack!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "third attack", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 95, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!throw!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   Beats = 3, 
   Name = "throw", 
   Position = "sitting", 
   Target = "ignore", 
   Level = 5, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!torture!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "leadership", 
   Beats = 12, 
   Name = "torture", 
   Position = "standing", 
   Target = "ignore", 
   Level = 85, 
   Teachers = 
   {
      [32029] = "hutt crimelord", 
      [10504] = "Corellian Diktat", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Track!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 14, 
   Name = "track", 
   Position = "standing", 
   Target = "ignore", 
   Level = 3, 
   Teachers = 
   {
      [32050] = "rodian hunter bounty mercenary", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "tractor beams", 
   Position = "resting", 
   Target = "ignore", 
   Level = 35, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You enter a peaceful trance, tuning yourself to the Force.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!TRANCE!", 
      Failure = 
      {
         ToVictim = "You spend several minutes in a deep trance, but fail to find the Force.", 
      }, 
   }, 
   Ability = "force", 
   Beats = 32, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = "force", 
         Modifier = "l*2", 
      }, 
   }, 
   Name = "trance", 
   Position = "resting", 
   Target = "self", 
   Level = 60, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
   SpellFunction = "spell_smaug", 
}

SkillEntry
{
   Type = "Skill", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!done!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "piloting", 
   SpellFunction = "spell_null", 
   Name = "weapon systems", 
   Position = "resting", 
   Target = "ignore", 
   Level = 2, 
   Teachers = 
   {
      [32007] = "imperial flight officer", 
      [32008] = "Rebel Alliance flight instructor", 
      [32040] = "imperial flight lieutenant", 
   }, 
}

SkillEntry
{
   Type = "Weapon", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Blasters!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "blasters", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 2, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Bludgeons!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Weapon", 
   Name = "bludgeons", 
   Position = "fighting", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 101, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Weapon", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "bowcasters", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 4, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Flexible Arms!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Weapon", 
   Name = "flexible arms", 
   Position = "fighting", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 101, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Weapon", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "force pikes", 
   Position = "dead", 
   Target = "ignore", 
   Level = 3, 
   Teachers = 
   {
      [32012] = "imperial trooper drill seargent", 
      [10509] = "An instructor", 
      [32011] = "new repulic training officer", 
      [412] = "Self Defence Trainer", 
   }, 
}

SkillEntry
{
   Type = "Weapon", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Lightsabers!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "force", 
   SpellFunction = "spell_null", 
   Name = "lightsabers", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 2, 
   Teachers = 
   {
      [50] = "Master Yoda", 
      [605] = "ancient sith spirit teacher sith9870", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Talonous Arms!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Weapon", 
   Name = "talonous arms", 
   Position = "fighting", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 101, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Weapon", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Vibro-Blades!", 
      Failure = 
      {
      }, 
   }, 
   Ability = "combat", 
   SpellFunction = "spell_null", 
   Name = "vibro-blades", 
   Position = "fighting", 
   Target = "ignore", 
   Level = 1, 
   Teachers = 
   {
      [32011] = "new repulic training officer", 
      [32012] = "imperial trooper drill seargent", 
      [412] = "Self Defence Trainer", 
      [10340] = "Domick Dom teacher", 
      [10509] = "An instructor", 
   }, 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Adarian!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "adarian", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "barabel", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "binary", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "bothan", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "chadra-fan", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Common!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "common", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "coynite", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "defel", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "devaronian", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "duros", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "ewok", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "falleen", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "firrerreo", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Gamorrean!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "gamorrean", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "gand", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "gotal", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Hutt!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "hutt", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "ithorian", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Jawa!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "jawa", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "kubaz", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Mon Calamari!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "mon calamari", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "quarren", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Rodian!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "rodian", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Noghri!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "shistavanen", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "sullustan", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "togorian", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "trandoshan", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Dwarven!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "twilek", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "verpine", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "!Wookiee!", 
      Failure = 
      {
      }, 
   }, 
   Type = "Tongue", 
   Name = "wookiee", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Level = 1, 
   Target = "ignore", 
}

SkillEntry
{
   Type = "Tongue", 
   Name = "yevethan", 
   Position = "dead", 
   Ability = "none", 
   SpellFunction = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
      }, 
      VictimDeath = 
      {
      }, 
      Success = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Target = "ignore", 
}
