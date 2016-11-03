package com.ar.math.path.curve
{
	import com.ar.math.path.Path;

	import flash.geom.Point;

	public class SpiralPath extends Path
	{
		private var startRadius:Number;
		private var deltaTheta:Number;
		private var startTheta:Number;
		private var deltaRadius:Number;

		private var center:Point;

		public function SpiralPath( center:Point, radius0:Number, radius1:Number, angleStart:Number = 0, numRotations:Number = 1.0 )
		{
			super();

			this.center = center;
			this.startRadius = radius0;
			this.startTheta = angleStart;

			deltaTheta = Math.PI * 2 * numRotations;
			deltaRadius = radius1 - radius0;
		}

		override public function compute( t:Number, result: Point ):void
		{
			var theta:Number = startTheta + deltaTheta * t;
			var radius:Number = startRadius + deltaRadius * t;

			result.x = center.x + Math.cos( theta ) * radius;
			result.y = center.y + Math.sin( theta ) * radius;
		}
	}
}