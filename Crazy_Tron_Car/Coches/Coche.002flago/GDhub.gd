extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var bill= get_node("bill")
var posicionInicial = Vector2(1525, 181)
var posicion = posicionInicial

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	
	bill.set_pos(Vector2(posicion))
	posicion = Vector2((posicion.x - 10),posicion.y)
	if posicion.x < -50:
		posicion = posicionInicial
	print(bill.get_pos())
	