-- Skills
-- Last saved Monday 30-Nov-2020 10:39:46

SkillEntry
{
   Level = 45, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "offensive", 
   Function = "do_bind", 
   Type = "Skill", 
   Beats = 3, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "dead", 
   Ability = "bounty hunting", 
   Name = "bind", 
}

SkillEntry
{
   Level = 105, 
   Slot = 22, 
   Mana = 15, 
   Target = "offensive", 
   Function = "spell_dispel_evil", 
   Type = "unknown", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "dispel evil", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Dispel Evil!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "fighting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "dispel dark", 
}

SkillEntry
{
   Level = 105, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_smaug", 
   Type = "unknown", 
   Ability = "combat", 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "dead", 
   Name = "stun", 
}

SkillEntry
{
   Level = 101, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_smaug", 
   Type = "unknown", 
   Ability = "combat", 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "dead", 
   Name = "unknown", 
}

SkillEntry
{
   Level = 60, 
   Slot = 85, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You prepare to absorb incoming energy.", 
         ToCaster = "$N's eyelids seem heavy for a moment.", 
         ToRoom = "$N's eyelids seem heavy for a moment.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "Your pent up energy disperses into the deck.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 28, 
         Modifier = "8", 
         Duration = "l*5", 
      }, 
   }, 
   Mana = 50, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Value = 30, 
   Flags = 
   {
      [9] = "_09", 
   }, 
   Position = "resting", 
   Beats = 4, 
   Dice = "none", 
   Name = "absorb energy", 
}

SkillEntry
{
   Level = 28, 
   Slot = 7, 
   Mana = 5, 
   Target = "offensive", 
   Function = "spell_charm_person", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You feel more self-confident.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "affect mind", 
}

SkillEntry
{
   Level = 26, 
   Slot = 102, 
   Mana = 60, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You suddenly feel alert.", 
         ToCaster = "", 
         ToRoom = "$N's eyes dart about the room in an alert manner.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You are suddenly less alert.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         Location = 27, 
         Modifier = "4194304", 
         Duration = "l*15", 
      }, 
      [3] = 
      {
         Location = 27, 
         Modifier = "1024", 
         Duration = "l*15", 
      }, 
      [4] = 
      {
         Location = 28, 
         Modifier = "32", 
         Duration = "l*15", 
      }, 
      [5] = 
      {
         Location = 27, 
         Modifier = "8", 
         Duration = "l*15", 
      }, 
   }, 
   Beats = 15, 
   Name = "alertness", 
}

SkillEntry
{
   Level = 101, 
   Slot = 236, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your lungs take on the ability to breathe water...", 
         ToCaster = "$N's lungs take on the ability to breathe water...", 
         ToRoom = "$N's lungs take on the ability to breathe water...", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "Your lungs revert to their original state.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Mana = 50, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "none", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "aqua breath", 
         Duration = "l*23", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Flags = 
   {
      [21] = "Recastable", 
   }, 
   Position = "standing", 
   Alignment = 100, 
   Beats = 12, 
   Name = "aqua breath", 
}

SkillEntry
{
   Level = 5, 
   Slot = 1, 
   Mana = 5, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your armor begins to glow softly as it is enhanced by the Force.", 
         ToCaster = "$N's armor begins to glow softly as it is enhanced by the Force.", 
         ToRoom = "$N's armor begins to glow softly as it is enhanced by the Force.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "Your armor returns to its mundane value.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
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
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "armor", 
}

SkillEntry
{
   Level = 6, 
   Slot = 226, 
   Mana = 14, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Drawing the Force, you change yourself to be more likeable.", 
         ToCaster = "$N seems more jovial.", 
         ToRoom = "$N suddenly seems like a much nicer person.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You stop enhancing yourself.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
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
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "standing", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "beauty", 
}

SkillEntry
{
   Level = 10, 
   Slot = 4, 
   Mana = 5, 
   Target = "ignore", 
   Function = "spell_blindness", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You can see again.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "blindness", 
}

SkillEntry
{
   Level = 20, 
   Slot = 63, 
   Mana = 20, 
   Target = "offensive", 
   Function = "spell_cause_critical", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You feel a tight pressure around your throat.", 
         ToCaster = "Stretching out with the force you slowly choke your victim.", 
         ToRoom = "$N begins to claw at $S throat.", 
      }, 
      NounDamage = "spell", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Cause Critical!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "choke", 
}

SkillEntry
{
   Level = 8, 
   Slot = 14, 
   Mana = 5, 
   Target = "defensive", 
   Function = "spell_cure_blindness", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Cure Blindness!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "cure blindness", 
}

SkillEntry
{
   Level = 18, 
   Slot = 15, 
   Mana = 20, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your critical wounds close and your pain ebbs away.", 
         ToCaster = "You cure $N's critical wounds.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Cure Critical!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "3d8+(l-6)", 
         Location = 13, 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "cure critical", 
}

SkillEntry
{
   Level = 2, 
   Slot = 16, 
   Mana = 10, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your light wounds mend and your pain ebbs slightly.", 
         ToCaster = "You cure $N's light wounds.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "Your ability to see in the dark fades away.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "1d8+(l/3)", 
         Location = 13, 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "cure light", 
}

SkillEntry
{
   Level = 16, 
   Slot = 43, 
   Mana = 5, 
   Target = "defensive", 
   Function = "spell_cure_poison", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Cure Poison!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "cure poison", 
}

SkillEntry
{
   Level = 10, 
   Slot = 61, 
   Mana = 15, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your serious wounds mend and your pain ebbs away.", 
         ToCaster = "You cure $N's serious wounds.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Cure Serious!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "2d8+(l/2)", 
         Location = 13, 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "cure serious", 
}

SkillEntry
{
   Level = 5, 
   Slot = 18, 
   Mana = 5, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Traces of red outline all those who abuse the Force.", 
         ToCaster = "", 
         ToRoom = "A tint of red appears in $N's eyes, mirroring his own vision.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You stop focusing on the Dark Side.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
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
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "detect darkness", 
}

