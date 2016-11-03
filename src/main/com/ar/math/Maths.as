package com.ar.math
{
	import com.ar.core.error.ValueError;

	import flash.geom.Point;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Maths
	{
		/**
		 * Return the absolute value of a given number.
		 */
		public static function abs( value:Number ):Number
		{
			return value < 0 ? -value : value;
		}

		/**
		 * Return the average value of given array of numbers.
		 */
		public static function average( values:Array ):Number
		{
			var result:Number = 0.0;

			var n:int = values.length;

			for( var i:int = 0; i < n; ++i )
			{
				// dividing must be done here, as else adding
				// two max values would result in infinity
				// also n could be zero if length of array is zero.
				// that would result in a zero division.
				result += values[i] / n;
			}

			return result;
		}

		/**
		 *
		 */
		public static function bezierCubic( a:Number, b:Number, c:Number, d:Number, t:Number ):Number
		{
			var s:Number = 1 - t;

			return s * s * s * a + 3 * s * s * t * b + 3 * s * t * t * c + t * t * t * d;
		}

		/**
		 *
		 */
		public static function bezierQuadratic( a:Number, b:Number, c:Number, t:Number ):Number
		{
			var s:Number = 1 - t;

			return s * s * a + 2 * s * t * b + t * t * c;
		}

		public static function circleArea( diameter:Number ):Number
		{
			var radius:Number = diameter / 2;

			// The formula is Pi * radius * radius.
			return Math.PI * radius * radius;
		}

		public static function circleCircumference( diameter:Number ):Number
		{
			return Math.PI * diameter;
		}

		/**
		 * Return the given value, clamped by given min and max value.
		 */
		public static function clamp( val:Number, min:Number = 0.0, max:Number = 1.0 ):Number
		{
			if( val < min )
			{
				return min;
			}
			if( val > max )
			{
				return max;
			}

			return val;
		}

		/**
		 * Return the given integer value, clamped by given min and max value.
		 */
		public static function clampInt( val:int, min:int = 0, max:int = 100 ):int
		{
			if( val < min )
			{
				return min;
			}
			if( val > max )
			{
				return max;
			}

			return val;
		}

		/**
		 *
		 */
		public static function cumulatedPercent( val:Number, times:int, percent:Number ):Number
		{
			for( var i:int = 0; i < times; ++i )
			{
				val += (val / 100.0) * percent;
			}

			return val;
		}

		/**
		 * convert degree to radian
		 */
		public static function deg2rad( deg:Number ):Number
		{
			return deg * Math.PI / 180;
		}

		/**
		 * Return the distance between two points defined by their x and y value.
		 */
		public static function dist( x0:Number, y0:Number, x1:Number, y1:Number ):Number
		{
			var dx:Number = x1 - x0;
			var dy:Number = y1 - y0;

			return Math.sqrt( dx * dx + dy * dy );
		}

		/**
		 * get distance of given point to center of circle
		 */
		public static function distToCircleCenter( px:int, py:int, radius:int ):Number
		{
			var pctX:Number = (px - radius) / radius;
			var pctY:Number = (py - radius) / radius;

			var pctDistance:Number = Math.sqrt( pctX * pctX + pctY * pctY );

			return pctDistance;
		}

		/**
		 * Compares two given values according to provided precision.
		 * 1 equals 1.09 if precision is 0.1
		 */
		public static function equals( a:Number, b:Number, precision:Number ):Boolean
		{
			var dif:Number = a - b;

			return ( ( dif < 0 ? -dif : dif ) <= precision );
		}

		/**
		 * Returns true if two points are within the bounds of precision, false other wise.
		 */
		public static function equals2D( a:Point, b:Point, precision:Number ):Boolean
		{
			const dx:Number = b.x - a.x;
						const dy:Number = b.y - a.y;

						return ( Math.sqrt( dx * dx + dy * dy ) <= precision );
		}

		/**
		 *      6
		 *    5   7
		 *  4  -1   0
		 *    3   1
		 *      2
		 */
		public static function getDirection2D( center:Point, relative:Point ):int
		{
			//right side
			if( center.x < relative.x )
			{
				if( center.y > relative.y )
				{
					return 7;
				}
				if( center.y < relative.y )
				{
					return 1;
				}

				return 0;
			}

			//left side
			else if( center.x > relative.x )
			{
				if( center.y > relative.y )
				{
					return 5;
				}
				if( center.y < relative.y )
				{
					return 3;
				}

				return 4;
			}

			// center
			else
			{
				if( center.y > relative.y )
				{
					return 6;
				}
				if( center.y < relative.y )
				{
					return 2;
				}

				return -1;
			}
		}

		/**
		 *
		 */
		public static function grid( rows:int = 10, cols:int = 10, spacingX:int = 10, spacingY:int = 10, offsetX:int = 0, offsetY:int = 0 ):Vector.<Point>
		{
			var points:Vector.<Point> = new Vector.<Point>();

			for( var r:int = 0; r < rows; ++r )
			{
				for( var c:int = 0; c < cols; ++c )
				{
					points.push( new Point( ( c * spacingX ) + offsetX, ( r * spacingY ) + offsetY ) );
				}
			}

			return points;
		}

		/**
		 *
		 */
		public static function grid2( width:int = 10, height:int = 10, spacingX:int = 10, spacingY:int = 10, offsetX:int = 0, offsetY:int = 0 ):Vector.<Point>
		{
			var rows:int = Math.floor( height / spacingY );
			var cols:int = Math.floor( width / spacingX );

			var points:Vector.<Point> = new Vector.<Point>();

			for( var r:int = 0; r < rows; ++r )
			{
				for( var c:int = 0; c < cols; ++c )
				{
					points.push( new Point( ( c * spacingX ) + offsetX, ( r * spacingY ) + offsetY ) );
				}
			}

			return points;
		}

		/**
		 *
		 */
		public static function int2Binary( value:int ):String
		{
			return value.toString( 2 );
		}

		/**
		 *
		 */
		public static function isEven( value:int ):Boolean
		{
			// (value % 2) == 0					-> 10106ms
			// ((value * 0.5) – (i >> 1)) == 0	-> 2974ms
			// !(value & 1)						-> 2612ms
			// (value & 1) == 0					-> 2277ms
			return ((value & 1) == 0);
		}

		/**
		 *
		 */
		public static function isInBounds( val:Number, min:Number = 0, max:Number = 100 ):Boolean
		{
			return !( val < min || val > max );
		}

		/**
		 * Return the larger of two numbers.
		 */
		public static function max( a:Number, b:Number ):Number
		{
			return ( a > b ) ? a : b;
		}

		/**
		 * Return the lesser of two numbers.
		 */
		public static function min( a:Number, b:Number ):Number
		{
			return ( a < b ) ? a : b;
		}

		/**
		 * Return the next power of two of given value.
		 * Example: 5 returns 8, 1000 returns 1024.
		 */
		public static function nextPowerOfTwo( value:int ):int
		{
			if( value < 0 )
			{
				throw new ValueError( "nextPowerOfTwo does not compute negative values" );
			}

			value--;
			value |= value >> 1;
			value |= value >> 2;
			value |= value >> 4;
			value |= value >> 8;
			value |= value >> 16;
			value++;

			return value;
		}

		/**
		 * Normalize a given value.
		 */
		public static function normalize( value:Number, low:Number, high:Number ):Number
		{
			return (value - low) / (high - low);
		}

		/**
		 *
		 */
		public static function quantize2D( pos:Point, hq:Number, vq:Number ):void
		{
			pos.x = int( Math.floor( pos.x / Number( hq ) ) * hq );
			pos.y = int( Math.floor( pos.y / Number( vq ) ) * vq );
		}

		/**
		 * convert radian to degree
		 */
		public static function rad2deg( rad:Number ):Number
		{
			return rad * 180 / Math.PI;
		}

		/**
		 *
		 */
		public static function rand( min:Number = 0.0, max:Number = 1.0 ):Number
		{
			return min + Math.random() * ( max - min );
		}

		/**
		 * Calculates and sets X and Y position of point. Point is defines by defined by radius and degree.
		 */
		public static function rotateBy( deg:Number, radius:int, point:Point ):void
		{
			const rad:Number = deg * Math.PI / 180.0;

			point.x = Math.sin( rad ) * radius;
			point.y = Math.cos( rad ) * radius;
		}

		/**
		 * Round a given number to an integer value.
		 */
		public static function round( value:Number ):int
		{
			/*
			 A return Math.round( value );
			 B return( ~~ (0.5 + value) );		//ONLY FOR POSITIVE VALUES
			 C return( ~~ (value + (value > 0 ? .5 : -.5)) ); // SLOWER THAN INT CONVERSION
			 D return( (0.5 + value) | 0 );		//ONLY FOR POSITIVE VALUES
			 E return( (0.5 + value) << 0 );	//ONLY FOR POSITIVE VALUES

			 // 80000000 times operation:

			 POSITIVE
			 A 418MS :100.259123 > 100		415MS :100.559123 > 101
			 B 222MS :100.259123 > 100		227MS :100.559123 > 101
			 C 5661MS :100.259123 > 100		5620MS :100.559123 > 101
			 D 221MS :100.259123 > 100		223MS :100.559123 > 101
			 E 219MS :100.259123 > 100		219MS :100.559123 > 101
			 F 1014MS :100.259123 > 100		1013MS :100.559123 > 101

			 NEGATIVE
			 A 421 :-100.259123 > -100		417 :-100.559123 > -101
			 B 226 :-100.259123 > -99		223 :-100.559123 > -100 	(!)
			 C 5729 :-100.259123 > -100		5618 :-100.559123 > -101
			 D 219 :-100.259123 > -99		219 :-100.559123 > -100		(!)
			 E 221 :-100.259123 > -99		218 :-100.559123 > -100		(!)
			 F 1204 :-100.259123 > -100		1188 :-100.559123 > -101
			 */

			if( value > 0 )
			{
				return int( value + 0.5 );
			}
			if( value < 0 )
			{
				return -int( -value + 0.5 );
			}
			else
			{
				return 0;
			}
		}

		/**
		 * roundToPrecision( 0.1515, 0 ) // Output: 0
		 * roundToPrecision( 0.1515, 1 ) // Output: 0.2
		 * roundToPrecision( 0.1515, 2 ) // Output: 0.15
		 * roundToPrecision( 0.1515, 3 ) // Output: 0.152
		 */
		public static function roundToPrecision( value:Number, precision:int ):Number
		{
			var decimalPlaces:Number = Math.pow( 10, precision );

			return Math.round( decimalPlaces * value ) / decimalPlaces;
		}

		/**
		 * convert a given value of one scale to another
		 * result = ( ( (inVal - inMin) * (outMax - outMin) / (inMax - inMin) ) + outMin )
		 */
		public static function scale( inVal:Number, inMin:Number, inMax:Number, outMin:Number, outMax:Number ):Number
		{
			return ( ( (inVal - inMin) * (outMax - outMin) / (inMax - inMin) ) + outMin );
		}

		/**
		 * Return the sum of all given numbers
		 */
		public static function sum( values:Array ):Number
		{
			var result:Number = 0.0;

			var n:int = values.length;

			for( var i:int = 0; i < n; ++i )
			{
				result += values[i];
			}

			return result;
		}

		/**
		 * Creates a new instance of Maths.
		 */
		public function Maths()
		{
			throw new Error( "Maths is static container only." );
		}

		/**
		 * Creates and returns a string representation of the Maths object.
		 */
		public function toString():String
		{
			return "[Maths]";
		}
	}
}