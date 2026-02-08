extends TextureRect

var noise = TwoDPerlin.new(0.01, 0)

func _ready() -> void:
	calculate_landscape()

func calculate_landscape() -> void:
	var image = noise.noise_to_image(400)
	texture = ImageTexture.create_from_image(image)
	
