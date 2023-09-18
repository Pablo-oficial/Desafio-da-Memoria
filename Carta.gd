extends TextureButton

class_name Carta

var numero
var frente
var verso

func _ready():
	set_h_size_flags(3)
	set_v_size_flags(3)
	set_expand(true)
	set_stretch_mode(TextureButton.STRETCH_KEEP_ASPECT_CENTERED)
	
func _init(var n):
	numero = n
	frente = load("res://assets/cartas/carta-"+str(numero)+".png")
	verso = GerenciadorGame.cartaVerso
	set_normal_texture(verso)
	
func _pressed():
	GerenciadorGame.selecionarCarta(self)
	
func virar():
	if get_normal_texture() == verso:
		set_normal_texture(frente)
	else:
		set_normal_texture(verso)
