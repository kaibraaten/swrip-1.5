#ifndef _SWRIP_TYPES_H_
#define _SWRIP_TYPES_H_

#include <utility/utility.h>

typedef int ch_ret;
typedef int obj_ret;

struct affect_data;
typedef struct affect_data             AFFECT_DATA;

struct area_data;
typedef struct area_data               AREA_DATA;

struct auction_data;
typedef struct auction_data            AUCTION_DATA;

struct ban_data;
typedef struct ban_data                BAN_DATA;

struct extracted_char_data;
typedef struct extracted_char_data     EXTRACT_CHAR_DATA;

struct char_data;
typedef struct char_data               CHAR_DATA;

struct hunt_hate_fear;
typedef struct hunt_hate_fear          HHF_DATA;

struct fighting_data;
typedef struct fighting_data           FIGHT_DATA;

struct descriptor_data;
typedef struct descriptor_data         DESCRIPTOR_DATA;

struct exit_data;
typedef struct exit_data               EXIT_DATA;

struct extra_descr_data;
typedef struct extra_descr_data        EXTRA_DESCR_DATA;

struct help_data;
typedef struct help_data               HELP_DATA;

struct mob_index_data;
typedef struct mob_index_data          MOB_INDEX_DATA;

struct note_data;
typedef struct note_data               NOTE_DATA;

struct comment_data;
typedef struct comment_data            COMMENT_DATA;

struct board_data;
typedef struct board_data              BOARD_DATA;

struct obj_data;
typedef struct obj_data                OBJ_DATA;

struct obj_index_data;
typedef struct obj_index_data          OBJ_INDEX_DATA;

struct pc_data;
typedef struct pc_data                 PC_DATA;

struct reset_data;
typedef struct reset_data              RESET_DATA;

struct room_index_data;
typedef struct room_index_data         ROOM_INDEX_DATA;

struct shop_data;
typedef struct shop_data               SHOP_DATA;

struct repairshop_data;
typedef struct repairshop_data         REPAIR_DATA;

struct time_info_data;
typedef struct time_info_data          TIME_INFO_DATA;

struct hour_min_sec;
typedef struct hour_min_sec            HOUR_MIN_SEC;

struct weather_data;
typedef struct weather_data            WEATHER_DATA;

struct bounty_data;
typedef struct bounty_data             BOUNTY_DATA;

struct planet_data;
typedef struct planet_data             PLANET_DATA;

struct storeroom;
typedef struct storeroom               STOREROOM;

struct guard_data;
typedef struct guard_data              GUARD_DATA;

struct space_data;
typedef struct space_data              SPACE_DATA;

struct clan_data;
typedef struct clan_data               CLAN_DATA;

struct ship_data;
typedef struct ship_data               SHIP_DATA;

struct turret_data;
typedef struct turret_data             TURRET_DATA;

struct missile_data;
typedef struct missile_data            MISSILE_DATA;

struct tourney_data;
typedef struct tourney_data            TOURNEY_DATA;

struct mob_prog_data;
typedef struct mob_prog_data           MPROG_DATA;

struct mob_prog_act_list;
typedef struct mob_prog_act_list       MPROG_ACT_LIST;

struct editor_data;
typedef struct editor_data             EDITOR_DATA;

struct teleport_data;
typedef struct teleport_data           TELEPORT_DATA;

struct timer_data;
typedef struct timer_data              TIMER;

struct godlist_data;
typedef struct godlist_data            GOD_DATA;

struct system_data;
typedef struct system_data             SYSTEM_DATA;

struct smaug_affect;
typedef struct smaug_affect            SMAUG_AFF;

struct who_data;
typedef struct who_data                WHO_DATA;

struct skill_type;
typedef struct skill_type              SKILLTYPE;

struct social_type;
typedef struct social_type             SOCIALTYPE;

struct cmd_type;
typedef struct cmd_type                CMDTYPE;

struct killed_data;
typedef struct killed_data             KILLED_DATA;

struct wizent;
typedef struct wizent                  WIZENT;

struct member_data;
typedef struct member_data             MEMBER_DATA; /* Individual member data */

struct member_list;
typedef struct member_list             MEMBER_LIST; /* List of members in clan */

struct membersort_data;
typedef struct membersort_data         MS_DATA;     /* List for sorted roster list */

struct shuttle_data;
typedef struct shuttle_data SHUTTLE_DATA;

struct stop_data;
typedef struct stop_data STOP_DATA;

/*
 * Function types.
 */
typedef void    DO_FUN          ( CHAR_DATA *ch, char *argument );
typedef bool    SPEC_FUN        ( CHAR_DATA *ch );
typedef ch_ret  SPELL_FUN       ( int sn, int level, CHAR_DATA *ch, void *vo );

#ifdef __cplusplus
#define DECLARE_DO_FUN( fun )    extern "C" { DO_FUN    fun; } DO_FUN fun##_mangled
#define DECLARE_SPEC_FUN( fun )  extern "C" { SPEC_FUN  fun; } SPEC_FUN fun##_mangled
#define DECLARE_SPELL_FUN( fun ) extern "C" { SPELL_FUN fun; } SPELL_FUN fun##_mangled
#else
#define DECLARE_DO_FUN( fun )           DO_FUN    fun
#define DECLARE_SPEC_FUN( fun )         SPEC_FUN  fun
#define DECLARE_SPELL_FUN( fun )        SPELL_FUN fun
#endif

#endif
