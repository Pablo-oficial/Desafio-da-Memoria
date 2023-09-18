extends Button

func _ready():
	pass

func _pressed():
	if !get_tree().is_paused():
		get_tree().set_pause(true)
	elif get_tree().is_paused():
		get_tree().set_pause(false)
