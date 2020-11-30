-- Skills
-- Last saved Monday 30-Nov-2020 11:04:20

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 45, 
   Name = "bind", 
   Type = "Skill", 
   Function = "do_bind", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "dead", 
   Ability = "bounty hunting", 
   Beats = 3, 
   Target = "offensive", 
}

SkillEntry
{
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Dispel Evil!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "dispel evil", 
   }, 
   Slot = 22, 
   Name = "dispel dark", 
   Alignment = 1001, 
   Type = "unknown", 
   Mana = 15, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 105, 
   Position = "fighting", 
   Function = "spell_dispel_evil", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Level = 105, 
   Name = "stun", 
   Type = "unknown", 
   Function = "spell_smaug", 
   Position = "dead", 
   Ability = "combat", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Level = 101, 
   Name = "unknown", 
   Type = "unknown", 
   Function = "spell_smaug", 
   Position = "dead", 
   Ability = "combat", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "Your pent up energy disperses into the deck.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N's eyelids seem heavy for a moment.", 
         ToRoom = "$N's eyelids seem heavy for a moment.", 
         ToVictim = "You prepare to absorb incoming energy.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*5", 
         Modifier = "8", 
         Location = 28, 
      }, 
   }, 
   Flags = 
   {
      [9] = "_09", 
   }, 
   Value = 30, 
   Slot = 85, 
   Name = "absorb energy", 
   Dice = "none", 
   Type = "Force Power", 
   Mana = 50, 
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
   Level = 60, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 4, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You feel more self-confident.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 7, 
   Name = "affect mind", 
   Type = "Force Power", 
   Mana = 5, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 28, 
   Position = "standing", 
   Function = "spell_charm_person", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You are suddenly less alert.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "$N's eyes dart about the room in an alert manner.", 
         ToVictim = "You suddenly feel alert.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 102, 
   Name = "alertness", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*15", 
         Modifier = "1024", 
         Location = 27, 
      }, 
      [3] = 
      {
         Duration = "l*15", 
         Modifier = "4194304", 
         Location = 27, 
      }, 
      [4] = 
      {
         Duration = "l*15", 
         Modifier = "8", 
         Location = 27, 
      }, 
      [5] = 
      {
         Duration = "l*15", 
         Modifier = "32", 
         Location = 28, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 60, 
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
   Level = 26, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 15, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "Your lungs revert to their original state.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N's lungs take on the ability to breathe water...", 
         ToRoom = "$N's lungs take on the ability to breathe water...", 
         ToVictim = "Your lungs take on the ability to breathe water...", 
      }, 
      NounDamage = "", 
   }, 
   Flags = 
   {
      [21] = "Recastable", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*23", 
         Modifier = "aqua breath", 
         Location = 26, 
      }, 
   }, 
   Slot = 236, 
   Name = "aqua breath", 
   Alignment = 100, 
   Type = "Force Power", 
   Mana = 50, 
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
   Level = 101, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "none", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "Your armor returns to its mundane value.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N's armor begins to glow softly as it is enhanced by the Force.", 
         ToRoom = "$N's armor begins to glow softly as it is enhanced by the Force.", 
         ToVictim = "Your armor begins to glow softly as it is enhanced by the Force.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*20", 
         Modifier = "-20", 
         Location = 17, 
      }, 
   }, 
   Slot = 1, 
   Name = "armor", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 5, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You stop enhancing yourself.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N seems more jovial.", 
         ToRoom = "$N suddenly seems like a much nicer person.", 
         ToVictim = "Drawing the Force, you change yourself to be more likeable.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "1+(l/17)", 
         Location = 25, 
      }, 
   }, 
   Slot = 226, 
   Name = "beauty", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 14, 
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
   Level = 6, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You can see again.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 4, 
   Name = "blindness", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 5, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 10, 
   Position = "fighting", 
   Function = "spell_blindness", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Flags = 
   {
      [2] = "_02", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Cause Critical!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "Stretching out with the force you slowly choke your victim.", 
         ToRoom = "$N begins to claw at $S throat.", 
         ToVictim = "You feel a tight pressure around your throat.", 
      }, 
      NounDamage = "spell", 
   }, 
   Slot = 63, 
   Name = "choke", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 20, 
   Position = "fighting", 
   Function = "spell_cause_critical", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Cure Blindness!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 14, 
   Name = "cure blindness", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 8, 
   Position = "fighting", 
   Function = "spell_cure_blindness", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Cure Critical!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You cure $N's critical wounds.", 
         ToRoom = "", 
         ToVictim = "Your critical wounds close and your pain ebbs away.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "3d8+(l-6)", 
         Location = 13, 
      }, 
   }, 
   Slot = 15, 
   Name = "cure critical", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 20, 
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
   Level = 18, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "Your ability to see in the dark fades away.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You cure $N's light wounds.", 
         ToRoom = "", 
         ToVictim = "Your light wounds mend and your pain ebbs slightly.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "1d8+(l/3)", 
         Location = 13, 
      }, 
   }, 
   Slot = 16, 
   Name = "cure light", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 10, 
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
   Level = 2, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Cure Poison!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 43, 
   Name = "cure poison", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 16, 
   Position = "standing", 
   Function = "spell_cure_poison", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Cure Serious!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You cure $N's serious wounds.", 
         ToRoom = "", 
         ToVictim = "Your serious wounds mend and your pain ebbs away.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "2d8+(l/2)", 
         Location = 13, 
      }, 
   }, 
   Slot = 61, 
   Name = "cure serious", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 15, 
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
   Level = 10, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You stop focusing on the Dark Side.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "A tint of red appears in $N's eyes, mirroring his own vision.", 
         ToVictim = "Traces of red outline all those who abuse the Force.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "detect evil", 
         Location = 26, 
      }, 
   }, 
   Slot = 18, 
   Name = "detect darkness", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 5, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "The blue outlines disappear from your vision.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "A tint of blue in $N's eyes mirrors $S own perception.", 
         ToVictim = "Traces of blue outline objects touched by the Force.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 20, 
   Name = "detect force", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "detect magic", 
         Location = 26, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 5, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Know Alignment!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 58, 
   Name = "detect intent", 
   Type = "Force Power", 
   Mana = 9, 
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
   Level = 8, 
   Position = "fighting", 
   Function = "spell_know_alignment", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You no longer see invisible objects.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "$N's eyes fixate as they gain the ability to see the unseen.", 
         ToVictim = "Your eyes fixate as they gain the ability to see the unseen.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 19, 
   Name = "detect masking", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "detect invis", 
         Location = 26, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 4, 
   Position = "sitting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Detect Poison!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 21, 
   Name = "detect poison", 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 9, 
   Position = "standing", 
   Function = "spell_detect_poison", 
   Ability = "force", 
   Beats = 12, 
   Target = "objinv", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You feel less aware of the dangers about you.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "$N peers about the room, intent on finding all manner of danger.", 
         ToVictim = "You suddenly grow aware of the dangers about you.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 86, 
   Name = "detect traps", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "detect traps", 
         Location = 26, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 15, 
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
   Level = 13, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Dispel Magic!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 59, 
   Name = "dispel force", 
   Type = "Force Power", 
   Mana = 15, 
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
   Level = 20, 
   Position = "fighting", 
   Function = "spell_dispel_magic", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Flags = 
   {
      [2] = "_02", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Energy Drain!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "energy drain", 
   }, 
   Slot = 25, 
   Name = "drain essence", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 35, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 27, 
   Position = "fighting", 
   Function = "spell_energy_drain", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Dream!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 233, 
   Name = "dream", 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 35, 
   Position = "standing", 
   Function = "spell_dream", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Earthquake!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "earthquake", 
   }, 
   Slot = 23, 
   Name = "earthquake", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 15, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 15, 
   Position = "fighting", 
   Function = "spell_earthquake", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Farsight!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 222, 
   Name = "farsight", 
   Type = "Force Power", 
   Mana = 15, 
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
   Level = 70, 
   Position = "sitting", 
   Function = "spell_farsight", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "Mysteriously, $N was not affected by your spell.", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You no longer feel so sleepy.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N suddenly appears very tired and drowsy.", 
         ToRoom = "$N suddenly appears very tired and drowsy.", 
         ToVictim = "You suddenly grow very tired and drowsy.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*15", 
         Modifier = "1024", 
         Location = 29, 
      }, 
   }, 
   Slot = 103, 
   Name = "fatigue", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 60, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 46, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 15, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "$N is not affected by your spell.", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You no longer feel so feeble.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You lay a curse of feebleness upon $N.", 
         ToRoom = "$n lays a curse of feebleness upon $N.", 
         ToVictim = "You grow feeble from a powerful curse.", 
      }, 
      NounDamage = "", 
   }, 
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*19", 
         Modifier = "512", 
         Location = 29, 
      }, 
   }, 
   Slot = 107, 
   Name = "feebleness", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 30, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 80, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 10, 
   Target = "offensive", 
}

