extends Control

func _ready():
    var jogar_button = $jogar  
    var home_button = $home  
    
    jogar_button.connect("pressed", self, "on_button_pressed", ["jogar"])
    home_button.connect("pressed", self, "on_button_pressed", ["home"])

func on_button_pressed(button_name: String) -> void:
    match button_name:
        "jogar":
            var _game = get_tree().change_scene("res://Game.tscn")
        "home":
            get_tree().quit()
