-- Herbs
-- Last saved Friday 25-Mar-2016 20:32:05

HerbEntry
{
   Type = "Herb", 
   Name = "pipeweed", 
   Position = "dead", 
   Ability = "none", 
   Beats = 5, 
   Messages = 
   {
      NounDamage = "smoke", 
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
   Target = "ignore", 
}

HerbEntry
{
   Type = "Herb", 
   Messages = 
   {
      NounDamage = "smoke", 
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "You start to cough and choke!", 
      }, 
      VictimImmune = 
      {
      }, 
      Failure = 
      {
      }, 
   }, 
   Slot = 1, 
   Ability = "none", 
   Beats = 12, 
   Function = "spell_smaug", 
   Name = "black gwyvel", 
   Position = "fighting", 
   Target = "offensive", 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "-10", 
      }, 
   }, 
}

HerbEntry
{
   Type = "Herb", 
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
         ToVictim = "You feel a sparkling warmth flow through your limbs.", 
         ToCaster = ".", 
         ToRoom = "$N leans back, relishing the flavor of the vermeir.", 
      }, 
      Failure = 
      {
      }, 
   }, 
   Slot = 2, 
   Ability = "none", 
   Beats = 4, 
   Function = "spell_smaug", 
   Name = "vermeir", 
   Position = "resting", 
   Target = "self", 
   Affects = 
   {
      [2] = 
      {
         Location = 14, 
         Modifier = "20", 
      }, 
   }, 
}

HerbEntry
{
   Type = "Herb", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "The acrid taste of the smoke overwhelms your senses. You feel light headed.", 
         ToRoom = "$N grimaces at the acrid flavor of the nooracht.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Your feet slowly lower to the ground.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 3, 
   Ability = "none", 
   Beats = 4, 
   Function = "spell_smaug", 
   Name = "nooracht", 
   Position = "resting", 
   Target = "self", 
   Affects = 
   {
      [2] = 
      {
         AffectedBy = "floating", 
         Duration = "30", 
      }, 
      [3] = 
      {
         Location = 12, 
         Modifier = "20", 
      }, 
   }, 
   Flags = 
   {
      [21] = "Recastable", 
   }, 
}

HerbEntry
{
   Type = "Herb", 
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
         ToVictim = "The sharp flavor of the smoke sends a flow of warmth through your body.", 
         ToRoom = "$N's eyes water as the smoke flows around $m.", 
      }, 
      Failure = 
      {
      }, 
   }, 
   Slot = 4, 
   Ability = "none", 
   Function = "spell_smaug", 
   Name = "occadaal", 
   Affects = 
   {
      [2] = 
      {
         Location = 13, 
         Modifier = "20", 
      }, 
   }, 
   Target = "self", 
   Position = "dead", 
}

HerbEntry
{
   Type = "Herb", 
   Messages = 
   {
      VictimDeath = 
      {
      }, 
      Success = 
      {
         ToVictim = "Life takes on a brighter, crisper outlook as you savor the breadl's flavor.", 
         ToRoom = "$N smiles as $s enjoys the mellow flavor of the breadl.", 
      }, 
      VictimImmune = 
      {
      }, 
      WearOff = "Everything about you takes on it's normal drab tone.", 
      Failure = 
      {
      }, 
   }, 
   Slot = 5, 
   Ability = "none", 
   Function = "spell_smaug", 
   Name = "breadl", 
   Affects = 
   {
      [2] = 
      {
         AffectedBy = "truesight", 
         Duration = "10", 
      }, 
   }, 
   Target = "self", 
   Position = "resting", 
}
