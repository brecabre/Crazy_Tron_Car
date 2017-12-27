extends Spatial

# class member variables go here, for example:
onready var coche = get_parent().get_node("truckCicloPi/PosicionSalida/car/BODY")



#variables para relog
#onready var imprimeTiempo = get_node("SpriteTiempo/Tiempo")
var tiempoInicio = 0
var banderaInicioT = false
var segundosT = 0
var vueltas = 0 
#variables para boqueo Salida
var fuerzaMotor 
var banderaEnCarrera = false
onready var cuentaAtras = get_node("HubTerreno/cuentaAtras")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
	
	fuerzaMotor = coche.engine_force
	coche.engine_force = 0

	pass
	
func _fixed_process(delta):
	relogiko()
	salidaFuerza()
	cuentaAtras()
	tiempo_vueltas()


func tiempo_vueltas():
	var tiempoveltas
	if banderaEnCarrera == true:
		tiempoveltas = segundosT - 3
		print ("tiempoveltas",tiempoveltas)

func cuentaAtras():
	if banderaEnCarrera == false:
		cuentaAtras.set_text(str(3-segundosT))	
	else:	
#		print ("parar de contar")
		cuentaAtras.hide()
		


func relogiko():
	if banderaInicioT == false :
		tiempoInicio = OS.get_ticks_msec()
		banderaInicioT = true 
		#mapa = preMapa.instance()
		#get_parent().add_child(mapa)
		
	#print(((OS.get_ticks_msec()-tiempoInicio)/1000))
	segundosT = ((OS.get_ticks_msec()-tiempoInicio)/1000)
#	print(segundosT)
	#imprimeTiempo.set_text(str(int(segundosT))+" s")
	print (tiempoInicio)
	pass
	
func salidaFuerza():
	if segundosT > 3 and banderaEnCarrera == false:
		coche.engine_force = fuerzaMotor
		banderaEnCarrera = true
		print(coche.engine_force)


func _on_Area_body_enter( body ):
	vueltas += 1
	print ("vueltas: " + str(vueltas) )
	
	pass # replace with function body
