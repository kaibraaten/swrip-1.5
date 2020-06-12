#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "object.hpp"
#include "protoobject.hpp"

void do_oset( Character *ch, std::string argument )
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    char buf[MAX_STRING_LENGTH];
    char outbuf[MAX_STRING_LENGTH];
    Object *obj = nullptr;
    std::shared_ptr<ExtraDescription> ed;
    std::string origarg = argument;
    int value = 0, tmp = 0;

    if ( IsNpc( ch ) )
    {
        ch->Echo("Mob's can't oset\r\n");
        return;
    }

    if ( !ch->Desc )
    {
        ch->Echo("You have no descriptor\r\n");
        return;
    }

    SmashTilde( argument );

    argument = OneArgument( argument, arg1 );
    argument = OneArgument( argument, arg2 );
    arg3 = argument;

    if ( arg1.empty() || arg2.empty() || !StrCmp( arg1, "?" ) )
    {
        ch->Echo("Syntax: oset <object> <field>  <value>\r\n");
        ch->Echo("\r\n");
        ch->Echo("Field being one of:\r\n");
        ch->Echo("  flags wear level weight cost timer\r\n");
        ch->Echo("  name short long desc ed rmed actiondesc\r\n");
        ch->Echo("  type value0 value1 value2 value3 value4 value5\r\n");
        ch->Echo("  affect rmaffect layers\r\n");
        ch->Echo("For weapons:             For armor:\r\n");
        ch->Echo("  weapontype condition     ac condition\r\n");
        ch->Echo("  numdamdie sizedamdie                  \r\n");
        ch->Echo("  charges   maxcharges                  \r\n");
        ch->Echo("For potions, pills:\r\n");
        ch->Echo("  slevel spell1 spell2 spell3\r\n");
        ch->Echo("For devices:\r\n");
        ch->Echo("  slevel spell maxcharges charges\r\n");
        ch->Echo("For salves:\r\n");
        ch->Echo("  slevel spell1 spell2 maxdoses delay (keep low - delay is anoying)\r\n");
        ch->Echo("For containers:          For levers and switches:\r\n");
        ch->Echo("  cflags key capacity      tflags\r\n");
        ch->Echo("For rawspice:            For ammo and batteries:\r\n");
        ch->Echo("  spicetype  grade         charges (at least 1000 for ammo)\r\n");
        ch->Echo("For crystals:\r\n");
        ch->Echo("  gemtype\r\n");
        return;
    }

    if ( !obj && GetTrustLevel(ch) <= LEVEL_IMMORTAL )
    {
        if ( ( obj = GetObjectHere( ch, arg1 ) ) == NULL )
        {
            ch->Echo("You can't find that here.\r\n");
            return;
        }
    }
    else if ( !obj )
    {
        if ( ( obj = GetObjectAnywhere( ch, arg1 ) ) == NULL )
        {
            ch->Echo("There is nothing like that in all the realms.\r\n");
            return;
        }
    }

    SeparateOneObjectFromGroup( obj );
    value = ToLong( arg3 );

    if ( !StrCmp( arg2, "value0" ) || !StrCmp( arg2, "v0" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Value[0] = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Value[0] = value;

        return;
    }

    if ( !StrCmp( arg2, "value1" ) || !StrCmp( arg2, "v1" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Value[1] = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Value[1] = value;

        return;
    }

    if ( !StrCmp( arg2, "value2" ) || !StrCmp( arg2, "v2" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Value[2] = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
        {
            obj->Prototype->Value[2] = value;

            if ( obj->ItemType == ITEM_WEAPON && value != 0 )
                obj->Value[2] = obj->Prototype->Value[1] * obj->Prototype->Value[2];
        }

        return;
    }

    if ( !StrCmp( arg2, "value3" ) || !StrCmp( arg2, "v3" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Value[3] = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Value[3] = value;

        return;
    }

    if ( !StrCmp( arg2, "value4" ) || !StrCmp( arg2, "v4" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Value[4] = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Value[4] = value;

        return;
    }

    if ( !StrCmp( arg2, "value5" ) || !StrCmp( arg2, "v5" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Value[5] = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Value[5] = value;

        return;
    }

    if ( !StrCmp( arg2, "type" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: oset <object> type <type>\r\n");
            ch->Echo("Possible Types:\r\n");
            ch->Echo("None        Light\r\n");
            ch->Echo("Treasure    Armor      Comlink    Fabric      Grenade\r\n");
            ch->Echo("Furniture   Trash      Container  Drink_con   Landmine\r\n");
            ch->Echo("Key         Food       Money      Pen         Fuel\r\n");
            ch->Echo("Fountain    Pill       Weapon     Medpac      Missile\r\n");
            ch->Echo("Fire        Book       Superconductor         Rare_metal\r\n");
            ch->Echo("Switch      Lever      Button     Dial        Government\r\n");
            ch->Echo("Trap        Map        Portal     Paper       Magnet\r\n");
            ch->Echo("Lockpick    Shovel     Thread     Smut        Ammo\r\n");
            ch->Echo("Rawspice    Lens       Crystal    Duraplast   Battery\r\n");
            ch->Echo("Toolkit     Durasteel  Oven       Mirror      Circuit\r\n");
            ch->Echo("Potion      Salve      Pill       Device      Spacecraft\r\n");
            ch->Echo("Bolt        Chemical\r\n");
            return;
        }

        value = GetObjectType( argument );

        if ( value < 1 )
        {
            ch->Echo("Unknown type: %s\r\n", arg3.c_str() );
            return;
        }

        obj->ItemType = (ItemTypes) value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->ItemType = obj->ItemType;

        return;
    }

    if ( !StrCmp( arg2, "flags" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: oset <object> flags <flag> [flag]...\r\n");
            ch->Echo( "  glow, dark, magic, bless, antievil, noremove, antisith, antisoldier,\r\n");
            ch->Echo( "  donation, covering, hum, invis, nodrop, antigood, antipilot, anticitizen\r\n");
            ch->Echo( "  antineutral, inventory, antithief, antijedi, clanobject, antihunter\r\n");
            ch->Echo( "  small_size, human_size, large_size, hutt_size, contraband\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetObjectFlag( arg3 );

            if ( value < 0 || value > 31 )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
            {
                obj->Flags.flip(value);

                if ( value == Flag::Obj::Prototype)
                    obj->Prototype->Flags = obj->Flags;
            }
        }

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Flags = obj->Flags;

        return;
    }

    if ( !StrCmp( arg2, "wear" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: oset <object> wear <flag> [flag]...\r\n");
            ch->Echo("Possible locations:\r\n");
            ch->Echo("  take   finger   neck    body    head   legs\r\n");
            ch->Echo("  feet   hands    arms    shield  about  waist\r\n");
            ch->Echo("  wrist  wield    hold    ears    eyes   floating\r\n");
            ch->Echo("  over\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetWearFlag( arg3 );

            if ( value < 0 || static_cast<size_t>(value) >= Flag::MAX )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
                obj->WearFlags.flip(value);
        }

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->WearFlags = obj->WearFlags;

        return;
    }

    if ( !StrCmp( arg2, "level" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Level = value;
        return;
    }

    if ( !StrCmp( arg2, "weight" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Weight = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Weight = value;

        return;
    }

    if ( !StrCmp( arg2, "cost" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Cost = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Cost = value;

        return;
    }

    if ( !StrCmp( arg2, "layers" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Layers = value;
        else
            ch->Echo("Item must have prototype flag to set this value.\r\n");

        return;
    }

    if ( !StrCmp( arg2, "timer" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Timer = value;
        return;
    }

    if ( !StrCmp( arg2, "name" ) )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Name = arg3;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
        {
            obj->Prototype->Name = obj->Name;
        }

        return;
    }

    if ( !StrCmp( arg2, "short" ) )
    {
        obj->ShortDescr = arg3;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
        {
            obj->Prototype->ShortDescr = obj->ShortDescr;
        }
        else
            /* Feature added by Narn, Apr/96
             * If the item is not proto, add the word 'rename' to the keywords
             * if it is not already there.
             */
        {
            if ( StringInfix( "rename", obj->Name ) )
            {
                sprintf( buf, "%s %s", obj->Name.c_str(), "rename" );
                obj->Name = buf;
            }
        }

        return;
    }

    if ( !StrCmp( arg2, "actiondesc" ) )
    {
        if ( strstr( arg3.c_str(), "%n" )
             || strstr( arg3.c_str(), "%d" )
             || strstr( arg3.c_str(), "%l" ) )
        {
            ch->Echo("Illegal characters!\r\n");
            return;
        }

        obj->ActionDescription = arg3;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
        {
            obj->Prototype->ActionDescription = obj->ActionDescription;
        }

        return;
    }

    if ( !StrCmp( arg2, "long" ) )
    {
        if ( !arg3.empty() )
        {
            obj->Description = arg3;

            if ( obj->Flags.test(Flag::Obj::Prototype) )
            {
                obj->Prototype->Description = obj->Description;
            }

            return;
        }

        CHECK_SUBRESTRICTED( ch );

        StartEditing(ch, obj->Description,
                     [ch, obj](const auto &txt)
                     {
                         if (IsObjectExtracted(obj))
                         {
                             ch->Echo("Your object was extracted!\r\n");
                             return;
                         }

                         obj->Description = txt;

                         if ( obj->Flags.test(Flag::Obj::Prototype) )
                         {
                             obj->Prototype->Description = obj->Description;
                         }
                     });
        SetEditorDesc( ch, "Object %ld (%s) long description",
                       obj->Prototype->Vnum, obj->Name.c_str() );
        return;
    }

    if ( !StrCmp( arg2, "affect" ) )
    {
        short loc = 0;
        int bitv = 0;

        argument = OneArgument( argument, arg2 );

        if ( arg2.empty() || argument.empty() )
        {
            ch->Echo( "Usage: oset <object> affect <field> <value>\r\n");
            ch->Echo( "Affect Fields:\r\n");
            ch->Echo( "  none        strength    dexterity   intelligence  wisdom       constitution\r\n");
            ch->Echo( "  sex         level       age         height        weight       force\r\n");
            ch->Echo( "  hit         move        credits     experience    armor        hitroll\r\n");
            ch->Echo( "  damroll     save_para   save_rod    save_poison   save_breath  save_power\r\n");
            ch->Echo( "  charisma    resistant   immune      susceptible   affected     luck\r\n");
            ch->Echo( "  backstab    pick        track       steal         sneak        hide\r\n");
            ch->Echo( "  detrap      dodge       peek        scan          gouge        search\r\n");
            ch->Echo( "  mount       disarm      kick        parry         bash         stun\r\n");
            ch->Echo( "  punch       climb       grip        scribe        brew\r\n");
            return;
        }

        loc = GetAffectType( arg2 );

        if ( loc < 1 )
        {
            ch->Echo("Unknown field: %s\r\n", arg2.c_str() );
            return;
        }

        if ( loc >= APPLY_AFFECT && loc < APPLY_WEAPONSPELL )
        {
            bitv = 0;

            while ( !argument.empty() )
            {
                argument = OneArgument( argument, arg3 );

                if ( loc == APPLY_AFFECT )
                    value = GetAffectFlag( arg3 );
                else
                    value = GetResistanceFlag( arg3 );

                if ( value < 0 || value > 31 )
                    ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
                else
                    SetBit( bitv, 1 << value );
            }

            if ( !bitv )
                return;

            value = bitv;
        }
        else
        {
            argument = OneArgument( argument, arg3 );
            value = ToLong( arg3 );
        }

        std::shared_ptr<Affect> paf = std::make_shared<Affect>();
        paf->Type         = -1;
        paf->Duration             = -1;
        paf->Location             = loc;
        paf->Modifier             = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Add(paf);
        else
            obj->Add(paf);

        ++top_affect;
        ch->Echo("Done.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "rmaffect" ) )
    {
        short loc = 0, count = 0;

        if ( argument.empty() )
        {
            ch->Echo("Usage: oset <object> rmaffect <affect#>\r\n");
            return;
        }

        loc = ToLong( argument );

        if ( loc < 1 )
        {
            ch->Echo("Invalid number.\r\n");
            return;
        }

        count = 0;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
        {
            std::shared_ptr<ProtoObject> pObjIndex = obj->Prototype;

            for(auto paf : pObjIndex->Affects())
            {
                if ( ++count == loc )
                {
                    pObjIndex->Remove(paf);
                    ch->Echo("Removed.\r\n");
                    --top_affect;
                    return;
                }
            }

            ch->Echo("Not found.\r\n");
            return;
        }
        else
        {
            for(auto paf : obj->Affects())
            {
                if ( ++count == loc )
                {
                    obj->Remove(paf);
                    ch->Echo("Removed.\r\n");
                    --top_affect;
                    return;
                }
            }

            ch->Echo("Not found.\r\n");
            return;
        }
    }

    if ( !StrCmp( arg2, "ed" ) )
    {
        if ( arg3.empty() )
        {
            ch->Echo( "Syntax: oset <object> ed <keywords>\r\n");
            return;
        }

        CHECK_SUBRESTRICTED( ch );

        if ( obj->Timer )
        {
            ch->Echo("It's not safe to edit an extra description on an object with a timer.\r\nTurn it off first.\r\n");
            return;
        }

        if ( obj->ItemType == ITEM_PAPER )
        {
            ch->Echo("You can not add an extra description to a note paper at the moment.\r\n");
            return;
        }

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            ed = SetOExtraProto( obj->Prototype, arg3 );
        else
            ed = SetOExtra( obj, arg3 );

        StartEditing(ch, ed->Description,
                     [ed](const auto &txt)
                     {
                         ed->Description = txt;
                     });
        SetEditorDesc( ch, "Object %ld (%s) extra description: %s",
                       obj->Prototype->Vnum, obj->Name.c_str(), arg3.c_str() );
        return;
    }

    if ( !StrCmp( arg2, "desc" ) )
    {
        CHECK_SUBRESTRICTED( ch );

        if ( obj->Timer )
        {
            ch->Echo("It's not safe to edit a description on an object with a timer.\r\nTurn it off first.\r\n");
            return;
        }

        if ( obj->ItemType == ITEM_PAPER )
        {
            ch->Echo("You can not add a description to a note paper at the moment.\r\n");
            return;
        }

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            ed = SetOExtraProto( obj->Prototype, obj->Name );
        else
            ed = SetOExtra( obj, obj->Name );

        StartEditing(ch, ed->Description,
                     [ed](const auto &txt)
                     {
                         ed->Description = txt;
                     });
        SetEditorDesc( ch, "Object %ld (%s) description",
                       obj->Prototype->Vnum, obj->Name.c_str() );
        return;
    }

    if ( !StrCmp( arg2, "rmed" ) )
    {
        if ( arg3.empty() )
        {
            ch->Echo("Syntax: oset <object> rmed <keywords>\r\n");
            return;
        }

        if ( obj->Flags.test(Flag::Obj::Prototype) )
        {
            if ( DelOExtraProto( obj->Prototype, arg3 ) )
                ch->Echo("Deleted.\r\n");
            else
                ch->Echo("Not found.\r\n");
            return;
        }

        if ( DelOExtra( obj, arg3 ) )
            ch->Echo("Deleted.\r\n");
        else
            ch->Echo("Not found.\r\n");

        return;
    }
    /*
     * save some finger-leather
     */
    if ( !StrCmp( arg2, "ris" ) )
    {
        sprintf(outbuf, "%s affect resistant %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        sprintf(outbuf, "%s affect immune %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        sprintf(outbuf, "%s affect susceptible %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        return;
    }

    if ( !StrCmp( arg2, "r" ) )
    {
        sprintf(outbuf, "%s affect resistant %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        return;
    }

    if ( !StrCmp( arg2, "i" ) )
    {
        sprintf(outbuf, "%s affect immune %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        return;
    }

    if ( !StrCmp( arg2, "s" ) )
    {
        sprintf(outbuf, "%s affect susceptible %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        return;
    }

    if ( !StrCmp( arg2, "ri" ) )
    {
        sprintf(outbuf, "%s affect resistant %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        sprintf(outbuf, "%s affect immune %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        return;
    }

    if ( !StrCmp( arg2, "rs" ) )
    {
        sprintf(outbuf, "%s affect resistant %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        sprintf(outbuf, "%s affect susceptible %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        return;
    }

    if ( !StrCmp( arg2, "is" ) )
    {
        sprintf(outbuf, "%s affect immune %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        sprintf(outbuf, "%s affect susceptible %s", arg1.c_str(), arg3.c_str());
        do_oset( ch, outbuf );
        return;
    }

    /*
     * Make it easier to set special object values by name than number
     *                                            -Thoric
     */
    tmp = -1;

    switch( obj->ItemType )
    {
    case ITEM_WEAPON:
        if ( !StrCmp( arg2, "weapontype" ) )
        {
            value = GetWeaponType( arg3 );

            if ( value < 0 )
            {
                ch->Echo("Unknown weapon type.\r\n");
                ch->Echo("\r\nChoices:\r\n");
                ch->Echo("   ");

                for( size_t x = 0; x < GetWeaponTableSize(); ++x )
                {
                    ch->Echo("%s", GetWeaponTypeName( x ));
                }

                ch->Echo("\r\n");

                return;
            }

            tmp = 3;
            break;
        }

        if ( !StrCmp( arg2, "condition" ) )      tmp = 0;
        if ( !StrCmp( arg2, "numdamdie" ) )        tmp = 1;
        if ( !StrCmp( arg2, "sizedamdie" ) )       tmp = 2;
        if ( !StrCmp( arg2, "charges" ) )          tmp = 4;
        if ( !StrCmp( arg2, "maxcharges" ) )       tmp = 5;
        if ( !StrCmp( arg2, "charge" ) )          tmp = 4;
        if ( !StrCmp( arg2, "maxcharge" ) )       tmp = 5;
        break;

    case ITEM_BOLT:
    case ITEM_AMMO:
        if ( !StrCmp( arg2, "charges" ) )          tmp = 0;
        if ( !StrCmp( arg2, "charge" ) )          tmp = 0;
        break;

    case ITEM_BATTERY:
        if ( !StrCmp( arg2, "charges" ) )          tmp = 0;
        if ( !StrCmp( arg2, "charge" ) )          tmp = 0;
        break;

    case ITEM_RAWSPICE:
    case ITEM_SPICE:
        if ( !StrCmp( arg2, "grade" ) )          tmp = 1;
        if ( !StrCmp( arg2, "spicetype" ) )
        {
            value = GetSpiceType( arg3 );

            if ( value < 0 )
            {
                ch->Echo("Unknown spice type.\r\n");
                ch->Echo("\r\nChoices:\r\n");
                ch->Echo("   ");

                for( size_t x = 0; x < GetSpiceTableSize(); ++x )
                {
                    ch->Echo("%s", GetSpiceTypeName( x ));
                }

                ch->Echo("\r\n");
                return;
            }
            tmp = 0;
            break;
        }
        break;

    case ITEM_CRYSTAL:
        if ( !StrCmp( arg2, "gemtype" ) )
        {
            value = GetCrystalType( arg3 );

            if ( value < 0 )
            {
                ch->Echo("Unknown gem type.\r\n");
                ch->Echo("\r\nChoices:\r\n");
                ch->Echo("   ");

                for( size_t x = 0; x < GetCrystalTableSize(); ++x )
                {
                    ch->Echo("%s", GetCrystalTypeName( x ));
                }

                ch->Echo("\r\n");
                return;
            }

            tmp = 0;
            break;
        }
        break;

    case ITEM_ARMOR:
        if ( !StrCmp( arg2, "condition" ) )      tmp = 0;
        if ( !StrCmp( arg2, "ac" )       )               tmp = 1;
        break;

    case ITEM_SALVE:
        if ( !StrCmp( arg2, "slevel"   ) )               tmp = 0;
        if ( !StrCmp( arg2, "maxdoses" ) )               tmp = 1;
        if ( !StrCmp( arg2, "doses"    ) )               tmp = 2;
        if ( !StrCmp( arg2, "delay"    ) )               tmp = 3;
        if ( !StrCmp( arg2, "spell1"   ) )               tmp = 4;
        if ( !StrCmp( arg2, "spell2"   ) )               tmp = 5;
        if ( tmp >=4 && tmp <= 5 )                        value = LookupSkill(arg3);
        break;

    case ITEM_POTION:
    case ITEM_PILL:
        if ( !StrCmp( arg2, "slevel" ) )         tmp = 0;
        if ( !StrCmp( arg2, "spell1" ) )         tmp = 1;
        if ( !StrCmp( arg2, "spell2" ) )         tmp = 2;
        if ( !StrCmp( arg2, "spell3" ) )         tmp = 3;
        if ( tmp >=1 && tmp <= 3 )                        value = LookupSkill(arg3);
        break;

    case ITEM_DEVICE:
        if ( !StrCmp( arg2, "slevel" ) )         tmp = 0;
        if ( !StrCmp( arg2, "spell" ) )
        {
            tmp = 3;
            value = LookupSkill(arg3);
        }
        if ( !StrCmp( arg2, "maxcharges" )       )       tmp = 1;
        if ( !StrCmp( arg2, "charges" ) )                tmp = 2;
        break;

    case ITEM_CONTAINER:
        if ( !StrCmp( arg2, "capacity" ) )               tmp = 0;
        if ( !StrCmp( arg2, "cflags" ) )         tmp = 1;
        if ( !StrCmp( arg2, "key" ) )            tmp = 2;
        break;

    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_BUTTON:
        if ( !StrCmp( arg2, "tflags" ) )
        {
            tmp = 0;
            value = GetTrapTriggerFlag(arg3);
        }
        break;

    default:
        break;
    }

    if ( tmp >= 0 && tmp <= 5 )
    {
        if ( !CanModifyObject( ch, obj ) )
            return;

        obj->Value[tmp] = value;

        if ( obj->Flags.test(Flag::Obj::Prototype) )
            obj->Prototype->Value[tmp] = value;

        return;
    }

    /*
     * Generate usage message.
     */
    do_oset( ch, "" );
}