SkillEntry
{
   Level = 5, 
   Slot = 20, 
   Mana = 5, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Traces of blue outline objects touched by the Force.", 
         ToCaster = "", 
         ToRoom = "A tint of blue in $N's eyes mirrors $S own perception.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "The blue outlines disappear from your vision.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect magic", 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 12, 
   Name = "detect force", 
}

SkillEntry
{
   Level = 8, 
   Slot = 58, 
   Mana = 9, 
   Target = "defensive", 
   Function = "spell_know_alignment", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "fighting", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Know Alignment!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "detect intent", 
}

SkillEntry
{
   Level = 4, 
   Slot = 19, 
   Mana = 5, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your eyes fixate as they gain the ability to see the unseen.", 
         ToCaster = "", 
         ToRoom = "$N's eyes fixate as they gain the ability to see the unseen.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You no longer see invisible objects.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "7310", 
      }, 
      [3] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "sitting", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect invis", 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 12, 
   Name = "detect masking", 
}

SkillEntry
{
   Level = 9, 
   Slot = 21, 
   Mana = 5, 
   Target = "objinv", 
   Function = "spell_detect_poison", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "standing", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Detect Poison!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "detect poison", 
}

SkillEntry
{
   Level = 13, 
   Slot = 86, 
   Mana = 15, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You suddenly grow aware of the dangers about you.", 
         ToCaster = "", 
         ToRoom = "$N peers about the room, intent on finding all manner of danger.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You feel less aware of the dangers about you.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "resting", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect traps", 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 12, 
   Name = "detect traps", 
}

SkillEntry
{
   Level = 20, 
   Slot = 59, 
   Mana = 15, 
   Target = "offensive", 
   Function = "spell_dispel_magic", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "fighting", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Dispel Magic!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "dispel force", 
}

SkillEntry
{
   Level = 27, 
   Slot = 25, 
   Mana = 35, 
   Target = "offensive", 
   Function = "spell_energy_drain", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "energy drain", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Energy Drain!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "drain essence", 
}

SkillEntry
{
   Level = 35, 
   Slot = 233, 
   Mana = 5, 
   Target = "ignore", 
   Function = "spell_dream", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Dream!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "dream", 
}

SkillEntry
{
   Level = 15, 
   Slot = 23, 
   Mana = 15, 
   Target = "ignore", 
   Function = "spell_earthquake", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "earthquake", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Earthquake!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "earthquake", 
}

SkillEntry
{
   Level = 70, 
   Slot = 222, 
   Mana = 15, 
   Target = "ignore", 
   Function = "spell_farsight", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "sitting", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Farsight!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "farsight", 
}

SkillEntry
{
   Level = 46, 
   Slot = 103, 
   Mana = 60, 
   Target = "offensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You suddenly grow very tired and drowsy.", 
         ToCaster = "$N suddenly appears very tired and drowsy.", 
         ToRoom = "$N suddenly appears very tired and drowsy.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You no longer feel so sleepy.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "Mysteriously, $N was not affected by your spell.", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
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
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 15, 
   Name = "fatigue", 
}

SkillEntry
{
   Level = 80, 
   Slot = 107, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You grow feeble from a powerful curse.", 
         ToCaster = "You lay a curse of feebleness upon $N.", 
         ToRoom = "$n lays a curse of feebleness upon $N.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You no longer feel so feeble.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "$N is not affected by your spell.", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Mana = 30, 
   Target = "offensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Affects = 
   {
      [2] = 
      {
         Location = 29, 
         Modifier = "512", 
         Duration = "l*19", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 10, 
   Name = "feebleness", 
}

SkillEntry
{
   Level = 18, 
   Slot = 26, 
   Mana = 15, 
   Target = "offensive", 
   Function = "spell_fireball", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "fireball", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Fireball!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "fireball", 
}

SkillEntry
{
   Level = 26, 
   Slot = 65, 
   Mana = 20, 
   Target = "offensive", 
   Function = "spell_flamestrike", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "flamestrike", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Flamestrike!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "flamestrike", 
}

SkillEntry
{
   Level = 10, 
   Slot = 292, 
   Mana = 8, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You begin to float in mid-air...", 
         ToCaster = "$N begins to float in mid-air...", 
         ToRoom = "$N begins to float in mid-air...", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "Your feet float slowly to the surface.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "float", 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 18, 
   Name = "float", 
}

SkillEntry
{
   Mana = 120, 
   Function = "spell_smaug", 
   Alignment = -1001, 
   Beats = 24, 
   Participants = 3, 
   Name = "force blast wrath", 
   Level = 50, 
   Slot = 115, 
   Target = "ignore", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "spiritual wrath", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
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
   Position = "fighting", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Dice = "44*W", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "blindness", 
         Duration = "6", 
      }, 
   }, 
}

SkillEntry
{
   Level = 27, 
   Slot = 30, 
   Mana = 15, 
   Target = "offensive", 
   Function = "spell_lightning_bolt", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "lightning bolt", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Lightning Bolt!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "force bolt", 
}

SkillEntry
{
   Level = 90, 
   Slot = 224, 
   Mana = 40, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "A shimmering translucent shell forms about you.", 
         ToCaster = "", 
         ToRoom = "A shimmering translucent shell forms about $N.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "The shimmering shell and its protection from the Force fade away...", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 27, 
         Modifier = "2907151", 
         Duration = "l*24", 
      }, 
      [3] = 
      {
         Location = 17, 
         Modifier = "-80", 
         Duration = "l*20", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "force bubble", 
}

SkillEntry
{
   Level = 43, 
   Slot = 218, 
   Mana = 75, 
   Target = "offensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "An aura surrounds you, channeling violent energies in your direction!", 
         ToCaster = "You erect a Force funnel about $N...", 
         ToRoom = "A Force funnel forms about $N...", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "The funnel of Force about you ceases to exist.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "The Force funnel dissipates before it reaches $N.", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
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
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 22, 
   Name = "force funnel", 
}

SkillEntry
{
   Level = 90, 
   Slot = 303, 
   Mana = 35, 
   Target = "offensive", 
   Function = "spell_black_lightning", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "Force Lightning", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!WEAROFF!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
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
   Alignment = -1001, 
   Beats = 8, 
   Name = "force lightning", 
}

