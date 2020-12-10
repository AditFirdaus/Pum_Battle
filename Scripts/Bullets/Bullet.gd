extends Area2D

export(float) var speed
export(float) var damage
export(float) var lifetime

export(bool) var allow_damage

export(PackedScene) var Start_Effects
export(PackedScene) var End_Effects

func _enter_tree():
	if Start_Effects != null:
		var effects = Start_Effects.instance()
		effects.global_position = global_position
		effects.global_rotation = global_rotation
		get_parent().add_child(effects)
	
	#This make a Timer if the lifetime is != 0
	if lifetime != 0:
		var timer = Timer.new()
		timer.wait_time = lifetime
		timer.connect("timeout", self, "Timeout")
		timer.autostart = true
		add_child(timer)

func _exit_tree():
	if End_Effects != null:
		var effects = End_Effects.instance()
		effects.global_position = global_position
		effects.global_rotation = global_rotation
		get_parent().add_child(effects)

func Hit(area):
	if area.get_parent().get("Hit") != null && allow_damage:
		area.get_parent().Hit(damage)
		queue_free()

func Timeout():
	queue_free()
