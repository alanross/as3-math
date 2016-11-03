package com.ar.math
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Colors
	{
		/**
		 * Set color value by separate rgb values.
		 * All values must range between 0x0 and 0xFF.
		 */
		public static function argb2hex( a:int, r:int, g:int, b:int ):int
		{
			return ( a << 24 | r << 16 | g << 8 | b );
		}

		/**
		 * Return the values of the alpha, red, green and blue channels
		 * separately as entries in an array.
		 */
		public static function hex2argb( color:uint, normalized:Boolean = false ):Array
		{
			if( normalized )
			{
				return [
					( ( color >> 24 ) & 0xff ) / 255.0,
					( ( color >> 16 ) & 0xff ) / 255.0,
					( ( color >> 8 ) & 0xff ) / 255.0,
					( color & 0xff ) / 255.0
				];
			}
			else
			{
				return [
					( color >> 24 ) & 0xff,
					( color >> 16 ) & 0xff,
					( color >> 8 ) & 0xff,
					color & 0xff
				];
			}
		}

		/**
		 * Converts a hex value in uint representation to a string representation.
		 * E.g. the uint value 16711680 which is 0xFF0000 will return the string "0xFF0000".
		 */
		public static function hex2str( value:uint ):String
		{
			var str:String = value.toString( 16 ).toUpperCase();

			var l:int = str.length;

			while( l++ < 6 )
			{
				str = "0" + str;
			}

			return "0x" + str;
		}

		/**
		 * H :0.0 - 360.0;
		 * S :0.0 - 1.0;
		 * V :0.0 - 1.0;
		 */
		public static function hsv2rgb( H:Number, S:Number, V:Number ):int
		{
			var R:Number;
			var G:Number;
			var B:Number;

			if( V == 0 )
			{
				return 0;
			}
			else if( S == 0 )
			{
				R = G = B = V;
			}
			else
			{
				const hf:Number = H / 60.0;
				const hfInt:int = hf;
				const f:Number = hf - hfInt;
				const pv:Number = V * ( 1.0 - S );
				const qv:Number = V * ( 1.0 - S * f );
				const tv:Number = V * ( 1.0 - S * ( 1.0 - f ) );

				switch( hfInt )
				{
					case 0:
						R = V;
						G = tv;
						B = pv;
						break;
					case 1:
						R = qv;
						G = V;
						B = pv;
						break;
					case 2:
						R = pv;
						G = V;
						B = tv;
						break;
					case 3:
						R = pv;
						G = qv;
						B = V;
						break;
					case 4:
						R = tv;
						G = pv;
						B = V;
						break;
					case 5:
						R = V;
						G = pv;
						B = qv;
						break;
					case -1:
						R = V;
						G = pv;
						B = qv;
						break;
				}
			}

			var r:int = R * 256;
			var g:int = G * 256;
			var b:int = B * 256;

			if( r > 0xFF )
			{
				r = 0xFF;
			}
			if( g > 0xFF )
			{
				g = 0xFF;
			}
			if( b > 0xFF )
			{
				b = 0xFF;
			}

			return r << 16 | g << 8 | b;
		}

		/**
		 * Converts a hex value, given in string representation, to an uint value.
		 * E.g. "0xFF0000" will return 16711680
		 */
		public static function str2hex( value:String ):uint
		{
			return uint( value );
		}

		public function Colors()
		{
			throw new Error( "Colors is static container only." );
		}

		public function toString():String
		{
			return "[Colors]";
		}
	}
}