SkillEntry
{
   Flags = 
   {
      [0] = "_00", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Fireball!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "fireball", 
   }, 
   Slot = 26, 
   Name = "fireball", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 15, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 18, 
   Position = "fighting", 
   Function = "spell_fireball", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Flags = 
   {
      [0] = "_00", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Flamestrike!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "flamestrike", 
   }, 
   Slot = 65, 
   Name = "flamestrike", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 26, 
   Position = "fighting", 
   Function = "spell_flamestrike", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "Your feet float slowly to the surface.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N begins to float in mid-air...", 
         ToRoom = "$N begins to float in mid-air...", 
         ToVictim = "You begin to float in mid-air...", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 292, 
   Name = "float", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "float", 
         Location = 26, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 8, 
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
   Level = 10, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 18, 
   Target = "defensive", 
}

SkillEntry
{
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
   Dice = "44*W", 
   Target = "ignore", 
   Function = "spell_smaug", 
   Participants = 3, 
   Level = 50, 
   Name = "force blast wrath", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "spiritual wrath", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "6", 
         Modifier = "blindness", 
         Location = 26, 
      }, 
   }, 
   Mana = 120, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Alignment = -1001, 
   Position = "fighting", 
   Slot = 115, 
   Ability = "force", 
   Beats = 24, 
   Type = "Force Power", 
}

SkillEntry
{
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Lightning Bolt!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "lightning bolt", 
   }, 
   Slot = 30, 
   Name = "force bolt", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 15, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 27, 
   Position = "fighting", 
   Function = "spell_lightning_bolt", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "The shimmering shell and its protection from the Force fade away...", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "A shimmering translucent shell forms about $N.", 
         ToVictim = "A shimmering translucent shell forms about you.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*20", 
         Modifier = "-80", 
         Location = 17, 
      }, 
      [3] = 
      {
         Duration = "l*24", 
         Modifier = "2907151", 
         Location = 27, 
      }, 
   }, 
   Slot = 224, 
   Name = "force bubble", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 40, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 90, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "The Force funnel dissipates before it reaches $N.", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "The funnel of Force about you ceases to exist.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You erect a Force funnel about $N...", 
         ToRoom = "A Force funnel forms about $N...", 
         ToVictim = "An aura surrounds you, channeling violent energies in your direction!", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*23", 
         Modifier = "8", 
         Location = 29, 
      }, 
   }, 
   Slot = 218, 
   Name = "force funnel", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 75, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 43, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 22, 
   Target = "offensive", 
}

