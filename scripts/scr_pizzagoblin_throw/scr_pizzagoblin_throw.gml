function scr_pizzagoblin_throw() //scr_pizzagoblin_throw
{
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0
        global.throw_frame[370] = 2
        global.throw_frame[372] = 5
        global.throw_frame[371] = 18
        global.throw_frame[366] = 6
        global.throw_frame[385] = 2
        global.throw_frame[149] = 2
        global.throw_frame[24] = 2
        global.throw_frame[387] = 2
        global.throw_frame[368] = 2
        global.throw_frame[369] = 8
        global.throw_frame[376] = 6
        global.throw_frame[380] = 0
        global.throw_frame[706] = 0
        global.throw_frame[379] = 15
        global.throw_frame[378] = 3
        global.throw_frame[377] = 2
        global.throw_frame[168] = 6
        global.throw_frame[358] = 9
        global.throw_frame[359] = 9
        global.throw_frame[334] = 9
        global.throw_frame[170] = 13
        global.throw_frame[395] = 3
        global.throw_frame[783] = 3
        global.throw_frame[213] = 11
        global.throw_sprite = spr_plug
        global.throw_sprite[370] = spr_pizzagoblin_throwbomb
        global.throw_sprite[372] = spr_canongoblin_throwbomb
        global.throw_sprite[371] = spr_archergoblin_shoot
        global.throw_sprite[366] = spr_cheeserobot_attack
        global.throw_sprite[385] = spr_spitcheese_spit
        global.throw_sprite[149] = spr_spitcheese_spit
        global.throw_sprite[24] = spr_trash_throw
        global.throw_sprite[387] = spr_invtrash_throw
        global.throw_sprite[368] = spr_robot_attack
        global.throw_sprite[369] = spr_kentukykenny_throw
        global.throw_sprite[376] = spr_pizzard_shoot
        global.throw_sprite[380] = spr_pepgoblin_kick
        global.throw_sprite[706] = spr_pepgoblin_kick
        global.throw_sprite[379] = spr_swedishmonkey_eat
        global.throw_sprite[378] = spr_ranch_shoot
        global.throw_sprite[377] = spr_pickle_attack
        global.throw_sprite[168] = spr_tank_shoot
        global.throw_sprite[358] = spr_shrimp_knife
        global.throw_sprite[359] = spr_shrimp_knife
        global.throw_sprite[334] = spr_shrimp_knife
        global.throw_sprite[170] = spr_pizzaslug_cough
        global.throw_sprite[395] = spr_ufolive_shoot
        global.throw_sprite[783] = spr_ufolive_shoot
        global.throw_sprite[213] = spr_ufogrounded_shoot
        global.reset_timer = 0
        global.reset_timer[370] = (200 / (global.stylethreshold + 1))
        global.reset_timer[372] = (200 / (global.stylethreshold + 1))
        global.reset_timer[371] = (200 / (global.stylethreshold + 1))
        global.reset_timer[366] = (200 / (global.stylethreshold + 1))
        global.reset_timer[385] = (100 / (global.stylethreshold + 1))
        global.reset_timer[149] = 400
        global.reset_timer[24] = 100
        global.reset_timer[387] = (100 / (global.stylethreshold + 1))
        global.reset_timer[368] = (200 / (global.stylethreshold + 1))
        global.reset_timer[369] = (200 / (global.stylethreshold + 1))
        global.reset_timer[376] = (100 / (global.stylethreshold + 1))
        global.reset_timer[380] = (200 / (global.stylethreshold + 1))
        global.reset_timer[706] = (200 / (global.stylethreshold + 1))
        global.reset_timer[379] = (200 / (global.stylethreshold + 1))
        global.reset_timer[378] = (100 / (global.stylethreshold + 1))
        global.reset_timer[377] = (200 / (global.stylethreshold + 1))
        global.reset_timer[168] = (100 / (global.stylethreshold + 1))
        global.reset_timer[358] = (60 / (global.stylethreshold + 1))
        global.reset_timer[359] = (60 / (global.stylethreshold + 1))
        global.reset_timer[334] = (60 / (global.stylethreshold + 1))
        global.reset_timer[170] = (10 / (global.stylethreshold + 1))
        global.reset_timer[395] = (100 / (global.stylethreshold + 1))
        global.reset_timer[783] = (100 / (global.stylethreshold + 1))
        global.reset_timer[213] = (100 / (global.stylethreshold + 1))
    }
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (floor(image_index) == (image_number - 1))
    {
        state = states.walk
        sprite_index = walkspr
    }
    if (bombreset <= 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index]
        sprite_index = global.throw_sprite[object_index]
        if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
            scr_soundeffect(sfx_enemyprojectile)
        switch object_index
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_pizzagoblinbomb))
                {
                    defused = 1
                    movespeed = 5
                    image_xscale = other.image_xscale
                    vsp = -8
                }
                break;
            case obj_canongoblin:
                with (instance_create(x, (y - 20), obj_canongoblinbomb))
                    image_xscale = other.image_xscale
                break;
            case obj_noisegoblin:
                with (instance_create(x, y, obj_noisegoblin_arrow))
                {
                }
                break;
            case obj_cheeserobot:
                with (instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 8)
                    vsp = 0
                    grav = 0
                }
                break;
            case obj_spitcheese:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -6
                }
                break;
            case obj_trash:
            case obj_invtrash:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -4
                }
                break;
            case obj_robot:
                with (instance_create(x, y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break;
            case obj_kentukykenny:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale
                break;
            case obj_pizzard:
                with (instance_create(x, y, obj_pizzard_bolt))
                    image_xscale = other.image_xscale
                break;
            case obj_swedishmonkey:
                if (global.stylethreshold >= 3)
                {
                    with (instance_create(x, y, obj_evilbanana))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_slipnslide))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                with (obj_slipnslide)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                with (obj_evilbanana)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                break;
            case obj_pepgoblin:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break;
            case obj_pepbat:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break;
            case obj_pickle:
                attacking = 0
                with (instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                break;
            case obj_tank:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_canongoblinbomb))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break;
            case obj_thug_blue:
            case obj_thug_red:
                with (instance_create((x + (8 * image_xscale)), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break;
            case obj_rancher:
                with (instance_create((x + (image_xscale * 6)), (y + 26), obj_rancher_bullet))
                    image_xscale = other.image_xscale
                break;
            case obj_smokingpizzaslice:
                substate = choose(states.walk, states.idle, states.idle)
                if (substate == states.walk)
                    image_xscale = choose(-1, 1, (-image_xscale))
                substate_buffer = substate_max
                with (instance_create((x + (50 * image_xscale)), (y + 20), obj_smokingprojectile))
                    image_xscale = other.image_xscale
                break;
            case obj_thug_green:
                with (instance_create((x + (8 * image_xscale)), y, obj_junkenemy))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 7)
                    vsp = -8
                }
                break;
            case obj_miniufo:
                instance_create(x, y, obj_warplaser)
                break;
            case obj_miniufo_grounded:
                with (instance_create((x + (8 * image_xscale)), y, obj_enemybullet))
                {
                    sprite_index = spr_ufogrounded_bullet
                    image_xscale = other.image_xscale
                }
                break;
            case obj_kentukybomber:
                instance_create((x + (8 * image_xscale)), y, obj_kentukybomb)
                break;
            case obj_bazookabaddie:
                instance_create((x + (8 * image_xscale)), y, obj_bazooka)
                break;
        }

    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
}