SkillEntry
{
   Level = 80, 
   Slot = 217, 
   Mana = 75, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You fade from the mundane energy continuum.", 
         ToCaster = "", 
         ToRoom = "A shield of Force divides $N from the mundane energy continuum.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You are returned to the mundane energy continuum.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 27, 
         Modifier = "1048576", 
         Duration = "l*24", 
      }, 
      [3] = 
      {
         Location = 17, 
         Modifier = "-50", 
         Duration = "l*20", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Alignment = 1001, 
   Beats = 22, 
   Name = "force shield", 
}

SkillEntry
{
   Level = 4, 
   Slot = 77, 
   Mana = 5, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Heat appears red through your eyes.", 
         ToCaster = "$N's eyes dart about as they grow accustomed to Force sight.", 
         ToRoom = "$N's eyes dart about as they grow accustomed to Force sight.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You no longer see in the dark.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "infravision", 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 18, 
   Name = "force sight", 
}

SkillEntry
{
   Level = 2, 
   Slot = 62, 
   Mana = 15, 
   Target = "offensive", 
   Function = "spell_cause_light", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "spell", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Cause Light!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "force spray", 
}

SkillEntry
{
   Level = 28, 
   Slot = 228, 
   Mana = 12, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "The wisdom of the Force blossoms within you.", 
         ToCaster = "$N grows serious as wisdom takes root within $M.", 
         ToRoom = "$N grows serious as wisdom takes root within $M.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "Furrowing your brow, you sense the weight of wisdom leave you.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
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
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "forethought", 
}

SkillEntry
{
   Level = 11, 
   Slot = 3, 
   Mana = 5, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "A powerful blessing is laid upon you.", 
         ToCaster = "You lay the blessing of the Force upon $N.", 
         ToRoom = "$N beams as a powerful blessing is laid upon $M.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "The protection of the Force fades away.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 18, 
         Modifier = "l/8", 
         Duration = "l*23", 
      }, 
      [3] = 
      {
         Location = 24, 
         Modifier = "-(l/8)", 
         Duration = "l*23", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Alignment = 999, 
   Beats = 12, 
   Name = "good fortune", 
}

SkillEntry
{
   Level = 43, 
   Slot = 69, 
   Mana = 20, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You fade from existence.", 
         ToCaster = "", 
         ToRoom = "$N fades from existence.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You are no longer masked.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "mass invis", 
         Duration = "l*11", 
      }, 
   }, 
   Flags = 
   {
      [24] = "Group", 
   }, 
   Position = "standing", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Beats = 24, 
   Name = "group masking", 
}

SkillEntry
{
   Level = 56, 
   Slot = 307, 
   Mana = 15, 
   Target = "offensive", 
   Function = "spell_hand_of_chaos", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "Hand of Chaos", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!WEAROFF!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
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
   Alignment = -1001, 
   Beats = 8, 
   Name = "Hand of Darkness", 
}

SkillEntry
{
   Level = 55, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You steel yourself against pain.", 
         ToCaster = "", 
         ToRoom = "$N's face hardens.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You soften.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Mana = 12, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Beats = 18, 
   Affects = 
   {
      [2] = 
      {
         Location = 27, 
         Modifier = "8192", 
         Duration = "l*30", 
      }, 
      [3] = 
      {
         Location = 5, 
         Modifier = "4", 
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
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "dead", 
   Alignment = -1001, 
   Ability = "force", 
   Name = "harden", 
}

SkillEntry
{
   Level = 26, 
   Slot = 27, 
   Mana = 35, 
   Target = "offensive", 
   Function = "spell_harm", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "harm spell", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Harm!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "harm", 
}

SkillEntry
{
   Level = 30, 
   Slot = 28, 
   Mana = 50, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "A warm feeling fills your body.", 
         ToCaster = "You lay a hand of healing upon $N.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Heal!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "100", 
         Location = 13, 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "heal", 
}

SkillEntry
{
   Level = 15, 
   Slot = 44, 
   Mana = 5, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your senses are heightened to those of an animal.", 
         ToCaster = "", 
         ToRoom = "$N's senses are heightened to those of an animal.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You feel less aware of your surroundings.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "resting", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect hidden", 
         Duration = "l*24", 
      }, 
   }, 
   Beats = 12, 
   Name = "heightened awareness", 
}

SkillEntry
{
   Level = 4, 
   Slot = 57, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "Shards of iridescent light collide to form a dazzling ball...", 
         ToRoom = "Shards of iridescent light collide to form a dazzling ball...", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Continual Light!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Mana = 7, 
   Target = "ignore", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Value = 21, 
   Flags = 
   {
      [9] = "_09", 
      [25] = "Object", 
      [3] = "_03", 
   }, 
   Position = "standing", 
   Beats = 12, 
   Dice = "0", 
   Name = "illuminate", 
}

SkillEntry
{
   Level = 55, 
   Slot = 66, 
   Mana = 12, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You steel yourself against pain.", 
         ToCaster = "", 
         ToRoom = "$N's face hardens.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You soften.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 27, 
         Modifier = "8192", 
         Duration = "l*30", 
      }, 
      [3] = 
      {
         Location = 5, 
         Modifier = "5", 
         Duration = "l*20", 
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
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Alignment = 1001, 
   Beats = 18, 
   Name = "inner fortress", 
}

SkillEntry
{
   Level = 10, 
   Slot = 64, 
   Mana = 17, 
   Target = "offensive", 
   Function = "spell_cause_serious", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "spell", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Cause Serious!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "invade essence", 
}

SkillEntry
{
   Level = 20, 
   Slot = 53, 
   Mana = 12, 
   Target = "ignore", 
   Function = "spell_identify", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "standing", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Identify!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 24, 
   Name = "know essence", 
}

SkillEntry
{
   Level = 5, 
   Slot = 29, 
   Mana = 5, 
   Target = "ignore", 
   Function = "spell_invis", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You fade from existence.", 
         ToCaster = "A momentary lapse in attention, and $N is out of sight.", 
         ToRoom = "A momentary lapse in attention, and $N is out of sight.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You are no longer invisible.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "7310", 
      }, 
      [3] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "resting", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "invis", 
         Duration = "l*11", 
      }, 
   }, 
   Beats = 12, 
   Name = "mask", 
}

