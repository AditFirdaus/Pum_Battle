extends AnimatedSprite

export(AudioStream) var Sound

func _ready():
	# I cant really explain this
	frame = 0
	connect("animation_finished", self, "Animation_Finished")
	play()
	if Sound != null:
		var audio = AudioStreamPlayer2D.new()
		audio.connect("finished", self, "Audio_Finished")
		audio.stream = Sound
		audio.play()
		add_child(audio)
	flip_h = bool(round(rand_range(0, 1)))
	flip_v = bool(round(rand_range(0, 1)))

func Audio_Finished():
	queue_free()

func Animation_Finished():
	# The nodes is still visible even the sound is not finished and the d
	visible = false
	if Sound == null:
		queue_free()
