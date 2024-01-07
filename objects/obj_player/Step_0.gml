prevhsp = hsp
prevmove = move
prevmovespeed = movespeed
previcemovespeed = icemovespeed
prevstate = state
prevxscale = xscale
switch state
{
    case states.normal:
        scr_player_normal()
        break;
    case states.revolver:
        scr_player_revolver()
        break;
    case states.dynamite:
        scr_player_dynamite()
        break;
    case states.boots:
        scr_player_boots()
        break;
    case states.grabbed:
        scr_player_grabbed()
        break;
    case states.finishingblow:
        scr_player_finishingblow()
        break;
    case states.tumble:
        scr_player_tumble()
        break;
    case states.titlescreen:
        scr_player_titlescreen()
        break;
    case states.ejected:
        scr_player_ejected()
        break;
    case states.firemouth:
        scr_player_firemouth()
        break;
    case states.fireass:
        scr_player_fireass()
        break;
    case states.transitioncutscene:
        scr_player_transitioncutscene()
        break;
    case states.hookshot:
        scr_playerN_hookshot()
        break;
    case states.slap:
        scr_player_slap()
        break;
    case states.tacklecharge:
        scr_player_tacklecharge()
        break;
    case states.cheesepep:
        scr_player_cheesepep()
        break;
    case states.cheesepepjump:
        scr_player_cheesepepjump()
        break;
    case states.cheesepepfling:
        scr_player_cheesepepfling()
        break;
    case states.cheeseball:
        scr_player_cheeseball()
        break;
    case states.cheeseballclimbwall:
        scr_player_cheeseballclimbwall()
        break;
    case states.cheesepepstickside:
        scr_player_cheesepepstickside()
        break;
    case states.cheesepepstickup:
        scr_player_cheesepepstickup()
        break;
    case states.cheesepepstick:
        scr_player_cheesepepstick()
        break;
    case states.cheesepeplaunch:
        scr_player_cheesepeplaunch()
        break;
    case states.boxxedpep:
        scr_player_boxxedpep()
        break;
    case states.boxxedpepjump:
        scr_player_boxxedpepjump()
        break;
    case states.boxxedpepspin:
        scr_player_boxxedpepspin()
        break;
    case states.pistolaim:
        scr_player_pistolaim()
        break;
    case states.climbwall:
        scr_player_climbwall()
        break;
    case states.knightpepslopes:
        scr_player_knightpepslopes()
        break;
    case states.portal:
        scr_player_portal()
        break;
    case states.secondjump:
        scr_player_secondjump()
        break;
    case states.chainsawbump:
        scr_player_chainsawbump()
        break;
    case states.handstandjump:
        scr_player_handstandjump()
        break;
    case states.lungeattack:
        scr_player_lungeattack()
        break;
    case states.lungegrab:
        scr_player_lungegrab()
        break;
    case states.dashtumble:
        scr_player_dashtumble()
        break;
    case states.shoulderbash:
        scr_player_shoulderbash()
        break;
    case states.gottreasure:
        scr_player_gottreasure()
        break;
    case states.knightpep:
        scr_player_knightpep()
        break;
    case states.knightpepattack:
        scr_player_knightpepattack()
        break;
    case states.knightpepbump:
        scr_player_knightpepbump()
        break;
    case states.meteorpep:
        scr_player_meteorpep()
        break;
    case states.bombpep:
        scr_player_bombpep()
        break;
    case states.bombpepup:
        scr_player_bombpepup()
        break;
    case states.bombpepside:
        scr_player_bombpepside()
        break;
    case states.bombgrab:
        scr_player_bombgrab()
        break;
    case states.grabbing:
        scr_player_grabbing()
        break;
    case states.chainsawpogo:
        scr_player_chainsawpogo()
        break;
    case states.shotgunjump:
        scr_player_shotgunjump()
        break;
    case states.stunned:
        scr_player_stunned()
        break;
    case states.highjump:
        scr_player_highjump()
        break;
    case states.chainsaw:
        scr_player_chainsaw()
        break;
    case states.hit:
        scr_player_hit()
        break;
    case states.thrown:
        scr_player_thrown()
        break;
    case states.facestomp:
        scr_player_facestomp()
        break;
    case states.timesup:
        scr_player_timesup()
        break;
    case states.machroll:
        scr_player_machroll()
        break;
    case states.pistol:
        scr_player_pistol()
        break;
    case states.shotgun:
        scr_player_shotgun()
        break;
    case states.shotguncrouch:
        scr_player_shotguncrouch()
        break;
    case states.shotguncrouchjump:
        scr_player_shotguncrouchjump()
        break;
    case states.shotgunshoot:
        scr_player_shotgunshoot()
        break;
    case states.shotgunfreefall:
        scr_player_shotgunfreefall()
        break;
    case states.shotgundash:
        scr_player_shotgundash()
        break;
    case states.machfreefall:
        scr_player_machfreefall()
        break;
    case states.throwing:
        scr_player_throwing()
        break;
    case states.superslam:
        scr_player_superslam()
        break;
    case states.slam:
        scr_player_slam()
        break;
    case states.skateboard:
        scr_player_skateboard()
        break;
    case states.grind:
        scr_player_grind()
        break;
    case states.grab:
        scr_player_grab()
        break;
    case states.punch:
        scr_player_punch()
        break;
    case states.backkick:
        scr_player_backkick()
        break;
    case states.uppunch:
        scr_player_uppunch()
        break;
    case states.shoulder:
        scr_player_shoulder()
        break;
    case states.backbreaker:
        scr_player_backbreaker()
        break;
    case states.graffiti:
        scr_player_graffiti()
        break;
    case states.bossdefeat:
        scr_player_bossdefeat()
        break;
    case states.bossintro:
        scr_player_bossintro()
        break;
    case states.smirk:
        scr_player_smirk()
        break;
    case states.pizzathrow:
        scr_player_pizzathrow()
        break;
    case states.gameover:
        scr_player_gameover()
        break;
    case states.Sjumpland:
        scr_player_Sjumpland()
        break;
    case states.freefallprep:
        scr_player_freefallprep()
        break;
    case states.runonball:
        scr_player_runonball()
        break;
    case states.boulder:
        scr_player_boulder()
        break;
    case states.keyget:
        scr_player_keyget()
        break;
    case states.tackle:
        scr_player_tackle()
        break;
    case states.slipnslide:
        scr_player_slipnslide()
        break;
    case states.ladder:
        scr_player_ladder()
        break;
    case states.jump:
        scr_player_jump()
        break;
    case states.victory:
        scr_player_victory()
        break;
    case states.comingoutdoor:
        scr_player_comingoutdoor()
        break;
    case states.Sjump:
        scr_player_Sjump()
        break;
    case states.Sjumpprep:
        scr_player_Sjumpprep()
        break;
    case states.crouch:
        scr_player_crouch()
        break;
    case states.crouchjump:
        scr_player_crouchjump()
        break;
    case states.crouchslide:
        scr_player_crouchslide()
        break;
    case states.mach1:
        scr_player_mach1()
        break;
    case states.mach2:
        scr_player_mach2()
        break;
    case states.mach3:
        scr_player_mach3()
        break;
    case states.machslide:
        scr_player_machslide()
        break;
    case states.bump:
        scr_player_bump()
        break;
    case states.hurt:
        scr_player_hurt()
        break;
    case states.freefall:
        scr_player_freefall()
        break;
    case states.freefallland:
        scr_player_freefallland()
        break;
    case states.hang:
        scr_player_hang()
        break;
    case states.door:
        scr_player_door()
        break;
    case states.barrel:
        scr_player_barrel()
        break;
    case states.barreljump:
        scr_player_barreljump()
        break;
    case states.barrelslide:
        scr_player_barrelslide()
        break;
    case states.barrelclimbwall:
        scr_player_barrelclimbwall()
        break;
    case states.current:
        scr_player_current()
        break;
    case states.taxi:
        scr_player_taxi()
        break;
    case states.taxi2:
        scr_player_taxi()
        break;
    case states.pogo:
        scr_player_pogo()
        break;
    case states.rideweenie:
        scr_player_rideweenie()
        break;
    case states.motorcycle:
        scr_player_motorcycle()
        break;
    case states.faceplant:
        scr_player_faceplant()
        break;
    case states.ghost:
        scr_player_ghost()
        break;
    case states.ghostpossess:
        scr_player_ghostpossess()
        break;
    case states.mort:
        scr_player_mort()
        break;
    case states.mortjump:
        scr_player_mortjump()
        break;
    case states.mortattack:
        scr_player_mortattack()
        break;
    case states.morthook:
        scr_player_morthook()
        break;
    case states.hook:
        scr_player_hook()
        break;
    case states.arenaintro:
        scr_player_arenaintro()
        break;
    case states.actor:
        scr_player_actor()
        break;
    case states.parry:
        scr_player_parry()
        break;
    case states.golf:
        scr_player_golf()
        break;
    case states.tube:
        scr_player_tube()
        break;
    case states.pummel:
        scr_player_pummel()
        break;
    case states.slipbanan:
        scr_player_slipbanan()
        break;
    case states.bombdelete:
        scr_player_bombdelete()
        break;
    case states.rocket:
        scr_player_rocket()
        break;
    case states.rocketslide:
        scr_player_rocketslide()
        break;
    case states.gotoplayer:
        scr_player_gotoplayer()
        break;
    case states.trickjump:
        scr_player_trickjump()
        break;
    case states.ridecow:
        scr_player_ridecow()
        break;
    case states.ratmount:
        scr_player_ratmount()
        break;
    case states.ratmounthurt:
        scr_player_ratmounthurt()
        break;
    case states.ratmountjump:
        scr_player_ratmountjump()
        break;
    case states.ratmountattack:
        scr_player_ratmountattack()
        break;
    case states.ratmountspit:
        scr_player_ratmountspit()
        break;
    case states.ratmountclimbwall:
        scr_player_ratmountclimbwall()
        break;
    case states.ratmountgroundpound:
        scr_player_ratmountgroundpound()
        break;
    case states.ratmountbounce:
        scr_player_ratmountbounce()
        break;
    case states.ratmountballoon:
        scr_player_ratmountballoon()
        break;
    case states.ratmountgrind:
        scr_player_ratmountgrind()
        break;
    case states.ratmounttumble:
        scr_player_ratmounttumble()
        break;
    case states.ratmounttrickjump:
        scr_player_ratmounttrickjump()
        break;
    case states.blockstance:
        scr_player_blockstance()
        break;
    case states.balloon:
        scr_player_balloon()
        break;
    case states.debugstate:
        scr_player_debugstate()
        break;
    case states.trashjump:
        scr_player_trashjump()
        break;
    case states.trashroll:
        scr_player_trashroll()
        break;
    case states.stringfling:
        scr_player_stringfling()
        break;
    case states.stringjump:
        scr_player_stringjump()
        break;
    case states.noisejetpack:
        scr_player_noisejetpack()
        break;
    case states.spiderweb:
        scr_player_spiderweb()
        break;
    case states.animatronic:
        scr_player_animatronic()
        break;
}

