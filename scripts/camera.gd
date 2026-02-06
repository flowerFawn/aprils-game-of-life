extends Camera2D

var base_speed:float = 500
var max_speed:float = 1000
var acceleration:float = 100
var speed:float = 500
var is_moving:bool = false

func _process(delta: float) -> void:
	var change:Vector2 = Vector2(Input.get_axis("camera_left", "camera_right"), Input.get_axis("camera_up", "camera_down")) * delta * speed * (1 + int(Input.is_action_pressed("camera_rush")))
	offset += change
	zoom += Vector2(Input.get_axis("camera_zoom_out", "camera_zoom_in"),Input.get_axis("camera_zoom_out", "camera_zoom_in")) * 1 * delta
	zoom = zoom.clampf(0.1, 10)
	if change.is_zero_approx():
		is_moving = false
		speed = base_speed
	else:
		is_moving = true
		speed += acceleration * delta
		speed = clampf(speed, base_speed, max_speed)
