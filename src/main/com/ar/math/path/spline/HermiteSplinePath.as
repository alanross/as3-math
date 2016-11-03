package com.ar.math.path.spline
{
	import flash.geom.Point;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public class HermiteSplinePath extends LinearSplinePath
	{
		protected var tangents:Vector.<Point>;

		public function HermiteSplinePath( points:Vector.<Point>, tangents:Vector.<Point> )
		{
			super( points );

			this.tangents = tangents;
		}

		final override protected function getPoint( index:int, t:Number, result:Point ):void
		{
			// http://de.wikipedia.org/wiki/Kubisch_Hermitescher_Spline
			// c(t) = ( 2t^3 - 3t^2 + 1 ) * p0 + ( -2t^3 + 3t^2 ) * p1 + ( t^3 - 2t^2 + t ) * m0 + ( t^3 - t^2 ) * m1

			var t2:Number = t * t;
			var t3:Number = t2 * t;

			var h00:Number = (2 * t3) - (3 * t2) + 1;
			var h10:Number = (-2 * t3) + (3 * t2);
			var h01:Number = t3 - (2 * t2) + t;
			var h11:Number = t3 - t2;

			var p0:Point = vertices[ index ];
			var p1:Point = vertices[ index + 1 ];

			var m0:Point = tangents[ index ];
			var m1:Point = tangents[ index + 1 ];

			result.x = p0.x * h00 + p1.x * h10 + m0.x * h01 + m1.x * h11;
			result.y = p0.y * h00 + p1.y * h10 + m0.y * h01 + m1.y * h11;
		}

		override public function toString():String
		{
			return "[HermiteSplinePath]";
		}
	}
}