if (state != states.animatronic)
    animatronic_buffer = 360
if (state == states.boxxedpep && grounded && vsp > 0)
    boxxedpepjump = boxxedpepjumpmax
if (verticalbuffer > 0)
    verticalbuffer--
if (!scr_slope())
    angle = 0
else if (!(place_meeting(x, (y + 1), obj_solid)))
{
    with (instance_place(x, (y + 1), obj_slope))
    {
        if (abs(image_yscale) < abs(image_xscale))
        {
            if (sign(image_xscale) == 1)
                other.angle = 15
            else
                other.angle = -15
        }
        else if (sign(image_xscale) == 1)
            other.angle = 30
        else
            other.angle = -30
    }
}
if (grounded && vsp > 0)
    icemomentum = (place_meeting(x, (y + 1), obj_iceblock) || place_meeting(x, (y + 1), obj_iceblockslope))
else if icemomentum
{
    if (xscale != dir && movespeed != 0 && state == states.jump)
    {
        icedir = (-xscale)
        icemovespeed = 8
    }
    if (move == 0)
        icemovespeed = 0
}
if (!grounded)
    icemomentum = 0
if ((!icemomentum) && state != states.machslide)
    icedir = (-xscale)
if (state == states.climbwall)
    icemomentum = 0
hsp_carry += (icedir * icemovespeed)
icemovespeed = Approach(icemovespeed, 0, 0.1)
if (state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3)
    scr_do_noisejetpack()
