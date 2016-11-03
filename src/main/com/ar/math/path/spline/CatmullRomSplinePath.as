package com.ar.math.path.spline
{
	import flash.geom.Point;

	public final class CatmullRomSplinePath extends HermiteSplinePath
	{
		public function CatmullRomSplinePath( points:Vector.<Point> )
		{
			var n:int = points.length;

			var delta: Point = new Point(points[ n - 1 ].x - points[ 0 ].x, points[ n - 1 ].x - points[ 0 ].y );

			var t:Vector.<Point> = new Vector.<Point>();

			for( var i:int = 0; i < n - 1; ++i )
			{
				var p0: Point;
				var p1: Point;

				if( i == 0 )
				{
					p0 = new Point( points[ 0 ].x - delta.x, points[ 0 ].y - delta.y );
				}
				else
				{
					p0 = new Point( points[ i - 1 ].x, points[ i - 1 ].y );
				}

				if( i == n - 2 )
				{
					p1 = new Point( points[ n - 1 ].x + delta.x, points[ n - 1 ].y + delta.y );
				}
				else
				{
					p1 = new Point( points[ i + 1 ].x, points[ i + 1 ].y );
				}

				t.push( new Point( ( p1.x - p0.x ) * 0.5, ( p1.y - p0.y ) * 0.5 ) );
			}

			super( points, t );
		}

		override public function toString():String
		{
			return "[CatmullRomSplinePath]";
		}
	}
}