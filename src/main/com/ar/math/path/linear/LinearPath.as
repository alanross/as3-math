package com.ar.math.path.linear
{
	import com.ar.math.path.Path;

	import flash.geom.Point;

	public class LinearPath extends Path
	{
		protected var p0:Point;
		protected var p1:Point;
		protected var v:Point;

		public function LinearPath( p0:Point, p1:Point )
		{
			super();

			this.p0 = p0;
			this.p1 = p1;

			v = p1.subtract( p0 );
		}

		override public function compute( t:Number, result: Point ):void
		{
			result.x = p0.x + v.x * t;
			result.y = p0.y + v.y * t;
		}
	}
}