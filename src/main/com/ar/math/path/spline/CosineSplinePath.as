package com.ar.math.path.spline
{
	import flash.geom.Point;

	public final class CosineSplinePath extends LinearSplinePath
	{
		public function CosineSplinePath( vertices:Vector.<Point> )
		{
			super( vertices );
		}

		override protected function getPoint( index:int, t:Number, result:Point ):void
		{
			const p0:Point = vertices[index];
			const p1:Point = vertices[index + 1];

			const k:Number = ( 1 - Math.cos( t * Math.PI ) ) * 0.5;

			result.x = p0.x + ( p1.x - p0.x ) * t;
			result.y = p0.y + ( p1.y - p0.y ) * k;
		}

		override public function toString():String
		{
			return "[CosineSplinePath]";
		}
	}
}