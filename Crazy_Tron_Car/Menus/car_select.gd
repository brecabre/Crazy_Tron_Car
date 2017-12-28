#nota  ruidoCoche
#https://www.youtube.com/watch?v=JuE1e5WGURo&list=RDj2ny3JhPn7U&index=13
extends Control

# Member variables car
var town = null

# variable CYclo pi
var banderaCircuito = false
onready var CartelCircuito001 = get_node("SelectCircuit001")
onready var marcaCircuito = get_node("MarcaCircuito001")
var NumeroCircuito = 0
onready var cartelSelecione = get_node("SelectCircuit")


func _back():
	town.queue_free()
	vuelvoAlMenu()
	show()


func _load_scene(car):
	if NumeroCircuito == 1:
		var tt = load(car).instance()
		tt.set_name("car")
		town = load("res://Pistas/escenatruckCicloPi.tscn").instance()
		town.get_node("PosicionSalida").add_child(tt)
		get_parent().add_child(town)
		town.get_node("PosicionSalida/car/HubFlafo/AlMenu").connect("pressed", self, "_back")
		print("cargo circuito 1")
		hide()
	
	if NumeroCircuito == 2:
		var tt = load(car).instance()
		tt.set_name("car")
		town = load("res://Pistas/RoscoCampero/terrenoSalidaLuces.tscn").instance()
		town.get_node("PosicionSalida").add_child(tt)
		get_parent().add_child(town)
		town.get_node("PosicionSalida/car/HubFlafo/AlMenu").connect("pressed", self, "_back")
		print("cargo circuito 2")
		hide()
	if NumeroCircuito == 3:
		var tt = load(car).instance()
		tt.set_name("car")
		town = load("res://Pistas/circuito_platano/terreno.tscn").instance()
		town.get_node("PosicionSalida").add_child(tt)
		get_parent().add_child(town)
		town.get_node("PosicionSalida/car/HubFlafo/AlMenu").connect("pressed", self, "_back")
		print("cargo circuito 3")
		hide()
#funciones de entrada de botón
func _on_vanCocheClio_pressed():
	if banderaCircuito:
		_load_scene("res://Coches/Coche.003clio/clio.scn")
		pass # replace with function body
	
func _on_vanCochePlatano_pressed():
	if banderaCircuito:
		_load_scene("res://Coches/coche_platano/coche_platano.scn")
	pass # replace with function body
	
func _on_van_1_pressed():
	if banderaCircuito:
		_load_scene("res://Coches/Coche.002flago/flago.scn")

func _on_vanCocheRally_pressed():
	if banderaCircuito:
		_load_scene("res://Coches/Coche.RallY/rally.scn")
	pass # replace with function body

func _on_Circuito001_pressed():
	selecionaCircuito1()
	#CartelCircuito001.set_pos(Vector2(900,480))
	NumeroCircuito = 1
	# bandera circuito selecionado
	banderaCircuito = true
	pass # replace with function body

func _on_Circuito002_pressed():
	#CartelCircuito001.set_pos(Vector2(900,980))
	selecionaCircuito2() # cambiar
	NumeroCircuito = 2
	banderaCircuito = true
	pass # replace with function body
func _on_Circuito003_pressed():
	#CartelCircuito001.set_pos(Vector2(900,980))
	selecionaCircuito2() # cambiar
	NumeroCircuito = 3
	banderaCircuito = true
	pass # replace with function body

#funciones Cyclo Pi a full
func selecionaCircuito1():
	marcaCircuito.set_pos(Vector2(240,480))
	cartelSelecione.set_pos(Vector2(240,360))
	cartelSelecione.set_text("Select car")
	print(cartelSelecione)


func selecionaCircuito2():
	marcaCircuito.set_pos(Vector2(640,480))

func selecionaCircuito3():
	marcaCircuito.set_pos(Vector2(500,480))
	cartelSelecione.set_pos(Vector2(400,360))
	cartelSelecione.set_text("Select car")

func vuelvoAlMenu():
	banderaCircuito = false
	marcaCircuito.set_pos(Vector2(-900,-480))
	CartelCircuito001.set_pos(Vector2(-900,-480))
	cartelSelecione.set_pos(Vector2(240,580))
	cartelSelecione.set_text("Select circuit")
	print("llego al menu")









