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
	rect_pivot_offset = Vector2(int(rect_size.x/8), int(rect_size.y/8))
	
func _init(var n):
	numero = n
	frente = load("res://assets/cartas/carta-"+str(numero)+".png")
	verso = GerenciadorGame.cartaVerso
	set_normal_texture(verso)
	
func _pressed():
	GerenciadorGame.selecionarCarta(self)
	
func virar():
	
	var duration = 0.1  # Duration of the animation
	var target_scale_x = 0.1  # Scale factor for the x-axis when shrinking
	
	if get_normal_texture() == verso:
		# Shrink the TextureButton along the x-axis
		var initial_scale = rect_scale
		var target_scale = Vector2(target_scale_x, 1.0)
		var time_elapsed = 0.0
		
		while time_elapsed < duration:
			var scale_x = lerp(initial_scale.x, target_scale.x, time_elapsed / duration)
			rect_scale.x = scale_x
			yield(get_tree(), "idle_frame")
			time_elapsed += get_process_delta_time()
		
		rect_scale = target_scale  # Ensure the final scale is set correctly
		
		# Set the new normal texture
		set_normal_texture(frente)
		
		# Restore the TextureButton to its original scale
		time_elapsed = 0.0
		while time_elapsed < duration:
			var scale_x = lerp(target_scale.x, initial_scale.x, time_elapsed / duration)
			rect_scale.x = scale_x
			yield(get_tree(), "idle_frame")
			time_elapsed += get_process_delta_time()
		
		rect_scale = initial_scale  # Ensure the final scale is set correctly

	else:
		var initial_scale = rect_scale
		var target_scale = Vector2(target_scale_x, 1.0)
		var time_elapsed = 0.0
		
		
		while time_elapsed < duration:
			var scale_x = lerp(initial_scale.x, target_scale.x, time_elapsed / duration)
			rect_scale.x = scale_x
			yield(get_tree(), "idle_frame")
			time_elapsed += get_process_delta_time()
		
		rect_scale = target_scale  # Ensure the final scale is set correctly
		
		# Set the new normal texture
		set_normal_texture(verso)
		
		# Restore the TextureButton to its original scale
		time_elapsed = 0.0
		while time_elapsed < duration:
			var scale_x = lerp(target_scale.x, initial_scale.x, time_elapsed / duration)
			rect_scale.x = scale_x
			yield(get_tree(), "idle_frame")
			time_elapsed += get_process_delta_time()
		
		rect_scale = initial_scale  # Ensure the final scale is set correctly
