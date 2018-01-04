extends Spatial



onready var meta = get_node("meta")

func _ready():
	
	set_process_input(true)
	set_fixed_process(true)
	#### escone la meta del coche, esconde la leyermask (.hide no sive) ####
	meta.set_layer_mask_bit(0,0)
### carga el diccionario y instancia la escena del fantasma ###


func _on_meta1_body_enter( body ):
	#### hace visible  la meta del coche, hace visible la leyermask  ####
	#### para que no se corte al pisar la meta por primera vez ####
	meta.set_layer_mask_bit(0,1)

func _on_meta_body_enter( body ):
 #deja de grabar y sustituye el tiempo del fantasma por el del coche si este es menor 
	if GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_0"].empty() or GLOBAL.posiciones_coche["posicion_coche_x_0"].size() < GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_0"].size():
		
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_0"] = GLOBAL.posicion_coche_x_0
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_1"] = GLOBAL.posicion_coche_x_1
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_2"] = GLOBAL.posicion_coche_x_2
	
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_y_0"] = GLOBAL.posicion_coche_y_0
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_y_1"] = GLOBAL.posicion_coche_y_1
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_y_2"] = GLOBAL.posicion_coche_y_2
		
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_z_0"] = GLOBAL.posicion_coche_z_0
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_z_1"] = GLOBAL.posicion_coche_z_1
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_z_2"] = GLOBAL.posicion_coche_z_2
		
		GLOBAL.posiciones_fantasma_circuito_1["origen_fantasma_circuito_1_0"] = GLOBAL.origen_coche_0
		GLOBAL.posiciones_fantasma_circuito_1["origen_fantasma_circuito_1_1"] = GLOBAL.origen_coche_1
		GLOBAL.posiciones_fantasma_circuito_1["origen_fantasma_circuito_1_2"] = GLOBAL.origen_coche_2
		
		GLOBAL.save_game()