
extends VehicleBody

# Member variables car
const STEER_SPEED = 1
const STEER_LIMIT = 0.4

var steer_angle = 0
var steer_target = 0

export var engine_force = 40

# cyclo pi variables
var velo  = 1
var veloRef = 1
onready var imprimeVelo = get_owner().get_node("HubFlafo/Velocidad")
onready var imprimeAngu = get_owner().get_node("HubFlafo/Angulo")
onready var auja = get_owner().get_node("HubFlafo/Panel")
onready var imprimePuntos = get_owner().get_node("HubFlafo/Hub")

var banderaPuntos10 = false
var puntos = 0
var grabar_coche = true

func _fixed_process(delta):
	if grabar_coche:
		grabar_coche()
	
	if (Input.is_action_pressed("ui_left")):
		steer_target = -STEER_LIMIT
	elif (Input.is_action_pressed("ui_right")):
		steer_target = STEER_LIMIT
	else:
		steer_target = 0
	
	if (Input.is_action_pressed("ui_up")):
		set_engine_force(engine_force)	
#	else:
#		set_engine_force(0)
	
	elif (Input.is_action_pressed("ui_down")):
		set_engine_force(-engine_force)

	else:
		set_engine_force(0)
		
	if (Input.is_action_pressed("ui_frenar")):
		set_brake(1)	
	else: 
		set_brake(0)
	
	
	if (steer_target < steer_angle):
		steer_angle -= STEER_SPEED*delta
		if (steer_target > steer_angle):
			steer_angle = steer_target
	elif (steer_target > steer_angle):
		steer_angle += STEER_SPEED*delta
		if (steer_target < steer_angle):
			steer_angle = steer_target
	
	set_steering(steer_angle)


func _ready():
	set_fixed_process(true)
	

func grabar_coche():	
	### graba las posiciones del coche ###
	### apendiza a las listas del diccionario la matrix3x4 ####

	GLOBAL.posicion_coche_x_0.append(get_global_transform().basis.x[0])
	GLOBAL.posicion_coche_x_1.append(get_global_transform().basis.x[1])
	GLOBAL.posicion_coche_x_2.append(get_global_transform().basis.x[2])
	
	GLOBAL.posicion_coche_y_0.append(get_global_transform().basis.y[0])
	GLOBAL.posicion_coche_y_1.append(get_global_transform().basis.y[1])
	GLOBAL.posicion_coche_y_2.append(get_global_transform().basis.y[2])
	
	GLOBAL.posicion_coche_z_0.append(get_global_transform().basis.z[0])
	GLOBAL.posicion_coche_z_1.append(get_global_transform().basis.z[1])
	GLOBAL.posicion_coche_z_2.append(get_global_transform().basis.z[2])
	
	GLOBAL.origen_coche_0.append(get_global_transform().origin[0])
	GLOBAL.origen_coche_1.append(get_global_transform().origin[1])
	GLOBAL.origen_coche_2.append(get_global_transform().origin[2])

func _on_meta_body_enter( body ):
	grabar_coche = false
	