SkillEntry
{
   Flags = 
   {
      [8] = "_08", 
      [9] = "_09", 
      [2] = "_02", 
      [3] = "_03", 
      [7] = "_07", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!WEAROFF!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "Force Lightning", 
   }, 
   Slot = 303, 
   Name = "force lightning", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 35, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 90, 
   Position = "fighting", 
   Function = "spell_black_lightning", 
   Ability = "force", 
   Beats = 8, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You are returned to the mundane energy continuum.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "A shield of Force divides $N from the mundane energy continuum.", 
         ToVictim = "You fade from the mundane energy continuum.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*20", 
         Modifier = "-50", 
         Location = 17, 
      }, 
      [3] = 
      {
         Duration = "l*24", 
         Modifier = "1048576", 
         Location = 27, 
      }, 
   }, 
   Slot = 217, 
   Name = "force shield", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 75, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 80, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 22, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You no longer see in the dark.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N's eyes dart about as they grow accustomed to Force sight.", 
         ToRoom = "$N's eyes dart about as they grow accustomed to Force sight.", 
         ToVictim = "Heat appears red through your eyes.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 77, 
   Name = "force sight", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "infravision", 
         Location = 26, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 4, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 18, 
   Target = "self", 
}

SkillEntry
{
   Flags = 
   {
      [2] = "_02", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Cause Light!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "spell", 
   }, 
   Slot = 62, 
   Name = "force spray", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 15, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 2, 
   Position = "fighting", 
   Function = "spell_cause_light", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "Furrowing your brow, you sense the weight of wisdom leave you.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N grows serious as wisdom takes root within $M.", 
         ToRoom = "$N grows serious as wisdom takes root within $M.", 
         ToVictim = "The wisdom of the Force blossoms within you.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "1+(l/17)", 
         Location = 4, 
      }, 
   }, 
   Slot = 228, 
   Name = "forethought", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 28, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "The protection of the Force fades away.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You lay the blessing of the Force upon $N.", 
         ToRoom = "$N beams as a powerful blessing is laid upon $M.", 
         ToVictim = "A powerful blessing is laid upon you.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*23", 
         Modifier = "-(l/8)", 
         Location = 24, 
      }, 
      [3] = 
      {
         Duration = "l*23", 
         Modifier = "l/8", 
         Location = 18, 
      }, 
   }, 
   Slot = 3, 
   Name = "good fortune", 
   Alignment = 999, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 11, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Flags = 
   {
      [24] = "Group", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You are no longer masked.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "$N fades from existence.", 
         ToVictim = "You fade from existence.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 69, 
   Name = "group masking", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*11", 
         Modifier = "mass invis", 
         Location = 26, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 20, 
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
   Level = 43, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 24, 
   Target = "defensive", 
}

SkillEntry
{
   Flags = 
   {
      [8] = "_08", 
      [9] = "_09", 
      [2] = "_02", 
      [3] = "_03", 
      [7] = "_07", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!WEAROFF!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "Hand of Chaos", 
   }, 
   Slot = 307, 
   Name = "Hand of Darkness", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 15, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 56, 
   Position = "fighting", 
   Function = "spell_hand_of_chaos", 
   Ability = "force", 
   Beats = 8, 
   Target = "offensive", 
}

SkillEntry
{
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You soften.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "$N's face hardens.", 
         ToVictim = "You steel yourself against pain.", 
      }, 
      NounDamage = "", 
   }, 
   Level = 55, 
   Name = "harden", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*30", 
         Modifier = "4", 
         Location = 5, 
      }, 
      [3] = 
      {
         Duration = "l*30", 
         Modifier = "8192", 
         Location = 27, 
      }, 
      [4] = 
      {
         Duration = "l*30", 
         Modifier = "l*4", 
         Location = 13, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Alignment = -1001, 
   Position = "dead", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 18, 
   Target = "self", 
}

