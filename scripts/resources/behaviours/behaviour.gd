extends Resource
class_name Behaviour

@export var considered_group:StringName
@export var weight:float = 1

func get_desired(behavour:Vehicle, neighbours:Array[Thing]) -> Vector2:
	return Vector2.RIGHT

func get_vector_average(vectors:Array[Vector2]) -> Vector2:
	if vectors.is_empty():
		return Vector2.ZERO
	var average_vector:Vector2 = Vector2.ZERO
	for vector:Vector2 in vectors:
		average_vector += vector
	return average_vector / vectors.size()

func set_mag(vec:Vector2, magnitude:float) -> Vector2:
	return vec.normalized() * magnitude

##Returns a random unit vector
func random_vector() -> Vector2:
	var r = RandomNumberGenerator.new()
	return Vector2.RIGHT.rotated(r.randf_range(0, 2 * PI))
