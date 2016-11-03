package com.ar.math.geom
{
	import com.ar.core.error.MissingImplementationError;
	import com.ar.core.error.ValueError;
	import com.ar.math.Maths;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Circle implements IShape
	{
		private var _bounds:Rect;
		private var _center:Point2D;
		private var _radius:Number;

		/**
		 * Creates a new instance of Circle.
		 */
		public function Circle( x:Number = 0.0, y:Number = 0.0, radius:Number = 1.0 )
		{
			_bounds = new Rect();
			_center = new Point2D();

			moveTo( x, y );

			this.radius = radius;
		}

		/**
		 * @inheritDoc
		 */
		public function moveTo( x:Number, y:Number ):void
		{
			_center.x = Maths.round( x );
			_center.y = Maths.round( y );

			_bounds.x = _center.x - _radius;
			_bounds.y = _center.y - _radius;
		}

		/**
		 * @inheritDoc
		 */
		public function resizeTo( width:Number, height:Number ):void
		{
			throw new MissingImplementationError();
		}

		/**
		 * Returns the area as number value.
		 */
		public function getArea():Number
		{
			return Math.PI * _radius * _radius;
		}

		/**
		 * Returns the perimeter.
		 */
		public function getPermieter():Number
		{
			return 2.0 * Math.PI * radius;
		}

		/**
		 * @inheritDoc
		 */
		public function contains( x:Number, y:Number ):Boolean
		{
			var xd:Number = _center.x - x;
			var yd:Number = _center.y - y;

			return ( Math.sqrt( xd * xd + yd * yd ) <= radius );
		}

		/**
		 * @inheritDoc
		 */
		public function containsPoint( p:Point2D ):Boolean
		{
			return contains( p.x, p.y );
		}

		/**
		 * @inheritDoc
		 */
		public function getBounds():Rect
		{
			return _bounds;
		}

		/**
		 * @inheritDoc
		 */
		public function dispose():void
		{
			_bounds = null;
			_center = null;
		}

		/**
		 * The X coordinate of the circle.
		 */
		public function get x():Number
		{
			return _center.x;
		}

		/**
		 * The X coordinate of the circle.
		 */
		public function set x( value:Number ):void
		{
			_center.x = value;
		}

		/**
		 * The Y coordinate of the circle.
		 */
		public function get y():Number
		{
			return _center.y;
		}

		/**
		 * The Y coordinate of the circle.
		 */
		public function set y( value:Number ):void
		{
			_center.y = value;
		}

		/**
		 * The width of the circle.
		 */
		public function get width():Number
		{
			return _radius * 2;
		}

		/**
		 * The height of the circle.
		 */
		public function get height():Number
		{
			return _radius * 2;
		}

		/**
		 * The radius of the circle.
		 */
		public function get radius():Number
		{
			return _radius;
		}

		/**
		 * The radius of the circle.
		 */
		public function set radius( value:Number ):void
		{
			if( value < 0 )
			{
				throw new ValueError( "Radius can not be less than zero" );
			}

			_radius = value;

			_bounds.width = _bounds.height = _radius * 2;
		}

		/**
		 * Creates and returns a string representation of the Circle object.
		 */
		public function toString():String
		{
			return "[Circle" +
					", x: " + x +
					", y: " + y +
					", radius: " + radius + "]";
		}
	}
}