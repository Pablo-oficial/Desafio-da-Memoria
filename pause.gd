extends Button

func _ready():
	pass

onready var Game = get_node('/root/Game')
var pauseMenu = preload("res://PauseMenu.tscn")

func _pressed():
	if !get_tree().is_paused():
		var tela = pauseMenu.instance()
		Game.add_child(tela)
		get_tree().set_pause(true)

