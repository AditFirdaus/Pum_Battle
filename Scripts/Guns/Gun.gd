extends Position2D

export(PackedScene) var Bullet
export(String) var Spawn_Path = "/root"

func Shoot():
	if Bullet != null:
		var bullet = Bullet.instance()
		bullet.global_position = global_position
		bullet.global_rotation = global_rotation
		if get_node_or_null(Spawn_Path) != null:
			get_node_or_null(Spawn_Path).add_child(bullet)
