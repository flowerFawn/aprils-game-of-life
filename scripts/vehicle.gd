extends Thing
class_name Vehicle


@export_category("technical")
var node_sprite:Sprite2D

##Type type of creature in question
var creature_type:CreatureType

##Where the vehicle currently wants to go
var desired:Vector2
##Current velocity the vehicle is moving at
var velocity:Vector2 = Vector2.ZERO



	
func do_process(delta:float, neighbours:Array[Thing]) -> void:
	desired = get_desired(neighbours)
	velocity += get_acceleration() * delta
	velocity.limit_length(creature_type.max_speed)
	node_sprite.rotation = velocity.angle()
	move(delta)
	
func get_desired(neighbours:Array[Thing]) -> Vector2:
	var affecting_vectors:Array[Vector2] = []
	var new_desired:Vector2 = Vector2.ZERO
	for behaviour:Behaviour in creature_type.behaviours:
		affecting_vectors.append(behaviour.get_desired(self, neighbours))
	return get_vector_average(affecting_vectors).normalized() * creature_type.max_speed
	
func get_vector_average(vectors:Array[Vector2]) -> Vector2:
	if vectors.is_empty():
		return Vector2.ZERO
	var average_vector:Vector2 = Vector2.ZERO
	for vector:Vector2 in vectors:
		average_vector += vector
	return average_vector / vectors.size()
	
func get_acceleration() -> Vector2:
	return creature_type.force * (desired - velocity).normalized()
	

func move(delta:float) -> void:
	position += velocity * delta
	
func _init(given_creature_type:CreatureType) -> void:
	creature_type = given_creature_type
	node_sprite = Sprite2D.new()
	node_sprite.texture = preload("res://icon.svg")
	add_child(node_sprite)
	for group:StringName in given_creature_type.groups:
		add_to_group(group)