SkillEntry
{
   Level = 13, 
   Slot = 33, 
   Mana = 10, 
   Target = "offensive", 
   Function = "spell_poison", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "poison", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You feel less sick.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Position = "standing", 
   Alignment = -1001, 
   Beats = 20, 
   Name = "poison", 
}

SkillEntry
{
   Level = 150, 
   Slot = 232, 
   Mana = 120, 
   Target = "ignore", 
   Function = "spell_possess", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "possess", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You return to your body.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "standing", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "possess", 
}

SkillEntry
{
   Level = 12, 
   Slot = 34, 
   Mana = 5, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You are blessed with a protection from the Dark Side.", 
         ToCaster = "", 
         ToRoom = "$N is blessed with a protection from the Dark Side.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You feel less protected from the Dark Side.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
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
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "protection from darkness", 
}

SkillEntry
{
   Level = 6, 
   Slot = 81, 
   Mana = 12, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Blooming vitality flows through you.", 
         ToCaster = "You allow blooming vitality to flow from you to $N.", 
         ToRoom = "", 
      }, 
      NounDamage = "refresh", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Refresh!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "l", 
         Location = 14, 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Alignment = 1001, 
   Beats = 18, 
   Name = "refresh", 
}

SkillEntry
{
   Level = 8, 
   Slot = 230, 
   Mana = 10, 
   Target = "ignore", 
   Function = "spell_remove_invis", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "standing", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Remove Invis!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "remove masking", 
}

SkillEntry
{
   Level = 29, 
   Slot = 87, 
   Mana = 35, 
   Target = "ignore", 
   Function = "spell_remove_trap", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Remove trap!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "remove trap", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "???", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 101, 
   Position = "standing", 
   Target = "ignore", 
   Type = "Force Power", 
   Name = "reserved", 
}

SkillEntry
{
   Level = 60, 
   Slot = 113, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "A warm feeling flows through you.", 
         ToCaster = "", 
         ToRoom = "A warm feeling flows through $N.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "200", 
         Location = 13, 
      }, 
   }, 
   Mana = 80, 
   Target = "ignore", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Participants = 2, 
   Flags = 
   {
      [24] = "Group", 
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Position = "fighting", 
   Alignment = 1001, 
   Beats = 20, 
   Name = "restoration", 
}

SkillEntry
{
   Level = 27, 
   Slot = 36, 
   Mana = 75, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "A luminous aura spreads slowly over your body.", 
         ToCaster = "A luminous aura spreads slowly over $N's body.", 
         ToRoom = "A luminous aura spreads slowly over $N's body.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "The luminous aura about your body fades away.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
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
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "sanctuary", 
}

SkillEntry
{
   Level = 73, 
   Slot = 296, 
   Mana = 25, 
   Target = "offensive", 
   Function = "spell_scorching_surge", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "scorching surge", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Scorching Surge!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "scorching surge", 
}

SkillEntry
{
   Level = 26, 
   Slot = 67, 
   Mana = 12, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "A force shield of shimmering blue surrounds you.", 
         ToCaster = "A force shield of shimmering blue surrounds $N.", 
         ToRoom = "A force shield of shimmering blue surrounds $N.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "Your force shield shimmers then fades away.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
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
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Alignment = 1001, 
   Beats = 18, 
   Name = "shield", 
}

SkillEntry
{
   Level = 14, 
   Slot = 51, 
   Mana = 15, 
   Target = "offensive", 
   Function = "spell_shocking_grasp", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "shocking grasp", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Shocking Grasp!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "shocking grasp", 
}

SkillEntry
{
   Level = 72, 
   Slot = 89, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Torrents of cascading energy form around you.", 
         ToCaster = "", 
         ToRoom = "Torrents of cascading energy form around $N.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "The torrents of cascading energy suddenly fade away.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Mana = 95, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Affects = 
   {
      [2] = 
      {
         AffectedBy = "Blind", 
         Location = 26, 
         Modifier = "shockshield", 
         Duration = "(l*3)+14", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Position = "standing", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "shockshield", 
}

SkillEntry
{
   Level = 24, 
   Slot = 38, 
   Mana = 15, 
   Target = "ignore", 
   Function = "spell_sleep", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You feel less tired.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "sleep", 
}

SkillEntry
{
   Level = 18, 
   Slot = 205, 
   Mana = 12, 
   Target = "defensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You suddenly feel more nimble...", 
         ToCaster = "$N suddenly appears more agile...", 
         ToRoom = "$N suddenly appears more agile...", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You suddenly feel less coordinated...", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 40, 
      }, 
      [3] = 
      {
         Location = 2, 
         Modifier = "1+(l/17)", 
         Duration = "l*24", 
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
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Alignment = 1001, 
   Beats = 12, 
   Name = "slink", 
}

SkillEntry
{
   Level = 77, 
   Slot = 235, 
   Mana = 70, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your vision is elevated to the highest plane.", 
         ToCaster = "", 
         ToRoom = "$N's eyes begin to glow a soft white.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "Your vision descends to the material plane.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         AffectedBy = "Blind", 
         Location = 26, 
         Modifier = "truesight", 
         Duration = "l*5", 
      }, 
   }, 
   Beats = 12, 
   Name = "true sight", 
}

SkillEntry
{
   Level = 66, 
   Slot = 110, 
   Mana = 70, 
   Target = "offensive", 
   Function = "spell_smaug", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "Your defenses are unravelled before your very eyes.", 
         ToCaster = "$N's eyes widen in fear as $S defenses are unravelled.", 
         ToRoom = "$N's eyes widen in fear as $S defenses are unravelled.", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "Your intricate defenses are restored to their original quality.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "Your spell has no effect upon $N.", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Affects = 
   {
      [2] = 
      {
         Location = 29, 
         Modifier = "8192", 
         Duration = "(l*3)+25", 
      }, 
      [3] = 
      {
         Location = 29, 
         Modifier = "1048576", 
         Duration = "(l*3)+25", 
      }, 
   }, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Position = "fighting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Beats = 15, 
   Name = "unravel defense", 
}

