
// <ACEStransformID>IDT.ARRI.Alexa-v2-logC-EI250-CCT6500.a1.v1</ACEStransformID>
// <ACESuserName>ACES 1.0 Input - ARRI V2 LogC (EI250, 6500K)</ACESuserName>

// ARRI ALEXA IDT for ALEXA logC files
//  with camera EI set to 250
//  and CCT of adopted white set to 6500K
// Written by v2_IDT_maker.py v0.05 on Friday 19 December 2014

float
normalizedLogC2ToRelativeExposure(float x) {
	if (x > 0.114725)
		return (pow(10,(x - 0.391007) / 0.262978) - 0.089004) / 5.061087;
	else
		return (x - 0.114725) / 6.034414;
}

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	float r_lin = normalizedLogC2ToRelativeExposure(rIn);
	float g_lin = normalizedLogC2ToRelativeExposure(gIn);
	float b_lin = normalizedLogC2ToRelativeExposure(bIn);

	rOut = r_lin * 0.809931 + g_lin * 0.162741 + b_lin * 0.027328;
	gOut = r_lin * 0.083731 + g_lin * 1.108667 + b_lin * -0.192397;
	bOut = r_lin * 0.044166 + g_lin * -0.272038 + b_lin * 1.227872;
	aOut = 1.0;

}
