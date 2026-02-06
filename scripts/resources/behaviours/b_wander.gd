extends Behaviour
class_name BWander

var r = RandomNumberGenerator.new()
var current_rotation:float = 0

func get_desired(behavour:Vehicle, neighbours:Array[Thing]) -> Vector2:
	current_rotation += r.randf_range(-0.1 * PI, 0.1 * PI)
	return behavour.position.direction_to(
		behavour.position + (behavour.velocity.normalized() * 300) + (Vector2.UP.rotated(current_rotation) * 100))