SkillEntry
{
   Level = 9, 
   Slot = 41, 
   Mana = 5, 
   Target = "ignore", 
   Function = "spell_ventriloquate", 
   Type = "Force Power", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "standing", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Ventriloquate!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Beats = 12, 
   Name = "ventriloquate", 
}

SkillEntry
{
   Level = 3, 
   Slot = 68, 
   Mana = 20, 
   Target = "offensive", 
   Function = "spell_weaken", 
   Type = "Force Power", 
   Ability = "force", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "spell", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You feel stronger.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Position = "fighting", 
   Alignment = -1001, 
   Beats = 12, 
   Name = "weaken", 
}

SkillEntry
{
   Level = 50, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou focus your senses to find those that would hide from you.&R&W", 
         ToCaster = "You focus your senses to find those that would hide from you.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "&cYour mind is no longer focused enough to see those hidden from you.&R&w", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your senses.&R&W", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "resting", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect hidden", 
         Duration = "l*5", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Name = "AcuteAwareness", 
}

SkillEntry
{
   Level = 99, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou focus your strength to increase your damage.&R&W", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "You focus on your opponents weak points increasing your damage.", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "&cYour mind relaxes its focus on increasing your damage.&R&w", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your abilities.&R&W", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         Location = 19, 
         Modifier = "2+(l/33)", 
         Duration = "l*10", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Name = "AcuteDamage", 
}

SkillEntry
{
   Level = 50, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_add_patrol", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "leadership", 
   Name = "AddPatrol", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Aid!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_aid", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31537", 
      }, 
      [2] = 
      {
         Vnum = "32006", 
      }, 
      [0] = 
      {
         Vnum = "10340", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Name = "aid", 
}

SkillEntry
{
   Level = 35, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "&RYou fumble with the binds.&R&W", 
         ToRoom = "", 
      }, 
   }, 
   Target = "offensive", 
   Function = "spell_charm_person", 
   Type = "Skill", 
   Beats = 6, 
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Position = "standing", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Name = "apprehend", 
}

SkillEntry
{
   Level = 6, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "backstab", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Backstab!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_backstab", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "6606", 
      }, 
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Ability = "bounty hunting", 
   Name = "backstab", 
}

SkillEntry
{
   Level = 47, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "bash", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Bash!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "offensive", 
   Function = "do_bash", 
   Type = "Skill", 
   Beats = 8, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Name = "bash", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Beg!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_beg", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31538", 
      }, 
      [0] = 
      {
         Vnum = "210", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Name = "beg", 
}

SkillEntry
{
   Level = 85, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "???", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "offensive", 
   Function = "do_berserk", 
   Type = "Skill", 
   Beats = 4, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Name = "berserk", 
}

SkillEntry
{
   Level = 25, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_bribe", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "31537", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Name = "bribe", 
}

SkillEntry
{
   Level = 90, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32008", 
      }, 
      [2] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "capital ships", 
}

SkillEntry
{
   Level = 50, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "circle", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Circle!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_circle", 
   Type = "Skill", 
   Beats = 16, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "bounty hunting", 
   Name = "circle", 
}

SkillEntry
{
   Level = 7, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "climb", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!climb!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "offensive", 
   Function = "do_climb", 
   Type = "Skill", 
   Beats = 10, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "410", 
      }, 
      [2] = 
      {
         Vnum = "31538", 
      }, 
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Name = "climb", 
}

SkillEntry
{
   Level = 35, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_disguise", 
   Type = "Skill", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "dead", 
   Name = "cloak", 
}

SkillEntry
{
   Level = 20, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "dead", 
   Name = "cutdoor", 
}

SkillEntry
{
   Level = 32, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Detrap!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_detrap", 
   Type = "Skill", 
   Beats = 24, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "sitting", 
   Ability = "smuggling", 
   Name = "detrap", 
}

SkillEntry
{
   Level = 2, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_dig", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "6805", 
      }, 
      [2] = 
      {
         Vnum = "206", 
      }, 
      [3] = 
      {
         Vnum = "6819", 
      }, 
      [0] = 
      {
         Vnum = "31538", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Name = "dig", 
}

SkillEntry
{
   Level = 45, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Disarm!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_disarm", 
   Type = "Skill", 
   Beats = 24, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Name = "disarm", 
}

SkillEntry
{
   Level = 70, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!disguise!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_disguise", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Name = "disguise", 
}

SkillEntry
{
   Level = 50, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Dodge!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Name = "dodge", 
}

SkillEntry
{
   Level = 75, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "&BYou fail.&R&W", 
         ToRoom = "", 
      }, 
   }, 
   Target = "offensive", 
   Function = "spell_charm_person", 
   Type = "Skill", 
   Beats = 12, 
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Position = "standing", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Ability = "leadership", 
   Name = "dominate", 
}

SkillEntry
{
   Level = 10, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "bashdoor", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Bash Door!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_bashdoor", 
   Type = "Skill", 
   Beats = 24, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "6606", 
      }, 
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Ability = "bounty hunting", 
   Name = "doorbash", 
}

SkillEntry
{
   Level = 27, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Dual Wield!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "standing", 
   Name = "dual wield", 
}

SkillEntry
{
   Level = 85, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_elite_guard", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "leadership", 
   Name = "EliteGuard", 
}

SkillEntry
{
   Level = 10, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Enhanced Damage!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "10509", 
      }, 
      [3] = 
      {
         Vnum = "412", 
      }, 
      [4] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Name = "enhanced damage", 
}

SkillEntry
{
   Level = 105, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "32010", 
      }, 
   }, 
   Position = "dead", 
   Name = "fake signal", 
}

SkillEntry
{
   Level = 140, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Fifth Attack!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Name = "fifth attack", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!First Aid!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_first_aid", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31537", 
      }, 
      [2] = 
      {
         Vnum = "32006", 
      }, 
      [0] = 
      {
         Vnum = "10340", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Name = "FirstAid", 
}

SkillEntry
{
   Level = 70, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cA strong mind leads to a stronger body.&R&W", 
         ToCaster = "A strong mind leads to a stronger body.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "&cYour mind wanders from strengthening your body.&R&w", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your energy.&R&W", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         Location = 1, 
         Modifier = "2+(l/33)", 
         Duration = "l*10", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Name = "FocusStrength", 
}

