﻿// Upgrade NOTE: upgraded instancing buffer 'Props' to new syntax.

Shader "Custom/ColoredPoint" 
{
    Properties 
    {
	_Glossiness ("Smoothness", Range (0,1)) = 0.5
	_Metallic ("Metallic", Range (0,1)) = 0.0
    }

    SubShader 
    {
    	Tags { "RenderType" = "Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows

		#pragma target 3.0

		struct Input 
		{
		// Color based on position
			float3 worldPos;
		};

		half _Glossiness;
		half _Metallic;

		UNITY_INSTANCING_BUFFER_START(Props)
		UNITY_INSTANCING_BUFFER_END(Props)

		void surf (Input IN, inout SurfaceOutputStandard o) 
		{
		// Color from red, green and yellow
			o.Albedo.rgb = IN.worldPos.xyz * 0.5 + 0.5;
			o.Metallic = _Metallic;
		}
		ENDCG
    }
	FallBack "Diffuse"
}