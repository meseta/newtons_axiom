//
// bloom smader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
const float blurSize = 1.0/1024.0;
const float intensity = 0.5;

const float kernel0 = 0.13298;
const float kernel1 = 0.125858;
const float kernel2 = 0.106701;
const float kernel3 = 0.081029;
const float kernel4 = 0.055119;
const float kernel5 = 0.033585;
const float kernel6 = 0.018331;
const float kernel7 = 0.008962;
const float kernel8 = 0.003924;

void main() {
	vec4 sum = vec4(0);

	// size 17 kernel
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 8.0*blurSize, v_vTexcoord.y)) * kernel8;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 7.0*blurSize, v_vTexcoord.y)) * kernel7;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 6.0*blurSize, v_vTexcoord.y)) * kernel6;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 5.0*blurSize, v_vTexcoord.y)) * kernel5;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 4.0*blurSize, v_vTexcoord.y)) * kernel4;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 3.0*blurSize, v_vTexcoord.y)) * kernel3;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 2.0*blurSize, v_vTexcoord.y)) * kernel2;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - blurSize, v_vTexcoord.y)) * kernel1;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y)) * kernel0;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + blurSize, v_vTexcoord.y)) * kernel1;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 2.0*blurSize, v_vTexcoord.y)) * kernel2;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 3.0*blurSize, v_vTexcoord.y)) * kernel3;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 4.0*blurSize, v_vTexcoord.y)) * kernel4;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 5.0*blurSize, v_vTexcoord.y)) * kernel5;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 6.0*blurSize, v_vTexcoord.y)) * kernel6;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 7.0*blurSize, v_vTexcoord.y)) * kernel7;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 8.0*blurSize, v_vTexcoord.y)) * kernel8;

	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 8.0*blurSize)) * kernel8;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 7.0*blurSize)) * kernel7;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 6.0*blurSize)) * kernel6;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 5.0*blurSize)) * kernel5;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 4.0*blurSize)) * kernel4;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 3.0*blurSize)) * kernel3;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 2.0*blurSize)) * kernel2;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - blurSize)) * kernel1;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y)) * kernel0;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + blurSize)) * kernel1;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 2.0*blurSize)) * kernel2;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 3.0*blurSize)) * kernel3;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 4.0*blurSize)) * kernel4;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 5.0*blurSize)) * kernel5;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 6.0*blurSize)) * kernel6;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 7.0*blurSize)) * kernel7;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 8.0*blurSize)) * kernel8;

   //increase blur with intensity!
   gl_FragColor = sum * intensity + texture2D(gm_BaseTexture, v_vTexcoord);
}
