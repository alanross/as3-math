package com.ar.math.geom
{
	import com.ar.core.error.MissingImplementationError;
	import com.ar.core.error.NullError;
	import com.ar.core.error.ValueError;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Polygon implements IShape
	{
		private var _points:Vector.<Point2D>;
		private var _bounds:Rect;

		/**
		 * Creates a new instance of Polygon.
		 */
		public function Polygon( ...points )
		{
			_points = new Vector.<Point2D>();
			_bounds = new Rect();

			if( points != null && points.length > 0 )
			{
				addPoints( points );
			}
		}

		/**
		 * @private
		 */
		private function updateBounds():void
		{
			var xMin:Number = Number.MAX_VALUE;
			var xMax:Number = Number.MIN_VALUE;

			var yMin:Number = Number.MAX_VALUE;
			var yMax:Number = Number.MIN_VALUE;

			var p:Point2D;

			for( var i:int = 0; i < _points.length; ++i )
			{
				p = _points[i];

				if( p.x < xMin )
				{
					xMin = p.x;
				}
				if( p.x > xMax )
				{
					xMax = p.x;
				}
				if( p.y < yMin )
				{
					yMin = p.y;
				}
				if( p.y > yMax )
				{
					yMax = p.y;
				}
			}

			_bounds.setTo( xMin, yMin, xMax, yMax );
		}

		/**
		 * @inheritDoc
		 */
		public function moveTo( x:Number, y:Number ):void
		{
			const dx:Number = x - _bounds.x;
			const dy:Number = y - _bounds.y;

			const n:int = _points.length;

			var p:Point2D;

			for( var i:int = 0; i < n; ++i )
			{
				p = _points[i];
				p.x += dx;
				p.y += dy;
			}

			updateBounds();
		}

		/**
		 * @inheritDoc
		 */
		public function resizeTo( width:Number, height:Number ):void
		{
			throw new MissingImplementationError();
		}

		/**
		 * @inheritDoc
		 */
		public function contains( x:Number, y:Number ):Boolean
		{
			var inside:Boolean = false;
			var n:int = _points.length;

			var j:int = 0;

			var pi:Point2D;
			var pj:Point2D;

			for( var i:int = 0; i < n; i++ )
			{
				j++;

				if( j == n )
				{
					j = 0;
				}

				pi = _points[i];
				pj = _points[j];

				if( pi.y < y && pj.y >= y || pj.y < y && pi.y >= y )
				{
					if( pi.x + (y - pi.y) / (pj.y - pi.y) * (pj.x - pi.x) < x )
					{
						inside = !inside;
					}
				}
			}

			return inside;
		}

		/**
		 * @inheritDoc
		 */
		public function getBounds():Rect
		{
			return _bounds;
		}

		/**
		 * Add a point defining the polygon.
		 */
		public function addPoint( p:Point2D ):void
		{
			_points.push( p );

			updateBounds();
		}

		/**
		 * Add a points defining the polygon.
		 */
		public function addPoints( ...points ):void
		{
			if( points != null )
			{
				throw new NullError( "points is null" );
			}

			if( points.length == 0 )
			{
				throw new ValueError( "points array is empty" );
			}

			// will throw an exception if a member of points if not of type Point

			for each ( var p:Point2D in points )
			{
				_points.push( p );
			}

			updateBounds();
		}

		/**
		 * Frees all internal references of the object.
		 */
		public function dispose():void
		{
			_points.splice( 0, _points.length );
			_points = null;

			_bounds = null;
		}

		/**
		 * The points defining the polygon.
		 */
		public function get points():Vector.<Point2D>
		{
			return _points;
		}

		/**
		 * Creates and returns a string representation of the Polygon object.
		 */
		public function toString():String
		{
			return "[Polygon points:" + ( ( _points != null ) ? String( _points.length ) : "0" ) + "]";
		}
	}
}