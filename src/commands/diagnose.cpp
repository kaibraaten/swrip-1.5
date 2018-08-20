#include <time.h>
#include <string.h>
#include <ctype.h>
#include "mud.hpp"
#include "grub.hpp"
#include "character.hpp"
#include "playerrepository.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"

static int diag_int_comp(const void *i, const void *j);
static void diagnose_help (Character *ch);
static void diag_ins (ProtoObject *p, int siz, ProtoObject **f, Character *ch);
static void zero_sort( int *vnums, int *count, int left, int right );
static void diag_visit_obj( Character *ch, Object *obj );

/*
 * The "diagnose" command is designed to be expandable and take different
 * parameters to handle different diagnostic routines.
 */

void do_diagnose( Character *ch, char *argument )
{
#define   DIAG_MAX_SIZE  1000
  ProtoObject *pObj = nullptr;
  ProtoObject **freq = nullptr;                        /* dynamic array of pointers */
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char arg4[MAX_INPUT_LENGTH];
  char arg5[MAX_INPUT_LENGTH];
  char arg6[MAX_INPUT_LENGTH];
  int num = 20;                               /* display lines requested */
  int cou = 0;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  argument = OneArgument( argument, arg4 );
  argument = OneArgument( argument, arg5 );
  argument = OneArgument( argument, arg6 );

  if (!*arg1)
    {
      diagnose_help(ch);
      return;
    }

  if ( !StrCmp(arg1, "time") )
    {
      struct tm *t = localtime(&current_time);

      ch->Echo( "mon=%d day=%d hh=%d mm=%d\r\n",
                t->tm_mon+1, t->tm_mday, t->tm_hour, t->tm_min);
      return;
    }

  if (!StrCmp(arg1, "rf"))
    {
#define DIAG_RF_MAX_SIZE 5000
      Room *pRoom = nullptr;
      int match = 0, hit_cou = 0, vnum[DIAG_RF_MAX_SIZE];

      if (!*arg2)                                   /* empty arg gets help scrn */
        {
          diagnose_help(ch);
          return;
        }
      else
        {
          match = atoi (arg2);
        }
      
      int lo = (*arg3) ? atoi (arg3) : 0;
      int hi = (*arg4) ? atoi (arg4) : MAX_VNUM;

      ch->Echo("\r\nRoom Vnums\r\n");
      
      for (cou = 0; cou < MAX_KEY_HASH; cou++)
        {
          if ( RoomIndexHash[cou] )
	    {
	      for (pRoom = RoomIndexHash[cou]; pRoom; pRoom = pRoom->Next)
		{
		  if (pRoom->Vnum >= lo && pRoom->Vnum <= hi)
		    {
		      if ( match == (match & pRoom->Flags)
			   && hit_cou < DIAG_RF_MAX_SIZE)
			vnum[hit_cou++] = pRoom->Vnum;
		    }
		}
	    }
        }
      
      qsort(vnum, hit_cou, sizeof(int), diag_int_comp);      /* sort vnums    */

      for (cou=0; cou<hit_cou; cou++)
        ch->Echo("%5d %6d\r\n", cou+1, vnum[cou]);   /* display vnums */

      return;
    }

  if (!StrCmp(arg1, "of")) {
    if (*arg2)                                    /* empty arg gets dft number */
      num = atoi (arg2);

    if (num > DIAG_MAX_SIZE  || num < 1) {        /* display num out of bounds */
      diagnose_help(ch);
      return;
    }

    freq = new ProtoObject*[num];

    for (cou = 0; cou < num; cou++)                /* initialize freq array */
      freq[cou] = NULL;                          /* to NULL pointers */

    for (cou = 0; cou < MAX_KEY_HASH; cou++) {     /* loop thru ObjectIndexHash */
      if ( ObjectIndexHash[cou] )                 /* safety check */
        for (pObj=ObjectIndexHash[cou];          /* loop thru all pObjInd */
             pObj; pObj=pObj->Next)
          diag_ins (pObj, num, freq, ch);    /* insert pointer into list */
    }
    
    ch->Echo("\r\nObject Frequencies\r\n");  /* send results to char */

    for (cou = 0; cou < num && freq[cou]; cou++)
      ch->Echo("%3d%8d%8d\r\n", cou+1,freq[cou]->Vnum,freq[cou]->Count);

    delete[] freq;
    return;
  }

  if (!StrCmp(arg1, "mm"))
    {
      Character *victim;

      if ( !*arg2 )
        return;

      if ( GetTrustLevel(ch) < LEVEL_SUB_IMPLEM )
        return;

      if ( ( victim = GetCharacterAnywhere( ch, arg2 ) ) == NULL )
        {
          ch->Echo( "Not here.\r\n" );
          return;
      }

      if ( !victim->Desc )
        {
          ch->Echo( "No descriptor.\r\n" );
          return;
        }

      if ( victim == ch )
        {
          ch->Echo( "Cancelling.\r\n" );

          for(Character *snoopedCharacter : PlayerCharacters->Entities())
            {
              if(snoopedCharacter->Desc->SnoopBy == ch->Desc)
                {
                  snoopedCharacter->Desc->SnoopBy = nullptr;
                }
            }
        
          return;
        }

      if ( victim->Desc->SnoopBy )
        {
          ch->Echo( "Busy.\r\n" );
          return;
        }

      if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
        {
          ch->Echo( "Busy.\r\n" );
          return;
        }

      victim->Desc->SnoopBy = ch->Desc;
      ch->Echo( "Ok.\r\n" );
      return;
    }

  if (!StrCmp(arg1, "zero"))
    {
#define ZERO_MAX   1500
      int vnums[ZERO_MAX];
      int count[ZERO_MAX];
      int zero_obj_ind = 0;                        /* num of obj_ind's with 0 wt */
      int zero_obj     = 0;                        /* num of objs with 0 wt */
      int zero_num     = -1;                       /* num of lines requested */

      if (*arg2)
        zero_num = atoi (arg2);
      for (cou = 0; cou < MAX_KEY_HASH; cou++)     /* loop thru ObjectIndexHash */
        if ( ObjectIndexHash[cou] )
          for (pObj=ObjectIndexHash[cou]; pObj; pObj=pObj->Next)
            if (pObj->Weight == 0)
              {
                zero_obj_ind++;
                zero_obj += pObj->Count;

                if (zero_obj_ind <= ZERO_MAX)
                  {
                    vnums[zero_obj_ind - 1] = pObj->Vnum;
                    count[zero_obj_ind - 1] = pObj->Count;
                  }
              }

      if (zero_num > 0)
        {
          zero_sort (vnums, count, 0, zero_obj_ind - 1);
          zero_num = umin (zero_num, ZERO_MAX);
          zero_num = umin (zero_num, zero_obj_ind);

          for (cou=0; cou<zero_num; cou++)
            ch->Echo("%6d %6d %6d\r\n",
                     cou+1, vnums[cou], count[cou]);
        }
      
      ch->Echo("%6d %6d\r\n", zero_obj_ind, zero_obj);
      return;
    }

  if (!StrCmp(arg1, "visit"))
    {
      //diag_visit_obj( ch, ch->FirstCarrying);
      diag_visit_obj(ch, nullptr);
      return;
    }


  if (!StrCmp(arg1, "xxxobxxx"))
    {
      Object       *po, *pt = NULL;
      int            i=0;

      ch->Echo("CHAR name=%s \r\n", ch->Name);
      ch->Echo("   first_carry=%s\r\n",
               ch->Objects().empty() ? "NULL" : ch->Objects().front()->Name);
      ch->Echo("   last_carry=%s\r\n",
               ch->Objects().empty() ? "NULL" : ch->Objects().back()->Name);

      /*
        for (pa=ch->FirstAffect; pa; pa=pa->Next)
        Echo(ch,
        "   type=%d duration=%d location=%d modifier=%d bitvector=%d\r\n",
        pa->type, pa->duration, pa->Location, pa->modifier, pa->bitvector);
      */

      for (po=FirstObject; po; po=po->Next)
	{
          i++;
          pt=NULL;

          if ( !po->CarriedBy && !po->InObject )
            continue;

          if ( !po->CarriedBy )
            {
              pt = po;
              while( pt->InObject )           /* could be in a container on ground */
                pt=pt->InObject;
            }

          if ( ch == po->CarriedBy || (pt && ch == pt->CarriedBy) )
            {
              ch->Echo("\r\n%d OBJ name=%s \r\n", i, po->Name);
              /*
              ch->Echo("   NextContent=%s\r\n", po->NextContent ? po->NextContent->Name : "NULL");
              ch->Echo("   PreviousContent=%s\r\n",
                       po->PreviousContent ? po->PreviousContent->Name : "NULL");
              ch->Echo("   FirstContent=%s\r\n",
                       po->FirstContent ? po->FirstContent->Name : "NULL");
              ch->Echo("   LastContent=%s\r\n",
                       po->LastContent ? po->LastContent->Name : "NULL");
              */
            }
        }
      
      return;
    }

  if (!StrCmp(arg1, "mrc"))
    {
      ProtoMobile *pm = nullptr;
      short race_num = 0, dis_num = 0, vnum1 = 0, vnum2 = 0, dis_cou = 0;

      if ( !*arg2 || !*arg3 || !*arg4 || !*arg5
           || !isdigit(*arg2) || !isdigit(*arg3) || !isdigit(*arg4)
           || !isdigit(*arg5))
        {
          ch->Echo( "Sorry. Invalid format.\r\n\r\n" );
          diagnose_help(ch);
          return;
        }
      dis_num  = umin(atoi (arg2), DIAG_MAX_SIZE);
      race_num     = atoi (arg3);
      vnum1    = atoi (arg4);
      vnum2    = atoi (arg5);
      ch->Echo("\r\n");

      for (cou = 0; cou < MAX_KEY_HASH; cou++)
        {
          if ( MobIndexHash[cou] )
            for (pm = MobIndexHash[cou]; pm; pm = pm->Next)
              {
                if ( pm->Vnum >= vnum1 && pm->Vnum <= vnum2
                     &&   pm->Race == race_num && dis_cou++ < dis_num )
                  ch->Echo( "%5d %s\r\n", pm->Vnum, pm->Name );
              }
        }
      return;
    }

  diagnose_help( ch );
}