SkillEntry
{
   Flags = 
   {
      [2] = "_02", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Harm!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "harm spell", 
   }, 
   Slot = 27, 
   Name = "harm", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 35, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 26, 
   Position = "fighting", 
   Function = "spell_harm", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Heal!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You lay a hand of healing upon $N.", 
         ToRoom = "", 
         ToVictim = "A warm feeling fills your body.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "100", 
         Location = 13, 
      }, 
   }, 
   Slot = 28, 
   Name = "heal", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 50, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 30, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You feel less aware of your surroundings.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "$N's senses are heightened to those of an animal.", 
         ToVictim = "Your senses are heightened to those of an animal.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 44, 
   Name = "heightened awareness", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "detect hidden", 
         Location = 26, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 15, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Continual Light!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "Shards of iridescent light collide to form a dazzling ball...", 
         ToRoom = "Shards of iridescent light collide to form a dazzling ball...", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Flags = 
   {
      [9] = "_09", 
      [25] = "Object", 
      [3] = "_03", 
   }, 
   Value = 21, 
   Slot = 57, 
   Name = "illuminate", 
   Dice = "0", 
   Type = "Force Power", 
   Mana = 7, 
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
   Level = 4, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You soften.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "$N's face hardens.", 
         ToVictim = "You steel yourself against pain.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*20", 
         Modifier = "5", 
         Location = 5, 
      }, 
      [3] = 
      {
         Duration = "l*30", 
         Modifier = "8192", 
         Location = 27, 
      }, 
      [4] = 
      {
         Duration = "l*30", 
         Modifier = "l*4", 
         Location = 13, 
      }, 
   }, 
   Slot = 66, 
   Name = "inner fortress", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 55, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 18, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Cause Serious!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "spell", 
   }, 
   Slot = 64, 
   Name = "invade essence", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 17, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 10, 
   Position = "fighting", 
   Function = "spell_cause_serious", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Identify!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 53, 
   Name = "know essence", 
   Type = "Force Power", 
   Mana = 12, 
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
   Level = 20, 
   Position = "standing", 
   Function = "spell_identify", 
   Ability = "force", 
   Beats = 24, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You are no longer invisible.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "A momentary lapse in attention, and $N is out of sight.", 
         ToRoom = "A momentary lapse in attention, and $N is out of sight.", 
         ToVictim = "You fade from existence.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 29, 
   Name = "mask", 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*11", 
         Modifier = "invis", 
         Location = 26, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 5, 
   Position = "resting", 
   Function = "spell_invis", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You feel less sick.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "poison", 
   }, 
   Slot = 33, 
   Name = "poison", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 10, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 13, 
   Position = "standing", 
   Function = "spell_poison", 
   Ability = "force", 
   Beats = 20, 
   Target = "offensive", 
}

SkillEntry
{
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You return to your body.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "possess", 
   }, 
   Slot = 232, 
   Name = "possess", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 120, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 150, 
   Position = "standing", 
   Function = "spell_possess", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You feel less protected from the Dark Side.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "$N is blessed with a protection from the Dark Side.", 
         ToVictim = "You are blessed with a protection from the Dark Side.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*10", 
         Modifier = "protection", 
         Location = 26, 
      }, 
   }, 
   Slot = 34, 
   Name = "protection from darkness", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 12, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Refresh!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You allow blooming vitality to flow from you to $N.", 
         ToRoom = "", 
         ToVictim = "Blooming vitality flows through you.", 
      }, 
      NounDamage = "refresh", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "l", 
         Location = 14, 
      }, 
   }, 
   Slot = 81, 
   Name = "refresh", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 12, 
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
   Level = 6, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 18, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Remove Invis!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 230, 
   Name = "remove masking", 
   Type = "Force Power", 
   Mana = 10, 
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
   Level = 8, 
   Position = "standing", 
   Function = "spell_remove_invis", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Remove trap!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 87, 
   Name = "remove trap", 
   Type = "Force Power", 
   Mana = 35, 
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
   Level = 29, 
   Position = "standing", 
   Function = "spell_remove_trap", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "???", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "standing", 
   Level = 101, 
   Ability = "none", 
   Name = "reserved", 
   Type = "Force Power", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "A warm feeling flows through $N.", 
         ToVictim = "A warm feeling flows through you.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Modifier = "200", 
         Location = 13, 
      }, 
   }, 
   Flags = 
   {
      [24] = "Group", 
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Participants = 2, 
   Slot = 113, 
   Name = "restoration", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 80, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 60, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 20, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "The luminous aura about your body fades away.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "A luminous aura spreads slowly over $N's body.", 
         ToRoom = "A luminous aura spreads slowly over $N's body.", 
         ToVictim = "A luminous aura spreads slowly over your body.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "(l*4)+30", 
         Modifier = "sanctuary", 
         Location = 26, 
      }, 
   }, 
   Slot = 36, 
   Name = "sanctuary", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 75, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 27, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Flags = 
   {
      [0] = "_00", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Scorching Surge!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "scorching surge", 
   }, 
   Slot = 296, 
   Name = "scorching surge", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 25, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 73, 
   Position = "fighting", 
   Function = "spell_scorching_surge", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "Your force shield shimmers then fades away.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "A force shield of shimmering blue surrounds $N.", 
         ToRoom = "A force shield of shimmering blue surrounds $N.", 
         ToVictim = "A force shield of shimmering blue surrounds you.", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*20", 
         Modifier = "-50", 
         Location = 17, 
      }, 
   }, 
   Slot = 67, 
   Name = "shield", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 12, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "50", 
      }, 
   }, 
   Level = 26, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 18, 
   Target = "defensive", 
}

