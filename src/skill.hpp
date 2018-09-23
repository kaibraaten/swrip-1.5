#ifndef _SWRIP_SKILL_HPP_
#define _SWRIP_SKILL_HPP_

#include <string>
#include <array>
#include "types.hpp"
#include "constants.hpp"

#define SKILL_DATA_FILE     DATA_DIR "skills.lua"
#define HERB_DATA_FILE      DATA_DIR "herbs.lua"

/*
 * Skills include spells as a particular case.
 */
class Skill
{
public:
  std::string Name;                   /* Name of skill                */
  SpellFun *SpellFunction = nullptr;              /* Spell pointer (for spells)   */
  CmdFun *SkillFunction = nullptr;              /* Skill pointer (for skills)   */
  std::string FunctionName;
  SkillTargetType Target = 0;                 /* Legal targets                */
  PositionType Position = 0;       /* Position for caster / user   */
  int Slot = 0;                   /* Slot for #OBJECT loading     */
  int Mana = 0;               /* Minimum mana used            */
  int Beats = 0;                  /* Rounds required to use skill */
  int Guild = 0;                  /* Which guild the skill belongs to */
  int Level = 0;              /* Minimum level to be able to cast */
  SkillType Type = 0;                   /* Spell/Skill/Weapon/Tongue    */
  unsigned int Flags = 0;                  /* extra stuff                  */

  struct
  {
    std::string NounDamage;            /* Damage message               */
    std::string WearOff;                /* Wear off message             */

    struct
    {
      std::string ToCaster;
      std::string ToVictim;
      std::string ToRoom;
    } Success, Failure, VictimDeath, VictimImmune;

  } Messages;

  std::string Dice;                   /* Dice roll                    */
  int Value = 0;                  /* Misc value                   */
  int Saves = 0;                  /* What saving spell applies    */
  int Difficulty = 0;             /* Difficulty of casting/learning */
  SmaugAffect *Affects = nullptr;                /* Spell affects, if any        */
  std::string Teachers;               /* Skill requires a special teacher */
  int Participants = 0;           /* # of required participants   */
  timerset *UseRec = nullptr; /* Usage record                 */
  int Alignment = 0;              /* for jedi powers */
};

extern const std::array<const char * const, SKILLTYPE_MAX> SkillTypeName;
extern std::array<Skill*, MAX_SKILL> SkillTable;
extern std::array<Skill*, MAX_SKILL> HerbTable;
extern int TopSN;
extern int TopHerb;
extern const std::array<const char * const, SKILLTARGETTYPE_MAX> SpellTargetName;
extern const std::array<const char * const, SAVETYPE_MAX> SpellSaveName;
extern const std::array<const char * const, MAX_BIT> SpellFlag;

/*
 * These are LookupSkill return values for common skills and spells.
 */
extern short gsn_starfighters;
extern short gsn_midships;
extern short gsn_capitalships;
extern short gsn_weaponsystems;
extern short gsn_navigation;
extern short gsn_shipsystems;
extern short gsn_tractorbeams;
extern short gsn_shipmaintenance;
extern short gsn_sabotage;
extern short gsn_spacecombat;
extern short gsn_spacecombat2;
extern short gsn_spacecombat3;
extern short gsn_shipdocking;
extern short gsn_jumpvector;
extern short gsn_speeders;
extern short gsn_speedercombat;
extern short gsn_reinforcements;
extern short gsn_postguard;
extern short gsn_addpatrol;
extern short gsn_eliteguard;
extern short gsn_specialforces;
extern short gsn_jail;
extern short gsn_smalltalk;
extern short gsn_propaganda;
extern short gsn_bribe;
extern short gsn_seduce;
extern short gsn_masspropaganda;
extern short gsn_gather_intelligence;
extern short gsn_torture;
extern short gsn_snipe;
extern short gsn_throw;
extern short gsn_disguise;
extern short gsn_cloak;
extern short gsn_mine;
extern short gsn_grenades;
extern short gsn_first_aid;
extern short gsn_beg;
extern short gsn_makeblade;
extern short gsn_makejewelry;
extern short gsn_makeblaster;
extern short gsn_makebowcaster;
extern short gsn_makeglowrod;
extern short gsn_makecomlink;
extern short gsn_makegrenade;
extern short gsn_makelandmine;
extern short gsn_makearmor;
extern short gsn_makeshield;
extern short gsn_makecontainer;
extern short gsn_lightsaber_crafting;
extern short gsn_spice_refining;
extern short gsn_fake_signal;
extern short gsn_slicing;
extern short gsn_detrap;
extern short gsn_backstab;
extern short gsn_circle;
extern short gsn_dodge;
extern short gsn_hide;
extern short gsn_peek;
extern short gsn_pick_lock;
extern short gsn_scan;
extern short gsn_skin;
extern short gsn_sneak;
extern short gsn_steal;
extern short gsn_gouge;
extern short gsn_track;
extern short gsn_search;
extern short gsn_dig;
extern short gsn_mount;
extern short gsn_bashdoor;
extern short gsn_cutdoor;
extern short gsn_berserk;
extern short gsn_hitall;
extern short gsn_pickshiplock;
extern short gsn_hijack;
extern short gsn_disarm;
extern short gsn_enhanced_damage;
extern short gsn_kick;
extern short gsn_parry;
extern short gsn_rescue;
extern short gsn_second_attack;
extern short gsn_third_attack;
extern short gsn_fourth_attack;
extern short gsn_fifth_attack;
extern short gsn_dual_wield;
extern short gsn_aid;

