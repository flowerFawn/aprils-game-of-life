extends Thing
class_name Plant

@export var foodness:float


func _init() -> void:
	var node_sprite:Sprite2D = Sprite2D.new()
	add_to_group(&"Plant")
	node_sprite.texture = load("res://icon.svg")
	add_child(node_sprite)