/*
 * Sort function used by diagnose "rf" to sort integers
 */

static int diag_int_comp(const void *i, const void *j)
{
  return *(int*)i - *(int*)j;
}

/*
 * Displays the help screen for the "diagnose" command
 */
static void diagnose_help (Character *ch)
{
  ch->Echo( "Syntax:\r\n" );
  ch->Echo( "diagnose of n  -  object frequency top n objects\r\n" );
  ch->Echo( "diagnose zero  -  count objects with zero weight\r\n" );
  ch->Echo( "diagnose zero n - list n objects with zero weight\r\n" );
  ch->Echo( "diagnose rf n lo hi - room flag search.\r\n"
            "   list room vnums between lo and hi that match n.\r\n" );
  ch->Echo( "   e.g. diagnose rf 6 901 969 - list all rooms in Olympus\r\n"
            "      that are nomob and deathtraps.\r\n" );
  ch->Echo( "   e.g. diagnose rf 2 - list all deathtraps.\r\n" );
  ch->Echo( "diagnose mrc num racevnum1 vnum2 - mobs/race/class\r\n"
            "   display all mobs of a particular race/class combo.\r\n"
            "   e.g. diagnose mrc 50 0 3 7500 7534 - show 50 human warriors "
            " in Edo.\r\n");
}

