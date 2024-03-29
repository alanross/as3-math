package com.ar.math.path.bezier
{
	import com.ar.math.path.Path;

	import flash.geom.Point;

	public class QuadraticBezierPath extends Path
	{
		protected var anchor1:Point;
		protected var anchor2:Point;
		protected var control1:Point;

		private var reparametrize:Boolean;
		private var arcLength:Number;
		private var reparametrizedTable:Vector.<Number>;

		protected var X:Point;

		public function QuadraticBezierPath( anchor1:Point, control1:Point, anchor2:Point, reparametrize:Boolean = false )
		{
			super();

			this.anchor1 = anchor1;
			this.anchor2 = anchor2;

			this.control1 = control1;
			this.reparametrize = reparametrize;

			if( reparametrize )
			{

				arcLength = getArcLength( 1.0 );
				reparametrizedTable = new Vector.<Number>();

				for( var i:int = 0; i < 300; i++ )
				{
					reparametrizedTable[ i ] = getReparametrizedT( i / 300 );
				}

			}

			X = new Point();

		}

		override public function compute( t:Number, result:Point ):void
		{
			if( reparametrize )
			{
				var indexFloat:Number = ( reparametrizedTable.length ) * t;
				var index:int = int( indexFloat );

				var t0:Number;
				var t1:Number;

				if( index != 0 )
				{
					if( index >= reparametrizedTable.length )
					{
						t0 = reparametrizedTable[ index - 1 ];
						t1 = 1.0;
					}
					else
					{
						t0 = reparametrizedTable[ index - 1 ];
						t1 = reparametrizedTable[ index ];
					}
				}
				else
				{
					t0 = 0.0;
					t1 = reparametrizedTable[ 0 ];
				}

				t = t0 + ( t1 - t0 ) * ( indexFloat - index );

			}

			getPoint( t, X );

			result.x = X.x;
			result.y = X.y;
		}

		final private function getArcLength( s:Number ):Number
		{
			const RESOLUTION:int = 30;

			var step:Number = s * ( 1 / RESOLUTION );
			var t:Number = 0;

			var last:Point = anchor1.clone();
			var next:Point = new Point();

			var length:Number = 0;

			for( var i:int = 1; i <= RESOLUTION; i++ )
			{
				getPoint( t, next );

				var dx:Number = next.x - last.x;
				var dy:Number = next.y - last.y;

				length += Math.sqrt( dx * dx + dy * dy );

				last.x = next.x;
				last.y = next.y;

				t += step;
			}

			return length;
		}

		protected function getPoint( t:Number, point:Point ):void
		{
			var tSq:Number = t * t;
			var omt:Number = 1 - t;
			var tOmt2:Number = t * omt * 2;
			var omtSq:Number = omt * omt;

			point.x = anchor1.x * omtSq + control1.x * tOmt2 + tSq * anchor2.x;
			point.y = anchor1.y * omtSq + control1.y * tOmt2 + tSq * anchor2.y;
		}

		protected function getDerivative( t:Number, point:Point ):void
		{
			var P0:Point = control1.subtract( anchor1 );
			var P1:Point = anchor2.subtract( control1 );

			point.x = ( 1 - t ) * P0.x + t * P1.x;
			point.y = ( 1 - t ) * P0.y + t * P1.y;
		}

		final private function getReparametrizedT( s:Number ):Number
		{
			const MAX_ITERATIONS:int = 30;
			const EPSILON:Number = 1E-2;

			s *= arcLength;

			var t:Number = s / arcLength;
			var DX:Point = new Point();

			for( var i:int = 0; i < MAX_ITERATIONS; i++ )
			{
				var f:Number = getArcLength( t ) - s;
				if( Math.abs( f ) < EPSILON )
				{
					return t;
				}

				getDerivative( t, DX );
				t -= f / ( DX.length / t );

			}

			return t;
		}
	}
}