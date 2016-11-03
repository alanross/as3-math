package com.ar.math.path.curve
{
	import com.ar.math.path.Path;

	import flash.geom.Point;

	public class CirclePath extends Path
	{
		private var _center:Point;
		private var _radius:Number;

		private var startTheta:Number;
		private var deltaTheta:Number;

		public function CirclePath( center:Point, radius:Number, radian0:Number = 0, radian1:Number = Math.PI * 2 )
		{
			super();

			_center = center;
			_radius = radius;

			startTheta = radian0;
			deltaTheta = radian1 - radian0;
		}

		override public function compute( t:Number, result: Point ):void
		{
			const theta:Number = startTheta + deltaTheta * t;

			result.x = _center.x + Math.cos( theta ) * _radius;
			result.y = _center.y + Math.sin( theta ) * _radius;
		}

	}
}