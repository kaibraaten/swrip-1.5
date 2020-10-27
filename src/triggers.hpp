#ifndef _SWRIP_TRIGGERS_HPP_
#define _SWRIP_TRIGGERS_HPP_

#include <memory>
#include <string>
#include "types.hpp"
#include "vo.hpp"

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
                       std::shared_ptr<Character> vict, std::shared_ptr<Object> targ, const Vo &vo);
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
#endif