extends Node2D
class_name EcosystemHandler



func _physics_process(delta: float) -> void:
	var things:Array[Thing]
	things.assign(get_children())
	for thing:Thing in things:
		thing.do_process(delta, things)
		
func _ready() -> void:
	add_child(Vehicle.new(load("uid://bnd7hjshh86qi")))
	add_child(Vehicle.new(load("uid://dpngri5e6lfiq")))
	add_child(Vehicle.new(load("uid://da6kt54fotebe")))
	await get_tree().create_timer(2).timeout
	add_child(Vehicle.new(load("uid://ckelnbkwmatw3")))
