extends Thing
class_name Vehicle

##The maximum speed (per second) the vehicle can travel at
@export var max_speed:float = 500
##The max amount (per second) the vehicle can apply a force to it's velocity
@export var force:float = 1000
@export_category("technical")
@export var node_sprite:Sprite2D

##Where the vehicle currently wants to go
var desired:Vector2
##Current velocity the vehicle is moving at
var velocity:Vector2 = Vector2.ZERO



	
func do_process(delta:float, neighbours:Array[Thing]) -> void:
	desired = get_desired()
	velocity += get_acceleration() * delta
	velocity.limit_length(max_speed)
	node_sprite.rotation = velocity.angle()
	move(delta)
	
func get_desired() -> Vector2:
	return max_speed * get_local_mouse_position().normalized()
	
	
func get_acceleration() -> Vector2:
	return force * (desired - velocity).normalized()
	

func move(delta:float) -> void:
	position += velocity * delta
