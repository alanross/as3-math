package com.ar.math.path.linear
{
	import flash.geom.Point;

	public final class SinePath extends LinearPath
	{
		private const normal:Point = new Point();

		private var _frequency:Number;
		private var _amplitude:Number;

		public function SinePath( p0:Point, p1:Point, frequency:Number = 1.0, amplitude:Number = 5.0 )
		{
			super( p0, p1 );

			_frequency = frequency * Math.PI * 2;
			_amplitude = amplitude;

			normal.x = -v.y;
			normal.y = v.x;

			if( normal.x == 0 && normal.y == 0 )
			{
				normal.y = 1.0;
			}
			else
			{
				normal.normalize( 1 );
			}
		}

		override public function compute( t:Number, result:Point ):void
		{
			const sine:Number = Math.sin( _frequency * t ) * _amplitude;

			result.x = p0.x + v.x * t + normal.x * sine;
			result.y = p0.y + v.y * t + normal.y * sine;
		}

		override public function toString():String
		{
			return "[SinePath]";
		}
	}
}