SkillEntry
{
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Shocking Grasp!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "shocking grasp", 
   }, 
   Slot = 51, 
   Name = "shocking grasp", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 15, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 14, 
   Position = "fighting", 
   Function = "spell_shocking_grasp", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "The torrents of cascading energy suddenly fade away.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "Torrents of cascading energy form around $N.", 
         ToVictim = "Torrents of cascading energy form around you.", 
      }, 
      NounDamage = "", 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "_00", 
   }, 
   Affects = 
   {
      [2] = 
      {
         AffectedBy = "Blind", 
         Duration = "(l*3)+14", 
         Modifier = "shockshield", 
         Location = 26, 
      }, 
   }, 
   Slot = 89, 
   Name = "shockshield", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 95, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 72, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You feel less tired.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 38, 
   Name = "sleep", 
   Type = "Force Power", 
   Mana = 15, 
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
   Level = 24, 
   Position = "standing", 
   Function = "spell_sleep", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You suddenly feel less coordinated...", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N suddenly appears more agile...", 
         ToRoom = "$N suddenly appears more agile...", 
         ToVictim = "You suddenly feel more nimble...", 
      }, 
      NounDamage = "", 
   }, 
   Affects = 
   {
      [2] = 
      {
         Duration = "l*24", 
         Modifier = "1+(l/17)", 
         Location = 2, 
      }, 
      [3] = 
      {
         Location = 40, 
      }, 
      [4] = 
      {
         Duration = "l*20", 
         Modifier = "l/8", 
         Location = 40, 
      }, 
   }, 
   Slot = 205, 
   Name = "slink", 
   Alignment = 1001, 
   Type = "Force Power", 
   Mana = 12, 
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
   Level = 18, 
   Position = "resting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "defensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "Your vision descends to the material plane.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "$N's eyes begin to glow a soft white.", 
         ToVictim = "Your vision is elevated to the highest plane.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 235, 
   Name = "true sight", 
   Affects = 
   {
      [2] = 
      {
         AffectedBy = "Blind", 
         Duration = "l*5", 
         Modifier = "truesight", 
         Location = 26, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 70, 
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
   Level = 77, 
   Position = "standing", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 12, 
   Target = "self", 
}

SkillEntry
{
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "Your spell has no effect upon $N.", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "Your intricate defenses are restored to their original quality.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "$N's eyes widen in fear as $S defenses are unravelled.", 
         ToRoom = "$N's eyes widen in fear as $S defenses are unravelled.", 
         ToVictim = "Your defenses are unravelled before your very eyes.", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 110, 
   Name = "unravel defense", 
   Affects = 
   {
      [2] = 
      {
         Duration = "(l*3)+25", 
         Modifier = "1048576", 
         Location = 29, 
      }, 
      [3] = 
      {
         Duration = "(l*3)+25", 
         Modifier = "8192", 
         Location = 29, 
      }, 
   }, 
   Type = "Force Power", 
   Mana = 70, 
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
   Level = 66, 
   Position = "fighting", 
   Function = "spell_smaug", 
   Ability = "force", 
   Beats = 15, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Ventriloquate!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Slot = 41, 
   Name = "ventriloquate", 
   Type = "Force Power", 
   Mana = 5, 
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
   Level = 9, 
   Position = "standing", 
   Function = "spell_ventriloquate", 
   Ability = "force", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You feel stronger.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "spell", 
   }, 
   Slot = 68, 
   Name = "weaken", 
   Alignment = -1001, 
   Type = "Force Power", 
   Mana = 20, 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "605", 
      }, 
   }, 
   Level = 3, 
   Position = "fighting", 
   Function = "spell_weaken", 
   Ability = "force", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "&cYour mind is no longer focused enough to see those hidden from you.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your senses.&R&W", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You focus your senses to find those that would hide from you.", 
         ToRoom = "", 
         ToVictim = "&cYou focus your senses to find those that would hide from you.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Level = 50, 
   Name = "AcuteAwareness", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
         Duration = "l*5", 
         Modifier = "detect hidden", 
         Location = 26, 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "&cYour mind relaxes its focus on increasing your damage.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your abilities.&R&W", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "&cYou focus your strength to increase your damage.&R&W", 
      }, 
      NounDamage = "You focus on your opponents weak points increasing your damage.", 
   }, 
   Level = 99, 
   Name = "AcuteDamage", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
         Duration = "l*10", 
         Modifier = "2+(l/33)", 
         Location = 19, 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 50, 
   Name = "AddPatrol", 
   Type = "Skill", 
   Function = "do_add_patrol", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Aid!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "aid", 
   Type = "Skill", 
   Function = "do_aid", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Level = 35, 
   Name = "apprehend", 
   Type = "Skill", 
   Function = "spell_charm_person", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "&RYou fumble with the binds.&R&W", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Ability = "bounty hunting", 
   Beats = 6, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Backstab!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "backstab", 
   }, 
   Level = 6, 
   Name = "backstab", 
   Type = "Skill", 
   Function = "do_backstab", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Bash!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "bash", 
   }, 
   Level = 47, 
   Name = "bash", 
   Type = "Skill", 
   Function = "do_bash", 
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
   Beats = 8, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Beg!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "beg", 
   Type = "Skill", 
   Function = "do_beg", 
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
   Beats = 20, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "???", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 85, 
   Name = "berserk", 
   Type = "Skill", 
   Function = "do_berserk", 
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
   Beats = 4, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 25, 
   Name = "bribe", 
   Type = "Skill", 
   Function = "do_bribe", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "31537", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 90, 
   Name = "capital ships", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Circle!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "circle", 
   }, 
   Level = 50, 
   Name = "circle", 
   Type = "Skill", 
   Function = "do_circle", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "bounty hunting", 
   Beats = 16, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!climb!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "climb", 
   }, 
   Level = 7, 
   Name = "climb", 
   Type = "Skill", 
   Function = "do_climb", 
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
   Beats = 10, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 35, 
   Name = "cloak", 
   Type = "Skill", 
   Function = "do_disguise", 
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
   Ability = "force", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 20, 
   Name = "cutdoor", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "force", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Detrap!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 32, 
   Name = "detrap", 
   Type = "Skill", 
   Function = "do_detrap", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "sitting", 
   Ability = "smuggling", 
   Beats = 24, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 2, 
   Name = "dig", 
   Type = "Skill", 
   Function = "do_dig", 
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
   Beats = 20, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Disarm!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 45, 
   Name = "disarm", 
   Type = "Skill", 
   Function = "do_disarm", 
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
   Beats = 24, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!disguise!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 70, 
   Name = "disguise", 
   Type = "Skill", 
   Function = "do_disguise", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Dodge!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 50, 
   Name = "dodge", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Target = "ignore", 
}