SkillEntry
{
   Level = 115, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Fourth Attack!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Name = "fourth attack", 
}

SkillEntry
{
   Level = 100, 
   Difficulty = 4, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_gather_intelligence", 
   Type = "Skill", 
   Beats = 40, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "leadership", 
   Name = "GatherIntelligence", 
}

SkillEntry
{
   Level = 30, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "gouge", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Gouge!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_gouge", 
   Type = "Skill", 
   Beats = 10, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Name = "gouge", 
}

SkillEntry
{
   Level = 61, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "resting", 
   Name = "grenades", 
}

SkillEntry
{
   Level = 50, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Grip!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Name = "grip", 
}

SkillEntry
{
   Level = 85, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou focus on your ability to hit your opponent.&R&W", 
         ToCaster = "You focus on your ability to hit your oponent.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "&cYou lose your focus on your opponent.&R&w", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your skills.&R&W", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         Location = 18, 
         Modifier = "2+(l/33)", 
         Duration = "l*10", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Name = "HeightenedAccuracy", 
}

SkillEntry
{
   Level = 95, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Hijack!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_hijack", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Name = "hijack", 
}

SkillEntry
{
   Level = 87, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "hit", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!HitAll!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_hitall", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "standing", 
   Ability = "combat", 
   Name = "hitall", 
}

SkillEntry
{
   Level = 80, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou harden yourself against all pain.&R&W", 
         ToCaster = "You harden yourself against pain.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "&cYou soften against all pain.&R&w", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your energy.&R&W", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         Location = 27, 
         Modifier = "32", 
         Duration = "l*10", 
      }, 
      [3] = 
      {
         Location = 27, 
         Modifier = "8192", 
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
         Modifier = "8", 
         Duration = "l*10", 
      }, 
      [6] = 
      {
         Location = 5, 
         Modifier = "1+(l/50)", 
         Duration = "l*10", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Name = "InnerStrength", 
}

SkillEntry
{
   Level = 25, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_jail", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "408", 
      }, 
      [2] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "leadership", 
   Name = "jail", 
}

SkillEntry
{
   Level = 80, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_jumpvector", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32008", 
      }, 
      [2] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "dead", 
   Name = "jumpvector", 
}

SkillEntry
{
   Level = 6, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "kick", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Kick!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "offensive", 
   Function = "do_kick", 
   Type = "Skill", 
   Beats = 8, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "10509", 
      }, 
      [3] = 
      {
         Vnum = "412", 
      }, 
      [4] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Name = "kick", 
}

SkillEntry
{
   Level = 20, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Steal!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_steal", 
   Type = "Skill", 
   Beats = 24, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32009", 
      }, 
      [0] = 
      {
         Vnum = "31538", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Name = "lift", 
}

SkillEntry
{
   Level = 25, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Position = "resting", 
   Name = "lightsaber crafting", 
}

SkillEntry
{
   Level = 90, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou relax your muscles becoming more limber and agile.&R&W", 
         ToCaster = "You relax your muscles becoming limber and agile.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "&cYour muscles stiffen as your efforts to relax them fade.&R&w", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "&RYou can't become any more limber.&R&W", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         Location = 2, 
         Modifier = "2+(l/33)", 
         Duration = "l*10", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Name = "limber", 
}

SkillEntry
{
   Level = 58, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makearmor", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "32010", 
      }, 
   }, 
   Position = "resting", 
   Name = "makearmor", 
}

SkillEntry
{
   Level = 40, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makeblade", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "32010", 
      }, 
   }, 
   Position = "resting", 
   Name = "makeblade", 
}

SkillEntry
{
   Level = 95, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makeblaster", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "32010", 
      }, 
   }, 
   Position = "resting", 
   Name = "makeblaster", 
}

SkillEntry
{
   Level = 40, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makebowcaster", 
   Type = "Skill", 
   Ability = "engineering", 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "resting", 
   Name = "makebowcaster", 
}

SkillEntry
{
   Level = 5, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makecomlink", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32010", 
      }, 
      [2] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "31536", 
      }, 
   }, 
   Position = "resting", 
   Name = "makecomlink", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makecontainer", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31536", 
      }, 
      [2] = 
      {
         Vnum = "206", 
      }, 
      [3] = 
      {
         Vnum = "32010", 
      }, 
      [0] = 
      {
         Vnum = "10340", 
      }, 
   }, 
   Position = "resting", 
   Name = "makecontainer", 
}

SkillEntry
{
   Level = 10, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makeglowrod", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32010", 
      }, 
      [2] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "31536", 
      }, 
   }, 
   Position = "resting", 
   Name = "makeglowrod", 
}

SkillEntry
{
   Level = 95, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makegrenade", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "32010", 
      }, 
   }, 
   Position = "resting", 
   Name = "makegrenade", 
}

SkillEntry
{
   Level = 60, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makejewelry", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "32010", 
      }, 
   }, 
   Position = "resting", 
   Name = "makejewelry", 
}

SkillEntry
{
   Level = 80, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makelandmine", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "32010", 
      }, 
   }, 
   Position = "resting", 
   Name = "makelandmine", 
}

SkillEntry
{
   Level = 70, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_makeshield", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "32010", 
      }, 
   }, 
   Position = "resting", 
   Name = "makeshield", 
}

SkillEntry
{
   Level = 80, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_mass_propaganda", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Name = "MassPropaganda", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You meditate peacefully, tuning yourself to the Force.", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "You spend several minutes in deep concentration, but fail to find the Force.", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 25, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "l", 
         Location = 12, 
      }, 
   }, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Position = "resting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31900", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Ability = "force", 
   Name = "meditate", 
}

SkillEntry
{
   Level = 30, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32008", 
      }, 
      [2] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "midships", 
}

SkillEntry
{
   Level = 90, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!mine!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_mine", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "standing", 
   Ability = "combat", 
   Name = "mine", 
}

