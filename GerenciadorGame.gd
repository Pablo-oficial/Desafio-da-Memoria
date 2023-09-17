extends Node

onready var Game = get_node('/root/Game/')

var deck = Array()

var cartaVerso = preload("res://assets/cartas/cartaVerso.jpg")

func _ready():
	colocarCartas()
	selecionarCarta()

func colocarCartas():
	var n = 0
	var linha = 1
	while n < 6:
		deck.append(Carta.new(n))
		n += 1
	
func selecionarCarta():
	var c = 0
	while c < 6:
		Game.get_node('matriz').add_child(deck[c])
		c += 1
