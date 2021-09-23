void main() {
	vec3 stack = vec3(0.0);
	vec2 texSize = textureSize(InputTexture, 0);
	switch(blendMode) {
		//Normal
		case 0:
			for(int i = 0; i < samples; i++) {
				stack += texture(InputTexture, 0.5 + ((TexCoord - 0.5) / (vec2(shift.z * i + 1))) + vec2(shift.x, shift.y * (texSize.x / texSize.y)) * i).rgb * (1.0 / samples);
			}
			break;
			
		//Lighten
		case 1:
			for(int i = 0; i < samples; i++) {
				stack += max(stack, texture(InputTexture, 0.5 + ((TexCoord - 0.5) / (vec2(shift.z * i + 1))) + vec2(shift.x, shift.y * (texSize.x / texSize.y)) * i).rgb) * (1.0 / samples);
			}
			break;
	}
	FragColor = vec4(stack, 1.0);
}
