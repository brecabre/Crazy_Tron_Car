
extends Control

# Member variables
var town = null


func _back():
	town.queue_free()
	show()


func _load_scene(car):
	var tt = load(car).instance()
	tt.set_name("car")
	town = load("res://Pistas/truck_scene.scn").instance()
	town.get_node("instance_pos").add_child(tt)
	town.get_node("back").connect("pressed", self, "_back")
	get_parent().add_child(town)
	hide()


func _on_van_1_pressed():
	_load_scene("res://Coches/car_base.scn")


func _on_van_2_pressed():
	_load_scene("res://Coches/trailer_truck.scn")


func _on_van_3_pressed():
	_load_scene("res://Coches/crane.scn")