SkillEntry
{
   Level = 7, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Search!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_mount", 
   Type = "Skill", 
   Beats = 10, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "412", 
      }, 
   }, 
   Position = "standing", 
   Ability = "combat", 
   Name = "mount", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31539", 
      }, 
      [2] = 
      {
         Vnum = "10340", 
      }, 
      [3] = 
      {
         Vnum = "32008", 
      }, 
      [4] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "navigation", 
}

SkillEntry
{
   Level = 25, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Parry!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "fighting", 
   Name = "parry", 
}

SkillEntry
{
   Level = 20, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Peek!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "smuggling", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "410", 
      }, 
      [2] = 
      {
         Vnum = "31538", 
      }, 
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Name = "peek", 
}

SkillEntry
{
   Level = 55, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Pick!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_pick", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Name = "pick lock", 
}

SkillEntry
{
   Level = 90, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Pickshiplock!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_pickshiplock", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Name = "pick ship lock", 
}

SkillEntry
{
   Level = 30, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "poisonous concoction", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Poison Weapon!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "objinv", 
   Function = "do_poison_weapon", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Ability = "bounty hunting", 
   Name = "PoisonWeapon", 
}

SkillEntry
{
   Level = 35, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!post guard!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_postguard", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "leadership", 
   Name = "PostGuard", 
}

SkillEntry
{
   Level = 50, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_propaganda", 
   Type = "Skill", 
   Beats = 4, 
   Position = "standing", 
   Ability = "diplomacy", 
   Name = "propaganda", 
}

SkillEntry
{
   Level = 40, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "punch", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Punch!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "offensive", 
   Function = "do_punch", 
   Type = "Skill", 
   Beats = 8, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Name = "punch", 
}

SkillEntry
{
   Level = 60, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!reinforcements!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_reinforcements", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "leadership", 
   Name = "reinforcements", 
}

SkillEntry
{
   Level = 8, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Rescue!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_rescue", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "10509", 
      }, 
      [3] = 
      {
         Vnum = "412", 
      }, 
      [4] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Name = "rescue", 
}

SkillEntry
{
   Level = 120, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_sabotage", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32040", 
      }, 
      [2] = 
      {
         Vnum = "32008", 
      }, 
      [3] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "10340", 
      }, 
   }, 
   Position = "dead", 
   Name = "sabotage", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Scan!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_scan", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "10509", 
      }, 
      [3] = 
      {
         Vnum = "10340", 
      }, 
      [4] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "320", 
      }, 
   }, 
   Position = "standing", 
   Ability = "combat", 
   Name = "scan", 
}

SkillEntry
{
   Level = 3, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Search!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_search", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "410", 
      }, 
      [2] = 
      {
         Vnum = "31538", 
      }, 
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Name = "search", 
}

SkillEntry
{
   Level = 45, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Second Attack!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Name = "second attack", 
}

SkillEntry
{
   Level = 65, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_seduce", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Name = "seduce", 
}

SkillEntry
{
   Level = 60, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "&cYou focus your senses in an effort to detect the unseen.&R&W", 
         ToCaster = "You focus your senses in an effort to detect the unseen.", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "&cYour focus to see the unseen relaxes.&R&w", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "&RYou fail to focus your mind.&R&W", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "resting", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "detect invis", 
         Duration = "l*5", 
      }, 
   }, 
   Ability = "bounty hunting", 
   Name = "SeeMasking", 
}

SkillEntry
{
   Level = 30, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32008", 
      }, 
      [2] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "dead", 
   Name = "ship docking", 
}

SkillEntry
{
   Level = 25, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32010", 
      }, 
      [2] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "31536", 
      }, 
   }, 
   Position = "resting", 
   Name = "ship maintenance", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31539", 
      }, 
      [2] = 
      {
         Vnum = "10340", 
      }, 
      [3] = 
      {
         Vnum = "32008", 
      }, 
      [4] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "ship systems", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_skin", 
   Type = "Skill", 
   Beats = 5, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "6606", 
      }, 
   }, 
   Position = "resting", 
   Ability = "bounty hunting", 
   Name = "skin", 
}

SkillEntry
{
   Level = 105, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Beats = 3, 
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Position = "dead", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "206", 
      }, 
      [0] = 
      {
         Vnum = "32010", 
      }, 
   }, 
   Ability = "force", 
   Name = "slicing", 
}

SkillEntry
{
   Level = 10, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_smalltalk", 
   Type = "Skill", 
   Beats = 4, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "31537", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Name = "smalltalk", 
}

SkillEntry
{
   Level = 5, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You attempt to move silently.", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "You attempt to move silently.", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 1, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "410", 
      }, 
      [2] = 
      {
         Vnum = "31538", 
      }, 
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "sneak", 
         Duration = "l*23", 
      }, 
   }, 
   Ability = "smuggling", 
   Name = "sneak", 
}

SkillEntry
{
   Level = 2, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!snipe!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_snipe", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "10509", 
      }, 
      [3] = 
      {
         Vnum = "412", 
      }, 
      [4] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "standing", 
   Ability = "combat", 
   Name = "snipe", 
}

SkillEntry
{
   Level = 25, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31539", 
      }, 
      [2] = 
      {
         Vnum = "32008", 
      }, 
      [3] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "space combat 1", 
}

SkillEntry
{
   Level = 50, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32008", 
      }, 
      [2] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "space combat 2", 
}

SkillEntry
{
   Level = 75, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32008", 
      }, 
      [2] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "space combat 3", 
}

SkillEntry
{
   Level = 95, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_special_forces", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "leadership", 
   Name = "SpecialForces", 
}

SkillEntry
{
   Level = 75, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32008", 
      }, 
      [2] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "dead", 
   Name = "speeder combat", 
}

SkillEntry
{
   Level = 30, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32008", 
      }, 
      [2] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "dead", 
   Name = "speeders", 
}

SkillEntry
{
   Level = 50, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "engineering", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32029", 
      }, 
   }, 
   Position = "resting", 
   Name = "spice refining", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31539", 
      }, 
      [2] = 
      {
         Vnum = "10340", 
      }, 
      [3] = 
      {
         Vnum = "32008", 
      }, 
      [4] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "starfighters", 
}

