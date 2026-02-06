extends Thing
class_name Vehicle

##The maximum speed (per second) the vehicle can travel at
@export var max_speed:float = 500
##The max amount (per second) the vehicle can apply a force to it's velocity
@export var force:float = 1000
@export var behaviours:Array[Behaviour]
@export_category("technical")
@export var node_sprite:Sprite2D

##Where the vehicle currently wants to go
var desired:Vector2
##Current velocity the vehicle is moving at
var velocity:Vector2 = Vector2.ZERO



	
func do_process(delta:float, neighbours:Array[Thing]) -> void:
	desired = get_desired(neighbours)
	velocity += get_acceleration() * delta
	velocity.limit_length(max_speed)
	node_sprite.rotation = velocity.angle()
	move(delta)
	
func get_desired(neighbours:Array[Thing]) -> Vector2:
	var affecting_vectors:Array[Vector2] = []
	var new_desired:Vector2 = Vector2.ZERO
	for behaviour:Behaviour in behaviours:
		affecting_vectors.append(behaviour.get_desired(self, neighbours))
	return get_vector_average(affecting_vectors).normalized() * max_speed
	
func get_vector_average(vectors:Array[Vector2]) -> Vector2:
	if vectors.is_empty():
		return Vector2.ZERO
	var average_vector:Vector2 = Vector2.ZERO
	for vector:Vector2 in vectors:
		average_vector += vector
	return average_vector / vectors.size()
	
func get_acceleration() -> Vector2:
	return force * (desired - velocity).normalized()
	

func move(delta:float) -> void:
	position += velocity * delta
