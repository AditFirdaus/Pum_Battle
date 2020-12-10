extends "res://Scripts/Guns/Gun.gd"

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		Shoot()
func _process(delta):
	rotate(get_angle_to(get_global_mouse_position()) * 0.1)
