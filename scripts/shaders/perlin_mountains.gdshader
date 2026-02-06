shader_type canvas_item;
uniform float[2000] peaks;
uniform float[2000] snow;

void vertex() {
	//
}

void fragment() {
	int x_ref = int(ceil(2000.0 * UV.r));
	if (UV.g >= snow[x_ref]){
		COLOR = vec4(.3, .3, .3, 1.0);
	} else if (UV.g >= peaks[x_ref]){
		COLOR = vec4(1.0, 1.0, 1.0, 1.0);
	} else{
		COLOR = vec4(0.0, 0.0, 1.0, 1.0);
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