/*
 * Takes an object vnum and the count of the number of times
 * that object occurs and decides whether or not to include it in the
 * frequency table which contains the "top n" frequently occurring objects.
 */

static void diag_ins (ProtoObject *p, int siz, ProtoObject **f, Character *ch)
{
  int  cou =  0;                             /* temporary counter */
  int  ins = -1;                             /* insert pos in dynamic f array */

  if (!f[siz-1] || p->Count > f[siz-1]->Count) /* don't bother looping thru f */
    while ( cou<siz && ins<0 )              /* should this vnum be insertted? */
      if ( !f[cou++] || p->Count > f[cou-1]->Count )
        ins = cou-1;                      /* needs to go into pos "cou" */

  if ( ins>=0 )                              /* if vnum occurs more frequently */
    {
      for (cou = siz-1; cou > ins; cou--)     /* open a slot in the table */
        f[cou] = f[cou-1];
      f[ins] = p;                             /* insert pointer in empty slot */
    }
}

/*
 * Sorts the arrays "vnums" and "count" based on the order in "count"
 */
static void zero_sort( int *vnums, int *count, int left, int right )
{
  int i=left, j=right, swap, test;
  test = count[(left + right) / 2];
  do {
    while (count[i] > test) i++;
    while (test > count[j]) j--;
    if (i <= j) {
      swap=count[i]; count[i] = count[j]; count[j] = swap;
      swap=vnums[i]; vnums[i] = vnums[j]; vnums[j] = swap;
      i++; j--;
    }
  }
  while (i <= j);
  if (left < j)  zero_sort (vnums, count, left, j);
  if (i < right) zero_sort (vnums, count, i, right);
}

static void diag_visit_obj( Character *ch, Object *obj )
{
#if 0
  ch->Echo( "***obj=%s\r\n", obj->Name );

  if ( obj->FirstContent )
    {
      diag_visit_obj( ch, obj->FirstContent );

      if ( obj->NextContent )
        {
          diag_visit_obj( ch, obj->NextContent );
        }
    }
  else if ( obj->NextContent )
    {
      diag_visit_obj( ch, obj->NextContent );
    }
  else
    {
      return;
    }
#endif
}
