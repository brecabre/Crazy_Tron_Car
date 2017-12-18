extends Node

# variables para animación de velocidad
onready var cocheVelo = get_owner().get_node("BODY")
var veloHub = 1
onready var imprimeVeloLed = .get_node("Velo150led")

# variables para animación de bill
onready var bill= get_node("bill")
var posicionInicial = Vector2(1525, 181)
var posicion = posicionInicial

# variables para los puntos
onready var imprimePuntos = get_node("SpritePuntos/Puntos")
var puntos = 0
var banderaPuntos10 = false

# variables para relog
onready var imprimeTiempo = get_node("SpriteTiempo/Tiempo")
var tiempoInicio = 0
var banderaInicioT = false
var segundosT = 0



func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	puntikos()
	velocidad()
	#edicion
	animabill1()
	relogiko()
	
func puntikos():
	imprimePuntos.set_text(str(int(puntos)))
	if banderaPuntos10 == false and (veloHub) > 30:
		#imprimePuntos.set_text(str(int(puntos)))
		puntos += 100
		banderaPuntos10 = true
	
func animabill1():
		# animacion de bill
	bill.set_pos(Vector2(posicion))
	posicion = Vector2((posicion.x - 10),posicion.y)
	if posicion.x < -50:
		posicion = posicionInicial
	#print(bill.get_pos())
	
func relogiko():
	if banderaInicioT == false :
		tiempoInicio = OS.get_ticks_msec()
		banderaInicioT = true 
	print(((OS.get_ticks_msec()-tiempoInicio)/1000))
	segundosT = ((OS.get_ticks_msec()-tiempoInicio)/1000)
	imprimeTiempo.set_text(str(int(segundosT))+" s")
	pass
	
func velocidad():
	#print(veloHub)
	#print(cocheVelo.get_linear_velocity().length())
	veloHub  = 5*cocheVelo.get_linear_velocity().length()
	imprimeVeloLed.set_text(str(int(veloHub)))