SkillEntry
{
   Flags = 
   {
      [19] = "SaveNegates", 
   }, 
   Level = 75, 
   Name = "dominate", 
   Type = "Skill", 
   Function = "spell_charm_person", 
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
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "&BYou fail.&R&W", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Ability = "leadership", 
   Beats = 12, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Bash Door!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "bashdoor", 
   }, 
   Level = 10, 
   Name = "doorbash", 
   Type = "Skill", 
   Function = "do_bashdoor", 
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
   Beats = 24, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Dual Wield!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 27, 
   Name = "dual wield", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 85, 
   Name = "EliteGuard", 
   Type = "Skill", 
   Function = "do_elite_guard", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Enhanced Damage!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 10, 
   Name = "enhanced damage", 
   Type = "Skill", 
   Function = "spell_null", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 105, 
   Name = "fake signal", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Fifth Attack!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 140, 
   Name = "fifth attack", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!First Aid!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "FirstAid", 
   Type = "Skill", 
   Function = "do_first_aid", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "&cYour mind wanders from strengthening your body.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your energy.&R&W", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "A strong mind leads to a stronger body.", 
         ToRoom = "", 
         ToVictim = "&cA strong mind leads to a stronger body.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Level = 70, 
   Name = "FocusStrength", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
         Duration = "l*10", 
         Modifier = "2+(l/33)", 
         Location = 1, 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Fourth Attack!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 115, 
   Name = "fourth attack", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 100, 
   Name = "GatherIntelligence", 
   Type = "Skill", 
   Function = "do_gather_intelligence", 
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
   Difficulty = 4, 
   Ability = "leadership", 
   Beats = 40, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Gouge!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "gouge", 
   }, 
   Level = 30, 
   Name = "gouge", 
   Type = "Skill", 
   Function = "do_gouge", 
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
   Beats = 10, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 61, 
   Name = "grenades", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "combat", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Grip!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 50, 
   Name = "grip", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "&cYou lose your focus on your opponent.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your skills.&R&W", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You focus on your ability to hit your oponent.", 
         ToRoom = "", 
         ToVictim = "&cYou focus on your ability to hit your opponent.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Level = 85, 
   Name = "HeightenedAccuracy", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
         Duration = "l*10", 
         Modifier = "2+(l/33)", 
         Location = 18, 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Hijack!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 95, 
   Name = "hijack", 
   Type = "Skill", 
   Function = "do_hijack", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!HitAll!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "hit", 
   }, 
   Level = 87, 
   Name = "hitall", 
   Type = "Skill", 
   Function = "do_hitall", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "&cYou soften against all pain.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your energy.&R&W", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You harden yourself against pain.", 
         ToRoom = "", 
         ToVictim = "&cYou harden yourself against all pain.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Level = 80, 
   Name = "InnerStrength", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
         Duration = "l*10", 
         Modifier = "1+(l/50)", 
         Location = 5, 
      }, 
      [3] = 
      {
         Duration = "l*10", 
         Modifier = "8", 
         Location = 27, 
      }, 
      [4] = 
      {
         Duration = "l*10", 
         Modifier = "2097152", 
         Location = 27, 
      }, 
      [5] = 
      {
         Duration = "l*10", 
         Modifier = "8192", 
         Location = 27, 
      }, 
      [6] = 
      {
         Duration = "l*10", 
         Modifier = "32", 
         Location = 27, 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 25, 
   Name = "jail", 
   Type = "Skill", 
   Function = "do_jail", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 80, 
   Name = "jumpvector", 
   Type = "Skill", 
   Function = "do_jumpvector", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Kick!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "kick", 
   }, 
   Level = 6, 
   Name = "kick", 
   Type = "Skill", 
   Function = "do_kick", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Beats = 8, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Steal!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 20, 
   Name = "lift", 
   Type = "Skill", 
   Function = "do_steal", 
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
   Beats = 24, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 25, 
   Name = "lightsaber crafting", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "force", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "&cYour muscles stiffen as your efforts to relax them fade.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou can't become any more limber.&R&W", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You relax your muscles becoming limber and agile.", 
         ToRoom = "", 
         ToVictim = "&cYou relax your muscles becoming more limber and agile.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Level = 90, 
   Name = "limber", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
         Duration = "l*10", 
         Modifier = "2+(l/33)", 
         Location = 2, 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 58, 
   Name = "makearmor", 
   Type = "Skill", 
   Function = "do_makearmor", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 40, 
   Name = "makeblade", 
   Type = "Skill", 
   Function = "do_makeblade", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 95, 
   Name = "makeblaster", 
   Type = "Skill", 
   Function = "do_makeblaster", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Level = 40, 
   Name = "makebowcaster", 
   Type = "Skill", 
   Function = "do_makebowcaster", 
   Position = "resting", 
   Ability = "engineering", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 5, 
   Name = "makecomlink", 
   Type = "Skill", 
   Function = "do_makecomlink", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "makecontainer", 
   Type = "Skill", 
   Function = "do_makecontainer", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 10, 
   Name = "makeglowrod", 
   Type = "Skill", 
   Function = "do_makeglowrod", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 95, 
   Name = "makegrenade", 
   Type = "Skill", 
   Function = "do_makegrenade", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 60, 
   Name = "makejewelry", 
   Type = "Skill", 
   Function = "do_makejewelry", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 80, 
   Name = "makelandmine", 
   Type = "Skill", 
   Function = "do_makelandmine", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 70, 
   Name = "makeshield", 
   Type = "Skill", 
   Function = "do_makeshield", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 80, 
   Name = "MassPropaganda", 
   Type = "Skill", 
   Function = "do_mass_propaganda", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Level = 1, 
   Name = "meditate", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "You spend several minutes in deep concentration, but fail to find the Force.", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "You meditate peacefully, tuning yourself to the Force.", 
      }, 
      NounDamage = "", 
   }, 
   Position = "resting", 
   Affects = 
   {
      [2] = 
      {
         Modifier = "l", 
         Location = 12, 
      }, 
   }, 
   Ability = "force", 
   Beats = 25, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 30, 
   Name = "midships", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!mine!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 90, 
   Name = "mine", 
   Type = "Skill", 
   Function = "do_mine", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Search!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 7, 
   Name = "mount", 
   Type = "Skill", 
   Function = "do_mount", 
   Teachers = 
   {
      [1] = 
      {
         Vnum = "10509", 
      }, 
      [2] = 
      {
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "412", 
      }, 
   }, 
   Position = "standing", 
   Ability = "combat", 
   Beats = 10, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "navigation", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Parry!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 25, 
   Name = "parry", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "force", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Peek!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 20, 
   Name = "peek", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Pick!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 55, 
   Name = "pick lock", 
   Type = "Skill", 
   Function = "do_pick", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Pickshiplock!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 90, 
   Name = "pick ship lock", 
   Type = "Skill", 
   Function = "do_pickshiplock", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32009", 
      }, 
   }, 
   Position = "standing", 
   Ability = "smuggling", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Poison Weapon!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "poisonous concoction", 
   }, 
   Level = 30, 
   Name = "PoisonWeapon", 
   Type = "Skill", 
   Function = "do_poison_weapon", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32050", 
      }, 
   }, 
   Position = "standing", 
   Ability = "bounty hunting", 
   Beats = 12, 
   Target = "objinv", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!post guard!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 35, 
   Name = "PostGuard", 
   Type = "Skill", 
   Function = "do_postguard", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 50, 
   Name = "propaganda", 
   Type = "Skill", 
   Function = "do_propaganda", 
   Position = "standing", 
   Ability = "diplomacy", 
   Beats = 4, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Punch!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "punch", 
   }, 
   Level = 40, 
   Name = "punch", 
   Type = "Skill", 
   Function = "do_punch", 
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
   Beats = 8, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!reinforcements!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 60, 
   Name = "reinforcements", 
   Type = "Skill", 
   Function = "do_reinforcements", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Rescue!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 8, 
   Name = "rescue", 
   Type = "Skill", 
   Function = "do_rescue", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 120, 
   Name = "sabotage", 
   Type = "Skill", 
   Function = "do_sabotage", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Scan!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "scan", 
   Type = "Skill", 
   Function = "do_scan", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "320", 
      }, 
   }, 
   Position = "standing", 
   Ability = "combat", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Search!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 3, 
   Name = "search", 
   Type = "Skill", 
   Function = "do_search", 
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
   Beats = 20, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Second Attack!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 45, 
   Name = "second attack", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 65, 
   Name = "seduce", 
   Type = "Skill", 
   Function = "do_seduce", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "10504", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "&cYour focus to see the unseen relaxes.&R&w", 
      Failure = 
      {
         ToCaster = "&RYou fail to focus your mind.&R&W", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "You focus your senses in an effort to detect the unseen.", 
         ToRoom = "", 
         ToVictim = "&cYou focus your senses in an effort to detect the unseen.&R&W", 
      }, 
      NounDamage = "", 
   }, 
   Level = 60, 
   Name = "SeeMasking", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
         Duration = "l*5", 
         Modifier = "detect invis", 
         Location = 26, 
      }, 
   }, 
   Ability = "bounty hunting", 
   Beats = 20, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 30, 
   Name = "ship docking", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 25, 
   Name = "ship maintenance", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "ship systems", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "skin", 
   Type = "Skill", 
   Function = "do_skin", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "6606", 
      }, 
   }, 
   Position = "resting", 
   Ability = "bounty hunting", 
   Beats = 5, 
   Target = "ignore", 
}

