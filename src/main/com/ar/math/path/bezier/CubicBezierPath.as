package com.ar.math.path.bezier
{
	import flash.geom.Point;

	public class CubicBezierPath extends QuadraticBezierPath
	{
		private var _control2:Point;

		public function CubicBezierPath( anchor1:Point, control1:Point, control2:Point, anchor2:Point, reparametrize:Boolean = false )
		{
			_control2 = control2;

			super( anchor1, control1, anchor2, reparametrize );
		}

		override protected function getPoint( t:Number, point:Point ):void
		{
			var tSq:Number = t * t;
			var tCu:Number = tSq * t;
			var omt:Number = 1 - t;
			var omtSq:Number = omt * omt;
			var omtCu:Number = omtSq * omt;

			point.x = anchor1.x * omtCu + control1.x * 3 * omtSq * t + _control2.x * 3 * omt * tSq + anchor2.x * tCu;
			point.y = anchor1.y * omtCu + control1.y * 3 * omtSq * t + _control2.y * 3 * omt * tSq + anchor2.y * tCu;
		}

		override protected function getDerivative( t:Number, point:Point ):void
		{
			var t3:Number = 3 * t;
			var t3Sq:Number = t3 * t3;

			var exp1:Number = -3 * ( 1 - t * 2 + t * t );
			var exp2:Number = t3 * ( 4 - t3 );
			var exp3:Number = t3 * ( 2 - t3 );

			point.x = anchor1.x * exp1 - control1.x * exp2 + _control2.x * exp3 + t3Sq * anchor2.x;
			point.y = anchor1.y * exp1 - control1.y * exp2 + _control2.y * exp3 + t3Sq * anchor2.y;
		}
	}
}