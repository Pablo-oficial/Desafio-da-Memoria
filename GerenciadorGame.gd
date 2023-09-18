extends Node

onready var Game

var deck = Array()

var cartaVerso = preload("res://assets/cartas/cartaVerso.jpg")

var numCartas = 7
var carta1
var carta2
var par = 0
var pares = 6

var segundos = Timer.new()
var tempo = 0
var tempoLabel

var tempoMatch = Timer.new()
var virarTempo = Timer.new()

var telaVencer = preload("res://TelaVencer.tscn")

func _ready():
    print("Esperando por Game...")
    while Game == null:
        yield(get_tree(), "idle_frame")
        Game = get_node('/root/Game')

    print("Game não é mais nulo. Iniciando...")
    adicionarDeck()
    colocarCartas()
    configurarTempo()
    exibir()

func exibir():
	tempoLabel = Game.get_node('painelTempo/segundos')
	tempoLabel.text = str(tempo)

func configurarTempo():
	virarTempo.connect("timeout",self,"virarCartas")
	virarTempo.set_one_shot(true)
	add_child(virarTempo)
	
	tempoMatch.connect("timeout",self,"matchCartas")
	tempoMatch.set_one_shot(true)
	add_child(tempoMatch)
	
	segundos.connect("timeout",self,"contarSegundos")
	add_child(segundos)
	segundos.start()
	
func contarSegundos():
	tempo += 1
	tempoLabel.text = str(tempo)

func adicionarDeck():
	var n = 1
	while n < numCartas:
		deck.append(Carta.new(n))
		n += 1
	n = 1
	while n < numCartas:
		deck.append(Carta.new(n))
		n += 1
	
func colocarCartas():
	deck.shuffle()
	var c = 0
	while c < deck.size():
		Game.get_node('matriz').add_child(deck[c])
		c += 1

func selecionarCarta(var c):
	if carta1 == null:
		carta1 = c
		carta1.virar()
		carta1.set_disabled(true)
	elif carta2 == null:
		carta2 = c
		carta2.virar()
		carta2.set_disabled(true)
		verificarCartas()
		
func verificarCartas():
	if carta1.numero == carta2.numero:
		tempoMatch.start(1)
	else:
		virarTempo.start(1)
		
func virarCartas():	
	carta1.virar()
	carta2.virar()
	carta1.set_disabled(false)
	carta2.set_disabled(false)
	carta1 = null
	carta2 = null

func matchCartas():
	par += 1
	carta1.set_modulate(Color(0.6,0.6,0.6,0.5))
	carta2.set_modulate(Color(0.6,0.6,0.6,0.5))
	carta1 = null
	carta2 = null
	if par == pares:
		var tela = telaVencer.instance()
		Game.add_child(tela)
