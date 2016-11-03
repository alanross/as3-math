package com.ar.math.path
{
	import flash.display.Graphics;
	import flash.geom.Point;

	public class Path
	{
		public function Path()
		{
		}

		public function compute( t:Number, result: Point ):void
		{
		}

		public function interpolate( graphics:Graphics, resolution:int ):void
		{
			var point: Point = new Point();

			graphics.lineStyle( 1, 0xFFFFFF );

			for( var i:int = 0; i <= resolution; i++ )
			{
				compute( i / resolution, point );
				graphics.drawCircle( point.x, point.y, 1 );
			}
		}

		public function toString():String
		{
			return "[Path]";
		}
	}
}