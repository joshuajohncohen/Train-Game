shader_type canvas_item;
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
uniform float distortion_strength : hint_range(0.0, 0.1) = 0.0;

void fragment() {
    vec2 uv = SCREEN_UV;
    // Wavy math
    uv.x += sin(uv.y * 15.0 + TIME * 2.0) * distortion_strength;
    COLOR = texture(screen_texture, uv);
}