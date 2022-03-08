#ifndef _SWRIP_SKILL_HPP_
#define _SWRIP_SKILL_HPP_

#include <memory>
#include <list>
#include <string>
#include <array>
#include <bitset>
#include <functional>
#include "types.hpp"
#include "constants.hpp"

#define SKILL_DATA_FILE     DATA_DIR "skills.lua"
#define HERB_DATA_FILE      DATA_DIR "herbs.lua"

class timerset;
class Character;
class SmaugAffect;

/*
 * Skills include spells as a particular case.
 */
class Skill
{
public:
    Skill();
    std::string Name;                   /* Name of skill                */
    std::function<ch_ret(int, int, std::shared_ptr<Character>, const Vo&)> SpellFunction;
    std::function<void(std::shared_ptr<Character>, std::string)> SkillFunction;
    std::string FunctionName;
    SkillTargetType Target = 0;                 /* Legal targets                */
    PositionType Position = 0;       /* Position for caster / user   */
    int Slot = 0;                   /* Slot for #OBJECT loading     */
    int Mana = 0;               /* Minimum mana used            */
    int Beats = 0;                  /* Rounds required to use skill */
    AbilityClass Class = AbilityClass::None; /* Which guild the skill belongs to */
    int Level = 0;              /* Minimum level to be able to cast */
    SkillType Type = 0;                   /* Spell/Skill/Weapon/Tongue    */
    std::bitset<Flag::MAX> Flags;                  /* extra stuff                  */

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

    std::string Dice;                   // Dice roll
    int Value = 0;                  // Misc value
    int Saves = 0;                  // What saving spell applies
    int Difficulty = 0;             // Difficulty of casting/learning
    std::list<std::shared_ptr<SmaugAffect>> Affects;      // Spell affects, if any
    std::list<std::string> Teachers;               // Skill requires a special teacher
    int Participants = 0;           // # of required participants
    std::shared_ptr<timerset> UseRec;
    int Alignment = 0;              // for jedi powers
};

extern const std::array<const char *const, SKILLTYPE_MAX> SkillTypeName;
inline std::array<std::shared_ptr<Skill>, MAX_SKILL> SkillTable;
inline std::array<std::shared_ptr<Skill>, MAX_SKILL> HerbTable;
inline int TopSN;
inline int TopHerb;
extern const std::array<const char *const, SKILLTARGETTYPE_MAX> SpellTargetName;
extern const std::array<const char *const, SAVETYPE_MAX> SpellSaveName;
extern const std::array<const char *const, Flag::MAX> SpellFlag;

/*
 * These are LookupSkill return values for common skills and spells.
 */
inline short gsn_starfighters;
inline short gsn_midships;
inline short gsn_capitalships;
inline short gsn_weaponsystems;
inline short gsn_navigation;
inline short gsn_shipsystems;
inline short gsn_tractorbeams;
inline short gsn_shipmaintenance;
inline short gsn_sabotage;
inline short gsn_spacecombat;
inline short gsn_spacecombat2;
inline short gsn_spacecombat3;
inline short gsn_shipdocking;
inline short gsn_jumpvector;
inline short gsn_speeders;
inline short gsn_speedercombat;
inline short gsn_reinforcements;
inline short gsn_postguard;
inline short gsn_addpatrol;
inline short gsn_eliteguard;
inline short gsn_specialforces;
inline short gsn_jail;
inline short gsn_smalltalk;
inline short gsn_propaganda;
inline short gsn_bribe;
inline short gsn_seduce;
inline short gsn_masspropaganda;
inline short gsn_gather_intelligence;
inline short gsn_torture;
inline short gsn_snipe;
inline short gsn_throw;
inline short gsn_disguise;
inline short gsn_cloak;
inline short gsn_mine;
inline short gsn_grenades;
inline short gsn_first_aid;
inline short gsn_beg;
inline short gsn_makeblade;
inline short gsn_makejewelry;
inline short gsn_makeblaster;
inline short gsn_makebowcaster;
inline short gsn_makeglowrod;
inline short gsn_makecomlink;
inline short gsn_makegrenade;
inline short gsn_makelandmine;
inline short gsn_makearmor;
inline short gsn_makeshield;
inline short gsn_makecontainer;
inline short gsn_lightsaber_crafting;
inline short gsn_spice_refining;
inline short gsn_fake_signal;
inline short gsn_slicing;
inline short gsn_detrap;
inline short gsn_backstab;
inline short gsn_circle;
inline short gsn_dodge;
inline short gsn_hide;
inline short gsn_peek;
inline short gsn_pick_lock;
inline short gsn_scan;
inline short gsn_skin;
inline short gsn_sneak;
inline short gsn_steal;
inline short gsn_gouge;
inline short gsn_track;
inline short gsn_search;
inline short gsn_dig;
inline short gsn_mount;
inline short gsn_bashdoor;
inline short gsn_cutdoor;
inline short gsn_berserk;
inline short gsn_hitall;
inline short gsn_pickshiplock;
inline short gsn_hijack;
inline short gsn_disarm;
inline short gsn_enhanced_damage;
inline short gsn_kick;
inline short gsn_parry;
inline short gsn_rescue;
inline short gsn_second_attack;
inline short gsn_third_attack;
inline short gsn_fourth_attack;
inline short gsn_fifth_attack;
inline short gsn_dual_wield;
inline short gsn_aid;
inline short gsn_shove;