SkillEntry
{
   Flags = 
   {
      [27] = "SecretSkill", 
   }, 
   Level = 105, 
   Name = "slicing", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Ability = "force", 
   Beats = 3, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 10, 
   Name = "smalltalk", 
   Type = "Skill", 
   Function = "do_smalltalk", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "31537", 
      }, 
   }, 
   Position = "standing", 
   Ability = "diplomacy", 
   Beats = 4, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "You attempt to move silently.", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "You attempt to move silently.", 
      }, 
      NounDamage = "", 
   }, 
   Level = 5, 
   Name = "sneak", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
         Duration = "l*23", 
         Modifier = "sneak", 
         Location = 26, 
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 1, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!snipe!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 2, 
   Name = "snipe", 
   Type = "Skill", 
   Function = "do_snipe", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "standing", 
   Ability = "combat", 
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 25, 
   Name = "space combat 1", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 50, 
   Name = "space combat 2", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 75, 
   Name = "space combat 3", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 95, 
   Name = "SpecialForces", 
   Type = "Skill", 
   Function = "do_special_forces", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 75, 
   Name = "speeder combat", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 30, 
   Name = "speeders", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 50, 
   Name = "spice refining", 
   Type = "Skill", 
   Function = "spell_null", 
   Teachers = 
   {
      [0] = 
      {
         Vnum = "32029", 
      }, 
   }, 
   Position = "resting", 
   Ability = "engineering", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "starfighters", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You are no longer hidden.", 
      Failure = 
      {
         ToCaster = "You attempt to hide.", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "You attempt to hide.", 
      }, 
      NounDamage = "", 
   }, 
   Level = 50, 
   Name = "stealth", 
   Type = "Skill", 
   Function = "do_hide", 
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
         Duration = "l*23", 
         Modifier = "hide", 
         Location = 26, 
      }, 
   }, 
   Ability = "smuggling", 
   Beats = 12, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Name = "study", 
   Type = "Skill", 
   Function = "do_study", 
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
   Beats = 12, 
   Target = "objinv", 
}

