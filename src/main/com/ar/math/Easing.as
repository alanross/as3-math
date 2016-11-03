/*
	TERMS OF USE - EASING EQUATIONS
	---------------------------------------------------------------------------------
	Open source under the BSD License.

	Copyright © 2001 Robert Penner All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

	Redistributions of source code must retain the above copyright notice, this
	list of conditions and the following disclaimer. Redistributions in binary
	form must reproduce the above copyright notice, this list of conditions and
	the following disclaimer in the documentation and/or other materials provided
	with the distribution. Neither the name of the author nor the names of
	contributors may be used to endorse or promote products derived from this
	software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
	FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
	DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
	SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
	OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	---------------------------------------------------------------------------------
*/
package com.ar.math
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Easing
	{
		private static const PI_M2:Number = Math.PI * 2;
		private static const PI_D2:Number = Math.PI / 2;

		public static function linear( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c * t / d + b;
		}

		public static function sineIn( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return -c * Math.cos( t / d * PI_D2 ) + c + b;
		}

		public static function sineOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c * Math.sin( t / d * PI_D2 ) + b;
		}

		public static function sineInOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return -c / 2 * (Math.cos( Math.PI * t / d ) - 1) + b;
		}

		public static function quintIn( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c * (t /= d) * t * t * t * t + b;
		}

		public static function quintOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
		}

		public static function quintInOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			if( (t /= d / 2) < 1 )
			{
				return c / 2 * t * t * t * t * t + b;
			}
			return c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
		}

		public static function quartIn( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c * (t /= d) * t * t * t + b;
		}

		public static function quartOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return -c * ((t = t / d - 1) * t * t * t - 1) + b;
		}

		public static function quartInOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			if( (t /= d / 2) < 1 )
			{
				return c / 2 * t * t * t * t + b;
			}
			return -c / 2 * ((t -= 2) * t * t * t - 2) + b;
		}

		public static function quadIn( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c * (t /= d) * t + b;
		}

		public static function quadOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return -c * (t /= d) * (t - 2) + b;
		}

		public static function quadInOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			if( (t /= d / 2) < 1 )
			{
				return c / 2 * t * t + b;
			}
			return -c / 2 * ((--t) * (t - 2) - 1) + b;
		}

		public static function exponentialIn( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return (t == 0) ? b : c * Math.pow( 2, 10 * (t / d - 1) ) + b;
		}

		public static function exponentialOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return (t == d) ? b + c : c * (-Math.pow( 2, -10 * t / d ) + 1) + b;
		}

		public static function exponentialInOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			if( t == 0 )
			{
				return b;
			}
			if( t == d )
			{
				return b + c;
			}
			if( (t /= d / 2) < 1 )
			{
				return c / 2 * Math.pow( 2, 10 * (t - 1) ) + b;
			}
			return c / 2 * (-Math.pow( 2, -10 * --t ) + 2) + b;
		}

		public static function elasticIn( t:Number, b:Number, c:Number, d:Number, a:Number = undefined, p:Number = undefined ):Number
		{
			var s:Number;
			if( t == 0 )
			{
				return b;
			}
			if( (t /= d) == 1 )
			{
				return b + c;
			}
			if( !p )
			{
				p = d * .3;
			}
			if( !a || a < Math.abs( c ) )
			{
				a = c;
				s = p / 4;
			}
			else
			{
				s = p / PI_M2 * Math.asin( c / a );
			}
			return -(a * Math.pow( 2, 10 * (t -= 1) ) * Math.sin( (t * d - s) * PI_M2 / p )) + b;
		}

		public static function elasticOut( t:Number, b:Number, c:Number, d:Number, a:Number = undefined, p:Number = undefined ):Number
		{
			var s:Number;
			if( t == 0 )
			{
				return b;
			}
			if( (t /= d) == 1 )
			{
				return b + c;
			}
			if( !p )
			{
				p = d * .3;
			}
			if( !a || a < Math.abs( c ) )
			{
				a = c;
				s = p / 4;
			}
			else
			{
				s = p / PI_M2 * Math.asin( c / a );
			}
			return (a * Math.pow( 2, -10 * t ) * Math.sin( (t * d - s) * PI_M2 / p ) + c + b);
		}

		public static function elasticInOut( t:Number, b:Number, c:Number, d:Number, a:Number = undefined, p:Number = undefined ):Number
		{
			var s:Number;
			if( t == 0 )
			{
				return b;
			}
			if( (t /= d / 2) == 2 )
			{
				return b + c;
			}
			if( !p )
			{
				p = d * (.3 * 1.5);
			}
			if( !a || a < Math.abs( c ) )
			{
				a = c;
				s = p / 4;
			}
			else
			{
				s = p / PI_M2 * Math.asin( c / a );
			}
			if( t < 1 )
			{
				return -.5 * (a * Math.pow( 2, 10 * (t -= 1) ) * Math.sin( (t * d - s) * PI_M2 / p )) + b;
			}
			return a * Math.pow( 2, -10 * (t -= 1) ) * Math.sin( (t * d - s) * PI_M2 / p ) * .5 + c + b;
		}

		public static function circularIn( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return -c * (Math.sqrt( 1 - (t /= d) * t ) - 1) + b;
		}

		public static function circularOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c * Math.sqrt( 1 - (t = t / d - 1) * t ) + b;
		}

		public static function circularInOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			if( (t /= d / 2) < 1 )
			{
				return -c / 2 * (Math.sqrt( 1 - t * t ) - 1) + b;
			}
			return c / 2 * (Math.sqrt( 1 - (t -= 2) * t ) + 1) + b;
		}

		public static function backIn( t:Number, b:Number, c:Number, d:Number, s:Number = 1.70158 ):Number
		{
			return c * (t /= d) * t * ((s + 1) * t - s) + b;
		}

		public static function backOut( t:Number, b:Number, c:Number, d:Number, s:Number = 1.70158 ):Number
		{
			return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
		}

		public static function backInOut( t:Number, b:Number, c:Number, d:Number, s:Number = 1.70158 ):Number
		{
			if( (t /= d / 2) < 1 )
			{
				return c / 2 * (t * t * (((s *= (1.525)) + 1) * t - s)) + b;
			}
			return c / 2 * ((t -= 2) * t * (((s *= (1.525)) + 1) * t + s) + 2) + b;
		}

		public static function bounceIn( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c - bounceOut( d - t, 0, c, d ) + b;
		}

		public static function bounceOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			if( (t /= d) < (1 / 2.75) )
			{
				return c * (7.5625 * t * t) + b;
			}
			else if( t < (2 / 2.75) )
			{
				return c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75) + b;
			}
			else if( t < (2.5 / 2.75) )
			{
				return c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375) + b;
			}
			else
			{
				return c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375) + b;
			}
		}

		public static function bounceInOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			if( t < d / 2 )
			{
				return bounceIn( t * 2, 0, c, d ) * .5 + b;
			}
			else
			{
				return bounceOut( t * 2 - d, 0, c, d ) * .5 + c * .5 + b;
			}
		}

		public static function cubicIn( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c * (t /= d) * t * t + b;
		}

		public static function cubicOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			return c * ((t = t / d - 1) * t * t + 1) + b;
		}

		public static function cubicInOut( t:Number, b:Number, c:Number, d:Number ):Number
		{
			if( (t /= d / 2) < 1 )
			{
				return c / 2 * t * t * t + b;
			}
			return c / 2 * ((t -= 2) * t * t + 2) + b;
		}

		/**
		 * Creates a new instance of Easing.
		 */
		public function Easing()
		{
			throw new Error( "Easing is static container only." );
		}

		/**
		 * Creates and returns a string representation of the Easing object.
		 */
		public function toString():String
		{
			return "[Easing]";
		}
	}
}