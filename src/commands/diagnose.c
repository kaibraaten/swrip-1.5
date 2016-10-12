#include <time.h>
#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "grub.h"
#include "character.h"

extern ProtoObject *obj_index_hash[MAX_KEY_HASH];
extern Room *room_index_hash[MAX_KEY_HASH];
extern ProtoMobile *mob_index_hash[MAX_KEY_HASH];

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
  ProtoObject *pObj;
  ProtoObject **freq;                        /* dynamic array of pointers */
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char arg4 [MAX_INPUT_LENGTH];
  char arg5 [MAX_INPUT_LENGTH];
  char arg6 [MAX_INPUT_LENGTH];
  int   num = 20;                               /* display lines requested */
  int   cou;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  argument = OneArgument( argument, arg4 );
  argument = OneArgument( argument, arg5 );
  argument = OneArgument( argument, arg6 );

  if (!*arg1) {                                 /* empty arg gets help screen */
    diagnose_help(ch);
    return;
  }

  if ( !StrCmp(arg1, "time") )
    {
      struct tm *t = localtime(&current_time);

      PagerPrintf( ch, "mon=%d day=%d hh=%d mm=%d\r\n",
                    t->tm_mon+1, t->tm_mday, t->tm_hour, t->tm_min);
      return;
    }

  if (!StrCmp(arg1, "rf"))
    {
#define DIAG_RF_MAX_SIZE 5000
      Room *pRoom;
      int match, lo, hi, hit_cou, vnum[DIAG_RF_MAX_SIZE];

      if (!*arg2)                                   /* empty arg gets help scrn */
        {
          diagnose_help(ch);
          return;
        }
      else match = atoi (arg2);

      hit_cou = 0;                                 /* number of vnums found */
      lo = (*arg3) ? atoi (arg3) : 0;
      hi = (*arg4) ? atoi (arg4) : MAX_VNUM;

      Echo (ch, "\r\nRoom Vnums\r\n");

      for (cou = 0; cou < MAX_KEY_HASH; cou++)
        {
          if ( room_index_hash[cou] )
	    {
	      for (pRoom = room_index_hash[cou]; pRoom; pRoom = pRoom->Next)
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
        Echo (ch, "%5d %6d\r\n", cou+1, vnum[cou]);   /* display vnums */

      return;
    }

  if (!StrCmp(arg1, "of")) {
    if (*arg2)                                    /* empty arg gets dft number */
      num = atoi (arg2);
    if (num > DIAG_MAX_SIZE  || num < 1) {        /* display num out of bounds */
      diagnose_help(ch);
      return;
    }
    AllocateMemory(freq, ProtoObject *, num);           /* dynamic freq array */
    for (cou = 0; cou < num; cou++)                /* initialize freq array */
      freq[cou] = NULL;                          /* to NULL pointers */
    for (cou = 0; cou < MAX_KEY_HASH; cou++) {     /* loop thru obj_index_hash */
      if ( obj_index_hash[cou] )                 /* safety check */
        for (pObj=obj_index_hash[cou];          /* loop thru all pObjInd */
             pObj; pObj=pObj->next)
          diag_ins (pObj, num, freq, ch);    /* insert pointer into list */
    }
    Echo (ch, "\r\nObject Frequencies\r\n");  /* send results to char */
    for (cou = 0; cou < num && freq[cou]; cou++)
      Echo(ch, "%3d%8d%8d\r\n", cou+1,freq[cou]->Vnum,freq[cou]->count);
    FreeMemory(freq);
    return;
  }

  if (!StrCmp(arg1, "mm")) {
    Descriptor *d;
    Character *victim;

    if ( !*arg2 )
      return;

    if ( GetTrustLevel(ch) < LEVEL_SUB_IMPLEM )
      return;

    if ( ( victim = GetCharacterAnywhere( ch, arg2 ) ) == NULL )
      {
        SendToCharacter( "Not here.\r\n", ch );
        return;
      }

    if ( !victim->Desc )
      {
        SendToCharacter( "No descriptor.\r\n", ch );
	return;
      }

    if ( victim == ch )
      {
        SendToCharacter( "Cancelling.\r\n", ch );
        for ( d = first_descriptor; d; d = d->next )
          if ( d->snoop_by == ch->Desc )
            d->snoop_by = NULL;
        return;
      }

    if ( victim->Desc->snoop_by )
      {
        SendToCharacter( "Busy.\r\n", ch );
        return;
      }

    if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
      {
        SendToCharacter( "Busy.\r\n", ch );
        return;
      }

    victim->Desc->snoop_by = ch->Desc;
    SendToCharacter( "Ok.\r\n", ch );
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
      for (cou = 0; cou < MAX_KEY_HASH; cou++)     /* loop thru obj_index_hash */
        if ( obj_index_hash[cou] )
          for (pObj=obj_index_hash[cou]; pObj; pObj=pObj->next)
            if (pObj->weight == 0) {
              zero_obj_ind++;
	      zero_obj += pObj->count;
              if (zero_obj_ind <= ZERO_MAX) {
                vnums[zero_obj_ind - 1] = pObj->Vnum;
                count[zero_obj_ind - 1] = pObj->count;
              }
            }
      if (zero_num > 0) {
        zero_sort (vnums, count, 0, zero_obj_ind - 1);
        zero_num = umin (zero_num, ZERO_MAX);
        zero_num = umin (zero_num, zero_obj_ind);
        for (cou=0; cou<zero_num; cou++)
          Echo (ch, "%6d %6d %6d\r\n",
                     cou+1, vnums[cou], count[cou]);
      }
      Echo (ch, "%6d %6d\r\n", zero_obj_ind, zero_obj);
      return;
    }

  if (!StrCmp(arg1, "visit"))
    {
      diag_visit_obj( ch, ch->first_carrying);
      return;
    }


  if (!StrCmp(arg1, "xxxobxxx"))
    {
      Object       *po, *pt = NULL;
      int            i=0;
      char           buf[MAX_STRING_LENGTH];

      Echo(ch, "CHAR name=%s \r\n", ch->Name);
      strcpy(buf, ch->first_carrying ? ch->first_carrying->Name : "NULL");
      Echo(ch, "   first_carry=%s\r\n", buf);
      strcpy(buf, ch->last_carrying ? ch->last_carrying->Name : "NULL");
      Echo(ch, "   last_carry=%s\r\n", buf);

      /*
        for (pa=ch->first_affect; pa; pa=pa->next)
        Echo(ch,
        "   type=%d duration=%d location=%d modifier=%d bitvector=%d\r\n",
        pa->type, pa->duration, pa->location, pa->modifier, pa->bitvector);
      */

      for (po=first_object; po; po=po->next)
	{
          i++;
          pt=NULL;
          if ( !po->carried_by && !po->in_obj ) continue;
          if ( !po->carried_by )
            {
              pt = po;
              while( pt->in_obj )           /* could be in a container on ground */
                pt=pt->in_obj;
            }
          if ( ch==po->carried_by || (pt && ch==pt->carried_by) )
            {
              Echo(ch, "\r\n%d OBJ name=%s \r\n", i, po->Name);
              strcpy(buf, po->next_content ? po->next_content->Name : "NULL");
              Echo(ch, "   next_content=%s\r\n", buf);
              strcpy(buf, po->prev_content ? po->prev_content->Name : "NULL");
              Echo(ch, "   prev_content=%s\r\n", buf);
              strcpy(buf, po->first_content ? po->first_content->Name : "NULL");
              Echo(ch, "   first_content=%s\r\n", buf);
              strcpy(buf, po->last_content ? po->last_content->Name : "NULL");
              Echo(ch, "   last_content=%s\r\n", buf);
            }
        }
      return;
    }

  if (!StrCmp(arg1, "mrc"))
    {
      ProtoMobile *pm;
      short race_num, dis_num, vnum1, vnum2, dis_cou = 0;

      if ( !*arg2 || !*arg3 || !*arg4 || !*arg5
           ||  !isdigit(*arg2) || !isdigit(*arg3) || !isdigit(*arg4)
           ||  !isdigit(*arg5))
        {
          SendToCharacter( "Sorry. Invalid format.\r\n\r\n", ch);
          diagnose_help(ch);
          return;
        }
      dis_num  = umin(atoi (arg2), DIAG_MAX_SIZE);
      race_num     = atoi (arg3);
      vnum1    = atoi (arg4);
      vnum2    = atoi (arg5);
      SendToCharacter("\r\n", ch);

      for (cou = 0; cou < MAX_KEY_HASH; cou++)
        {
          if ( mob_index_hash[cou] )
            for (pm = mob_index_hash[cou]; pm; pm = pm->next)
              {
                if ( pm->Vnum >= vnum1 && pm->Vnum <= vnum2
                     &&   pm->Race == race_num && dis_cou++ < dis_num )
                  PagerPrintf( ch, "%5d %s\r\n", pm->Vnum, pm->Name );
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
  SendToCharacter( "Syntax:\r\n", ch);
  SendToCharacter( "diagnose of n  -  object frequency top n objects\r\n", ch );
  SendToCharacter( "diagnose zero  -  count objects with zero weight\r\n", ch );
  SendToCharacter( "diagnose zero n - list n objects with zero weight\r\n", ch );
  SendToCharacter( "diagnose rf n lo hi - room flag search.\r\n"
                "   list room vnums between lo and hi that match n.\r\n", ch );
  SendToCharacter( "   e.g. diagnose rf 6 901 969 - list all rooms in Olympus\r\n"
                "      that are nomob and deathtraps.\r\n", ch );
  SendToCharacter( "   e.g. diagnose rf 2 - list all deathtraps.\r\n", ch );
  SendToCharacter( "diagnose mrc num racevnum1 vnum2 - mobs/race/class\r\n"
                "   display all mobs of a particular race/class combo.\r\n"
                "   e.g. diagnose mrc 50 0 3 7500 7534 - show 50 human warriors "
                " in Edo.\r\n", ch);
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

  if (!f[siz-1] || p->count>f[siz-1]->count) /* don't bother looping thru f */
    while ( cou<siz && ins<0 )              /* should this vnum be insertted? */
      if ( !f[cou++] || p->count > f[cou-1]->count )
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
  PagerPrintf(ch, "***obj=%s\r\n", obj->Name );

  if ( obj->first_content )
    {
      diag_visit_obj( ch, obj->first_content );
      if ( obj->next_content )
        diag_visit_obj( ch, obj->next_content );
    }
  else
    if ( obj->next_content )
      diag_visit_obj( ch, obj->next_content );
    else
      return;
}
