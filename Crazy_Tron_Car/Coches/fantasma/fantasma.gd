extends Spatial

# class member variables go here, for example:
# var a = 2
var numero_frame = 0
var fantasma_corre = false

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	pass

### hace correr al fantasma recorriendo las listas del diccionario con "numero_frame" ###
func fantasma_corre():
	
	if GLOBAL.posicion_fantasma_circuito_1_x_0.empty():
		pass
	else:
		set_global_transform(Transform(
		
		Vector3(GLOBAL.posicion_fantasma_circuito_1_x_0[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_x_1[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_x_2[numero_frame]),
		Vector3(GLOBAL.posicion_fantasma_circuito_1_y_0[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_y_1[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_y_2[numero_frame]),
		Vector3(GLOBAL.posicion_fantasma_circuito_1_z_0[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_z_1[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_z_2[numero_frame]),
		Vector3(GLOBAL.origen_fantasma_circuito_1_0[numero_frame],GLOBAL.origen_fantasma_circuito_1_1[numero_frame],GLOBAL.origen_fantasma_circuito_1_2[numero_frame])))
		
		if numero_frame >= GLOBAL.posicion_fantasma_circuito_1_x_0.size()-1:
			pass
		else: numero_frame +=1
		
func _fixed_process(delta):
		
	if fantasma_corre:
		fantasma_corre()



func _input(event):
	if (Input.is_action_pressed("aparece_fantasma_j")):	
		fantasma_corre = true
	
	