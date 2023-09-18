extends Control

func _ready():
    var continuar_button = $continuar  
    var sair_button = $sair  
    
    continuar_button.connect("pressed", self, "on_button_pressed", ["continuar"])
    sair_button.connect("pressed", self, "on_button_pressed", ["sair"])

func on_button_pressed(button_name: String) -> void:
    match button_name:
        "continuar":
            var _game = get_tree().change_scene("res://Game.tscn")
        "sair":
            var _game = get_tree().change_scene("res://Menu.tscn")
	

