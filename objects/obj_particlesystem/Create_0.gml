if (instance_number(obj_particlesystem) > 1)
{
    instance_destroy()
    return;
}
depth = -99
global.particle_system = part_system_create()
global.part_map = ds_map_create()
global.part_depth = ds_map_create()
global.part_emitter = part_emitter_create(global.particle_system)
global.debris_list = ds_list_create()
global.collect_list = ds_list_create()
var p = declare_particle((1 << 0), spr_cloudeffect, 0.5, 99)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((2 << 0), spr_crazyrunothereffect, 0.5, -99)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((3 << 0), spr_highjumpcloud1, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((4 << 0), spr_highjumpcloud2, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((5 << 0), spr_jumpdust, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((6 << 0), spr_balloonpop, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((7 << 0), spr_shotgunimpact, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((8 << 0), spr_impact, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((9 << 0), spr_genericpoofeffect, 1, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((10 << 0), spr_keyparticles, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((11 << 0), spr_teleporteffect, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((12 << 0), spr_landcloud, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)