SkillEntry
{
   Level = 50, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You attempt to hide.", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You are no longer hidden.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "You attempt to hide.", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "do_hide", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32009", 
      }, 
      [0] = 
      {
         Vnum = "410", 
      }, 
   }, 
   Position = "resting", 
   Affects = 
   {
      [2] = 
      {
         Location = 26, 
         Modifier = "hide", 
         Duration = "l*23", 
      }, 
   }, 
   Ability = "smuggling", 
   Name = "stealth", 
}

SkillEntry
{
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "objinv", 
   Function = "do_study", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32006", 
      }, 
      [0] = 
      {
         Vnum = "10340", 
      }, 
   }, 
   Position = "dead", 
   Ability = "diplomacy", 
   Name = "study", 
}

SkillEntry
{
   Level = 105, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "stun", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "You regain consciousness.", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "offensive", 
   Function = "do_punch", 
   Type = "Skill", 
   Beats = 8, 
   Flags = 
   {
      [2] = "_02", 
   }, 
   Position = "fighting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "412", 
      }, 
   }, 
   Ability = "none", 
   Name = "stun", 
}

SkillEntry
{
   Level = 95, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Third Attack!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "412", 
      }, 
      [3] = 
      {
         Vnum = "32011", 
      }, 
      [0] = 
      {
         Vnum = "32012", 
      }, 
   }, 
   Position = "fighting", 
   Name = "third attack", 
}

SkillEntry
{
   Level = 5, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!throw!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_throw", 
   Type = "Skill", 
   Beats = 3, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "10509", 
      }, 
      [3] = 
      {
         Vnum = "412", 
      }, 
      [4] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "sitting", 
   Ability = "combat", 
   Name = "throw", 
}

SkillEntry
{
   Level = 85, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!torture!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_torture", 
   Type = "Skill", 
   Beats = 12, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32029", 
      }, 
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "leadership", 
   Name = "torture", 
}

SkillEntry
{
   Level = 3, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Track!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "do_track", 
   Type = "Skill", 
   Beats = 14, 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "6606", 
      }, 
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Ability = "bounty hunting", 
   Name = "track", 
}

SkillEntry
{
   Level = 35, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32008", 
      }, 
      [2] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "tractor beams", 
}

SkillEntry
{
   Level = 60, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "You enter a peaceful trance, tuning yourself to the Force.", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!TRANCE!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "You spend several minutes in a deep trance, but fail to find the Force.", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "self", 
   Function = "spell_smaug", 
   Type = "Skill", 
   Beats = 32, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "l*2", 
         Location = 12, 
      }, 
   }, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Position = "resting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Ability = "force", 
   Name = "trance", 
}

SkillEntry
{
   Level = 2, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!done!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Skill", 
   Ability = "piloting", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "31539", 
      }, 
      [2] = 
      {
         Vnum = "32008", 
      }, 
      [3] = 
      {
         Vnum = "32007", 
      }, 
      [0] = 
      {
         Vnum = "32040", 
      }, 
   }, 
   Position = "resting", 
   Name = "weapon systems", 
}

SkillEntry
{
   Level = 2, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Blasters!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Weapon", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "10509", 
      }, 
      [3] = 
      {
         Vnum = "412", 
      }, 
      [4] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Name = "blasters", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Bludgeons!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 101, 
   Type = "Weapon", 
   Position = "fighting", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "bludgeons", 
}

SkillEntry
{
   Level = 4, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Weapon", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "10509", 
      }, 
      [3] = 
      {
         Vnum = "412", 
      }, 
      [4] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Name = "bowcasters", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Flexible Arms!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 101, 
   Type = "Weapon", 
   Position = "fighting", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "flexible arms", 
}

SkillEntry
{
   Level = 3, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Weapon", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32012", 
      }, 
      [2] = 
      {
         Vnum = "10509", 
      }, 
      [3] = 
      {
         Vnum = "412", 
      }, 
      [4] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "dead", 
   Name = "force pikes", 
}

SkillEntry
{
   Level = 2, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Lightsabers!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Weapon", 
   Ability = "force", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "605", 
      }, 
      [2] = 
      {
         Vnum = "50", 
      }, 
      [0] = 
      {
         Vnum = "31900", 
      }, 
   }, 
   Position = "fighting", 
   Name = "lightsabers", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Talonous Arms!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 101, 
   Type = "Weapon", 
   Position = "fighting", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "talonous arms", 
}

SkillEntry
{
   Level = 1, 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Vibro-Blades!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Target = "ignore", 
   Function = "spell_null", 
   Type = "Weapon", 
   Ability = "combat", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "32011", 
      }, 
      [2] = 
      {
         Vnum = "10340", 
      }, 
      [3] = 
      {
         Vnum = "10509", 
      }, 
      [4] = 
      {
         Vnum = "32012", 
      }, 
      [5] = 
      {
         Vnum = "31535", 
      }, 
      [0] = 
      {
         Vnum = "412", 
      }, 
   }, 
   Position = "fighting", 
   Name = "vibro-blades", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Adarian!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "adarese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_smaug", 
   Name = "antarian", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "barabel", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Common!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "basic", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_smaug", 
   Name = "binary", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "bothese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "chadra-fan", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "coyn", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "defel", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_smaug", 
   Name = "devaronese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "dosh", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "durese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "ewokese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_smaug", 
   Name = "falleen", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "firrerreo", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Gamorrean!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "gamorrese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "gand", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Hutt!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "huttese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_smaug", 
   Name = "ithorese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Jawa!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "jawaese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "kubazian", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Mon Calamari!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "mon calamarian", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "quarrenese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Rodian!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "rodese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Noghri!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "shistavanen", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Wookiee!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "shyriiwook", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "sullustese", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "togorian", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!Dwarven!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "twileki", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "!!", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Level = 1, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "verpine", 
}

SkillEntry
{
   Ability = "none", 
   Messages = 
   {
      Success = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      NounDamage = "", 
      VictimDeath = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      WearOff = "", 
      VictimImmune = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
      Failure = 
      {
         ToVictim = "", 
         ToCaster = "", 
         ToRoom = "", 
      }, 
   }, 
   Type = "Tongue", 
   Position = "dead", 
   Target = "ignore", 
   Function = "spell_null", 
   Name = "yevethan", 
}
