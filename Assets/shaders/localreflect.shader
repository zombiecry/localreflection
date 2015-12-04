Shader "Unlit/localreflect"
{
	Properties
	{
	}


	Category{  
		// We must be transparent, so other objects are drawn before this one.
		Tags { "Queue"="Transparent" }	
		SubShader
		{
			LOD 100
			GrabPass {
				Name "BASE"
				Tags {"LightMode" = "ForwardBase" }
				"_MyGrabTexture"
			}  			
			Pass
			{
				Name "BASE"
				Tags { "LightMode" = "ForwardBase" }				
				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#include "UnityCG.cginc"
				struct appdata
				{
					float4 pos : POSITION;
				};

				struct v2f
				{
					float4 pos : SV_POSITION;
				};
				sampler2D _MyGrabTexture;
				
				v2f vert (appdata v)
				{
					v2f o;
					o.pos = mul(UNITY_MATRIX_MVP, v.pos);
					return o;
				}
				
				half4 frag (v2f i) : SV_Target
				{
					half4 finalColor = half4(1,0,0,1);
					return finalColor;
				}
				ENDCG
			}
		}
	}
}