/* spells */
inline short gsn_blindness;
inline short gsn_charm_person;
inline short gsn_aqua_breath;
inline short gsn_invis;
inline short gsn_mass_invis;
inline short gsn_poison;
inline short gsn_sleep;
inline short gsn_possess;
inline short gsn_fireball;           /* for fireshield  */
inline short gsn_lightning_bolt;     /* for shockshield */
inline short gsn_study;

/* newer attack skills */
inline short gsn_punch;
inline short gsn_bash;
inline short gsn_stun;
inline short gsn_bind;
inline short gsn_poison_weapon;
inline short gsn_climb;
inline short gsn_blasters;
inline short gsn_force_pikes;
inline short gsn_bowcasters;
inline short gsn_lightsabers;
inline short gsn_vibro_blades;
inline short gsn_flexible_arms;
inline short gsn_talonous_arms;
inline short gsn_bludgeons;
inline short gsn_grip;

/* languages */
inline short gsn_common;
inline short gsn_binary;
inline short gsn_falleen;
inline short gsn_devaronese;
inline short gsn_antarian;
inline short gsn_wookiee;
inline short gsn_twilek;
inline short gsn_rodian;
inline short gsn_hutt;
inline short gsn_mon_calamari;
inline short gsn_noghri;
inline short gsn_gamorrean;
inline short gsn_jawa;
inline short gsn_adarian;
inline short gsn_ewok;
inline short gsn_verpine;
inline short gsn_defel;
inline short gsn_trandoshan;
inline short gsn_chadra_fan;
inline short gsn_quarren;
inline short gsn_duinduogwuin;
inline short gsn_barabel;
inline short gsn_firrerreo;
inline short gsn_bothan;
inline short gsn_coynite;
inline short gsn_duros;
inline short gsn_gand;
inline short gsn_kubaz;
inline short gsn_togorian;
inline short gsn_yevethan;
inline short gsn_ithorese;
inline short gsn_sullustan;

/* used to do specific lookups */
inline short gsn_first_spell;
inline short gsn_first_skill;
inline short gsn_first_weapon;
inline short gsn_first_tongue;
inline short gsn_TopSN;

void ASSIGN_GSN(short &gsn, const std::string &skill);
bool IS_VALID_SN(int sn);
bool IS_VALID_HERB(int sn);
bool SPELL_FLAG(std::shared_ptr<Skill> skill, size_t flag);
long SPELL_DAMAGE(std::shared_ptr<Skill> skill);
long SPELL_ACTION(std::shared_ptr<Skill> skill);
long SPELL_CLASS(std::shared_ptr<Skill> skill);
long SPELL_POWER(std::shared_ptr<Skill> skill);
void SET_SDAM(std::shared_ptr<Skill> skill, int val);
void SET_SACT(std::shared_ptr<Skill> skill, int val);
void SET_SCLA(std::shared_ptr<Skill> skill, int val);
void SET_SPOW(std::shared_ptr<Skill> skill, int val);

/* RIS by gsn lookups. -- Altrag.
   Will need to add some || stuff for spells that need a special GSN. */
bool IS_FIRE(int dt);
bool IS_COLD(int dt);
bool IS_ACID(int dt);
bool IS_ELECTRICITY(int dt);
bool IS_ENERGY(int dt);
bool IS_DRAIN(int dt);
bool IS_POISON(int dt);

bool CheckSkill(std::shared_ptr<Character> ch, const std::string &command, const std::string &argument);
void LearnFromSuccess(std::shared_ptr<Character> ch, int sn);
void LearnFromFailure(std::shared_ptr<Character> ch, int sn);
int GetSkillLevel(std::shared_ptr<Character> ch, short gsn);

int ChLookupSkill(std::shared_ptr<Character> ch, const std::string &name);
int LookupSkill(const std::string &name);
int LookupHerb(const std::string &name);
int SkillNumberFromSlot(int slot);
int BSearchSkill(const std::string &name, int first, int top);
int BSearchSkillExact(const std::string &name, int first, int top);
int ChBSearchSkill(std::shared_ptr<Character> ch, const std::string &name, int first, int top);
std::shared_ptr<Skill> GetSkill(int sn);
SkillType GetSkillType(const std::string &skilltype);
void LoadSkills();
void SaveSkills();
void SortSkillTable();
void LoadHerbs();
void SaveHerbs();

#endif