if (walljumpbuffer > 0)
    walljumpbuffer--
if (grounded && vsp > 0 && state != states.noisejetpack)
    jetpackfuel = jetpackmax
if (state == states.ratmounttrickjump || state == states.ratmount || state == states.ratmountattack || state == states.ratmountbounce || state == states.ratmountclimbwall || state == states.ratmountgroundpound || state == states.ratmounthurt || state == states.ratmountjump || state == states.ratmountspit || state == (199 << 0) || state == states.ratmountballoon || state == states.ratmounttumble || state == states.ratmountgrind)
    isgustavo = 1
else
    isgustavo = 0
if tauntstoredisgustavo
{
    isgustavo = 1
    if (state != states.backbreaker && state != states.parry && state != states.graffiti)
        tauntstoredisgustavo = 0
}
if (state != states.mach3)
{
    launch = 0
    launched = 0
    launch_buffer = 0
}
if (launch_buffer > 0)
    launch_buffer--
else
    launched = 0
if (state != states.finishingblow)
    finishingblow = 0
if (dash_doubletap > 0)
    dash_doubletap--
if (cow_buffer > 0)
    cow_buffer--
if (state == states.lungeattack)
    lunge_buffer = 14
if (blur_effect > 0)
    blur_effect--
else if (state == states.tumble || state == states.ratmountbounce || state == states.ratmountattack || state == states.handstandjump || (state == states.barrelslide && movespeed >= barrel_rollspeed_threshold) || (state == states.grab && sprite_index == spr_swingding && swingdingdash <= 0) || (state == states.punch && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)) || state == states.freefall || state == states.lungeattack)
{
    blur_effect = 2
    with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), xscale))
        playerid = other.id
}
if (state != states.grab)
    grabbingenemy = 0