/* spells */
extern short gsn_blindness;
extern short gsn_charm_person;
extern short gsn_aqua_breath;
extern short gsn_invis;
extern short gsn_mass_invis;
extern short gsn_poison;
extern short gsn_sleep;
extern short gsn_possess;
extern short gsn_fireball;           /* for fireshield  */
extern short gsn_lightning_bolt;     /* for shockshield */
extern short gsn_study;

/* newer attack skills */
extern short gsn_punch;
extern short gsn_bash;
extern short gsn_stun;
extern short gsn_bind;
extern short gsn_poison_weapon;
extern short gsn_climb;
extern short gsn_blasters;
extern short gsn_force_pikes;
extern short gsn_bowcasters;
extern short gsn_lightsabers;
extern short gsn_vibro_blades;
extern short gsn_flexible_arms;
extern short gsn_talonous_arms;
extern short gsn_bludgeons;
extern short gsn_grip;

/* languages */
extern short gsn_common;
extern short gsn_binary;
extern short gsn_falleen;
extern short gsn_devaronese;
extern short gsn_antarian;
extern short gsn_wookiee;
extern short gsn_twilek;
extern short gsn_rodian;
extern short gsn_hutt;
extern short gsn_mon_calamari;
extern short gsn_noghri;
extern short gsn_gamorrean;
extern short gsn_jawa;
extern short gsn_adarian;
extern short gsn_ewok;
extern short gsn_verpine;
extern short gsn_defel;
extern short gsn_trandoshan;
extern short gsn_chadra_fan;
extern short gsn_quarren;
extern short gsn_duinduogwuin;
extern short gsn_barabel;
extern short gsn_firrerreo;
extern short gsn_bothan;
extern short gsn_coynite;
extern short gsn_duros;
extern short gsn_gand;
extern short gsn_kubaz;
extern short gsn_togorian;
extern short gsn_yevethan;
extern short gsn_ithorese;

/* used to do specific lookups */
extern short gsn_first_spell;
extern short gsn_first_skill;
extern short gsn_first_weapon;
extern short gsn_first_tongue;
extern short gsn_TopSN;

void ASSIGN_GSN( short &gsn, const std::string &skill );
bool IS_VALID_SN( int sn );
bool IS_VALID_HERB( int sn );
bool SPELL_FLAG( const Skill *skill, size_t flag );
long SPELL_DAMAGE( const Skill *skill );
long SPELL_ACTION( const Skill *skill );
long SPELL_CLASS( const Skill *skill );
long SPELL_POWER( const Skill *skill );
void SET_SDAM( Skill *skill, int val );
void SET_SACT( Skill *skill, int val );
void SET_SCLA( Skill *skill, int val );
void SET_SPOW( Skill *skill, int val );

/* RIS by gsn lookups. -- Altrag.
   Will need to add some || stuff for spells that need a special GSN. */
bool IS_FIRE( int dt );
bool IS_COLD( int dt );
bool IS_ACID( int dt );
bool IS_ELECTRICITY( int dt );
bool IS_ENERGY( int dt );
bool IS_DRAIN( int dt );
bool IS_POISON( int dt );

bool CheckSkill( Character *ch, const std::string &command, const std::string &argument );
void LearnFromSuccess( Character *ch, int sn );
void LearnFromFailure( Character *ch, int sn );

int ChLookupSkill( const Character *ch, const std::string &name );
int LookupSkill( const std::string &name );
int LookupHerb( const std::string &name );
int SkillNumberFromSlot( int slot );
int BSearchSkill( const std::string &name, int first, int top );
int BSearchSkillExact( const std::string &name, int first, int top );
int ChBSearchSkill( const Character *ch, const std::string &name, int first, int top );
Skill *GetSkill( int sn );
SkillType GetSkillType(const std::string &skilltype);
void LoadSkills();
void SaveSkills();
void SortSkillTable();
void LoadHerbs();
void SaveHerbs();

#endif
