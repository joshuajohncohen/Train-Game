shader_type canvas_item;

// Required for Godot 4.x screen-space effects
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

uniform float wiggle : hint_range(0.0, 10.0) = 0.03;
uniform float roll_speed : hint_range(0.0, 10.0) = 2.0;
uniform float scanline_opacity : hint_range(0.0, 1.0) = 0.1;
uniform float distortion_amount : hint_range(0.0, 0.1) = 0.002;

void fragment() {
    vec2 uv = SCREEN_UV;

    // 1. Horizontal Jitter (Wiggle)
    uv.x += sin(uv.y * 10.0 + TIME * roll_speed) * (wiggle * 0.001);

    // 2. Chromatic Aberration (Split RGB channels)
    float r = texture(screen_texture, uv + vec2(distortion_amount, 0.0)).r;
    float g = texture(screen_texture, uv).g;
    float b = texture(screen_texture, uv - vec2(distortion_amount, 0.0)).b;

    vec3 color = vec3(r, g, b);

    // 3. Scanlines
    float scanline = sin(uv.y * 800.0) * scanline_opacity;
    color -= scanline;

    // 4. Subtle Grain/Noise
    float noise = (fract(sin(dot(uv, vec2(12.9898, 78.233) * TIME)) * 43758.5453) - 0.5) * 0.05;
    color += noise;

    COLOR = vec4(color, 1.0);
}