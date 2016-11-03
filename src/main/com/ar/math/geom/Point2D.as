package com.ar.math.geom
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Point2D
	{
		public var x:Number;
		public var y:Number;

		/**
		 * Creates a new instance of Point.
		 */
		public function Point2D( px:Number = 0.0, py:Number = 0.0 )
		{
			this.x = px;
			this.y = py;
		}

		/**
		 * Add values to x and y.
		 */
		public function add( px:Number, py:Number ):void
		{
			this.x += px;
			this.y += py;
		}

		/**
		 * Subtract values from x and y.
		 */
		public function sub( px:Number, py:Number ):void
		{
			this.x -= px;
			this.y -= py;
		}

		/**
		 * Multiply value with x and y.
		 */
		public function mul( value:Number ):void
		{
			x *= value;
			y *= value;
		}

		/**
		 * Divide x and y by value.
		 */
		public function div( value:Number ):void
		{
			x /= value;
			y /= value;
		}

		/**
		 * The distance between this point and given coordinates.
		 */
		public function dist( px:Number, py:Number ):Number
		{
			var xd:Number = x - px;
			var yd:Number = y - py;

			return Math.sqrt( xd * xd + yd * yd );
		}

		/**
		 * The magnitude of the point.
		 */
		public function magnitude():Number
		{
			return Math.sqrt( x * x + y * y );
		}

		/**
		 * The dot product of the point and given coordinates.
		 */
		public function dot( px:Number, py:Number ):Number
		{
			return x * px + y * py;
		}

		/**
		 * The cross product of the point and given coordinates.
		 */
		public function cross( px:Number, py:Number ):Number
		{
			return ( x * py ) - ( px * y );
		}

		/**
		 * Normalize the point.
		 */
		public function normalize():void
		{
			const m:Number = magnitude();

			if( m != 0 && m != 1 )
			{
				div( m );
			}
		}

		/**
		 * limit the point.
		 */
		public function limit( max:Number ):void
		{
			if( magnitude() > max )
			{
				normalize();

				mul( max );
			}
		}

		/**
		 * The heading / angle of the point in radian
		 */
		public function heading():Number
		{
			const angle:Number = Math.atan2( -y, x );

			return -1 * angle;
		}

		/**
		 * Move the point to given coordinates.
		 */
		public function setTo( x:Number, y:Number ):void
		{
			this.x = x;
			this.y = y;
		}

		/**
		 * Add the x and y of given point to the x and y values of this point.
		 */
		public function addPoint( point:Point2D ):void
		{
			x += point.x;
			y += point.y;
		}

		/**
		 * Subtract the x and y of given point from the x and y values of this point.
		 */
		public function subPoint( point:Point2D ):void
		{
			x -= point.x;
			y -= point.y;
		}

		/**
		 * Multiply the x and y values of this point with the x and y values of given point.
		 */
		public function multPoint( point:Point2D ):void
		{
			x *= point.x;
			y *= point.y;
		}

		/**
		 * Divide the x and y values of this point by the x and y values of given point.
		 */
		public function divPoint( point:Point2D ):void
		{
			x /= point.x;
			y /= point.y;
		}

		/**
		 * The dot product of this and given point.
		 */
		public function dotPoint( point:Point2D ):Number
		{
			return x * point.x + y * point.y;
		}

		/**
		 * Get the distance between this and given point.
		 */
		public function distPoint( point:Point2D ):Number
		{
			var xd:Number = x - point.x;
			var yd:Number = y - point.y;

			return Math.sqrt( xd * xd + yd * yd );
		}

		/**
		 * Creates and returns a string representation of the Point object.
		 */
		public function toString():String
		{
			return "[Point x:" + x + " y:" + y + "]";
		}
	}
}