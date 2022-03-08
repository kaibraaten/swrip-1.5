#ifndef _SWRIP_TRIGGERS_HPP_
#define _SWRIP_TRIGGERS_HPP_

#include <memory>
#include <string>
#include <utility>
#include <vector>
#include "types.hpp"
#include "constants.hpp"
#include <imp/runtime/runtimevalue.hpp>
#include "vo.hpp"

constexpr auto ERROR_PROG = -1;
constexpr auto ACT_PROG = BV00;
constexpr auto SPEECH_PROG = BV01;
constexpr auto RAND_PROG = BV02;
constexpr auto FIGHT_PROG = BV03;
constexpr auto RFIGHT_PROG = BV03;
constexpr auto DEATH_PROG = BV04;
constexpr auto RDEATH_PROG = BV04;
constexpr auto HITPRCNT_PROG = BV05;
constexpr auto ENTRY_PROG = BV06;
constexpr auto ENTER_PROG = BV06;
constexpr auto GREET_PROG = BV07;
constexpr auto ALL_GREET_PROG = BV08;
constexpr auto GIVE_PROG = BV09;
constexpr auto BRIBE_PROG = BV10;
constexpr auto HOUR_PROG = BV11;
constexpr auto TIME_PROG = BV12;
constexpr auto WEAR_PROG = BV13;
constexpr auto REMOVE_PROG = BV14;
constexpr auto SAC_PROG = BV15;
constexpr auto LOOK_PROG = BV16;
constexpr auto EXA_PROG = BV17;
constexpr auto ZAP_PROG = BV18;
constexpr auto GET_PROG = BV19;
constexpr auto DROP_PROG = BV20;
constexpr auto DAMAGE_PROG = BV21;
constexpr auto REPAIR_PROG = BV22;
constexpr auto SPAWN_PROG = BV23;
//constexpr auto COMMAND_PROG = BV24;
constexpr auto PULL_PROG = BV25;
constexpr auto PUSH_PROG = BV26;
constexpr auto SLEEP_PROG = BV27;
constexpr auto REST_PROG = BV28;
constexpr auto LEAVE_PROG = BV29;
constexpr auto SCRIPT_PROG = BV30;
constexpr auto USE_PROG = BV31;

class Character;
class Object;
class Room;

void ImpScriptSpawnTrigger(std::shared_ptr<Character> mob);
void ImpScriptSpawnTrigger(std::shared_ptr<Object> obj);

void MobProgActTrigger(const std::string &buf, std::shared_ptr<Character> mob,
                       std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, const Vo &vo);
void MobProgBribeTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch, int amount);
void MobProgEntryTrigger(std::shared_ptr<Character> mob);
void MobProgGiveTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void MobProgGreetTrigger(std::shared_ptr<Character> mob);
void MobProgFightTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch);
void MobProgHitPercentTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch);
void MobProgDeathTrigger(std::shared_ptr<Character> killer, std::shared_ptr<Character> mob);
void MobProgRandomTrigger(std::shared_ptr<Character> mob);
void MobProgSpeechTrigger(const std::string &txt, std::shared_ptr<Character> mob);
void MobProgScriptTrigger(std::shared_ptr<Character> mob);
void MobProgHourTrigger(std::shared_ptr<Character> mob);
void MobProgTimeTrigger(std::shared_ptr<Character> mob);
void ObjProgSpeechTrigger(const std::string &txt, std::shared_ptr<Character> ch);
void ObjProgRandomTrigger(std::shared_ptr<Object> obj);
void ObjProgWearTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
bool ObjProgUseTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj,
                       const Vo &vo = nullptr);
void ObjProgRemoveTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgExamineTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgSacTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgDamageTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgRepairTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgDropTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgZapTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgGreetTrigger(std::shared_ptr<Character> ch);
void ObjProgGetTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgPullTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgPushTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);

void RoomProgLeaveTrigger(std::shared_ptr<Character> ch);
void RoomProgEnterTrigger(std::shared_ptr<Character> ch);
void RoomProgSleepTrigger(std::shared_ptr<Character> ch);
void RoomProgRestTrigger(std::shared_ptr<Character> ch);
void RoomProgFightTrigger(std::shared_ptr<Character> ch);
void RoomProgDeathTrigger(std::shared_ptr<Character> killer, std::shared_ptr<Character> ch);
void RoomProgSpeechTrigger(const std::string &txt, std::shared_ptr<Character> ch);
void RoomProgRandomTrigger(std::shared_ptr<Character> ch);
void RoomProgTimeTrigger(std::shared_ptr<Character> ch);
void RoomProgHourTrigger(std::shared_ptr<Character> ch);

void ObjProgActTrigger(const std::string &buf, std::shared_ptr<Object> mobj, std::shared_ptr<Character> ch,
                       std::shared_ptr<Object> obj, const Vo &vo);
void RoomProgActTrigger(const std::string &buf, std::shared_ptr<Room> room, std::shared_ptr<Character> ch,
                        std::shared_ptr<Object> obj, const Vo &vo);

std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> GetImpObjProgData(std::shared_ptr<Object> obj,
                                                                                          std::shared_ptr<Character> actor,
                                                                                          const Vo &vo, int type);
std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> GetImpMobProgData(std::shared_ptr<Character> mob,
                                                                                          std::shared_ptr<Character> actor,
                                                                                          const Vo &vo, int type);
std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> GetImpRoomProgData(std::shared_ptr<Room> room,
                                                                                           std::shared_ptr<Character> actor,
                                                                                           const Vo &vo, int type);
std::string MakeScriptName(std::shared_ptr<Character> mob, int type);
std::string MakeScriptName(std::shared_ptr<Object> obj, int type);
std::string MakeScriptName(std::shared_ptr<Room> room, int type);
void RunRoomSpawnTriggers();

#endif
