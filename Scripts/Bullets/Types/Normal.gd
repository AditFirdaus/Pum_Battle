extends "res://Scripts/Bullets/Bullet.gd"

var direction = Vector2()

func _ready():
	direction = Vector2(speed, 0).rotated(rotation)
	scale.x = speed

func _process(delta):
	position += direction