if (state != states.mach2 && state != states.mach3 && state != states.trickjump && state != states.ratmounttumble && state != states.ratmounttrickjump)
{
    ramp = 0
    ramp_points = 0
}
if (state != states.door && place_meeting(x, y, obj_boxofpizza))
    state = states.crouch
if (shoot_buffer > 0)
    shoot_buffer--
if (cheesepep_buffer > 0)
    cheesepep_buffer--
if (state != states.cheesepepstickside)
    yscale = 1
if (invhurt_buffer > 0)
    invhurt_buffer--
if (state == states.hurt)
{
    if (hurt_buffer > 0)
        hurt_buffer--
    else
    {
        invhurt_buffer = invhurt_max
        hurt_buffer = -1
    }
}
else
{
    if (hurt_buffer > 0)
        invhurt_buffer = invhurt_max
    hurt_buffer = -1
}
if (room == Realtitlescreen && instance_exists(obj_mainmenuselect))
    state = states.titlescreen
if (wallclingcooldown < 10)
    wallclingcooldown++
if ((!instance_exists(superchargedeffectid)) && supercharged)
{
    with (instance_create(x, y, obj_superchargeeffect))
    {
        playerid = other.id
        other.superchargedeffectid = id
    }
}
if (state != states.Sjump)
    sjumpvsp = -12
if (state != states.freefall)
    freefallvsp = 15
if (global.combo >= 4 && state != states.backbreaker)
    supercharged = 1
if ((!instance_exists(pizzashieldid)) && pizzashield == 1)
{
    with (instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index
        other.pizzashieldid = id
    }
}
if (visible == false && state == states.comingoutdoor)
{
    coopdelay++
    image_index = 0
    if (coopdelay == 50)
    {
        visible = true
        coopdelay = 0
    }
}
if (global.coop == 1)
{
    if ((state == states.punch || state == states.handstandjump) && (!((obj_player2.state == states.punch || obj_player2.state == states.handstandjump))))
        fightballadvantage = 1
    else if (!((obj_player2.state == states.punch || obj_player2.state == states.handstandjump)))
        fightballadvantage = 0
}
if (state != states.pogo && state != states.backbreaker)
{
    pogospeed = 6
    pogospeedprev = 0
}
scr_playersounds()
if grounded
    doublejump = 0
if (pogochargeactive == 1)
{
    if (flashflicker == 0)
    {
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogofall)
            sprite_index = spr_playerN_pogofallmach
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce)
            sprite_index = spr_playerN_pogobouncemach
    }
    flashflicker = 1
    pogocharge--
}
else
    flashflicker = 0
if (state != states.throwing)
    kickbomb = 0
if (pogocharge == 0)
{
    pogochargeactive = 0
    pogocharge = 100
}
if (flashflicker == 1)
{
    flashflickertime++
    if (flashflickertime == 20)
    {
        flash = 1
        flashflickertime = 0
    }
}
if (state != states.mach3 && state != states.grabbed)
    fightball = 0
if (state != states.grabbed && state != states.hurt)
{
    if (grounded && state != states.grabbing)
        suplexmove = 0
}
if (state != states.freefall && (state != states.chainsaw || tauntstoredstate != states.freefall))
    freefallsmash = 0
