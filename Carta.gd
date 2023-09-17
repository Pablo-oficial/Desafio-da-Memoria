extends TextureButton

class_name Carta

var numero
var valor
var frente
var verso

func _ready():
	pass
	
func _init(var n):
	numero = n
	frente = load("res://assets/cartas/carta-"+str(numero)+".png")
	verso = GerenciadorGame.cartaVerso
	set_normal_texture(frente)
