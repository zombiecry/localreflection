Shader "sc/localreflect"
{
	Properties
	{
	}


	Category{  
		// We must be transparent, so other objects are drawn before this one.
		Tags { "Queue"="Opaque" }	
		SubShader
		{
			LOD 100 			

			Pass
			{
				Name "BASE"
				Tags { "LightMode" = "PrepassBase" }
				CGPROGRAM
				#pragma vertex BaseMainVS
				#pragma fragment BaseMainPS
				#include "localreflectcore.cginc"
				ENDCG
			}
			Pass
			{
				Name "FINAL"
				Tags { "LightMode" = "PrepassFinal" }
				CGPROGRAM
				#pragma vertex FinalMainVS
				#pragma fragment FinalMainPS
				#include "localreflectcore.cginc"
				ENDCG
			}			
		}
	}
}