if (global.playerhealth <= 0 && state != states.gameover)
{
    image_index = 0
    sprite_index = spr_playerV_dead
    state = states.gameover
}
if (state == states.gameover && y > (room_height * 2))
{
    targetDoor = "D"
    scr_playerreset()
    if (global.coop == 1)
    {
        with (obj_player2)
        {
            scr_playerreset()
            targetDoor = "D"
        }
    }
    with (obj_player)
    {
        targetDoor = "D"
        room = hub_reception
    }
}
if (mort == 1)
{
    if (state != states.mort && state != states.mortjump && (!doublejump))
        mort = 0
}
if (baddiegrabbedID == obj_null && (state == states.grab || state == states.superslam || state == states.tacklecharge))
    state = states.normal
if (!((state == states.grab || state == states.superslam || state == states.mach2)))
{
    baddiegrabbedID = obj_null
    heavy = 0
}
if (cutscene == 1 && state != states.gotoplayer)
    global.heattime = 60
if (anger == 0)
    angry = 0
if (anger > 0)
{
    angry = 1
    anger -= 1
}
if (sprite_index == spr_winding && state != states.normal)
    windingAnim = 0
if (state != states.grab)
    swingdingbuffer = 0
if (state != states.grabbing && state != states.barrel && state != states.boxxedpepspin && state != states.boxxedpepjump && state != states.tumble && state != states.ghost && state != states.ghostpossess && sprite_index != spr_player_mortjump)
    grav = 0.5
else if (state == states.barrel || state == states.tumble)
    grav = 0.6
else if (state == states.ghost || state == states.ghostpossess)
    grav = 0
else if (state == states.boxxedpepspin)
    grav = 0.2
else if (state == states.boxxedpepjump)
    grav = 0.4
if (state == states.barrel && key_jump2 && (!jumpstop))
    grav = 0.4
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create((x + random_range(-5, obj_tubeleft)), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create((x + random_range(-5, obj_tubeleft)), (y + 46), obj_vomit))
        sprite_index = spr_vomit2
}
if (global.stylethreshold >= 2 && (!instance_exists(angryeffectid)) && state == states.normal && character != "V")
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index
        other.angryeffectid = id
    }
}
if (object_index == obj_player1)
{
    if (global.combotime > 0)
        global.combotime -= 0.25
    if (global.heattime > 0)
        global.heattime -= 0.25
    if (global.combotime <= 0 && global.combo != 0)
    {
        global.combotime = 0
        global.combo = 0
        supercharge = 0
    }
    if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
        global.style -= 0.05
}
if (key_jump && (!grounded) && (state == states.mach2 || state == states.mach3) && (state != (states.climbwall & walljumpbuffer)) <= 0)
    input_buffer_walljump = 24
if (input_buffer_jump < 8)
    input_buffer_jump++
if (input_buffer_secondjump < 8)
    input_buffer_secondjump++
if (input_buffer_highjump < 8)
    input_buffer_highjump++
if (input_attack_buffer > 0)
    input_attack_buffer--
if (input_finisher_buffer > 0)
    input_finisher_buffer--
if (input_up_buffer > 0)
    input_up_buffer--
if (input_down_buffer > 0)
    input_down_buffer--
if (input_buffer_walljump > 0)
    input_buffer_walljump--
if (key_particles == 1)
    create_particle((x + random_range(-25, 25)), (y + random_range(-35, 25)), (10 << 0), 0)
if (inv_frames == 0 && hurted == 0 && state != states.ghost)
    image_alpha = 1
if (state == states.punch || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || state == states.tacklecharge || state == states.skateboard || state == states.knightpep || state == states.boxxedpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.facestomp || state == states.mach3 || state == states.freefall || state == states.Sjump)
    attacking = 1
else
    attacking = 0
if (state == states.throwing || state == states.backkick || state == states.shoulder || state == states.uppunch)
    grabbing = 1
else
    grabbing = 0
