//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~/// glsl_gaussian_blur
varying vec2 v_vTexcoord;

uniform vec2 u_Scale;

vec4 sample2points ( vec2 basecoord, vec2 shift )
{
    return texture2D( gm_BaseTexture, basecoord + shift ) + 
           texture2D( gm_BaseTexture, basecoord - shift ); 
}

void main()
{
    gl_FragColor = ( //sample2points ( v_vTexcoord, u_Scale * 1.0 ) +
                     //sample2points ( v_vTexcoord, u_Scale * 0.8 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.6 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.4 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.2 ) +
                     texture2D ( gm_BaseTexture, v_vTexcoord ) ) / 4.4;
}