SkillEntry
{
   Flags = 
   {
      [2] = "_02", 
   }, 
   Level = 105, 
   Name = "stun", 
   Type = "Skill", 
   Function = "do_punch", 
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
   Position = "fighting", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "You regain consciousness.", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "stun", 
   }, 
   Ability = "none", 
   Beats = 8, 
   Target = "offensive", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Third Attack!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 95, 
   Name = "third attack", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!throw!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 5, 
   Name = "throw", 
   Type = "Skill", 
   Function = "do_throw", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "sitting", 
   Ability = "combat", 
   Beats = 3, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!torture!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 85, 
   Name = "torture", 
   Type = "Skill", 
   Function = "do_torture", 
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
   Beats = 12, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Track!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 3, 
   Name = "track", 
   Type = "Skill", 
   Function = "do_track", 
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
   Beats = 14, 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 35, 
   Name = "tractor beams", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Flags = 
   {
      [22] = "NoScribe", 
      [23] = "NoBrew", 
   }, 
   Level = 60, 
   Name = "trance", 
   Type = "Skill", 
   Function = "spell_smaug", 
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
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!TRANCE!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "You spend several minutes in a deep trance, but fail to find the Force.", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "You enter a peaceful trance, tuning yourself to the Force.", 
      }, 
      NounDamage = "", 
   }, 
   Position = "resting", 
   Affects = 
   {
      [2] = 
      {
         Modifier = "l*2", 
         Location = 12, 
      }, 
   }, 
   Ability = "force", 
   Beats = 32, 
   Target = "self", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!done!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 2, 
   Name = "weapon systems", 
   Type = "Skill", 
   Function = "spell_null", 
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
   Ability = "piloting", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Blasters!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 2, 
   Name = "blasters", 
   Type = "Weapon", 
   Function = "spell_null", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Target = "ignore", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Bludgeons!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "fighting", 
   Level = 101, 
   Ability = "none", 
   Name = "bludgeons", 
   Type = "Weapon", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 4, 
   Name = "bowcasters", 
   Type = "Weapon", 
   Function = "spell_null", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Target = "ignore", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Flexible Arms!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "fighting", 
   Level = 101, 
   Ability = "none", 
   Name = "flexible arms", 
   Type = "Weapon", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 3, 
   Name = "force pikes", 
   Type = "Weapon", 
   Function = "spell_null", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "32011", 
      }, 
   }, 
   Position = "dead", 
   Ability = "combat", 
   Target = "ignore", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Lightsabers!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 2, 
   Name = "lightsabers", 
   Type = "Weapon", 
   Function = "spell_null", 
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
   Ability = "force", 
   Target = "ignore", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Talonous Arms!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "fighting", 
   Level = 101, 
   Ability = "none", 
   Name = "talonous arms", 
   Type = "Weapon", 
}

SkillEntry
{
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Vibro-Blades!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Level = 1, 
   Name = "vibro-blades", 
   Type = "Weapon", 
   Function = "spell_null", 
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
         Vnum = "tatooine_combat_teacher", 
      }, 
      [0] = 
      {
         Vnum = "412", 
      }, 
   }, 
   Position = "fighting", 
   Ability = "combat", 
   Target = "ignore", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Adarian!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "adarese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "antarian", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "barabel", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Common!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "basic", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "binary", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "bothese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "chadra-fan", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "coyn", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "defel", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "devaronese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "dosh", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "durese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "ewokese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "falleen", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "firrerreo", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Gamorrean!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "gamorrese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "gand", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Hutt!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "huttese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_smaug", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "ithorese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Jawa!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "jawaese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "kubazian", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Mon Calamari!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "mon calamarian", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "quarrenese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Rodian!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "rodese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Noghri!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "shistavanen", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Wookiee!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "shyriiwook", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "sullustese", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "togorian", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!Dwarven!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "twileki", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Target = "ignore", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "!!", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Level = 1, 
   Ability = "none", 
   Name = "verpine", 
   Type = "Tongue", 
}

SkillEntry
{
   Function = "spell_null", 
   Messages = 
   {
      VictimImmune = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      WearOff = "", 
      Failure = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      VictimDeath = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      Success = 
      {
         ToCaster = "", 
         ToRoom = "", 
         ToVictim = "", 
      }, 
      NounDamage = "", 
   }, 
   Position = "dead", 
   Target = "ignore", 
   Ability = "none", 
   Name = "yevethan", 
   Type = "Tongue", 
}
