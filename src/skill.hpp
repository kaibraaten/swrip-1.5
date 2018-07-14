#ifndef _SWRIP_SKILL_HPP_
#define _SWRIP_SKILL_HPP_

#include "types.hpp"
#include "constants.hpp"

#define SKILL_DATA_FILE     DATA_DIR "skills.lua"
#define HERB_DATA_FILE      DATA_DIR "herbs.lua"

/*
 * Skills include spells as a particular case.
 */
struct Skill
{
  char      *Name;                   /* Name of skill                */
  SpellFun  *SpellFunction;              /* Spell pointer (for spells)   */
  CmdFun    *SkillFunction;              /* Skill pointer (for skills)   */
  char      *FunctionName;
  SkillTargetType Target;                 /* Legal targets                */
  PositionType Position;       /* Position for caster / user   */
  short      Slot;                   /* Slot for #OBJECT loading     */
  short      Mana;               /* Minimum mana used            */
  short      Beats;                  /* Rounds required to use skill */
  short      Guild;                  /* Which guild the skill belongs to */
  short      Level;              /* Minimum level to be able to cast */
  SkillType Type;                   /* Spell/Skill/Weapon/Tongue    */
  unsigned int Flags;                  /* extra stuff                  */

  struct
  {
    char      *NounDamage;            /* Damage message               */
    char      *WearOff;                /* Wear off message             */

    struct
    {
      char *ToCaster;
      char *ToVictim;
      char *ToRoom;
    } Success, Failure, VictimDeath, VictimImmune;

  } Messages;

  char      *Dice;                   /* Dice roll                    */
  int        Value;                  /* Misc value                   */
  char       Saves;                  /* What saving spell applies    */
  char       Difficulty;             /* Difficulty of casting/learning */
  SmaugAffect *Affects;                /* Spell affects, if any        */
  char      *Teachers;               /* Skill requires a special teacher */
  char       Participants;           /* # of required participants   */
  struct timerset *UseRec; /* Usage record                 */
  int        Alignment;              /* for jedi powers */
};

extern const char * const SkillTypeName[];
extern Skill *SkillTable[MAX_SKILL];
extern Skill *HerbTable[MAX_HERB];
extern int TopSN;
extern int TopHerb;
extern const char * const SpellTargetName[];
extern const char * const SpellSaveName[];
extern const char * const SpellFlag[];

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

/* used to do specific lookups */
extern short gsn_first_spell;
extern short gsn_first_skill;
extern short gsn_first_weapon;
extern short gsn_first_tongue;
extern short gsn_TopSN;

#define ASSIGN_GSN(gsn, skill)                                  \
  do                                                            \
    {                                                           \
      if ( ((gsn) = LookupSkill((skill))) == -1 )		\
	fprintf( stderr, "ASSIGN_GSN: Skill %s not found.\n",   \
		 (skill) );                                     \
    } while(0)

#define IS_VALID_SN(sn)         ( (sn) >=0 && (sn) < MAX_SKILL  \
				  && SkillTable[(sn)]          \
				  && SkillTable[(sn)]->Name )

#define IS_VALID_HERB(sn)       ( (sn) >=0 && (sn) < MAX_HERB   \
				  && HerbTable[(sn)]           \
				  && HerbTable[(sn)]->Name )

#define SPELL_FLAG(skill, flag) ( IsBitSet((skill)->Flags, (flag)) )
#define SPELL_DAMAGE(skill)     ( ((skill)->Flags     ) & 7 )
#define SPELL_ACTION(skill)     ( ((skill)->Flags >> 3) & 7 )
#define SPELL_CLASS(skill)      ( ((skill)->Flags >> 6) & 7 )
#define SPELL_POWER(skill)      ( ((skill)->Flags >> 9) & 3 )
#define SET_SDAM(skill, val)    ( (skill)->Flags =  ((skill)->Flags & SDAM_MASK) + ((val) & 7) )
#define SET_SACT(skill, val)    ( (skill)->Flags =  ((skill)->Flags & SACT_MASK) + (((val) & 7) << 3) )
#define SET_SCLA(skill, val)    ( (skill)->Flags =  ((skill)->Flags & SCLA_MASK) + (((val) & 7) << 6) )
#define SET_SPOW(skill, val)    ( (skill)->Flags =  ((skill)->Flags & SPOW_MASK) + (((val) & 3) << 9) )

/* RIS by gsn lookups. -- Altrag.
   Will need to add some || stuff for spells that need a special GSN. */

#define IS_FIRE(dt)             ( IS_VALID_SN(dt) &&                    \
				  SPELL_DAMAGE(SkillTable[(dt)]) == SD_FIRE )
#define IS_COLD(dt)             ( IS_VALID_SN(dt) &&                    \
				  SPELL_DAMAGE(SkillTable[(dt)]) == SD_COLD )
#define IS_ACID(dt)             ( IS_VALID_SN(dt) &&                    \
				  SPELL_DAMAGE(SkillTable[(dt)]) == SD_ACID )
#define IS_ELECTRICITY(dt)      ( IS_VALID_SN(dt) &&                    \
				  SPELL_DAMAGE(SkillTable[(dt)]) == SD_ELECTRICITY )
#define IS_ENERGY(dt)           ( IS_VALID_SN(dt) &&                    \
				  SPELL_DAMAGE(SkillTable[(dt)]) == SD_ENERGY )

#define IS_DRAIN(dt)            ( IS_VALID_SN(dt) &&                    \
				  SPELL_DAMAGE(SkillTable[(dt)]) == SD_DRAIN )

#define IS_POISON(dt)           ( IS_VALID_SN(dt) &&                    \
				  SPELL_DAMAGE(SkillTable[(dt)]) == SD_POISON )

bool CheckSkill( Character *ch, const char *command, char *argument );
void LearnFromSuccess( Character *ch, int sn );
void LearnFromFailure( Character *ch, int sn );

int ChLookupSkill( const Character *ch, const char *name );
int LookupSkill( const char *name );
int LookupHerb( const char *name );
int SkillNumberFromSlot( int slot );
int BSearchSkill( const char *name, int first, int top );
int BSearchSkillExact( const char *name, int first, int top );
int ChBSearchSkill( const Character *ch, const char *name, int first, int top );
Skill *GetSkill( int sn );

SkillType GetSkillType( const char *skilltype );
void LoadSkills( void );
void SaveSkills( void );
void SortSkillTable( void );
void LoadHerbs( void );
void SaveHerbs( void );

#endif
