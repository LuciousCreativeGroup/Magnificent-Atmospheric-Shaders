#version 120

#include "fastMath.glsl"

#define transMAD(mat, v) (mat3(mat) * (v) + (mat)[3].xyz)

#define diagonal2(mat) vec2((mat)[0].x, (mat)[1].y)
#define diagonal3(mat) vec3(diagonal2(mat), (mat)[2].z)
#define diagonal4(mat) vec4(diagonal3(mat), (mat)[2].w)

varying vec2 texCoord;
varying vec4 color;
varying vec3 normal;

void main() {

    gl_Position = transMAD(gl_ModelViewMatrix, gl_Vertex.xyz).xyzz * diagonal4(gl_ProjectionMatrix) + gl_ProjectionMatrix[3];

    texCoord = gl_MultiTexCoord0.st;
    color = gl_Color;

    normal = fNormalize(gl_NormalMatrix * gl_Normal);
}