if ((state == states.ratmountbounce && vsp >= 0) || sprite_index == spr_tumble || state == states.boxxedpepspin || state == states.trashroll || state == states.trashjump || state == states.shotgundash || (state == states.shotgunfreefall && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == states.Sjump || state == states.rocket || state == states.chainsawbump || state == states.punch || state == states.faceplant || state == states.rideweenie || state == states.mach3 || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || (state == states.hurt && thrown == 1) || state == states.climbwall || state == states.freefall || state == states.fireass || state == states.firemouth || state == states.hookshot || state == states.skateboard || state == (63 << 0) || state == states.Sjump || state == states.machfreefall || state == states.tacklecharge || (state == states.superslam && sprite_index == spr_piledriver) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.boxxedpep || state == states.cheesepep || state == states.cheeseball || state == states.slipbanan || state == states.shoulderbash)
    instakillmove = 1
else
    instakillmove = 0
if (state == states.ratmountbounce && vsp < 0)
    stunmove = 1
else
    stunmove = 0
if (flash == 1 && alarm[0] <= 0)
    alarm[0] = (0.15 * room_speed)
if (state != states.mach3 && state != states.machslide)
    autodash = 0
if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
    fallinganimation = 0
if (state != states.freefallland && state != states.normal && state != states.machslide && state != states.jump)
    facehurt = 0
if (state != states.normal && state != states.machslide)
    machslideAnim = 0
if (state != states.normal && state != states.ratmount)
{
    idle = 0
    dashdust = 0
}
if (state != states.mach1 && state != states.cheesepepjump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
    momemtum = 0
if (state != states.Sjump && state != states.Sjumpprep)
    a = 0
if (state != states.facestomp)
    facestompAnim = 0
if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
    superslam = 0
if (state != states.mach2)
    machpunchAnim = 0
if (state != states.jump && state != states.shotgunjump)
    ladderbuffer = 0
if (state != states.jump)
    stompAnim = 0
if ((state == states.mach3 || state == states.mach2) && macheffect == 0)
{
    macheffect = 1
    toomuchalarm1 = 6
    with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
    {
        playerid = other.object_index
        image_xscale = other.xscale
    }
}
if ((!(state == states.mach3)) && (!(state == states.mach2)))
    macheffect = 0
if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1
    if (toomuchalarm1 <= 0 && (state == states.mach3 || state == states.mach2))
    {
        with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
        {
            playerid = other.object_index
            image_xscale = other.xscale
        }
        toomuchalarm1 = 6
    }
}
if (y > (room_height + 200) && room != custom_lvl_room && state != states.gameover && state != states.gotoplayer)
{
    x = roomstartx
    y = roomstarty
    visible = true
    if (state == states.ghostpossess)
    {
        state = states.ghost
        sprite_index = spr_ghostidle
    }
    vsp = 10
}
if (character == "S")
{
    if (state == states.crouchjump || state == states.crouch)
        state = states.normal
}
if (character != "M")
{
    if (!(place_meeting(x, y, obj_solid)))
    {
        if (state != states.ghost && state != states.boxxedpepjump && state != states.boxxedpepspin && (!((state == states.bump && sprite_index == spr_tumbleend))) && state != states.barrelslide && state != states.barrelclimbwall && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_player_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != states.tumble && state != states.stunned && state != states.crouch && state != states.shotguncrouch && state != states.shotguncrouchjump && state != states.boxxedpep && state != states.pistol && sprite_index != spr_player_crouchshoot && state != states.Sjumpprep && state != states.crouchslide && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.crouchjump && state != states.cheesepepstickup && state != states.cheesepepstickside)
            mask_index = spr_player_mask
        else
            mask_index = spr_crouchmask
    }
    else if place_meeting(x, y, obj_solid)
        mask_index = spr_crouchmask
}
else
    mask_index = spr_pepperman_mask
if (character == "S" && state == states.bombpep)
    mask_index = spr_player_mask
else if (character == "S")
    mask_index = spr_crouchmask
if (state == states.gottreasure || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == states.keyget || state == states.chainsaw || state == states.door || state == states.ejected || state == states.victory || state == states.comingoutdoor || state == states.gameover || state == states.gotoplayer || state == states.taxi2 || state == states.actor)
    cutscene = 1
else
    cutscene = 0
if (((place_meeting(x, y, obj_door) && (!(place_meeting(x, y, obj_doorblocked)))) || place_meeting(x, y, obj_taxi) || place_meeting(x, y, obj_dialognpc) || place_meeting(x, y, obj_dresser) || place_meeting(x, y, obj_snick) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_filedoor) || place_meeting(x, y, obj_optiondoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == states.normal && obj_player1.spotlight == 1)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index
}
if (movespeed >= 16 && (!instance_exists(speedlineseffectid)))
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index
        other.speedlineseffectid = id
    }
}
scr_collision_destructibles()
if (state != states.ghostpossess && state != states.gotoplayer && state != states.debugstate && state != states.titlescreen && state != states.tube && state != states.grabbed && state != states.door && state != states.Sjump && state != states.ejected && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover)
    scr_collision()
if (state == states.tube || state == states.gotoplayer || state == states.debugstate)
{
    x += hsp
    y += vsp
}
if (state == states.boulder)
    scr_collision()